Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B9810E0AE
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Nov 2022 12:33:45 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  9 Nov 2022 14:33:37 +0200
Message-Id: <20221109123337.2391242-1-petri.latvala@intel.com>
In-Reply-To: <20221108100733.2378106-2-petri.latvala@intel.com>
References: <20221108100733.2378106-2-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 2/6] igt_core: Split too long log lines
 when sending to runner with comms
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

v2: Use while loop instead of recursion (Kamil).
v3: Call strlen once (Kamil).

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_core.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 3941c528..2a136b20 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -457,6 +457,31 @@ static void _igt_log_buffer_reset(void)
 	pthread_mutex_unlock(&log_buffer_mutex);
 }
 
+static void _log_to_runner_split(int stream, const char *str)
+{
+	size_t limit = 4096;
+	size_t len;
+	char *buf = NULL;
+
+	len = strlen(str);
+
+	while (len > limit) {
+		if (!buf)
+			buf = malloc(limit + 1);
+
+		strncpy(buf, str, limit);
+		buf[limit] = '\0';
+
+		send_to_runner(runnerpacket_log(stream, buf));
+
+		str += limit;
+		len -= limit;
+	}
+
+	send_to_runner(runnerpacket_log(stream, str));
+	free(buf);
+}
+
 __attribute__((format(printf, 2, 3)))
 static void _log_line_fprintf(FILE* stream, const char *format, ...)
 {
@@ -467,7 +492,7 @@ static void _log_line_fprintf(FILE* stream, const char *format, ...)
 
 	if (runner_connected()) {
 		vasprintf(&str, format, ap);
-		send_to_runner(runnerpacket_log(fileno(stream), str));
+		_log_to_runner_split(fileno(stream), str);
 		free(str);
 	} else {
 		vfprintf(stream, format, ap);
-- 
2.30.2
