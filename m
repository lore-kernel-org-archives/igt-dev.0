Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D792C4452F
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 03:33:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91DB610E288;
	Tue, 21 Jul 2026 03:33:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QtQo/C0M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AE8310E288
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 03:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784604764; x=1816140764;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lMLYOqy/IC7rl5t0N7lDFF9+aWJDduTRCtgJdIYpNWA=;
 b=QtQo/C0M4KDIMi2GFfmcdMb8e4lHJAyMgih6N6aHDpI3smiPUz6AVFkA
 KJzs8ObCccZuZp4TfRGZauBt5SFi9kaJqg7VmiFe9+NVSKt7IZ6z3G0Yv
 Ak4l23/y4n8O0kt0g/tC8a2A9YOfyrnQvMmrg3Z7nM0roTauP73pcoOH4
 Zt1g7JcA+Sn71vmo+JPDBEbe2ObZ25YqpEHaBP+CEoQGf+cskRaPERIv4
 5TsjieP/56yqbBOZCk18wyqdFC86XjFK/2V1qZq9HWGky06ufWWqXG5l1
 17Eb2ItMWBSpkpQ98KVSc2PixJu/XRX9seCqNyHhiIlgc3Oxr8K9BADnP Q==;
X-CSE-ConnectionGUID: XD2jRP2cQFCRL2hHFf7Gdw==
X-CSE-MsgGUID: y5jcPoqgTny5sniWoH7Udw==
X-IronPort-AV: E=McAfee;i="6800,10657,11852"; a="96552899"
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="96552899"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 20:32:43 -0700
X-CSE-ConnectionGUID: E3t35YW6SJ2YA42FfEDk3A==
X-CSE-MsgGUID: 9GFjRR+pSdmnx4dETKKaVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,175,1779174000"; d="scan'208";a="254996801"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2026 20:32:42 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	shekhar.chauhan@intel.com
Subject: [PATCH i-g-t v4] tools/xe-perf-recorder: Add mmio-trigger support
Date: Tue, 21 Jul 2026 09:02:35 +0530
Message-ID: <20260721033235.1951082-1-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Add mmio-trigger support to xe-perf-recorder, to justify the
whitelisting of OA MMIO Trigger Registers in XeKMD.

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 tools/xe-perf/xe_perf_recorder.c | 118 ++++++++++++++++++++++++++++++-
 1 file changed, 116 insertions(+), 2 deletions(-)

diff --git a/tools/xe-perf/xe_perf_recorder.c b/tools/xe-perf/xe_perf_recorder.c
index 61c3f6945..c69050b43 100644
--- a/tools/xe-perf/xe_perf_recorder.c
+++ b/tools/xe-perf/xe_perf_recorder.c
@@ -26,19 +26,28 @@
 #include <unistd.h>
 
 #include "igt_core.h"
+#include "intel_batchbuffer.h"
 #include "intel_chipset.h"
 #include "ioctl_wrappers.h"
 #include "linux_scaffold.h"
+#include "xe/xe_ioctl.h"
 #include "xe/xe_oa.h"
 #include "xe/xe_oa_data.h"
 #include "xe/xe_query.h"
 
 #include "xe_perf_recorder_commands.h"
 
-#define ALIGN(v, a) (((v) + (a)-1) & ~((a)-1))
-#define ARRAY_SIZE(arr) (sizeof(arr)/sizeof((arr)[0]))
 #define MAX(a,b) ((a) > (b) ? (a) : (b))
 #define MIN(a,b) ((a) < (b) ? (a) : (b))
