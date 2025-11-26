Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF7DD10379
	for <igt-dev@archiver.kernel.org>; Wed, 26 Nov 2025 03:50:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27BBF10E502;
	Wed, 26 Nov 2025 03:50:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DupX6qim";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB74B10E0F7
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Nov 2025 03:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764129020; x=1795665020;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lySY9flbcu/nxrRGrRrEQ95q+nBKI0Jm5VpRh9OIGms=;
 b=DupX6qimG4bu2q8Ficumj3WJ1sjBNEe/Rl70SDZmYzJxT9nq2jNp/xDt
 YaBu6xY2moHSPWAr9y+oGhQ78g8Bl88qNVsAq/8he/OTQbH/uHXWgg+/5
 Mh7tascYhcSTcdZmcOTZjRmZ20Qk7gQ+QP0fAqAKXq7sw6cfvdRqQD5wh
 f7aScAoWYwpAumiNLbzXr4jcJfLSbMfl5AQq5LExG+ZqCpufgRWlMaFpd
 ScLEa4SuQSzoRb+S3yuAHJ/BTdMbV6ROOq+nO3C988/g/eZ7in4REtoTq
 aDCrkcESHtDnhsYApe3r5bSjUNd4w76RW4ijTcV5Iyj9V+45B3f8ktSo+ Q==;
X-CSE-ConnectionGUID: WSTZzsEpTzWe+5U2NprPHw==
X-CSE-MsgGUID: jP5MVAZfRoyiJw4qy9Nuqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="76840039"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="76840039"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 19:50:19 -0800
X-CSE-ConnectionGUID: fFPg/AYgR+m43uoB992jZw==
X-CSE-MsgGUID: dZQ1x6yGQsSv1ZNLBFxltA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; d="scan'208";a="193639497"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2025 19:50:19 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 4/5] tests/intel/xe_oa: Run mmio-trigger tests on all OA
 units
Date: Tue, 25 Nov 2025 19:50:11 -0800
Message-ID: <20251126035012.12967-5-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251126035012.12967-1-ashutosh.dixit@intel.com>
References: <20251126035012.12967-1-ashutosh.dixit@intel.com>
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

Expand mmio-trigger tests to all OA units (rather than just OAG unit).

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 102 +++++++++++++++++++++++++++++++++++++-------
 1 file changed, 87 insertions(+), 15 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index c8475720c5..2f966e808f 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -73,9 +73,7 @@
 
 #define OAG_OASTATUS (0xdafc)
 #define OAG_PERF_COUNTER_B(idx) (0xDA94 + 4 * (idx))
-#define OAG_OATAILPTR (0xdb04)
 #define OAG_OATAILPTR_MASK 0xffffffc0
-#define OAG_OABUFFER (0xdb08)
 
 #define XE_OA_MAX_SET_PROPERTIES 16
 
@@ -93,6 +91,24 @@ struct accumulator {
 	uint64_t deltas[MAX_RAW_OA_COUNTERS];
 };
 
+#define MEDIA_GT_GSI_OFFSET		0x380000
+#define XE_OAM_SAG_BASE_ADJ		(MEDIA_GT_GSI_OFFSET + 0x13000)
+#define XE_OAM_SCMI_0_BASE_ADJ		(MEDIA_GT_GSI_OFFSET + 0x14000)
+#define XE_OAM_SCMI_1_BASE_ADJ		(MEDIA_GT_GSI_OFFSET + 0x14800)
+
+/** struct xe_oa_regs - Registers for each OA unit */
+struct xe_oa_regs {
+	u32 base;
+	u32 oa_head_ptr;
+	u32 oa_tail_ptr;
+	u32 oa_buffer;
+	u32 oa_ctx_ctrl;
+	u32 oa_ctrl;
+	u32 oa_debug;
+	u32 oa_status;
+	u32 oa_mmio_trg;
+};
+
 struct oa_buf_size {
 	char name[12];
 	uint32_t size;
@@ -3901,10 +3917,10 @@ emit_oa_reg_read(struct intel_bb *ibb, struct intel_buf *dst, uint32_t offset,
 }
 
 static void
-emit_mmio_triggered_report(struct intel_bb *ibb, uint32_t value)
+emit_mmio_triggered_report(struct intel_bb *ibb, uint32_t reg, uint32_t value)
 {
 	intel_bb_out(ibb, MI_LOAD_REGISTER_IMM(1));
-	intel_bb_out(ibb, OAG_MMIOTRIGGER);
+	intel_bb_out(ibb, reg);
 	intel_bb_out(ibb, value);
 }
 
@@ -3979,6 +3995,58 @@ static u32 oa_get_mmio_base(const struct drm_xe_engine_class_instance *hwe)
 	return mmio_base;
 }
 
