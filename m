Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 513016E12B
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Aug 2021 20:07:43 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Tue,  3 Aug 2021 13:07:37 -0700
Message-Id: <20210803200737.30843-5-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20210803200737.30843-1-umesh.nerlige.ramappa@intel.com>
References: <20210803200737.30843-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 5/5] tools/i915-perf: Add a command to trigger a
 report in OA buffer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>, Lionel G Landwerlin <lionel.g.landwerlin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Current OA captures used by GPUvis show timelines corresponding to
individual contexts as parsed from the OA buffer.

Add support to query OA report using the command line interface -
i915_perf_control. The query will take a snapshot of the counters and
store it in the OA buffer. The snapshots can be viewed as a separate
trigger event timeline in GPUvis. The command line allows passing a
distinct 32 bit trigger value that can be used to identify the triggers
in the visulaization.

The idea is to show counter deltas between these on-demand trigger
events. More fine grained triggerring can be achieved by adding the
trigger commands into a batch.

Example: i915_perf_control -t <distinct_32bit_value>

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tools/i915-perf/i915_perf_control.c           |  43 ++++++-
 tools/i915-perf/i915_perf_recorder.c          | 118 ++++++++++++++++--
 tools/i915-perf/i915_perf_recorder_commands.h |   1 +
 3 files changed, 151 insertions(+), 11 deletions(-)

diff --git a/tools/i915-perf/i915_perf_control.c b/tools/i915-perf/i915_perf_control.c
index be5996c0..509549d8 100644
--- a/tools/i915-perf/i915_perf_control.c
+++ b/tools/i915-perf/i915_perf_control.c
@@ -26,9 +26,19 @@
 #include <stdlib.h>
 #include <string.h>
 #include <unistd.h>
+#include <limits.h>
 
 #include "i915_perf_recorder_commands.h"
 
+static bool
+__valid_trigger_value(const char *value)
+{
+	char *endptr = '\0';
+
+	return strtoul(value, &endptr, 0) != ULONG_MAX &&
+	       *endptr == '\0';
+}
+
 static void
 usage(const char *name)
 {
@@ -37,7 +47,9 @@ usage(const char *name)
 		"\n"
 		"     --help,               -h         Print this screen\n"
 		"     --command-fifo,       -f <path>  Path to a command fifo\n"
-		"     --dump,               -d <path>  Write a content of circular buffer to path\n",
+		"     --dump,               -d <path>  Write a content of circular buffer to path\n"
+		"     --quit,               -q         Quit capturing reports fromm perf recorder\n"
+		"     --trigger,            -t <value> Trigger a report into OA buffer with this 32 bit unsigned value\n",
 		name);
 }
 
@@ -49,14 +61,16 @@ main(int argc, char *argv[])
 		{"dump",                 required_argument, 0, 'd'},
 		{"command-fifo",         required_argument, 0, 'f'},
 		{"quit",                       no_argument, 0, 'q'},
+		{"trigger",              required_argument, 0, 't'},
 		{0, 0, 0, 0}
 	};
 	const char *command_fifo = I915_PERF_RECORD_FIFO_PATH, *dump_file = NULL;
 	FILE *command_fifo_file;
 	int opt;
-	bool quit = false;
+	bool triggered = false, quit = false;
+	char *trigger_value;
 
