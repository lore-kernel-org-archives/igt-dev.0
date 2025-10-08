Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59133CCD18F
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 21:18:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C88310E8ED;
	Wed,  8 Oct 2025 21:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i2lqQVie";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3F0810E8DE
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 21:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759958297; x=1791494297;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8OANiKZTxn0NpuOhF4L1V9hz04HhRewO5oJHmCb9iJI=;
 b=i2lqQVieUyhK9jwFrdaeR6wpLtPwCDQKAuN9Sqfaae+unXnd6gzxzDS+
 VaitYxLMmhsJpQ2L8FhpdafRt8l/47UuFl8R633xRJz+ctpQOEck1tLkm
 0zzw9CCjPdW73yAY1QqBag5SdSv1IVgXOTf8QGLPUNAEUqAsrc/NlN6jM
 IzU0LbbPFbaejLSkufknpTj+XRRtgLSqtqeu+2rV1XXEoOfOKBTfpvvTs
 2shPHUdwdD3fUcQLayX8sbE+eL+Ry3jdNDD43SPSM/LVC9N5Vjq/Q42HC
 dwp7K+kSBvey8lKAu+5pSz18mO6OWHX5scmPbht9/FPLMFN6aQro6tGNl g==;
X-CSE-ConnectionGUID: 589q5+xsTEKpOqZriOhpzQ==
X-CSE-MsgGUID: hihk5c3USau1j5kz77jlPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65989662"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65989662"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:18:15 -0700
X-CSE-ConnectionGUID: R8UiThu0ScOj6xgab+gXNA==
X-CSE-MsgGUID: 9JFWNW25SaGoxW5s0fl8OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,214,1754982000"; d="scan'208";a="184805311"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 14:18:15 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 18/18] tests/intel/xe_oa: Constify arguments to various
 functions
Date: Wed,  8 Oct 2025 14:18:05 -0700
Message-ID: <20251008211806.625154-19-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251008211806.625154-1-ashutosh.dixit@intel.com>
References: <20251008211806.625154-1-ashutosh.dixit@intel.com>
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

Constify arguments to various functions, in order to prevent inadvertent
data modification.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 106 ++++++++++++++++++++++++--------------------
 1 file changed, 57 insertions(+), 49 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 36b1785bbd..54f59c52cb 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -345,7 +345,15 @@ static const char *oa_unit_name[] = {
 	[DRM_XE_OA_UNIT_TYPE_OAM_SAG] = "sag",
 };
 
-static struct intel_xe_perf_metric_set *oa_unit_metric_set(struct drm_xe_oa_unit *oau)
+/* Wrapper to deconstify @inst for xe_exec_queue_create */
+static u32 xe_exec_queue_create_deconst(int fd, uint32_t vm,
+					const struct drm_xe_engine_class_instance *inst,
+					uint64_t ext)
+{
+	return xe_exec_queue_create(fd, vm, (struct drm_xe_engine_class_instance *)inst, ext);
+}
+
+static struct intel_xe_perf_metric_set *oa_unit_metric_set(const struct drm_xe_oa_unit *oau)
 {
 	const char *test_set_name = NULL;
 	struct intel_xe_perf_metric_set *metric_set_iter;
@@ -476,7 +484,7 @@ static u64 oa_format_fields(u64 name)
 }
 #define __ff oa_format_fields
 
-static struct drm_xe_engine_class_instance *oa_unit_engine(struct drm_xe_oa_unit *oau)
+static const struct drm_xe_engine_class_instance *oa_unit_engine(const struct drm_xe_oa_unit *oau)
 {
 	return !oau ? NULL : oau->num_engines ? &oau->eci[random() % oau->num_engines] : NULL;
 }
@@ -486,7 +494,7 @@ static struct drm_xe_engine_class_instance *oa_unit_engine(struct drm_xe_oa_unit
 	     oau = (struct drm_xe_oa_unit *)poau, i < qoa->num_oa_units; \
 	     poau += sizeof(*oau) + oau->num_engines * sizeof(oau->eci[0]), i++)
 
-static struct drm_xe_oa_unit *oa_unit_by_id(int fd, int n)
+static const struct drm_xe_oa_unit *oa_unit_by_id(int fd, int n)
 {
 	struct drm_xe_query_oa_units *qoa;
 	struct drm_xe_oa_unit *oau;
@@ -501,7 +509,7 @@ static struct drm_xe_oa_unit *oa_unit_by_id(int fd, int n)
 	return NULL;
 }
 