+/* For register mmio offsets look at drivers/gpu/drm/xe/regs/xe_oa_regs.h in the kernel */
+static struct xe_oa_regs __oag_regs(void)
+{
+	return (struct xe_oa_regs) {
+		.base		= 0,
+		.oa_head_ptr	= 0xdb00,
+		.oa_tail_ptr	= 0xdb04,
+		.oa_buffer	= 0xdb08,
+		.oa_ctx_ctrl	= 0x2b28,
+		.oa_ctrl	= 0xdaf4,
+		.oa_debug	= 0xdaf8,
+		.oa_status	= 0xdafc,
+		.oa_mmio_trg	= 0xdb1c,
+	};
+}
+
+static struct xe_oa_regs __oam_regs(u32 base)
+{
+	return (struct xe_oa_regs) {
+		.base		= base,
+		.oa_head_ptr	= base + 0x1a0,
+		.oa_tail_ptr	= base + 0x1a4,
+		.oa_buffer	= base + 0x1a8,
+		.oa_ctx_ctrl	= base + 0x1bc,
+		.oa_ctrl	= base + 0x194,
+		.oa_debug	= base + 0x198,
+		.oa_status	= base + 0x19c,
+		.oa_mmio_trg	= base + 0x1d0,
+	};
+}
+
+static struct xe_oa_regs oa_unit_regs(const struct drm_xe_oa_unit *oau)
+{
+	switch (oau->oa_unit_type) {
+	case DRM_XE_OA_UNIT_TYPE_OAM: {
+		const struct drm_xe_oa_unit *first_oam_unit =
+			oa_unit_by_type(drm_fd, DRM_XE_OA_UNIT_TYPE_OAM);
+
+		igt_assert(first_oam_unit);
+		if (oau->oa_unit_id == first_oam_unit->oa_unit_id)
+			return __oam_regs(XE_OAM_SCMI_0_BASE_ADJ);
+		else
+			return __oam_regs(XE_OAM_SCMI_1_BASE_ADJ);
+	}
+	case DRM_XE_OA_UNIT_TYPE_OAM_SAG:
+		return __oam_regs(XE_OAM_SAG_BASE_ADJ);
+	case DRM_XE_OA_UNIT_TYPE_OAG:
+	default:
+		return __oag_regs();
+	}
+}
+
 /**
  * SUBTEST: oa-regs-whitelisted
  * Description: Verify that OA registers are whitelisted
@@ -4034,6 +4102,7 @@ __test_mmio_triggered_reports(const struct drm_xe_oa_unit *oau)
 {
 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	const struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oau);
+	struct xe_oa_regs regs = oa_unit_regs(oau);
 	uint64_t properties[] = {
 		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
@@ -4078,18 +4147,18 @@ __test_mmio_triggered_reports(const struct drm_xe_oa_unit *oau)
 	buf = mmap(0, default_oa_buffer_size, PROT_READ, MAP_PRIVATE, stream_fd, 0);
 	igt_assert(buf != NULL);
 
-	emit_oa_reg_read(ibb, dst_buf, 0, OAG_OABUFFER);
-	emit_oa_reg_read(ibb, dst_buf, 4, OAG_OATAILPTR);
-	emit_mmio_triggered_report(ibb, 0xc0ffee11);
+	emit_oa_reg_read(ibb, dst_buf, 0, regs.oa_buffer);
+	emit_oa_reg_read(ibb, dst_buf, 4, regs.oa_tail_ptr);
+	emit_mmio_triggered_report(ibb, regs.oa_mmio_trg, 0xc0ffee11);
 
-	if (render_copy)
+	if (render_copy && oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAG)
 		render_copy(ibb,
 			    &src, 0, 0, rc_width, rc_height,
 			    &dst, 0, 0);
 
-	emit_mmio_triggered_report(ibb, 0xc0ffee22);
+	emit_mmio_triggered_report(ibb, regs.oa_mmio_trg, 0xc0ffee22);
 
-	emit_oa_reg_read(ibb, dst_buf, 8, OAG_OATAILPTR);
+	emit_oa_reg_read(ibb, dst_buf, 8, regs.oa_tail_ptr);
 
 	intel_bb_flush_render(ibb);
 	intel_bb_sync(ibb);
@@ -4141,6 +4210,7 @@ __test_mmio_triggered_reports_read(const struct drm_xe_oa_unit *oau)
 {
 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	const struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oau);
+	struct xe_oa_regs regs = oa_unit_regs(oau);
 	uint64_t properties[] = {
 		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
@@ -4174,14 +4244,14 @@ __test_mmio_triggered_reports_read(const struct drm_xe_oa_unit *oau)
 	stream_fd = __perf_open(drm_fd, &param, false);
 	set_fd_flags(stream_fd, O_CLOEXEC);
 
-	emit_mmio_triggered_report(ibb, 0xc0ffee11);
+	emit_mmio_triggered_report(ibb, regs.oa_mmio_trg, 0xc0ffee11);
 
-	if (render_copy)
+	if (render_copy && oau->oa_unit_type == DRM_XE_OA_UNIT_TYPE_OAG)
 		render_copy(ibb,
 			    &src, 0, 0, rc_width, rc_height,
 			    &dst, 0, 0);
 
-	emit_mmio_triggered_report(ibb, 0xc0ffee22);
+	emit_mmio_triggered_report(ibb, regs.oa_mmio_trg, 0xc0ffee22);
 
 	intel_bb_flush_render(ibb);
 	intel_bb_sync(ibb);
@@ -5195,13 +5265,15 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 
 		igt_subtest_with_dynamic("mmio-triggered-reports") {
 			igt_require(HAS_OA_MMIO_TRIGGER(devid));
-			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
+			igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_UNIT_GT_ID);
+			__for_each_oa_unit(oau)
 				test_mmio_triggered_reports(oau, false);
 		}
 
 		igt_subtest_with_dynamic("mmio-triggered-reports-read") {
 			igt_require(HAS_OA_MMIO_TRIGGER(devid));
-			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
+			igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_UNIT_GT_ID);
+			__for_each_oa_unit(oau)
 				test_mmio_triggered_reports(oau, true);
 		}
 	}
-- 
2.48.1