-	while ((opt = getopt_long(argc, argv, "hd:f:q", long_options, NULL)) != -1) {
+	while ((opt = getopt_long(argc, argv, "hd:f:qt:", long_options, NULL)) != -1) {
 		switch (opt) {
 		case 'h':
 			usage(argv[0]);
@@ -70,6 +84,14 @@ main(int argc, char *argv[])
 		case 'q':
 			quit = true;
 			break;
+		case 't':
+			if (!__valid_trigger_value(optarg)) {
+				fprintf(stderr, "Invalid trigger value: %s\n", optarg);
+				return EXIT_FAILURE;
+			}
+			trigger_value = optarg;
+			triggered = true;
+			break;
 		default:
 			fprintf(stderr, "Internal error: "
 				"unexpected getopt value: %d\n", opt);
@@ -118,6 +140,21 @@ main(int argc, char *argv[])
 		}
 	}
 
+	if (triggered) {
+		uint32_t total_len =
+			sizeof(struct recorder_command_base) + strlen(trigger_value) + 1;
+		struct {
+			struct recorder_command_base base;
+			uint8_t trigger[];
+		} *data = malloc(total_len);
+
+		data->base.command = RECORDER_COMMAND_TRIGGER;
+		data->base.size = total_len;
+		snprintf((char *) data->trigger, strlen(trigger_value) + 1, "%s", trigger_value);
+
+		fwrite(data, total_len, 1, command_fifo_file);
+	}
+
 	if (quit) {
 		struct recorder_command_base base = {
 			.command = RECORDER_COMMAND_QUIT,
diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
index 6b2f8710..8da21595 100644
--- a/tools/i915-perf/i915_perf_recorder.c
+++ b/tools/i915-perf/i915_perf_recorder.c
@@ -26,6 +26,7 @@
 #include <fcntl.h>
 #include <getopt.h>
 #include <inttypes.h>
+#include <limits.h>
 #include <poll.h>
 #include <signal.h>
 #include <stdbool.h>
@@ -377,6 +378,8 @@ struct recording_context {
 	uint32_t oa_status_reg;
 	uint32_t oa_buffer_reg;
 	uint32_t oa_tail_reg;
+	uint32_t oa_trigger_reg;
+	uint32_t oa_marker_reg;
 
 	int zero_fd;
 	void *zero_mem;
@@ -629,8 +632,21 @@ static int gem_execbuf(int fd, struct drm_i915_gem_execbuffer2 *execbuf)
 #define _MI_INSTR(opcode, flags)	(((opcode) << 23) | (flags))
 #define MI_STORE_REGISTER_MEM      	_MI_INSTR(0x24, 1)
 #define MI_STORE_REGISTER_MEM_GEN8 	_MI_INSTR(0x24, 2)
+#define MI_LOAD_REGISTER_IMM		((0x22 << 23) | 1)
+#define MI_NOOP				0x00
 #define MI_BATCH_BUFFER_END		(0xA << 23)
 
+static void
+bb_emit_lri(struct bb_context *bb, uint32_t reg, uint32_t val)
+{
+	assert(bb->offset < BATCH_SIZE);
+
+	bb->batch[bb->offset++] = MI_LOAD_REGISTER_IMM;
+	bb->batch[bb->offset++] = reg;
+	bb->batch[bb->offset++] = val;
+	bb->batch[bb->offset++] = MI_NOOP;
+}
+
 static void
 bb_emit_srm(struct bb_context *bb, uint32_t reg, uint32_t devid)
 {
@@ -747,6 +763,18 @@ err:
 #define GEN12_OAG_OATAILPTR  0xdb04
 #define GEN12_OAG_OASTATUS   0xdafc
 
+#define OAREPORTTRIG2 (0x2744)
+#define   OAREPORTTRIG2_INVERT_C_1  (1 << 21)
+#define   OAREPORTTRIG2_INVERT_D_0  (1 << 22)
+#define   OAREPORTTRIG2_REPORT_TRIGGER_ENABLE (1 << 31)
+#define OAREPORTTRIG6 (0x2754)
+#define OA_PERF_COUNTER_A(idx) (0x2800 + 8 * (idx))
+
+#define GEN12_OAREPORTTRIG2 (0xd924)
+#define GEN12_OAREPORTTRIG6 (0xd934)
+#define GEN12_OAG_PERF_COUNTER_A(idx) (0xD980 + 8 * (idx))
+
+
 static void
 init_oa_regs(struct recording_context *ctx)
 {
@@ -754,10 +782,14 @@ init_oa_regs(struct recording_context *ctx)
 		ctx->oa_status_reg = GEN12_OAG_OASTATUS;
 		ctx->oa_buffer_reg = GEN12_OAG_OABUFFER;
 		ctx->oa_tail_reg = GEN12_OAG_OATAILPTR;
+		ctx->oa_trigger_reg = GEN12_OAREPORTTRIG2;
+		ctx->oa_marker_reg = GEN12_OAG_PERF_COUNTER_A(18);
 	} else if (ctx->devinfo->graphics_ver >= 9) {
 		ctx->oa_status_reg = GEN8_OASTATUS;
 		ctx->oa_buffer_reg = GEN8_OABUFFER;
 		ctx->oa_tail_reg = GEN8_OATAILPTR;
+		ctx->oa_trigger_reg = OAREPORTTRIG2;
+		ctx->oa_marker_reg = OA_PERF_COUNTER_A(18);
 	}
 }
 
@@ -791,6 +823,31 @@ __read_oa_reg(struct recording_context *ctx, uint32_t reg, uint32_t *val)
 	return 0;
 }
 
+static int
+oa_trigger_report(struct recording_context *ctx, uint32_t reg,
+		  uint32_t trigger_marker)
+{
+	int ret;
+
+	bb_emit_lri(&ctx->bb, ctx->oa_marker_reg, trigger_marker);
+	bb_emit_lri(&ctx->bb, reg,
+		    OAREPORTTRIG2_INVERT_C_1 |
+		    OAREPORTTRIG2_REPORT_TRIGGER_ENABLE);
+	bb_emit_lri(&ctx->bb, reg,
+		    OAREPORTTRIG2_INVERT_C_1 |
+		    OAREPORTTRIG2_INVERT_D_0 |
+		    OAREPORTTRIG2_REPORT_TRIGGER_ENABLE);
+	bb_emit_bbe(&ctx->bb);
+	ret = bb_exec(ctx->drm_fd, &ctx->bb);
+	if (ret) {
+		fprintf(stderr, "failed to trigger oa report %08x, %s\n",
+			reg, strerror(errno));
+		return ret;
+	}
+
+	return 0;
+}
+
 static bool
 __process_oa_status(struct recording_context *ctx)
 {
@@ -996,6 +1053,35 @@ write_correlation_timestamps(FILE *output, int drm_fd)
 	return write_saved_correlation_timestamps(output, &corr);
 }
 
+static bool
+__valid_trigger_value(const char *str, uint32_t *trigger_value)
+{
+	char *endptr = '\0';
+	uint32_t value = strtoul(str, &endptr, 0);
+
+	if (value != ULONG_MAX && *endptr == '\0') {
+		*trigger_value = value;
+		return true;
+	}
+
+	return false;
+}
+
+static int read_command_data(int fd, uint8_t *buf, uint32_t len)
+{
+	uint32_t offset = 0;
+	ssize_t ret;
+
+	while (offset < len &&
+	       ((ret = read(fd, (void *)(buf + offset), len - offset)) > 0
+		|| errno == EAGAIN)) {
+		if (ret > 0)
+			offset += ret;
+	}
+
+	return ret;
+}
+
 static void
 read_command_file(struct recording_context *ctx)
 {
@@ -1007,17 +1093,12 @@ read_command_file(struct recording_context *ctx)
 
 	switch (header.command) {
 	case RECORDER_COMMAND_DUMP: {
-		uint32_t len = header.size - sizeof(header), offset = 0;
+		uint32_t len = header.size - sizeof(header);
 		uint8_t *dump = malloc(len);
 		FILE *file;
 
-		while (offset < len &&
-		       ((ret = read(ctx->command_fifo_fd,
-				    (void *) dump + offset, len - offset)) > 0
-			|| errno == EAGAIN)) {
-			if (ret > 0)
-				offset += ret;
-		}
+		assert(dump);
+		assert(read_command_data(ctx->command_fifo_fd, dump, len) > 0);
 
 		fprintf(stdout, "Writing circular buffer to %s\n", dump);
 
@@ -1049,6 +1130,27 @@ read_command_file(struct recording_context *ctx)
 	case RECORDER_COMMAND_QUIT:
 		quit = true;
 		break;
+	case RECORDER_COMMAND_TRIGGER: {
+		uint32_t len = header.size - sizeof(header);
+		uint32_t value;
+		char *trigger;
+
+		if (ctx->perf->devinfo.devid < 9) {
+			fprintf(stderr, "OA report trigger not supported on gen %d\n",
+				ctx->perf->devinfo.devid);
+			break;
+		}
+
+		trigger = malloc(len);
+		assert(trigger);
+		assert(read_command_data(ctx->command_fifo_fd, (uint8_t *)trigger, len) > 0);
+
+		if (__valid_trigger_value(trigger, &value))
+			oa_trigger_report(ctx, ctx->oa_trigger_reg, value);
+
+		free(trigger);
+		break;
+	}
 	default:
 		fprintf(stderr, "Unknown command 0x%x\n", header.command);
 		break;
diff --git a/tools/i915-perf/i915_perf_recorder_commands.h b/tools/i915-perf/i915_perf_recorder_commands.h
index d9353cfa..e48d9426 100644
--- a/tools/i915-perf/i915_perf_recorder_commands.h
+++ b/tools/i915-perf/i915_perf_recorder_commands.h
@@ -30,6 +30,7 @@
 enum recorder_command {
 	RECORDER_COMMAND_DUMP = 1,
 	RECORDER_COMMAND_QUIT,
+	RECORDER_COMMAND_TRIGGER,
 };
 
 struct recorder_command_base {
-- 
2.20.1
