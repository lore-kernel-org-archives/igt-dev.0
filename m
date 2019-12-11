Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E526EA37
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2019 00:59:51 +0000 (UTC)
From: D Scott Phillips <d.scott.phillips@intel.com>
Date: Tue, 10 Dec 2019 16:52:24 -0800
Message-Id: <20191211005235.67897-19-d.scott.phillips@intel.com>
In-Reply-To: <20191211005235.67897-1-d.scott.phillips@intel.com>
References: <20191211005235.67897-1-d.scott.phillips@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 18/29] runner: Add support for non-Linux
 operating systems
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
List-ID: <igt-dev@lists.freedesktop.org>

The runner depends on Linux specific functionality like signalfd
and the watchdog interface. Provide stub functionality for other
platforms so that the runner can continue with reduced
functionality.

Signed-off-by: D Scott Phillips <d.scott.phillips@intel.com>
---
 runner/executor.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/runner/executor.c b/runner/executor.c
index f36bfd3d..095451c4 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -1,7 +1,9 @@
 #include <errno.h>
 #include <fcntl.h>
 #include <glib.h>
+#if defined(__linux__)
 #include <linux/watchdog.h>
+#endif
 #if HAVE_OPING
 #include <oping.h>
 #endif
@@ -13,7 +15,9 @@
 #include <sys/ioctl.h>
 #include <sys/select.h>
 #include <sys/poll.h>
+#if defined(__linux__)
 #include <sys/signalfd.h>
+#endif
 #include <sys/stat.h>
 #include <sys/time.h>
 #include <sys/types.h>
@@ -27,6 +31,12 @@
 #include "executor.h"
 #include "output_strings.h"
 
+#if !defined(__linux__)
+#define CLOCK_BOOTTIME CLOCK_REALTIME
+#define WDIOC_SETTIMEOUT 0
+#define WDIOC_KEEPALIVE 0
+#endif
+
 static struct {
 	int *fds;
 	size_t num_dogs;
@@ -674,7 +684,14 @@ static int monitor_output(pid_t child,
 	char *outbuf = NULL;
 	size_t outbufsize = 0;
 	char current_subtest[256] = {};
+#if defined(__linux__)
 	struct signalfd_siginfo siginfo;
+#else
+	struct signalfd_siginfo {
+		pid_t ssi_pid;
+		int ssi_signo;
+	} siginfo;
+#endif
 	ssize_t s;
 	int n, status;
 	int nfds = outfd;
@@ -1455,7 +1472,14 @@ static void oom_immortal(void)
 
 static bool should_die_because_signal(int sigfd)
 {
+#if defined(__linux__)
 	struct signalfd_siginfo siginfo;
+#else
+	struct signalfd_siginfo {
+		pid_t ssi_pid;
+		int ssi_signo;
+	} siginfo;
+#endif
 	int ret;
 	struct pollfd sigpoll = { .fd = sigfd, .events = POLLIN | POLLRDBAND };
 
@@ -1494,7 +1518,7 @@ bool execute(struct execute_state *state,
 	struct utsname unamebuf;
 	int resdirfd, testdirfd, unamefd, timefd;
 	sigset_t sigmask;
-	int sigfd;
+	int sigfd = -1;
 	double time_spent = 0.0;
 	bool status = true;
 
@@ -1543,7 +1567,9 @@ bool execute(struct execute_state *state,
 	sigaddset(&sigmask, SIGTERM);
 	sigaddset(&sigmask, SIGQUIT);
 	sigaddset(&sigmask, SIGHUP);
+#if defined(__linux__)
 	sigfd = signalfd(-1, &sigmask, O_CLOEXEC);
+#endif
 	sigprocmask(SIG_BLOCK, &sigmask, NULL);
 
 	if (sigfd < 0) {
-- 
2.23.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