-static struct drm_xe_oa_unit *oa_unit_by_type(int fd, int t)
+static const struct drm_xe_oa_unit *oa_unit_by_type(int fd, int t)
 {
 	struct drm_xe_query_oa_units *qoa;
 	struct drm_xe_oa_unit *oau;
@@ -1552,7 +1560,7 @@ open_and_read_2_oa_reports(int format_id,
 			   uint32_t *oa_report0,
 			   uint32_t *oa_report1,
 			   bool timer_only,
-			   struct drm_xe_oa_unit *oau)
+			   const struct drm_xe_oa_unit *oau)
 {
 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	uint64_t properties[] = {
@@ -1676,7 +1684,7 @@ print_reports(uint32_t *oa_report0, uint32_t *oa_report1, int fmt)
 }
 
 static bool
-oau_supports_oa_type(int oa_type, struct drm_xe_oa_unit *oau)
+oau_supports_oa_type(int oa_type, const struct drm_xe_oa_unit *oau)
 {
 	switch (oa_type) {
 	case DRM_XE_OA_FMT_TYPE_OAM:
@@ -1697,7 +1705,7 @@ oau_supports_oa_type(int oa_type, struct drm_xe_oa_unit *oau)
  * SUBTEST: oa-formats
  * Description: Test that supported OA formats work as expected
  */
-static void test_oa_formats(struct drm_xe_oa_unit *oau)
+static void test_oa_formats(const struct drm_xe_oa_unit *oau)
 {
 	for (int i = 0; i < XE_OA_FORMAT_MAX; i++) {
 		struct oa_format format = get_oa_format(i);
@@ -1854,7 +1862,7 @@ static bool expected_report_timing_delta(uint32_t delta, uint32_t expected_delta
  * SUBTEST: oa-exponents
  * Description: Test that oa exponent values behave as expected
  */
-static void test_oa_exponents(struct drm_xe_oa_unit *oau)
+static void test_oa_exponents(const struct drm_xe_oa_unit *oau)
 {
 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	uint64_t fmt = test_set->perf_oa_format;
@@ -2057,7 +2065,7 @@ get_time(void)
 static void test_blocking(uint64_t requested_oa_period,
 			  bool set_kernel_hrtimer,
 			  uint64_t kernel_hrtimer,
-			  struct drm_xe_oa_unit *oau)
+			  const struct drm_xe_oa_unit *oau)
 {
 	int oa_exponent = max_oa_exponent_for_period_lte(requested_oa_period);
 	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
@@ -2200,7 +2208,7 @@ static void test_blocking(uint64_t requested_oa_period,
 static void test_polling(uint64_t requested_oa_period,
 			 bool set_kernel_hrtimer,
 			 uint64_t kernel_hrtimer,
-			 struct drm_xe_oa_unit *oau)
+			 const struct drm_xe_oa_unit *oau)
 {
 	int oa_exponent = max_oa_exponent_for_period_lte(requested_oa_period);
 	uint64_t oa_period = oa_exponent_to_ns(oa_exponent);
@@ -2484,7 +2492,7 @@ num_valid_reports_captured(struct intel_xe_oa_open_prop *param,
  * Description: Open OA stream twice to verify OA TLB invalidation
  */
 static void
-test_oa_tlb_invalidate(struct drm_xe_oa_unit *oau)
+test_oa_tlb_invalidate(const struct drm_xe_oa_unit *oau)
 {
 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	uint64_t properties[] = {
@@ -2542,7 +2550,7 @@ wait_for_oa_buffer_overflow(int fd, int poll_period_us)
  * Description: Test filling and overflow of OA buffer
  */
 static void
-test_buffer_fill(struct drm_xe_oa_unit *oau)
+test_buffer_fill(const struct drm_xe_oa_unit *oau)
 {
 	/* ~5 micro second period */
 	int oa_exponent = max_oa_exponent_for_period_lte(5000);
@@ -2589,7 +2597,7 @@ test_buffer_fill(struct drm_xe_oa_unit *oau)
  * Description: Test reason field is non-zero. Can also check OA buffer wraparound issues
  */
 static void
-test_non_zero_reason(struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
+test_non_zero_reason(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
 {
 	/* ~20 micro second period */
 	int oa_exponent = max_oa_exponent_for_period_lte(20000);
@@ -2682,7 +2690,7 @@ test_non_zero_reason(struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
  * Description: Test that OA stream enable/disable works as expected
  */
 static void
-test_enable_disable(struct drm_xe_oa_unit *oau)
+test_enable_disable(const struct drm_xe_oa_unit *oau)
 {
 	uint32_t num_reports = 5;
 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
@@ -2952,10 +2960,10 @@ test_disabled_read_error(void)
  * Description: Test OAR/OAC using MI_REPORT_PERF_COUNT
  */
 static void
-test_mi_rpc(struct drm_xe_oa_unit *oau)
+test_mi_rpc(const struct drm_xe_oa_unit *oau)
 
 {
-	struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oau);
+	const struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oau);
 	uint64_t fmt = ((IS_DG2(devid) || IS_METEORLAKE(devid)) &&
 			hwe->engine_class == DRM_XE_ENGINE_CLASS_COMPUTE) ?
 		XE_OAC_FORMAT_A24u64_B8_C8 : oar_unit_default_format();
@@ -3004,7 +3012,7 @@ test_mi_rpc(struct drm_xe_oa_unit *oau)
 
 	bops = buf_ops_create(drm_fd);
 	vm = xe_vm_create(drm_fd, 0, 0);
-	ctx_id = xe_exec_queue_create(drm_fd, vm, hwe, 0);
+	ctx_id = xe_exec_queue_create_deconst(drm_fd, vm, hwe, 0);
 	igt_assert_neq(ctx_id, INVALID_CTX_ID);
 	properties[3] = ctx_id;
 
@@ -3083,7 +3091,7 @@ emit_stall_timestamp_and_rpc(struct intel_bb *ibb,
 	emit_report_perf_count(ibb, dst, report_dst_offset, report_id);
 }
 
-static void single_ctx_helper(struct drm_xe_oa_unit *oau)
+static void single_ctx_helper(const struct drm_xe_oa_unit *oau)
 {
 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	struct drm_xe_engine_class_instance *hwe =
@@ -3391,7 +3399,7 @@ static void single_ctx_helper(struct drm_xe_oa_unit *oau)
  * Description: A harder test for OAR/OAC using MI_REPORT_PERF_COUNT
  */
 static void
-test_single_ctx_render_target_writes_a_counter(struct drm_xe_oa_unit *oau)
+test_single_ctx_render_target_writes_a_counter(const struct drm_xe_oa_unit *oau)
 {
 	int child_ret;
 	struct igt_helper_process child = {};
@@ -3468,7 +3476,7 @@ test_rc6_disable(void)
  * Description: Open/close OA streams in a tight loop
  */
 static void
-test_stress_open_close(struct drm_xe_oa_unit *oau)
+test_stress_open_close(const struct drm_xe_oa_unit *oau)
 {
 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 
@@ -3950,10 +3958,10 @@ static u32 oa_get_mmio_base(const struct drm_xe_engine_class_instance *hwe)
  * SUBTEST: oa-regs-whitelisted
  * Description: Verify that OA registers are whitelisted
  */
-static void test_oa_regs_whitelist(struct drm_xe_oa_unit *oau)
+static void test_oa_regs_whitelist(const struct drm_xe_oa_unit *oau)
 {
 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
-	struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oau);
+	const struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oau);
 	uint64_t properties[] = {
 		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
@@ -3997,10 +4005,10 @@ static void test_oa_regs_whitelist(struct drm_xe_oa_unit *oau)
 }
 
 static void
-__test_mmio_triggered_reports(struct drm_xe_oa_unit *oau)
+__test_mmio_triggered_reports(const struct drm_xe_oa_unit *oau)
 {
 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
-	struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oau);
+	const struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oau);
 	uint64_t properties[] = {
 		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
@@ -4035,7 +4043,7 @@ __test_mmio_triggered_reports(struct drm_xe_oa_unit *oau)
 	scratch_buf_init(bops, &dst, rc_width, rc_height, 0x00ff00ff);
 
 	vm = xe_vm_create(drm_fd, 0, 0);
-	context = xe_exec_queue_create(drm_fd, vm, hwe, 0);
+	context = xe_exec_queue_create_deconst(drm_fd, vm, hwe, 0);
 	igt_assert(context);
 	ibb = intel_bb_create_with_context(drm_fd, context, vm, NULL, BATCH_SZ);
 
@@ -4104,10 +4112,10 @@ __test_mmio_triggered_reports(struct drm_xe_oa_unit *oau)
 }
 
 static void
-__test_mmio_triggered_reports_read(struct drm_xe_oa_unit *oau)
+__test_mmio_triggered_reports_read(const struct drm_xe_oa_unit *oau)
 {
 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
-	struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oau);
+	const struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oau);
 	uint64_t properties[] = {
 		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
@@ -4134,7 +4142,7 @@ __test_mmio_triggered_reports_read(struct drm_xe_oa_unit *oau)
 	scratch_buf_init(bops, &dst, rc_width, rc_height, 0x00ff00ff);
 
 	vm = xe_vm_create(drm_fd, 0, 0);
-	context = xe_exec_queue_create(drm_fd, vm, hwe, 0);
+	context = xe_exec_queue_create_deconst(drm_fd, vm, hwe, 0);
 	igt_assert(context);
 	ibb = intel_bb_create_with_context(drm_fd, context, vm, NULL, BATCH_SZ);
 
@@ -4202,7 +4210,7 @@ __test_mmio_triggered_reports_read(struct drm_xe_oa_unit *oau)
  * Description: Test MMIO trigger functionality with read system call
  */
 static void
-test_mmio_triggered_reports(struct drm_xe_oa_unit *oau, bool with_read)
+test_mmio_triggered_reports(const struct drm_xe_oa_unit *oau, bool with_read)
 {
 	struct igt_helper_process child = {};
 	int ret;
@@ -4251,8 +4259,8 @@ static void
 test_oa_unit_exclusive_stream(bool exponent)
 {
 	struct drm_xe_query_oa_units *qoa = xe_oa_units(drm_fd);
-	struct drm_xe_engine_class_instance *hwe;
-	struct drm_xe_oa_unit *oau;
+	const struct drm_xe_engine_class_instance *hwe;
+	const struct drm_xe_oa_unit *oau;
 	uint64_t properties[] = {
 		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
@@ -4282,7 +4290,7 @@ test_oa_unit_exclusive_stream(bool exponent)
 
 		igt_debug("opening OA buffer with c:i %d:%d\n",
 			  hwe->engine_class, hwe->engine_instance);
-		exec_q[i] = xe_exec_queue_create(drm_fd, vm, hwe, 0);
+		exec_q[i] = xe_exec_queue_create_deconst(drm_fd, vm, hwe, 0);
 		if (!exponent) {
 			properties[10] = DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID;
 			properties[11] = exec_q[i];
@@ -4326,7 +4334,7 @@ test_oa_unit_exclusive_stream(bool exponent)
 		/* case 2: concurrent access to non-OAG unit should fail */
 		igt_debug("try with exec_q with c:i %d:%d\n",
 			  hwe->engine_class, hwe->engine_instance);
-		exec_q[i] = xe_exec_queue_create(drm_fd, vm, hwe, 0);
+		exec_q[i] = xe_exec_queue_create_deconst(drm_fd, vm, hwe, 0);
 		properties[10] = DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID;
 		properties[11] = exec_q[i];
 		errno = 0;
@@ -4353,7 +4361,7 @@ test_oa_unit_concurrent_oa_buffer_read(void)
 	struct drm_xe_query_oa_units *qoa = xe_oa_units(drm_fd);
 
 	igt_fork(child, qoa->num_oa_units) {
-		struct drm_xe_oa_unit *oau = oa_unit_by_id(drm_fd, child);
+		const struct drm_xe_oa_unit *oau = oa_unit_by_id(drm_fd, child);
 
 		/* No OAM support yet */
 		if (oau->oa_unit_type != DRM_XE_OA_UNIT_TYPE_OAG)
@@ -4373,7 +4381,7 @@ static void *map_oa_buffer(u32 *size)
 	return vaddr;
 }
 
-static void invalid_param_map_oa_buffer(struct drm_xe_oa_unit *oau)
+static void invalid_param_map_oa_buffer(const struct drm_xe_oa_unit *oau)
 {
 	void *oa_vaddr = NULL;
 
@@ -4409,7 +4417,7 @@ static void unprivileged_try_to_map_oa_buffer(void)
 	igt_assert_eq(errno, EACCES);
 }
 
-static void unprivileged_map_oa_buffer(struct drm_xe_oa_unit *oau)
+static void unprivileged_map_oa_buffer(const struct drm_xe_oa_unit *oau)
 {
 	igt_fork(child, 1) {
 		igt_drop_root();
@@ -4443,7 +4451,7 @@ static void try_invalid_access(void *vaddr)
 	signal(SIGSEGV, old_sigsegv);
 }
 
-static void map_oa_buffer_unprivilege_access(struct drm_xe_oa_unit *oau)
+static void map_oa_buffer_unprivilege_access(const struct drm_xe_oa_unit *oau)
 {
 	void *vaddr;
 	uint32_t size;
@@ -4459,7 +4467,7 @@ static void map_oa_buffer_unprivilege_access(struct drm_xe_oa_unit *oau)
 	munmap(vaddr, size);
 }
 
-static void map_oa_buffer_forked_access(struct drm_xe_oa_unit *oau)
+static void map_oa_buffer_forked_access(const struct drm_xe_oa_unit *oau)
 {
 	void *vaddr;
 	uint32_t size;
@@ -4475,7 +4483,7 @@ static void map_oa_buffer_forked_access(struct drm_xe_oa_unit *oau)
 }
 
 static void mmap_wait_for_periodic_reports(void *oa_vaddr, uint32_t n,
-					   struct drm_xe_oa_unit *oau)
+					   const struct drm_xe_oa_unit *oau)
 {
 	uint32_t period_us = oa_exponent_to_ns(oa_exponent_default) / 1000;
 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
@@ -4496,7 +4504,7 @@ static void mmap_wait_for_periodic_reports(void *oa_vaddr, uint32_t n,
 }
 
 static void mmap_check_reports(void *oa_vaddr, uint32_t oa_size,
-			       struct drm_xe_oa_unit *oau)
+			       const struct drm_xe_oa_unit *oau)
 {
 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	uint64_t fmt = test_set->perf_oa_format;
@@ -4523,7 +4531,7 @@ static void mmap_check_reports(void *oa_vaddr, uint32_t oa_size,
 	igt_assert(timer_reports >= 3);
 }
 
-static void check_reports_from_mapped_buffer(struct drm_xe_oa_unit *oau)
+static void check_reports_from_mapped_buffer(const struct drm_xe_oa_unit *oau)
 {
 	void *vaddr;
 	uint32_t size;
@@ -4540,7 +4548,7 @@ static void check_reports_from_mapped_buffer(struct drm_xe_oa_unit *oau)
  * SUBTEST: closed-fd-and-unmapped-access
  * Description: Unmap buffer, close fd and try to access
  */
-static void closed_fd_and_unmapped_access(struct drm_xe_oa_unit *oau)
+static void closed_fd_and_unmapped_access(const struct drm_xe_oa_unit *oau)
 {
 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	uint64_t properties[] = {
@@ -4578,7 +4586,7 @@ static void closed_fd_and_unmapped_access(struct drm_xe_oa_unit *oau)
  * has zeroes in it.
  */
 static void
-test_tail_address_wrap(struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
+test_tail_address_wrap(const struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
 {
 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	u64 exponent = max_oa_exponent_for_period_lte(20000);
@@ -4638,9 +4646,9 @@ test_tail_address_wrap(struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
  * SUBTEST: privileged-forked-access-vaddr
  * Description: Verify that forked access to mapped buffer fails
  */
-typedef void (*map_oa_buffer_test_t)(struct drm_xe_oa_unit *oau);
+typedef void (*map_oa_buffer_test_t)(const struct drm_xe_oa_unit *oau);
 static void test_mapped_oa_buffer(map_oa_buffer_test_t test_with_fd_open,
-				  struct drm_xe_oa_unit *oau)
+				  const struct drm_xe_oa_unit *oau)
 {
 	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	uint64_t properties[] = {
@@ -4722,10 +4730,10 @@ struct oa_sync {
 };
 
 static void
-oa_sync_init(enum oa_sync_type sync_type, struct drm_xe_oa_unit *oau,
+oa_sync_init(enum oa_sync_type sync_type, const struct drm_xe_oa_unit *oau,
 	     struct oa_sync *osync, struct drm_xe_sync *sync)
 {
-	struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oau);
+	const struct drm_xe_engine_class_instance *hwe = oa_unit_engine(oau);
 	uint64_t addr = 0x1a0000;
 
 	osync->sync_type = sync_type;
@@ -4847,7 +4855,7 @@ static void oa_sync_free(struct oa_sync *osync)
  * @wait-cfg:	Exercise reconfig path and wait for syncs to signal
  * @wait:	Don't exercise reconfig path and wait for syncs to signal
  */
-static void test_syncs(struct drm_xe_oa_unit *oau,
+static void test_syncs(const struct drm_xe_oa_unit *oau,
 		       enum oa_sync_type sync_type, int flags)
 {
 	struct drm_xe_ext_set_property extn[XE_OA_MAX_SET_PROPERTIES] = {};
@@ -4976,7 +4984,7 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 		{ NULL },
 	};
 	struct drm_xe_query_oa_units *qoa;
-	struct drm_xe_oa_unit *oau;
+	const struct drm_xe_oa_unit *oau;
 	struct xe_device *xe_dev;
 	u8 *poau;
 	int i;
-- 
2.48.1

