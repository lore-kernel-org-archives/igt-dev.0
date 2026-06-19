Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BD9CD98F6
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jun 2026 05:03:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A7110E021;
	Fri, 19 Jun 2026 05:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ilKcZCaH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8410710E021
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jun 2026 05:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781845356; x=1813381356;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kWDHwq2tzq/RP4itcYd524wcb/Cy07C00DkLzFbuMNw=;
 b=ilKcZCaHFbkscwSInKOo+D9PtaYJ5Co/OB494SoIysT1q+KenHMunPHr
 IWi2RjJOqPnw1m+LYAcli5QPxgS/bJHotLkyVg8F3WRHSNlEUTDbScNSk
 xTCNNlmu8v7gO3wiCiNde0JhOQro4N+zs6xvBzQETOzg/VzgjopYhoTcm
 OstmoSEpfNXHWShoW3aZLxs8St3vd0fmxxtRSXi5MLkPIYU4/AMPVacc7
 GaMu28ZoiteoTMrz6eT4WypKgN+pT8EAHCPViknP2ZV3eRQYwOXgXBXyX
 s6qaLRBk6HhBWkJXQRN61vuSHFWZoeP1H+pBom22FLy+nSo90bzOcFkf4 w==;
X-CSE-ConnectionGUID: pjtlAA5DT8Ov40Exrqcnfg==
X-CSE-MsgGUID: wZRY9T+bQFqFLaQZ3VJAAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="108242222"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="108242222"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 22:02:36 -0700
X-CSE-ConnectionGUID: MfvPotQJS7OM24pPhOmmzA==
X-CSE-MsgGUID: JRqzSCMmQwOi8lvoLtPXXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; d="scan'208";a="248612534"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jun 2026 22:02:35 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com,
	shekhar.chauhan@intel.com
Subject: [PATCH] tools/xe-perf-recorder: Add mmio-trigger support
Date: Fri, 19 Jun 2026 10:32:17 +0530
Message-ID: <20260619050217.2112851-1-shekhar.chauhan@intel.com>
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
 tools/xe-perf/xe_perf_recorder.c | 83 ++++++++++++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/tools/xe-perf/xe_perf_recorder.c b/tools/xe-perf/xe_perf_recorder.c
index f200fe9c9..48a7d55d4 100644
--- a/tools/xe-perf/xe_perf_recorder.c
+++ b/tools/xe-perf/xe_perf_recorder.c
@@ -27,8 +27,11 @@
 
 #include "igt_core.h"
 #include "intel_chipset.h"
+#include "intel_batchbuffer.h"
+#include "intel_reg.h"
 #include "ioctl_wrappers.h"
 #include "linux_scaffold.h"
+#include "xe/xe_ioctl.h"
 #include "xe/xe_oa.h"
 #include "xe/xe_oa_data.h"
 #include "xe/xe_query.h"
@@ -39,6 +42,10 @@
 #define ARRAY_SIZE(arr) (sizeof(arr)/sizeof((arr)[0]))
 #define MAX(a,b) ((a) > (b) ? (a) : (b))
 #define MIN(a,b) ((a) < (b) ? (a) : (b))
+#define OAG_MMIOTRIGGER 0xdb1c
+#define TRIGGER_BB_SIZE 4096
+#define OAREPORT_REASON_MASK 0x3f
+#define OAREPORT_REASON_SHIFT 19
 
 struct circular_buffer {
 	char   *data;
@@ -354,8 +361,21 @@ struct recording_context {
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
+	switch (ctx->oa_unit->oa_unit_type) {
+	case DRM_XE_OA_UNIT_TYPE_OAG:
+	default:
+		return OAG_MMIOTRIGGER;
+	}
+}
+
 static void set_fd_flags(int fd, int flags)
 {
 	int old = fcntl(fd, F_GETFL, 0);
@@ -569,6 +589,23 @@ static bool write_stream_status(struct recording_context *ctx, FILE *output)
 	return true;
 }
 
+static void
+check_mmio_trigger_report(struct recording_context *ctx, const void *report)
+{
+	const struct xe_oa_format *fmt = &oa_formats[ctx->metric_set->perf_oa_format];
+	const uint32_t *report_32 = report;
+	uint32_t reason = (report_32[0] >> OAREPORT_REASON_SHIFT) & OAREPORT_REASON_MASK;
+	uint64_t value;
+
+	if (reason)
+		return;
+
+	value = (fmt->header == HDR_64_BIT) ? ((const uint64_t *)report)[2] : report_32[2];
+
+	if (value == 0xc0ffee01  || value == 0xc0ffee02)
+		fprintf(stdout, "Received trigger report with value 0x%" PRIx64 "\n", value);
+}
+
 static bool write_stream_data(struct recording_context *ctx,
 			      char *data, ssize_t size, FILE *output)
 {
@@ -582,6 +619,8 @@ static bool write_stream_data(struct recording_context *ctx,
 			.size = sizeof(header) + format_size,
 		};
 
+		check_mmio_trigger_report(ctx, data + i * format_size);
+
 		if (fwrite(&header, sizeof(header), 1, output) != 1)
 			return false;
 
@@ -697,6 +736,22 @@ write_correlation_timestamps(struct recording_context *ctx, FILE *output)
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
@@ -726,6 +781,9 @@ read_command_file(struct recording_context *ctx)
 		if (file) {
 			struct chunk chunks[2];
 
+			emit_oa_trigger(ctx, 0xc0ffee02);
+			write_perf_data(ctx->output_stream, ctx);
+
 			fflush(ctx->output_stream);
 			get_chunks(chunks, &ctx->circular_buffer,
 				   false, ctx->circular_buffer.size);
@@ -835,6 +893,13 @@ usage(const char *name)
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
 
@@ -912,6 +977,18 @@ static int assign_oa_unit(int fd, struct recording_context *ctx)
 	return -1;
 }
 
+static int init_trigger_ctx(struct recording_context *ctx)
+{
+	ctx->vm = xe_vm_create(ctx->drm_fd, 0, 0);
+	ctx->exec_queue = xe_exec_queue_create(ctx->drm_fd, ctx->vm, ctx->hwe, 0);
+	ctx->ibb = intel_bb_create_with_context(ctx->drm_fd, ctx->exec_queue, ctx->vm,
+				 NULL, TRIGGER_BB_SIZE);
+	if (!ctx->ibb)
+		return -1;
+
+	return 0;
+}
+
 int
 main(int argc, char *argv[])
 {
@@ -1180,6 +1257,12 @@ main(int argc, char *argv[])
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
 
-- 
2.53.0

