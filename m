Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBE489BFC
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Aug 2021 19:33:43 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Mon, 30 Aug 2021 12:33:36 -0700
Message-Id: <20210830193337.15260-4-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20210830193337.15260-1-umesh.nerlige.ramappa@intel.com>
References: <20210830193337.15260-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 4/5] tools/i915-perf: Add mmapped OA buffer
 support to i915-perf-recorder
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Lionel G Landwerlin <lionel.g.landwerlin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Currently report from OA buffer are read from the perf_fd. The kernel
patches enable mmaping the OA buffer into user space to allow for faster
report queries across different platforms and engines.

Enable OA buffer to be mmaped by the recorder tool based on command line
option -M.

Example:
i915-perf-recorder -m RenderBasic -s 8000 -k "mono" -M

The recorder processes the mmaped OA buffer by periodically reading the
OA TAIL PTR register from a batch and determining the number of reports
available. These reports are then logged in the circular-buffer as
INTEL_PERF_RECORD_TYPE_MULTIPLE_SAMPLE records. In this implementation
the periodicity of checking the TAIL is the same as writing correlation
timestamps (1 sec).

v2: Avoid unnecessarily draining the OA buffer (Ashutosh)
v3: Use igt lib helpers (Ashutosh)

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tools/i915-perf/i915_perf_recorder.c | 375 ++++++++++++++++++++++++++-
 tools/i915-perf/meson.build          |   6 +-
 2 files changed, 366 insertions(+), 15 deletions(-)

diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
index 00195290..7481f33c 100644
--- a/tools/i915-perf/i915_perf_recorder.c
+++ b/tools/i915-perf/i915_perf_recorder.c
@@ -34,6 +34,7 @@
 #include <stdlib.h>
 #include <string.h>
 #include <sys/ioctl.h>
+#include <sys/mman.h>
 #include <sys/stat.h>
 #include <sys/sysmacros.h>
 #include <sys/time.h>
@@ -44,11 +45,16 @@
 #include <i915_drm.h>
 
 #include "igt_core.h"
+#include "intel_allocator.h"
 #include "intel_chipset.h"
+#include "intel_ctx.h"
+#include "i915/gem_create.h"
+#include "i915/gem_mman.h"
 #include "i915/perf.h"
 #include "i915/perf_data.h"
 
 #include "i915_perf_recorder_commands.h"
+#include "ioctl_wrappers.h"
 
 #define ALIGN(v, a) (((v) + (a)-1) & ~((a)-1))
 #define ARRAY_SIZE(arr) (sizeof(arr)/sizeof((arr)[0]))
@@ -331,6 +337,18 @@ get_device_timestamp_frequency(const struct intel_device_info *devinfo, int drm_
 	return 12000000;
 }
 
+struct bb_context {
+	struct drm_i915_gem_relocation_entry reloc[2];
+	struct drm_i915_gem_exec_object2 obj[2];
+	struct drm_i915_gem_execbuffer2 execbuf;
+	uint32_t *batch;
+	uint32_t *dest;
+	uint32_t offset;
+	uint32_t reloc_idx;
+	uint64_t ahnd;
+	const intel_ctx_t *ctx;
+};
+
 struct recording_context {
 	int drm_fd;
 	int perf_fd;
@@ -355,6 +373,19 @@ struct recording_context {
 	int command_fifo_fd;
 
 	uint64_t poll_period;
+	double perf_period;
+
+	uint32_t max_record_length;
+
+	uint8_t *oa_buffer_vaddr;
+	uint32_t oa_buffer_size;
+	uint32_t tail_offset;
+	uint32_t head_offset;
+	uint32_t oa_status_reg;
+	uint32_t oa_buffer_reg;
+	uint32_t oa_tail_reg;
+
+	struct bb_context bb;
 };
 
 static int
@@ -527,6 +558,270 @@ write_i915_perf_data(FILE *output, int perf_fd)
 	return true;
 }
 
