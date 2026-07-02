Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78C3C43458
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jul 2026 05:23:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9EA10E43E;
	Thu,  2 Jul 2026 05:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DUYlv+B+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15F110E43E
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jul 2026 05:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782969803; x=1814505803;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=b8+0nTemjK2oGFkrDjsSCrxxGrhpsylgieHRQK37i0Y=;
 b=DUYlv+B+/CiAja4LIWAaZoDaytYfj39RhrELTljvc95xy2AfKzvVKEWN
 Kx/XfloOj9bPw1U/cSxDqpvjpJPGNNHRwPvxQn1zh7u8/xGSCdXTbrdN8
 Pimpzkb7VD+D/KioF8/fDvo6uI6TlBkE/8w1/emT1blKK5UqdBj3flzp6
 09DE201hwXyik2DYF7TI3PVO6D0USeKjUGCqaA2DDkF0WNpknl7Ybc7VV
 Dl6as8JWgohP8lmESow/LiQvMEK6edB0HYVGagkkpbS0WVXZHUjAKe1VF
 P6HuWUbth5N7g7YKCTmFkIqUZ2+A8DDGoJaEEs4dso+kjCpNfML0ar/cy Q==;
X-CSE-ConnectionGUID: 4C3HuRyrTPWExQtnU0iTpA==
X-CSE-MsgGUID: VV1dURiKTum5dZi55GyKAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="82700160"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="82700160"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 22:23:23 -0700
X-CSE-ConnectionGUID: mO5NociFSxW7ih74e/2X7A==
X-CSE-MsgGUID: tq93IfYtQfmHxGkxsfIERw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; d="scan'208";a="252322941"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2026 22:23:22 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	shekhar.chauhan@intel.com
Subject: [PATCH v2] tools/xe-perf-recorder: Add mmio-trigger support
Date: Thu,  2 Jul 2026 10:53:15 +0530
Message-ID: <20260702052315.3740840-1-shekhar.chauhan@intel.com>
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

v2: Add all OA unit types, fix includes, compile warnings and adding
extra triggger for file mode.

Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
---
 tools/xe-perf/xe_perf_recorder.c | 122 ++++++++++++++++++++++++++++++-
 1 file changed, 120 insertions(+), 2 deletions(-)

diff --git a/tools/xe-perf/xe_perf_recorder.c b/tools/xe-perf/xe_perf_recorder.c
index f200fe9c9..ecf1c7c27 100644
--- a/tools/xe-perf/xe_perf_recorder.c
+++ b/tools/xe-perf/xe_perf_recorder.c
@@ -26,19 +26,29 @@
 #include <unistd.h>
 
 #include "igt_core.h"
+#include "intel_batchbuffer.h"
 #include "intel_chipset.h"
+#include "intel_reg.h"
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
@@ -354,8 +364,47 @@ struct recording_context {
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
+		/* Find the first OAM unit, like oa_unit_by_type() in the IGT */
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
+		if ((int)oau->oa_unit_id == first_oam_id)
+			return XE_OAM_SCMI_0_BASE_ADJ + OAM_MMIOTRIGGER_OFFSET;
+		return XE_OAM_SCMI_1_BASE_ADJ + OAM_MMIOTRIGGER_OFFSET;
+	}
+	case DRM_XE_OA_UNIT_TYPE_OAM_SAG:
+		return XE_OAM_SAG_BASE_ADJ + OAM_MMIOTRIGGER_OFFSET;
+	case DRM_XE_OA_UNIT_TYPE_MERT:
+		return OAMERT_MMIOTRIGGER;
+	case DRM_XE_OA_UNIT_TYPE_OAG:
+	default:
+		return OAG_MMIOTRIGGER;
+	}
+}
+
 static void set_fd_flags(int fd, int flags)
 {
 	int old = fcntl(fd, F_GETFL, 0);
@@ -569,6 +618,28 @@ static bool write_stream_status(struct recording_context *ctx, FILE *output)
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
@@ -582,6 +653,8 @@ static bool write_stream_data(struct recording_context *ctx,
 			.size = sizeof(header) + format_size,
 		};
 
+		check_mmio_trigger_report(ctx, data + i * format_size);
+
 		if (fwrite(&header, sizeof(header), 1, output) != 1)
 			return false;
 
@@ -697,6 +770,22 @@ write_correlation_timestamps(struct recording_context *ctx, FILE *output)
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
@@ -712,6 +801,9 @@ read_command_file(struct recording_context *ctx)
 		uint8_t *dump = malloc(len);
 		FILE *file;
 
+		emit_oa_trigger(ctx, 0xc0ffee02);
+		write_perf_data(ctx->output_stream, ctx);
+
 		while (offset < len &&
 		       ((ret = read(ctx->command_fifo_fd,
 				    (void *) dump + offset, len - offset)) > 0
@@ -835,6 +927,13 @@ usage(const char *name)
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
 
@@ -912,6 +1011,18 @@ static int assign_oa_unit(int fd, struct recording_context *ctx)
 	return -1;
 }
 
+static int init_trigger_ctx(struct recording_context *ctx)
+{
+	ctx->vm = xe_vm_create(ctx->drm_fd, 0, 0);
+	ctx->exec_queue = xe_exec_queue_create(ctx->drm_fd, ctx->vm, ctx->hwe, 0);
+	ctx->ibb = intel_bb_create_with_context(ctx->drm_fd, ctx->exec_queue, ctx->vm,
+				 NULL, BATCH_SZ);
+	if (!ctx->ibb)
+		return -1;
+
+	return 0;
+}
+
 int
 main(int argc, char *argv[])
 {
@@ -1180,6 +1291,12 @@ main(int argc, char *argv[])
 		goto fail;
 	}
 
+	if (init_trigger_ctx(&ctx) < 0) {
+		fprintf(stderr, "Unable to initialize trigger context\n");
+		goto fail;
+	}
+	emit_oa_trigger(&ctx, 0xc0ffee01);
+
 	corr_period_ns = corr_period * 1000000000ul;
 	poll_time_ns = corr_period_ns;
 
@@ -1227,6 +1344,7 @@ main(int argc, char *argv[])
 		}
 	}
 
+	emit_oa_trigger(&ctx, 0xc0ffee02);
 	fprintf(stdout, "Exiting...\n");
 
 	if (!write_perf_data(ctx.output_stream, &ctx)) {
-- 
2.53.0

