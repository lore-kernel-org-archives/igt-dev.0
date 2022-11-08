Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8B210E1C9
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Nov 2022 10:07:39 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Nov 2022 12:07:28 +0200
Message-Id: <20221108100733.2378106-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/6] runner: Use a bigger buffer for
 receiving test outputs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Stream-based receiving was able to use buffers of any size for read(),
but with datagrams we actually need to prepare for actual sizes. In
practice, some file dumps from tests come as single log packets of a
couple of kB.

v2: Use a KB() macro for the buffer size (Kamil).

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/executor.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/runner/executor.c b/runner/executor.c
index a79a34e0..7fa932ac 100644
--- a/runner/executor.c
+++ b/runner/executor.c
@@ -842,6 +842,9 @@ static void write_packet_with_canary(int fd, struct runnerpacket *packet, bool s
 		fdatasync(fd);
 }
 
+/* TODO: Refactor this macro from here and from various tests to lib */
+#define KB(x) ((x) * 1024)
+
 /*
  * Returns:
  *  =0 - Success
@@ -857,7 +860,8 @@ static int monitor_output(pid_t child,
 			  char **abortreason)
 {
 	fd_set set;
-	char buf[2048];
+	char *buf;
+	size_t bufsize;
 	char *outbuf = NULL;
 	size_t outbufsize = 0;
 	char current_subtest[256] = {};
@@ -910,6 +914,9 @@ static int monitor_output(pid_t child,
 		}
 	}
 
+	bufsize = KB(256);
+	buf = malloc(bufsize);
+
 	while (outfd >= 0 || errfd >= 0 || sigfd >= 0) {
 		const char *timeout_reason;
 		struct timeval tv = { .tv_sec = interval_length };
@@ -942,7 +949,7 @@ static int monitor_output(pid_t child,
 
 			time_last_activity = time_now;
 
-			s = read(outfd, buf, sizeof(buf));
+			s = read(outfd, buf, bufsize);
 			if (s <= 0) {
 				if (s < 0) {
 					errf("Error reading test's stdout: %m\n");
@@ -1037,7 +1044,7 @@ static int monitor_output(pid_t child,
 		if (errfd >= 0 && FD_ISSET(errfd, &set)) {
 			time_last_activity = time_now;
 
-			s = read(errfd, buf, sizeof(buf));
+			s = read(errfd, buf, bufsize);
 			if (s <= 0) {
 				if (s < 0) {
 					errf("Error reading test's stderr: %m\n");
@@ -1060,7 +1067,7 @@ static int monitor_output(pid_t child,
 
 			/* Fully drain everything */
 			while (true) {
-				s = recv(socketfd, buf, sizeof(buf), MSG_DONTWAIT);
+				s = recv(socketfd, buf, bufsize, MSG_DONTWAIT);
 
 				if (s < 0) {
 					if (errno == EAGAIN)
@@ -1394,6 +1401,7 @@ static int monitor_output(pid_t child,
 					fdatasync(outputs[_F_DMESG]);
 
 				close_watchdogs(settings);
+				free(buf);
 				free(outbuf);
 				close(outfd);
 				close(errfd);
@@ -1418,6 +1426,7 @@ static int monitor_output(pid_t child,
 	if (settings->sync)
 		fdatasync(outputs[_F_DMESG]);
 
+	free(buf);
 	free(outbuf);
 	close(outfd);
 	close(errfd);
-- 
2.30.2