+#define BATCH_SIZE 4096
+#define DEST_SIZE 4096
+
+#define _MI_INSTR(opcode, flags)	(((opcode) << 23) | (flags))
+#define MI_STORE_REGISTER_MEM      	_MI_INSTR(0x24, 1)
+#define MI_STORE_REGISTER_MEM_GEN8 	_MI_INSTR(0x24, 2)
+#define MI_BATCH_BUFFER_END		(0xA << 23)
+
+static void
+bb_emit_srm(struct bb_context *bb, uint32_t reg, uint32_t devid)
+{
+	bool gen8_plus = devid >= 8;
+	uint64_t mem;
+
+	assert(bb->reloc_idx < ARRAY_SIZE(bb->reloc));
+	assert(bb->offset < BATCH_SIZE);
+
+	bb->batch[bb->offset++] = gen8_plus ? MI_STORE_REGISTER_MEM_GEN8 :
+					      MI_STORE_REGISTER_MEM;
+	bb->batch[bb->offset++] = reg;
+
+	bb->reloc[bb->reloc_idx].target_handle = bb->obj[0].handle;
+	bb->reloc[bb->reloc_idx].presumed_offset = bb->obj[0].offset;
+	bb->reloc[bb->reloc_idx].offset = bb->offset * sizeof(uint32_t);
+	bb->reloc[bb->reloc_idx].delta = bb->reloc_idx * sizeof(uint32_t);
+	bb->reloc[bb->reloc_idx].read_domains = I915_GEM_DOMAIN_RENDER;
+	bb->reloc[bb->reloc_idx].write_domain = I915_GEM_DOMAIN_RENDER;
+
+	mem = bb->obj[0].offset + bb->reloc[bb->reloc_idx].delta;
+	bb->batch[bb->offset++] = mem;
+	if (gen8_plus)
+		bb->batch[bb->offset++] = mem >> 32;
+
+	bb->reloc_idx++;
+}
+
+static void
+bb_emit_bbe(struct bb_context *bb)
+{
+	bb->batch[bb->offset++] = MI_BATCH_BUFFER_END;
+}
+
+static void
+bb_exec(int fd, struct bb_context *bb)
+{
+	struct drm_i915_gem_execbuffer2 *execbuf = &bb->execbuf;
+
+	memset(execbuf, 0, sizeof(*execbuf));
+	if (bb->reloc_idx) {
+		bb->obj[1].relocation_count = !bb->ahnd ? bb->reloc_idx : 0;
+		execbuf->buffers_ptr = to_user_pointer(bb->obj);
+		execbuf->buffer_count = 2;
+	} else {
+		bb->obj[1].relocation_count = 0;
+		execbuf->buffers_ptr = to_user_pointer(&bb->obj[1]);
+		execbuf->buffer_count = 1;
+	}
+	execbuf->rsvd1 = bb->ctx->id;
+	gem_execbuf(fd, execbuf);
+
+	bb->reloc_idx = 0;
+	bb->offset = 0;
+}
+
+static void
+bb_ctx_fini(struct recording_context *ctx)
+{
+	struct bb_context *bb = &ctx->bb;
+
+	intel_ctx_destroy(ctx->drm_fd, bb->ctx);
+
+	if (bb->batch)
+		munmap(bb->batch, BATCH_SIZE);
+
+	if (bb->obj[1].handle)
+		gem_close(ctx->drm_fd, bb->obj[1].handle);
+
+	if (bb->obj[0].handle)
+		gem_close(ctx->drm_fd, bb->obj[0].handle);
+
+	put_ahnd(bb->ahnd);
+}
+
+static int
+bb_ctx_init(struct recording_context *ctx)
+{
+	struct bb_context *bb = &ctx->bb;
+	struct drm_i915_gem_exec_object2 *obj = bb->obj;
+	int fd = ctx->drm_fd;
+
+	memset(bb, 0, sizeof(struct bb_context));
+
+	bb->ctx = intel_ctx_create(fd, NULL);
+	bb->ahnd = get_reloc_ahnd(fd, bb->ctx->id);
+
+	obj[0].handle = gem_create(fd, DEST_SIZE);
+	obj[1].handle = gem_create(fd, BATCH_SIZE);
+	obj[1].relocs_ptr = to_user_pointer(bb->reloc);
+	if (bb->ahnd) {
+		obj[0].offset = get_offset(bb->ahnd, obj[0].handle, DEST_SIZE, 0);
+		obj[0].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE;
+		obj[1].offset = get_offset(bb->ahnd, obj[1].handle, BATCH_SIZE, 0);
+		obj[1].flags |= EXEC_OBJECT_PINNED;
+	}
+
+	bb->batch = gem_mmap__cpu_coherent(fd, obj[1].handle, 0, BATCH_SIZE, PROT_WRITE);
+	if (!bb->batch)
+		goto err;
+
+	gem_set_domain(fd, obj[1].handle, I915_GEM_DOMAIN_CPU, I915_GEM_DOMAIN_CPU);
+
+	return 0;
+err:
+	bb_ctx_fini(ctx);
+	return -1;
+}
+
+#define OA_PTR_MASK 0xffffffc0
+
+#define GEN8_OABUFFER	0x2b14
+#define GEN8_OATAILPTR	0x2B10
+#define GEN8_OASTATUS   0x2b08
+#define  GEN8_OASTATUS_OABUFFER_OVERFLOW    (1 << 1)
+#define  GEN8_OASTATUS_REPORT_LOST	    (1 << 0)
+
+#define GEN12_OAG_OABUFFER   0xdb08
+#define GEN12_OAG_OATAILPTR  0xdb04
+#define GEN12_OAG_OASTATUS   0xdafc
+
+static void
+init_oa_regs(struct recording_context *ctx)
+{
+	if (ctx->devinfo->graphics_ver >= 12) {
+		ctx->oa_status_reg = GEN12_OAG_OASTATUS;
+		ctx->oa_buffer_reg = GEN12_OAG_OABUFFER;
+		ctx->oa_tail_reg = GEN12_OAG_OATAILPTR;
+	} else if (ctx->devinfo->graphics_ver >= 9) {
+		ctx->oa_status_reg = GEN8_OASTATUS;
+		ctx->oa_buffer_reg = GEN8_OABUFFER;
+		ctx->oa_tail_reg = GEN8_OATAILPTR;
+	}
+}
+
+static void
+__read_oa_reg(struct recording_context *ctx, uint32_t reg, uint32_t *val)
+{
+	struct bb_context *bb = &ctx->bb;
+	int fd = ctx->drm_fd;
+
+	bb_emit_srm(bb, reg, ctx->perf->devinfo.devid);
+	bb_emit_bbe(bb);
+	bb_exec(fd, bb);
+	bb->dest = gem_mmap__cpu_coherent(fd, bb->obj[0].handle, 0, DEST_SIZE, PROT_READ);
+	assert(bb->dest);
+	gem_set_domain(fd, bb->obj[0].handle, I915_GEM_DOMAIN_CPU, 0);
+
+	*val = bb->dest[0];
+	munmap(bb->dest, DEST_SIZE);
+}
+
+static bool
+__process_oa_status(struct recording_context *ctx)
+{
+	struct drm_i915_perf_record_header header = {
+		.type = 0,
+		.pad = 0,
+		.size = sizeof(header)
+	};
+	uint32_t status;
+
+	__read_oa_reg(ctx, ctx->oa_status_reg, &status);
+	if (status & GEN8_OASTATUS_REPORT_LOST) {
+		header.type = DRM_I915_PERF_RECORD_OA_REPORT_LOST;
+		if (fwrite(&header, sizeof(header), 1, ctx->output_stream) != 1)
+			return false;
+	}
+
+	return true;
+}
+
+static inline uint32_t
+__data_available(uint32_t tail, uint32_t head, uint32_t size)
+{
+	return tail >= head ? tail - head : size - (head - tail);
+}
+
+static inline uint32_t
+__rewind_tail(uint32_t tail, uint32_t report_size, uint32_t oa_buffer_size)
+{
+	return tail >= report_size ?
+	       tail - report_size :
+	       oa_buffer_size - (report_size - tail);
+}
+
+static bool
+write_i915_perf_mmapped_data(struct recording_context *ctx)
+{
+	uint32_t report_size = ctx->metric_set->perf_raw_size;
+	struct drm_i915_perf_record_header header;
+	uint32_t buff, tail, data_len;
+
+	if (!__process_oa_status(ctx))
+		return false;
+
+	__read_oa_reg(ctx, ctx->oa_buffer_reg, &buff);
+	buff = buff & OA_PTR_MASK;
+
+	__read_oa_reg(ctx, ctx->oa_tail_reg, &tail);
+	tail = (tail & OA_PTR_MASK) - buff;
+
+	/*
+	 * tail increments in 64 bytes, so round up to nearest report. note that
+	 * oa buffer size may not be a power of 2 and a report may split across
+	 * the boundary of the oa buffer
+	 */
+	data_len = __data_available(tail, ctx->head_offset, ctx->oa_buffer_size);
+	assert(data_len <= ctx->oa_buffer_size);
+
+	tail -= data_len % report_size;
+	ctx->tail_offset = tail;
+
+	while (ctx->tail_offset != ctx->head_offset) {
+		const uint32_t *report32 = (uint32_t *)(ctx->oa_buffer_vaddr +
+							ctx->tail_offset);
+
+		if (report32[0] || report32[1])
+			break;
+
+		ctx->tail_offset = __rewind_tail(ctx->tail_offset, report_size,
+						 ctx->oa_buffer_size);
+	}
+
+	data_len = __data_available(ctx->tail_offset, ctx->head_offset,
+				    ctx->oa_buffer_size);
+	if (!data_len)
+		return true;
+
+	assert(data_len < ctx->oa_buffer_size);
+
+	header.type = INTEL_PERF_RECORD_TYPE_MULTIPLE_SAMPLE;
+	while (data_len > 0) {
+		uint32_t len;
+
+		len = MIN(data_len, ctx->max_record_length);
+		len = MIN(len, ctx->oa_buffer_size - ctx->head_offset);
+
+		header.size = sizeof(header) + len;
+		if (fwrite(&header, sizeof(header), 1, ctx->output_stream) != 1)
+			return false;
+
+		if (fwrite(ctx->oa_buffer_vaddr + ctx->head_offset, len, 1, ctx->output_stream) != 1)
+			return false;
+
+		data_len -= len;
+		ctx->head_offset = ctx->head_offset + len;
+
+		assert(ctx->head_offset <= ctx->oa_buffer_size);
+		if (ctx->head_offset == ctx->oa_buffer_size)
+			ctx->head_offset = 0;
+	}
+
+	return true;
+}
+
 static uint64_t timespec_diff(struct timespec *begin,
 			      struct timespec *end)
 {
@@ -667,6 +962,21 @@ read_command_file(struct recording_context *ctx)
 	}
 }
 