+#define OAG_MMIOTRIGGER 0xdb1c
+#define OAMERT_MMIOTRIGGER 0x1453cc
+#define OAM_MMIOTRIGGER_OFFSET 0x1d0
+#define MEDIA_GT_GSI_OFFSET 0x380000
+#define XE_OAM_SAG_BASE_ADJ (MEDIA_GT_GSI_OFFSET + 0x13000)
+#define XE_OAM_SCMI_0_BASE_ADJ (MEDIA_GT_GSI_OFFSET + 0x14000)
+#define XE_OAM_SCMI_1_BASE_ADJ (MEDIA_GT_GSI_OFFSET + 0x14800)
+#define OAREPORT_REASON_MASK 0x3f
+#define OAREPORT_REASON_SHIFT 19
 
 struct circular_buffer {
 	char   *data;
@@ -354,8 +363,50 @@ struct recording_context {
 	int oa_unit_id;
 	struct drm_xe_oa_unit *oa_unit;
 	struct drm_xe_engine_class_instance *hwe;
+
+	uint32_t vm;
+	uint32_t exec_queue;
+	struct intel_bb *ibb;
 };
 
+static uint32_t oa_unit_mmio_trigger_reg(struct recording_context *ctx)
+{
+	const struct drm_xe_oa_unit *oau = ctx->oa_unit;
+
+	switch (oau->oa_unit_type) {
+	case DRM_XE_OA_UNIT_TYPE_OAM: {
+		struct drm_xe_query_oa_units *qoa = xe_oa_units(ctx->drm_fd);
+		uint8_t *poau = (uint8_t *)&qoa->oa_units[0];
+		int first_oam_id = -1;
+
+		/* Find the first OAM unit, as in oa_unit_by_type() */
+		for (int i = 0; i < qoa->num_oa_units; i++) {
+			struct drm_xe_oa_unit *u = (struct drm_xe_oa_unit *)poau;
+
+			if (u->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAM) {
+				first_oam_id = u->oa_unit_id;
+				break;
+			}
+			poau += sizeof(*u) + u->num_engines * sizeof(u->eci[0]);
+		}
+
+		assert(first_oam_id != -1);
+
+		if (oau->oa_unit_id == first_oam_id)
+			return XE_OAM_SCMI_0_BASE_ADJ + OAM_MMIOTRIGGER_OFFSET;
+		return XE_OAM_SCMI_1_BASE_ADJ + OAM_MMIOTRIGGER_OFFSET;
+	}
+	case DRM_XE_OA_UNIT_TYPE_OAM_SAG:
+		return XE_OAM_SAG_BASE_ADJ + OAM_MMIOTRIGGER_OFFSET;
+	case DRM_XE_OA_UNIT_TYPE_MERT:
+		return OAMERT_MMIOTRIGGER;
+	case DRM_XE_OA_UNIT_TYPE_OAG:
+		return OAG_MMIOTRIGGER;
+	default:
+		assert(0);
+	}
+}
+
 static void set_fd_flags(int fd, int flags)
 {
 	int old = fcntl(fd, F_GETFL, 0);
@@ -569,6 +620,28 @@ static bool write_stream_status(struct recording_context *ctx, FILE *output)
 	return true;
 }
 
+static uint32_t
+report_reason(const uint32_t *report)
+{
+	return (report[0] >> OAREPORT_REASON_SHIFT) & OAREPORT_REASON_MASK;
+}
+
+static void
+check_mmio_trigger_report(struct recording_context *ctx, const void *report)
+{
+	const struct xe_oa_format *fmt = &oa_formats[ctx->metric_set->perf_oa_format];
+	const uint32_t *report_32 = report;
+	uint64_t value;
+
+	if (report_reason(report_32))
+		return;
+
+	value = (fmt->header == HDR_64_BIT) ? ((const uint64_t *)report)[2] : report_32[2];
+
+	if (value == 0xc0ffee01 || value == 0xc0ffee02)
+		fprintf(stdout, "Received trigger report with value 0x%" PRIx64 "\n", value);
+}
+
 static bool write_stream_data(struct recording_context *ctx,
 			      char *data, ssize_t size, FILE *output)
 {
@@ -582,6 +655,8 @@ static bool write_stream_data(struct recording_context *ctx,
 			.size = sizeof(header) + format_size,
 		};
 
+		check_mmio_trigger_report(ctx, data);
+
 		if (fwrite(&header, sizeof(header), 1, output) != 1)
 			return false;
 
@@ -699,6 +774,22 @@ write_correlation_timestamps(struct recording_context *ctx, FILE *output)
 	return write_saved_correlation_timestamps(output, &corr);
 }
 
+static void emit_mmio_triggered_report(struct intel_bb *ibb, uint32_t reg, uint32_t value)
+{
+	intel_bb_out(ibb, MI_LOAD_REGISTER_IMM(1));
+	intel_bb_out(ibb, reg);
+	intel_bb_out(ibb, value);
+}
+
+static void emit_oa_trigger(struct recording_context *ctx, uint32_t value)
+{
+	emit_mmio_triggered_report(ctx->ibb, oa_unit_mmio_trigger_reg(ctx), value);
+
+	intel_bb_flush_render(ctx->ibb);
+	intel_bb_sync(ctx->ibb);
+	intel_bb_reset(ctx->ibb, false);
+}
+
 static void
 read_command_file(struct recording_context *ctx)
 {
@@ -714,6 +805,9 @@ read_command_file(struct recording_context *ctx)
 		uint8_t *dump = malloc(len);
 		FILE *file;
 
+		emit_oa_trigger(ctx, 0xc0ffee02);
+		write_perf_data(ctx->output_stream, ctx);
+
 		while (offset < len &&
 		       ((ret = read(ctx->command_fifo_fd,
 				    (void *) dump + offset, len - offset)) > 0
@@ -837,6 +931,13 @@ usage(const char *name)
 static void
 teardown_recording_context(struct recording_context *ctx)
 {
+	if (ctx->ibb)
+		intel_bb_destroy(ctx->ibb);
+	if (ctx->exec_queue)
+		xe_exec_queue_destroy(ctx->drm_fd, ctx->exec_queue);
+	if (ctx->vm)
+		xe_vm_destroy(ctx->drm_fd, ctx->vm);
+
 	if (ctx->topology)
 		free(ctx->topology);
 
@@ -914,6 +1015,14 @@ static int assign_oa_unit(int fd, struct recording_context *ctx)
 	return -1;
 }
 
+static void init_mmio_trigger_ctx(struct recording_context *ctx)
+{
+	ctx->vm = xe_vm_create(ctx->drm_fd, 0, 0);
+	ctx->exec_queue = xe_exec_queue_create(ctx->drm_fd, ctx->vm, ctx->hwe, 0);
+	ctx->ibb = intel_bb_create_with_context(ctx->drm_fd, ctx->exec_queue, ctx->vm,
+						NULL, BATCH_SZ);
+}
+
 int
 main(int argc, char *argv[])
 {
@@ -1182,6 +1291,9 @@ main(int argc, char *argv[])
 		goto fail;
 	}
 
+	init_mmio_trigger_ctx(&ctx);
+	emit_oa_trigger(&ctx, 0xc0ffee01);
+
 	corr_period_ns = corr_period * 1000000000ul;
 	poll_time_ns = corr_period_ns;
 
@@ -1229,6 +1341,8 @@ main(int argc, char *argv[])
 		}
 	}
 
+	/* Emit second OA trigger for the case where circular buffer is not used */
+	emit_oa_trigger(&ctx, 0xc0ffee02);
 	fprintf(stdout, "Exiting...\n");
 
 	if (!write_perf_data(ctx.output_stream, &ctx)) {
-- 
2.53.0

