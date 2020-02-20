Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D0D26E218
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Feb 2020 13:12:51 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 20 Feb 2020 15:12:45 +0200
Message-Id: <20200220131245.17108-1-petri.latvala@intel.com>
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

Use flexible array member in the first struct instead of two structs
and a 0-length array so compiler knows we really meant to read and
write past it.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 tools/i915-perf/i915_perf_control.c           | 24 +++++++------------
 tools/i915-perf/i915_perf_recorder.c          |  7 ++++--
 tools/i915-perf/i915_perf_recorder_commands.h |  5 +---
 3 files changed, 15 insertions(+), 21 deletions(-)

diff --git a/tools/i915-perf/i915_perf_control.c b/tools/i915-perf/i915_perf_control.c
index a8d0d30f..3722f2b1 100644
--- a/tools/i915-perf/i915_perf_control.c
+++ b/tools/i915-perf/i915_perf_control.c
@@ -91,28 +91,22 @@ main(int argc, char *argv[])
 		if (dump_file[0] == '/') {
 			uint32_t total_len =
 				sizeof(struct recorder_command_base) + strlen(dump_file) + 1;
-			struct {
-				struct recorder_command_base base;
-				struct recorder_command_dump dump;
-			} *data = malloc(total_len);
+			struct recorder_command_base *data = malloc(total_len);
 
-			data->base.command = RECORDER_COMMAND_DUMP;
-			data->base.size = total_len;
-			snprintf((char *) data->dump.path, strlen(dump_file) + 1, "%s", dump_file);
+			data->command = RECORDER_COMMAND_DUMP;
+			data->size = total_len;
+			snprintf((char *) data->path, strlen(dump_file) + 1, "%s", dump_file);
 
 			fwrite(data, total_len, 1, command_fifo_file);
 		} else {
 			char *cwd = get_current_dir_name();
 			uint32_t path_len = strlen(cwd) + 1 + strlen(dump_file) + 1;
 			uint32_t total_len = sizeof(struct recorder_command_base) + path_len;
-			struct {
-				struct recorder_command_base base;
-				struct recorder_command_dump dump;
-			} *data = malloc(total_len);
-
-			data->base.command = RECORDER_COMMAND_DUMP;
-			data->base.size = total_len;
-			snprintf((char *) data->dump.path, path_len, "%s/%s", cwd, dump_file);
+			struct recorder_command_base *data = malloc(total_len);
+
+			data->command = RECORDER_COMMAND_DUMP;
+			data->size = total_len;
+			snprintf((char *) data->path, path_len, "%s/%s", cwd, dump_file);
 
 			fwrite(data, total_len, 1, command_fifo_file);
 		}
diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
index 760cabf1..bd477746 100644
--- a/tools/i915-perf/i915_perf_recorder.c
+++ b/tools/i915-perf/i915_perf_recorder.c
@@ -605,12 +605,15 @@ read_command_file(struct recording_context *ctx)
 	switch (header.command) {
 	case RECORDER_COMMAND_DUMP: {
 		uint32_t len = header.size - sizeof(header), offset = 0;
-		struct recorder_command_dump *dump = malloc(len);
+		struct recorder_command_base *dump = malloc(sizeof(header) + len);
 		FILE *file;
 
+		/* Not really needed since current code only accesses dump->path but for completeness... */
+		memcpy(dump, &header, sizeof(header));
+
 		while (offset < len &&
 		       ((ret = read(ctx->command_fifo_fd,
-				    (void *) dump + offset, len - offset)) > 0
+				    (void *) dump->path + offset, len - offset)) > 0
 			|| errno == EAGAIN)) {
 			if (ret > 0)
 				offset += ret;
diff --git a/tools/i915-perf/i915_perf_recorder_commands.h b/tools/i915-perf/i915_perf_recorder_commands.h
index 4855d80f..5d84ca82 100644
--- a/tools/i915-perf/i915_perf_recorder_commands.h
+++ b/tools/i915-perf/i915_perf_recorder_commands.h
@@ -32,8 +32,5 @@ enum recorder_command {
 struct recorder_command_base {
 	uint32_t command;
 	uint32_t size;
-};
-
-struct recorder_command_dump {
-	uint8_t path[0];
+	uint8_t path[];
 };
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
