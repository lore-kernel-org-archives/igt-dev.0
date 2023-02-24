Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD3510E252
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Feb 2023 19:27:15 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 24 Feb 2023 20:27:03 +0100
Message-Id: <20230224192703.53697-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] runner: check disk limit at dumping kmsg
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Karol Krol <karol.krol@intel.com>,
 Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

It was reported that kernel dumps can grow beyond disk limit size
so add checks for it and report error if that happen.

Reported-by: Karol Krol <karol.krol@intel.com>
Ref: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/129
Cc: Petri Latvala <adrinael@adrinael.net>
Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/executor.c | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index 597cd7f5..17ebcdb8 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -584,7 +584,7 @@ void close_outputs(int *fds)
 }
 
 /* Returns the number of bytes written to disk, or a negative number on error */
-static long dump_dmesg(int kmsgfd, int outfd)
+static long dump_dmesg(int kmsgfd, int outfd, size_t disk_limit)
 {
 	/*
 	 * Write kernel messages to the log file until we reach
@@ -599,12 +599,18 @@ static long dump_dmesg(int kmsgfd, int outfd)
 	bool underflow_once = false;
 	char cont;
 	char buf[2048];
-	ssize_t r;
+	ssize_t r, disk_written;
 	long written = 0;
 
 	if (kmsgfd < 0)
 		return 0;
 
+	disk_written = lseek(outfd, 0, SEEK_SET);
+	if (disk_written > disk_limit) {
+		errf("Error dumping kmsg: disk limit already exceeded\n");
+		return disk_written;
+	}
+
 	comparefd = open("/dev/kmsg", O_RDONLY | O_NONBLOCK);
 	if (comparefd < 0) {
 		errf("Error opening another fd for /dev/kmsg\n");
@@ -655,6 +661,13 @@ static long dump_dmesg(int kmsgfd, int outfd)
 
 		write(outfd, buf, r);
 		written += r;
+		disk_written += r;
+
+		if (disk_written > disk_limit) {
+			close(comparefd);
+			errf("Error dumping kmsg: disk limit exceeded\n");
+			return disk_written;
+		}
 
 		if (comparefd < 0 && sscanf(buf, "%u,%llu,%llu,%c;",
 					    &flags, &seq, &usec, &cont) == 4) {
@@ -890,6 +903,7 @@ static int monitor_output(pid_t child,
 	unsigned long taints = 0;
 	bool aborting = false;
 	size_t disk_usage = 0;
+	const size_t mon_disk_limit = settings->disk_usage_limit ? : (~(size_t)0);
 	bool socket_comms_used = false; /* whether the test actually uses comms */
 	bool results_received = false; /* whether we already have test results that might need overriding if we detect an abort condition */
 
@@ -1219,7 +1233,7 @@ static int monitor_output(pid_t child,
 
 			time_last_activity = time_now;
 
-			dmesgwritten = dump_dmesg(kmsgfd, outputs[_F_DMESG]);
+			dmesgwritten = dump_dmesg(kmsgfd, outputs[_F_DMESG], mon_disk_limit);
 			if (settings->sync)
 				fdatasync(outputs[_F_DMESG]);
 
@@ -1457,7 +1471,7 @@ static int monitor_output(pid_t child,
 					asprintf(abortreason, "Child refuses to die, tainted 0x%lx.", taints);
 				}
 
-				dump_dmesg(kmsgfd, outputs[_F_DMESG]);
+				dump_dmesg(kmsgfd, outputs[_F_DMESG], mon_disk_limit);
 				if (settings->sync)
 					fdatasync(outputs[_F_DMESG]);
 
@@ -1483,7 +1497,7 @@ static int monitor_output(pid_t child,
 		}
 	}
 
-	dump_dmesg(kmsgfd, outputs[_F_DMESG]);
+	dump_dmesg(kmsgfd, outputs[_F_DMESG], mon_disk_limit);
 	if (settings->sync)
 		fdatasync(outputs[_F_DMESG]);
 
-- 
2.37.2