+static void
+mmap_oa_buffer(struct recording_context *ctx)
+{
+	struct drm_i915_perf_oa_buffer_info oa_info = {0};
+	void *vaddr;
+
+	perf_ioctl(ctx->perf_fd, I915_PERF_IOCTL_GET_OA_BUFFER_INFO, &oa_info);
+	vaddr = mmap(0, oa_info.size, PROT_READ, MAP_PRIVATE, ctx->perf_fd,
+		     oa_info.offset);
+	assert(vaddr != NULL);
+
+	ctx->oa_buffer_size = oa_info.size;
+	ctx->oa_buffer_vaddr = vaddr;
+}
+
 static void
 print_metric_sets(const struct intel_perf *perf)
 {
@@ -761,6 +1071,11 @@ teardown_recording_context(struct recording_context *ctx)
 
 	free(ctx->circular_buffer.data);
 
+	if (ctx->oa_buffer_vaddr)
+		munmap(ctx->oa_buffer_vaddr, ctx->oa_buffer_size);
+
+	bb_ctx_fini(ctx);
+
 	if (ctx->perf_fd != -1)
 		close(ctx->perf_fd);
 	if (ctx->drm_fd != -1)
@@ -781,6 +1096,7 @@ main(int argc, char *argv[])
 		{"command-fifo",         required_argument, 0, 'f'},
 		{"cpu-clock",            required_argument, 0, 'k'},
 		{"poll-period",          required_argument, 0, 'P'},
+		{"mmap-buffer",                no_argument, 0, 'M'},
 		{0, 0, 0, 0}
 	};
 	const struct {
@@ -791,7 +1107,7 @@ main(int argc, char *argv[])
 		{ CLOCK_MONOTONIC,     "mono" },
 		{ CLOCK_MONOTONIC_RAW, "mono_raw" },
 	};
