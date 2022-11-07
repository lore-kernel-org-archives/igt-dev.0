Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C72E10E2FA
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Nov 2022 12:02:05 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  7 Nov 2022 14:01:47 +0200
Message-Id: <20221107120151.2365523-2-petri.latvala@intel.com>
In-Reply-To: <20221107120151.2365523-1-petri.latvala@intel.com>
References: <20221107120151.2365523-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/6] igt_core: Split too long log lines when
 sending to runner with comms
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

Especially with file dumps a single log packet could exceed the max
size of a UNIX datagram. Split too long log chunks instead.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_core.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 3941c528..d4bef161 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -457,6 +457,23 @@ static void _igt_log_buffer_reset(void)
 	pthread_mutex_unlock(&log_buffer_mutex);
 }
 
+static void _log_to_runner_split(int stream, const char *str)
+{
+	size_t limit = 4096;
+	char *buf;
+
+	if (strlen(str) > limit) {
+		buf = calloc(limit + 1, 1);
+		strncpy(buf, str, limit);
+		send_to_runner(runnerpacket_log(stream, buf));
+		free(buf);
+
+		_log_to_runner_split(stream, str + limit);
+	} else {
+		send_to_runner(runnerpacket_log(stream, str));
+	}
+}
+
 __attribute__((format(printf, 2, 3)))
 static void _log_line_fprintf(FILE* stream, const char *format, ...)
 {
@@ -467,7 +484,7 @@ static void _log_line_fprintf(FILE* stream, const char *format, ...)
 
 	if (runner_connected()) {
 		vasprintf(&str, format, ap);
-		send_to_runner(runnerpacket_log(fileno(stream), str));
+		_log_to_runner_split(fileno(stream), str);
 		free(str);
 	} else {
 		vfprintf(stream, format, ap);
-- 
2.30.2
