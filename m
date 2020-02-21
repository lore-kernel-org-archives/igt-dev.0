Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8BF6EF33
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2020 10:38:37 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Fri, 21 Feb 2020 12:38:29 +0200
Message-Id: <20200221103829.28470-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tools/i915-perf: Fix compiler warning
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

Remove the _dump half of the pair of recorder command structs and use
a plain array of uint8_ts instead. Leave the struct in a comment to
act as documentation.

As a drive-by fix, add include guards to i915_perf_recorder_commands.h

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Acked-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 tools/i915-perf/i915_perf_control.c           |  8 ++++----
 tools/i915-perf/i915_perf_recorder.c          | 10 +++++-----
 tools/i915-perf/i915_perf_recorder_commands.h | 11 ++++++++++-
 3 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/tools/i915-perf/i915_perf_control.c b/tools/i915-perf/i915_perf_control.c
index a8d0d30f..be5996c0 100644
--- a/tools/i915-perf/i915_perf_control.c
+++ b/tools/i915-perf/i915_perf_control.c
@@ -93,12 +93,12 @@ main(int argc, char *argv[])
 				sizeof(struct recorder_command_base) + strlen(dump_file) + 1;
 			struct {
 				struct recorder_command_base base;
-				struct recorder_command_dump dump;
+				uint8_t dump[];
 			} *data = malloc(total_len);
 
 			data->base.command = RECORDER_COMMAND_DUMP;
 			data->base.size = total_len;
-			snprintf((char *) data->dump.path, strlen(dump_file) + 1, "%s", dump_file);
+			snprintf((char *) data->dump, strlen(dump_file) + 1, "%s", dump_file);
 
 			fwrite(data, total_len, 1, command_fifo_file);
 		} else {
@@ -107,12 +107,12 @@ main(int argc, char *argv[])
 			uint32_t total_len = sizeof(struct recorder_command_base) + path_len;
 			struct {
 				struct recorder_command_base base;
-				struct recorder_command_dump dump;
+				uint8_t dump[];
 			} *data = malloc(total_len);
 
 			data->base.command = RECORDER_COMMAND_DUMP;
 			data->base.size = total_len;
-			snprintf((char *) data->dump.path, path_len, "%s/%s", cwd, dump_file);
+			snprintf((char *) data->dump, path_len, "%s/%s", cwd, dump_file);
 
 			fwrite(data, total_len, 1, command_fifo_file);
 		}
diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
index 760cabf1..6bbc451e 100644
--- a/tools/i915-perf/i915_perf_recorder.c
+++ b/tools/i915-perf/i915_perf_recorder.c
@@ -605,7 +605,7 @@ read_command_file(struct recording_context *ctx)
 	switch (header.command) {
 	case RECORDER_COMMAND_DUMP: {
 		uint32_t len = header.size - sizeof(header), offset = 0;
-		struct recorder_command_dump *dump = malloc(len);
+		uint8_t *dump = malloc(len);
 		FILE *file;
 
 		while (offset < len &&
@@ -616,9 +616,9 @@ read_command_file(struct recording_context *ctx)
 				offset += ret;
 		}
 
-		fprintf(stdout, "Writing circular buffer to %s\n", dump->path);
+		fprintf(stdout, "Writing circular buffer to %s\n", dump);
 
-		file = fopen((const char *) dump->path, "w+");
+		file = fopen((const char *) dump, "w+");
 		if (file) {
 			struct chunk chunks[2];
 
@@ -634,11 +634,11 @@ read_command_file(struct recording_context *ctx)
 			     fwrite(chunks[1].data, chunks[1].len, 1, file) != 1) ||
 			    !write_correlation_timestamps(file, ctx->drm_fd)) {
 				fprintf(stderr, "Unable to write circular buffer data in file '%s'\n",
-					dump->path);
+					dump);
 			}
 			fclose(file);
 		} else
-			fprintf(stderr, "Unable to write dump file '%s'\n", dump->path);
+			fprintf(stderr, "Unable to write dump file '%s'\n", dump);
 
 		free(dump);
 		break;
diff --git a/tools/i915-perf/i915_perf_recorder_commands.h b/tools/i915-perf/i915_perf_recorder_commands.h
index 4855d80f..d9353cfa 100644
--- a/tools/i915-perf/i915_perf_recorder_commands.h
+++ b/tools/i915-perf/i915_perf_recorder_commands.h
@@ -20,6 +20,9 @@
  * SOFTWARE.
  */
 
+#ifndef I915_PERF_RECORDER_COMMANDS_H
+#define I915_PERF_RECORDER_COMMANDS_H
+
 #include <stdint.h>
 
 #define I915_PERF_RECORD_FIFO_PATH "/tmp/.i915-perf-record"
@@ -31,9 +34,15 @@ enum recorder_command {
 
 struct recorder_command_base {
 	uint32_t command;
-	uint32_t size;
+	uint32_t size; /* size of recorder_command_base + dump in bytes */
 };
 
+/*
+ The dump after the recorder_command_base header:
+
 struct recorder_command_dump {
 	uint8_t path[0];
 };
+*/
+
+#endif
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