-	double corr_period = 1.0, perf_period = 0.001;
+	double corr_period = 1.0;
 	const char *metric_name = NULL, *output_file = "i915_perf.record";
 	struct intel_perf_metric_set *metric_set;
 	struct intel_perf_record_timestamp_correlation initial_correlation;
@@ -799,7 +1115,7 @@ main(int argc, char *argv[])
 	uint64_t corr_period_ns, poll_time_ns;
 	uint32_t circular_size = 0;
 	int opt;
-	bool list_counters = false;
+	bool list_counters = false, mmap_buffer = false;
 	FILE *output = NULL;
 	struct recording_context ctx = {
 		.drm_fd = -1,
@@ -810,9 +1126,16 @@ main(int argc, char *argv[])
 
 		/* 5 ms poll period */
 		.poll_period = 5 * 1000 * 1000,
+		.perf_period = 0.001,
+
+		.oa_buffer_vaddr = NULL,
+		.head_offset = 0,
+		.tail_offset = 0,
+		.oa_buffer_size = 0,
 	};
 
-	while ((opt = getopt_long(argc, argv, "hc:p:m:Co:s:f:k:P:", long_options, NULL)) != -1) {
+	memset(&ctx.bb, 0, sizeof(ctx.bb));
+	while ((opt = getopt_long(argc, argv, "hc:p:m:Co:s:f:k:P:M", long_options, NULL)) != -1) {
 		switch (opt) {
 		case 'h':
 			usage(argv[0]);
@@ -821,7 +1144,7 @@ main(int argc, char *argv[])
 			corr_period = atof(optarg);
 			break;
 		case 'p':
-			perf_period = atof(optarg);
+			ctx.perf_period = atof(optarg);
 			break;
 		case 'm':
 			metric_name = optarg;
@@ -857,6 +1180,9 @@ main(int argc, char *argv[])
 		case 'P':
 			ctx.poll_period = MAX(100, atol(optarg)) * 1000;
 			break;
+		case 'M':
+			mmap_buffer = true;
+			break;
 		default:
 			fprintf(stderr, "Internal error: "
 				"unexpected getopt value: %d\n", opt);
@@ -876,6 +1202,10 @@ main(int argc, char *argv[])
 		fprintf(stderr, "No device info found.\n");
 		goto fail;
 	}
+	if (ctx.devinfo->graphics_ver < 9 && mmap_buffer) {
+		fprintf(stderr, "mmap_buffer not supported on graphics version less than 9\n");
+		goto fail;
+	}
 
 	fprintf(stdout, "Device name=%s gen=%i gt=%i id=0x%x\n",
 		ctx.devinfo->codename, ctx.devinfo->graphics_ver, ctx.devinfo->gt, ctx.devid);
@@ -926,6 +1256,11 @@ main(int argc, char *argv[])
 		goto fail;
 	}
 
+	/* header size is a uint16_t, so accomodate the header first */
+	ctx.max_record_length = 65535 - sizeof(struct drm_i915_perf_record_header);
+	/* accomodate only full report sizes */
+	ctx.max_record_length -= (ctx.max_record_length % ctx.metric_set->perf_raw_size);
+
 	intel_perf_load_perf_configs(ctx.perf, ctx.drm_fd);
 
 	ctx.timestamp_frequency = get_device_timestamp_frequency(ctx.devinfo, ctx.drm_fd);
@@ -1000,7 +1335,7 @@ main(int argc, char *argv[])
 		goto fail;
 	}
 
