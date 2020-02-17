Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2586E96F
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2020 14:50:45 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Mon, 17 Feb 2020 16:50:41 +0200
Message-Id: <20200217145042.829-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] runner: Refactor timeouting
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Instead of aiming for inactivity_timeout and splitting that into
suitable intervals for watchdog pinging, replace the whole logic with
one-second select() timeouts and checking if we're reaching a timeout
condition based on current time and the time passed since a particular
event, be it the last activity or the time of signaling the child
processes.

With the refactoring, we gain a couple of new features for free:

- use-watchdog now makes sense even without
inactivity-timeout. Previously use-watchdog was silently ignored if
inactivity-timeout was not set. Now, watchdogs will be used always if
configured so, effectively ensuring the device gets rebooted if
userspace dies without other timeout tracking.

- Killing tests early on kernel taint now happens even
earlier. Previously on an inactive system we possibly waited for some
tens of seconds before checking kernel taints.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
---
 runner/executor.c | 224 +++++++++++++++++++++++-----------------------
 1 file changed, 113 insertions(+), 111 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 3ea5d167..33610c9e 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -93,7 +93,7 @@ static void init_watchdogs(struct settings *settings)
 
 	memset(&watchdogs, 0, sizeof(watchdogs));
 
-	if (!settings->use_watchdog || settings->inactivity_timeout <= 0)
+	if (!settings->use_watchdog)
 		return;
 
 	if (settings->log_level >= LOG_LEVEL_VERBOSE) {
@@ -672,6 +672,69 @@ static void show_kernel_task_state(void)
 	sysrq('t');
 }
 
+static const char *need_to_timeout(struct settings *settings,
+				   int killed,
+				   unsigned long taints,
+				   double time_since_activity,
+				   double time_since_kill)
+{
+	if (killed) {
+		/*
+		 * Timeout after being killed is a hardcoded amount
+		 * depending on which signal we already used. The
+		 * exception is SIGKILL which just immediately bails
+		 * out if the kernel is tainted, because there's
+		 * little to no hope of the process dying gracefully
+		 * or at all.
+		 *
+		 * Note that if killed == SIGKILL, the caller needs
+		 * special handling anyway and should ignore the
+		 * actual string returned.
+		 */
+		const double kill_timeout = killed == SIGKILL ? 20.0 : 120.0;
+
+		if ((killed == SIGKILL && is_tainted(taints)) ||
+		    time_since_kill > kill_timeout)
+			return "Timeout. Killing the current test with SIGKILL.\n";
+
+		/*
+		 * We don't care for the other reasons to timeout if
+		 * we're already killing the test.
+		 */
+		return NULL;
+	}
+
+	/*
+	 * If we're configured to care about taints, kill the
+	 * test if there's a taint.
+	 */
+	if (settings->abort_mask & ABORT_TAINT &&
+	    is_tainted(taints))
+		return "Killing the test because the kernel is tainted.\n";
+
+	if (settings->inactivity_timeout != 0 &&
+	    time_since_activity > settings->inactivity_timeout) {
+		show_kernel_task_state();
+		return "Timeout. Killing the current test with SIGQUIT.\n";
+	}
+
+	return NULL;
+}
+
+static int next_kill_signal(int killed)
+{
+	switch (killed) {
+	case 0:
+		return SIGQUIT;
+	case SIGQUIT:
+		return SIGKILL;
+	case SIGKILL:
+	default:
+		assert(!"Unreachable");
+		return SIGKILL;
+	}
+}
+
 /*
  * Returns:
  *  =0 - Success
@@ -693,18 +756,15 @@ static int monitor_output(pid_t child,
 	ssize_t s;
 	int n, status;
 	int nfds = outfd;
-	int timeout = settings->inactivity_timeout;
-	int timeout_intervals = 1, intervals_left;
-	int wd_extra = 10;
+	const int interval_length = 1;
+	int wd_timeout;
 	int killed = 0; /* 0 if not killed, signal number otherwise */
