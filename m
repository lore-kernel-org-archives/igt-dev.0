Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA356E0E4
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2020 09:59:51 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 12 Mar 2020 11:59:44 +0200
Message-Id: <20200312095944.7477-3-petri.latvala@intel.com>
In-Reply-To: <20200312095944.7477-1-petri.latvala@intel.com>
References: <20200312095944.7477-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/3] runner: Read all kernel logs when there
 are logs
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

Instead of reading one record at a time between select() calls and
tainted-checks etc, use the same at-the-end dmesg dumper whenever
there's activity in /dev/kmsg. It's possible that the occasional chunk
of missing dmesg we're sometimes hitting is due to reading too slowly,
especially if there's a huge gem traceback.

Also print a clear message if we hit a log buffer underrun so we know
it.

Reference: https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/79
Signed-off-by: Petri Latvala <petri.latvala@intel.com>
---
 runner/executor.c | 66 ++++++++++++++++++++++++-----------------------
 1 file changed, 34 insertions(+), 32 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 790f99db..c4b99115 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -537,7 +537,7 @@ void close_outputs(int *fds)
 	}
 }
 
-static void dump_dmesg(int kmsgfd, int outfd)
+static int dump_dmesg(int kmsgfd, int outfd)
 {
 	/*
 	 * Write kernel messages to the log file until we reach
@@ -546,29 +546,31 @@ static void dump_dmesg(int kmsgfd, int outfd)
 	 * message to match against, or stop when we reach EAGAIN.
 	 */
 
-	int comparefd = open("/dev/kmsg", O_RDONLY | O_NONBLOCK);
+	int comparefd;
 	unsigned flags;
 	unsigned long long seq, cmpseq, usec;
 	char cont;
 	char buf[2048];
 	ssize_t r;
 
-	if (comparefd < 0)
-		return;
-	lseek(comparefd, 0, SEEK_END);
+	if (kmsgfd < 0)
+		return 0;
 
-	if (fcntl(kmsgfd, F_SETFL, O_NONBLOCK)) {
-		close(comparefd);
-		return;
+	comparefd = open("/dev/kmsg", O_RDONLY | O_NONBLOCK);
+	if (comparefd < 0) {
+		errf("Error opening another fd for /dev/kmsg\n");
+		return -1;
 	}
+	lseek(comparefd, 0, SEEK_END);
 
 	while (1) {
 		if (comparefd >= 0) {
 			r = read(comparefd, buf, sizeof(buf) - 1);
 			if (r < 0) {
 				if (errno != EAGAIN && errno != EPIPE) {
+					errf("Warning: Error reading kmsg comparison record: %m\n");
 					close(comparefd);
-					return;
+					return 0;
 				}
 			} else {
 				buf[r] = '\0';
@@ -582,16 +584,21 @@ static void dump_dmesg(int kmsgfd, int outfd)
 		}
 
 		r = read(kmsgfd, buf, sizeof(buf));
-		if (r <= 0) {
-			if (errno == EPIPE)
+		if (r < 0) {
+			if (errno == EPIPE) {
+				errf("Warning: kernel log ringbuffer underflow, some records lost.\n");
+				continue;
+			} else if (errno == EINVAL) {
+				errf("Warning: Buffer too small for kernel log record, record lost.\n");
 				continue;
+			} else if (errno != EAGAIN) {
+				errf("Error reading from kmsg: %m\n");
+				return errno;
+			}
 
-			/*
-			 * If EAGAIN, we're done. If some other error,
-			 * we can't do anything anyway.
-			 */
+			/* EAGAIN, so we're done dumping */
 			close(comparefd);
-			return;
+			return 0;
 		}
 
 		write(outfd, buf, r);
@@ -604,7 +611,7 @@ static void dump_dmesg(int kmsgfd, int outfd)
 			 * enough.
 			 */
 			if (seq >= cmpseq)
-				return;
+				return 0;
 		}
 	}
 }
@@ -939,22 +946,17 @@ static int monitor_output(pid_t child,
 		}
 
 		if (kmsgfd >= 0 && FD_ISSET(kmsgfd, &set)) {
+			int dmesgstatus;
+
 			time_last_activity = time_now;
 
-			s = read(kmsgfd, buf, sizeof(buf));
-			if (s < 0) {
-				if (errno != EPIPE && errno != EINVAL) {
-					errf("Error reading from kmsg, stopping monitoring: %m\n");
-					close(kmsgfd);
-					kmsgfd = -1;
-				} else if (errno == EINVAL) {
-					errf("Warning: Buffer too small for kernel log record, record lost.\n");
-				}
-			} else {
-				write(outputs[_F_DMESG], buf, s);
-				if (settings->sync) {
-					fdatasync(outputs[_F_DMESG]);
-				}
+			dmesgstatus = dump_dmesg(kmsgfd, outputs[_F_DMESG]);
+			if (settings->sync)
+				fdatasync(outputs[_F_DMESG]);
+
+			if (dmesgstatus) {
+				close(kmsgfd);
+				kmsgfd = -1;
 			}
 		}
 
@@ -1256,7 +1258,7 @@ static int execute_next_entry(struct execute_state *state,
 		goto out_pipe;
 	}
 
-	if ((kmsgfd = open("/dev/kmsg", O_RDONLY | O_CLOEXEC)) < 0) {
+	if ((kmsgfd = open("/dev/kmsg", O_RDONLY | O_CLOEXEC | O_NONBLOCK)) < 0) {
 		errf("Warning: Cannot open /dev/kmsg\n");
 	} else {
 		/* TODO: Checking of abort conditions in pre-execute dmesg */
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