-	ctx.oa_exponent = oa_exponent_for_period(ctx.timestamp_frequency, perf_period);
+	ctx.oa_exponent = oa_exponent_for_period(ctx.timestamp_frequency, ctx.perf_period);
 	fprintf(stdout, "Opening perf stream with metric_id=%"PRIu64" oa_exponent=%u oa_format=%u\n",
 		ctx.metric_set->perf_oa_metrics_set, ctx.oa_exponent,
 		ctx.metric_set->perf_oa_format);
@@ -1015,16 +1350,27 @@ main(int argc, char *argv[])
 	corr_period_ns = corr_period * 1000000000ul;
 	poll_time_ns = corr_period_ns;
 
+	if (mmap_buffer) {
+		if (bb_ctx_init(&ctx)) {
+			fprintf(stderr, "Unable to initialize batch buffer %s\n", strerror(errno));
+			goto fail;
+		}
+
+		init_oa_regs(&ctx);
+		mmap_oa_buffer(&ctx);
+	}
+
 	while (!quit) {
 		struct pollfd pollfd[2] = {
-			{         ctx.perf_fd, POLLIN, 0 },
 			{ ctx.command_fifo_fd, POLLIN, 0 },
+			{ ctx.perf_fd, POLLIN, 0 },
 		};
 		uint64_t elapsed_ns;
+		nfds_t num_fds = mmap_buffer ? 1 : 2;
 		int ret;
 
 		igt_gettime(&now);
-		ret = poll(pollfd, ctx.command_fifo_fd != -1 ? 2 : 1, poll_time_ns / 1000000);
+		ret = poll(pollfd, num_fds, poll_time_ns / 1000000);
 		if (ret < 0 && errno != EINTR) {
 			fprintf(stderr, "Failed to poll i915-perf stream: %s\n",
 				strerror(errno));
@@ -1032,17 +1378,16 @@ main(int argc, char *argv[])
 		}
 
 		if (ret > 0) {
-			if (pollfd[0].revents & POLLIN) {
+			if (pollfd[0].revents & POLLIN)
+				read_command_file(&ctx);
+
+			if (num_fds > 1 && pollfd[1].revents & POLLIN) {
 				if (!write_i915_perf_data(ctx.output_stream, ctx.perf_fd)) {
 					fprintf(stderr, "Failed to write i915-perf data: %s\n",
 						strerror(errno));
 					break;
 				}
 			}
-
-			if (pollfd[1].revents & POLLIN) {
-				read_command_file(&ctx);
-			}
 		}
 
 		elapsed_ns = igt_nsec_elapsed(&now);
@@ -1054,6 +1399,12 @@ main(int argc, char *argv[])
 					strerror(errno));
 				break;
 			}
+
+			if (mmap_buffer && !write_i915_perf_mmapped_data(&ctx)) {
+				fprintf(stderr, "Failed to write i915-perf mmapped data: %s\n",
+					strerror(errno));
+				break;
+			}
 		} else {
 			poll_time_ns -= elapsed_ns;
 		}
diff --git a/tools/i915-perf/meson.build b/tools/i915-perf/meson.build
index 3fbf20a0..60abb694 100644
--- a/tools/i915-perf/meson.build
+++ b/tools/i915-perf/meson.build
@@ -5,9 +5,9 @@ executable('i915-perf-configs',
            install: true)
 
 executable('i915-perf-recorder',
-           [ 'i915_perf_recorder.c' ],
-           include_directories: inc,
-           dependencies: [lib_igt, lib_igt_i915_perf],
+           [ 'i915_perf_recorder.c', '../../lib/stubs/drm/intel_bufmgr.c' ],
+           include_directories: [ inc, include_directories('../../lib/stubs/drm') ],
+           dependencies: [ lib_igt, lib_igt_i915_perf ],
            install: true)
 
 executable('i915-perf-control',
-- 
2.20.1