-	int sigkill_timeout = 120;
-	int sigkill_interval = 20;
-	int sigkill_intervals_left = sigkill_timeout / sigkill_interval;
-	struct timespec time_beg, time_end;
+	struct timespec time_beg, time_now, time_last_activity, time_killed;
 	unsigned long taints = 0;
 	bool aborting = false;
 
 	igt_gettime(&time_beg);
+	time_last_activity = time_killed = time_beg;
 
 	if (errfd > nfds)
 		nfds = errfd;
@@ -714,32 +774,32 @@ static int monitor_output(pid_t child,
 		nfds = sigfd;
 	nfds++;
 
-	if (timeout > 0) {
+	/*
+	 * If we're still alive, we want to kill the test process
+	 * instead of cutting power. Use a healthy 2 minute watchdog
+	 * timeout that gets automatically reduced if the device
+	 * doesn't support it.
+	 *
+	 * watchdogs_set_timeout() is a no-op and returns the given
+	 * timeout if we don't have use_watchdog set in settings.
+	 */
+	wd_timeout = watchdogs_set_timeout(120);
+
+	if (wd_timeout < 120) {
 		/*
-		 * Use original timeout plus some leeway. If we're still
-		 * alive, we want to kill the test process instead of cutting
-		 * power.
+		 * Watchdog timeout smaller, warn the user. With the
+		 * short select() timeout we're using we're able to
+		 * ping the watchdog regardless.
 		 */
-		int wd_timeout = watchdogs_set_timeout(timeout + wd_extra);
-
-		if (wd_timeout < timeout + wd_extra) {
-			/* Watchdog timeout smaller, so ping it more often */
-			if (wd_timeout - wd_extra < 0)
-				wd_extra = wd_timeout / 2;
-			timeout_intervals = timeout / (wd_timeout - wd_extra);
-			timeout /= timeout_intervals;
-
-			if (settings->log_level >= LOG_LEVEL_VERBOSE) {
-				outf("Watchdog doesn't support the timeout we requested (shortened to %d seconds). Using %d intervals of %d seconds.\n",
-				     wd_timeout, timeout_intervals, timeout);
-			}
+		if (settings->log_level >= LOG_LEVEL_VERBOSE) {
+			outf("Watchdog doesn't support the timeout we requested (shortened to %d seconds).\n",
+			     wd_timeout);
 		}
 	}
 
-	intervals_left = timeout_intervals;
-
 	while (outfd >= 0 || errfd >= 0 || sigfd >= 0) {
-		struct timeval tv = { .tv_sec = timeout };
+		const char *timeout_reason;
+		struct timeval tv = { .tv_sec = interval_length };
 
 		FD_ZERO(&set);
 		if (outfd >= 0)
@@ -751,7 +811,7 @@ static int monitor_output(pid_t child,
 		if (sigfd >= 0)
 			FD_SET(sigfd, &set);
 
-		n = select(nfds, &set, NULL, NULL, timeout == 0 ? NULL : &tv);
+		n = select(nfds, &set, NULL, NULL, &tv);
 		ping_watchdogs();
 
 		if (n < 0) {
@@ -759,86 +819,18 @@ static int monitor_output(pid_t child,
 			return -1;
 		}
 
-		/*
-		 * If we're configured to care about taints, kill the
-		 * test if there's a taint. But only if we didn't
-		 * already kill it, and make sure we still process the
-		 * fds select() marked for us.
-		 */
-		if (settings->abort_mask & ABORT_TAINT &&
-		    tainted(&taints) &&
-		    killed == 0) {
-			if (settings->log_level >= LOG_LEVEL_NORMAL) {
-				outf("Killing the test because the kernel is tainted.\n");
-				fflush(stdout);
-			}
-
-			killed = SIGQUIT;
-			if (!kill_child(killed, child))
-				return -1;
-
-			/*
-			 * Now continue the loop and let the
-			 * dying child be handled normally.
-			 */
-			timeout = 20;
-			watchdogs_set_timeout(120);
-			intervals_left = timeout_intervals = 1;
-		} else if (n == 0) {
-			if (--intervals_left)
-				continue;
+		igt_gettime(&time_now);
 
-			switch (killed) {
-			case 0:
-				show_kernel_task_state();
-				if (settings->log_level >= LOG_LEVEL_NORMAL) {
-					outf("Timeout. Killing the current test with SIGQUIT.\n");
-					fflush(stdout);
-				}
-
-				killed = SIGQUIT;
-				if (!kill_child(killed, child))
-					return -1;
-
-				/*
-				 * Now continue the loop and let the
-				 * dying child be handled normally.
-				 */
-				timeout = 20;
-				watchdogs_set_timeout(120);
-				intervals_left = timeout_intervals = 1;
-				break;
-			case SIGQUIT:
-				if (settings->log_level >= LOG_LEVEL_NORMAL) {
-					outf("Timeout. Killing the current test with SIGKILL.\n");
-					fflush(stdout);
-				}
-
-				killed = SIGKILL;
-				if (!kill_child(killed, child))
-					return -1;
-
-				/*
-				 * Allow the test two minutes to die
-				 * on SIGKILL. If it takes more than
-				 * that, we're quite likely in a
-				 * scenario where we want to reboot
-				 * the machine anyway.
-				 */
-				watchdogs_set_timeout(sigkill_timeout);
-				timeout = sigkill_interval;
-				intervals_left = 1; /* Intervals handled separately for sigkill */
-				break;
-			case SIGKILL:
-				if (!is_tainted(taints) && --sigkill_intervals_left) {
-					intervals_left = 1;
-					break;
-				}
+		timeout_reason = need_to_timeout(settings, killed, tainted(&taints),
+						 igt_time_elapsed(&time_last_activity, &time_now),
+						 igt_time_elapsed(&time_killed, &time_now));
 
+		if (timeout_reason) {
+			if (killed == SIGKILL) {
 				/* Nothing that can be done, really. Let's tell the caller we want to abort. */
 
 				if (settings->log_level >= LOG_LEVEL_NORMAL) {
-					errf("Child refuses to die, tainted %lx. Aborting.\n",
+					errf("Child refuses to die, tainted 0x%lx. Aborting.\n",
 					     taints);
 					if (kill(child, 0) && errno == ESRCH)
 						errf("The test process no longer exists, "
@@ -853,15 +845,23 @@ static int monitor_output(pid_t child,
 				return -1;
 			}
 
-			continue;
-		}
+			if (settings->log_level >= LOG_LEVEL_NORMAL) {
+				outf("%s", timeout_reason);
+				fflush(stdout);
+			}
 
-		intervals_left = timeout_intervals;
+			killed = next_kill_signal(killed);
+			if (!kill_child(killed, child))
+				return -1;
+			time_killed = time_now;
+		}
 
 		/* TODO: Refactor these handlers to their own functions */
 		if (outfd >= 0 && FD_ISSET(outfd, &set)) {
 			char *newline;
 
+			time_last_activity = time_now;
+
 			s = read(outfd, buf, sizeof(buf));
 			if (s <= 0) {
 				if (s < 0) {
@@ -929,6 +929,8 @@ static int monitor_output(pid_t child,
 	out_end:
 
 		if (errfd >= 0 && FD_ISSET(errfd, &set)) {
+			time_last_activity = time_now;
+
 			s = read(errfd, buf, sizeof(buf));
 			if (s <= 0) {
 				if (s < 0) {
@@ -945,6 +947,8 @@ static int monitor_output(pid_t child,
 		}
 
 		if (kmsgfd >= 0 && FD_ISSET(kmsgfd, &set)) {
+			time_last_activity = time_now;
+
 			s = read(kmsgfd, buf, sizeof(buf));
 			if (s < 0) {
 				if (errno != EPIPE && errno != EINVAL) {
@@ -995,17 +999,15 @@ static int monitor_output(pid_t child,
 				}
 
 				aborting = true;
-				timeout = 2;
 				killed = SIGQUIT;
 				if (!kill_child(killed, child))
 					return -1;
+				time_killed = time_now;
 
 				continue;
 			}
 
-			igt_gettime(&time_end);
-
-			time = igt_time_elapsed(&time_beg, &time_end);
+			time = igt_time_elapsed(&time_beg, &time_now);
 			if (time < 0.0)
 				time = 0.0;
 
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
