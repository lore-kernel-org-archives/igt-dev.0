Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D33ACCD193
	for <igt-dev@archiver.kernel.org>; Mon, 13 Oct 2025 20:30:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28ECC10E538;
	Mon, 13 Oct 2025 20:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f8rXuzNH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5362E10E52D
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Oct 2025 20:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760387450; x=1791923450;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4CTrj5G0g44fEWIkgN/2jQm61uZCj8IyIXIEo0ga8WU=;
 b=f8rXuzNHb/vd+MPEPiM1k9ItsqT6LGRxhPKYRU96wsUBWZeUrpFbH6MH
 ttTOll76u18x80exkXMv0sBChs7JJav/Bp0rXAI+LXTTViDG8I/vDnoki
 pph0w96k9mFxFd5DuOOt0gejeuHbYynY00l6KwSuStGaQyY9Fc+u80zNi
 Y2hlac9RLrlQGbKB2pYXRT0VZeWXQO+PiX6rrAdj8Mnvx2GSwZKF/Wdxm
 gUpe+mI8rSC9gHiY3SZPpKLrMwwDWTxB/GYQ6SG1JN9CCWgT+PB2nNELH
 +hrFuBMMpSyc57NcNsQzf88kXBpwQcJSLIlmJBzTC1EadlJCw05N4q6tW A==;
X-CSE-ConnectionGUID: my4De8H2TgKkuZ+QhStY0g==
X-CSE-MsgGUID: 3/INWo1FQ/m8sst9lfiLNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73641940"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="73641940"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:30:48 -0700
X-CSE-ConnectionGUID: SFtSuGwLRCG+FiyTVp3gvg==
X-CSE-MsgGUID: SxBdf1YWSfG2BexeFgYx9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="180924044"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:30:48 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t 13/18] tests/intel/xe_oa: Convert OA buffer mmap tests
 to take OA unit arguments
Date: Mon, 13 Oct 2025 13:30:36 -0700
Message-ID: <20251013203042.925115-14-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251013203042.925115-1-ashutosh.dixit@intel.com>
References: <20251013203042.925115-1-ashutosh.dixit@intel.com>
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

Convert OA buffer mmap tests to take 'struct drm_xe_oa_unit *' arguments,
to enable them to be run on all OA units.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 71 +++++++++++++++++++++++----------------------
 1 file changed, 36 insertions(+), 35 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index cdc422d724..50bcb48f0f 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4424,7 +4424,7 @@ static void *map_oa_buffer(u32 *size)
 	return vaddr;
 }
 
-static void invalid_param_map_oa_buffer(const struct drm_xe_engine_class_instance *hwe)
+static void invalid_param_map_oa_buffer(struct drm_xe_oa_unit *oau)
 {
 	void *oa_vaddr = NULL;
 
@@ -4460,7 +4460,7 @@ static void unprivileged_try_to_map_oa_buffer(void)
 	igt_assert_eq(errno, EACCES);
 }
 
-static void unprivileged_map_oa_buffer(const struct drm_xe_engine_class_instance *hwe)
+static void unprivileged_map_oa_buffer(struct drm_xe_oa_unit *oau)
 {
 	igt_fork(child, 1) {
 		igt_drop_root();
@@ -4494,7 +4494,7 @@ static void try_invalid_access(void *vaddr)
 	signal(SIGSEGV, old_sigsegv);
 }
 
-static void map_oa_buffer_unprivilege_access(const struct drm_xe_engine_class_instance *hwe)
+static void map_oa_buffer_unprivilege_access(struct drm_xe_oa_unit *oau)
 {
 	void *vaddr;
 	uint32_t size;
@@ -4510,7 +4510,7 @@ static void map_oa_buffer_unprivilege_access(const struct drm_xe_engine_class_in
 	munmap(vaddr, size);
 }
 
-static void map_oa_buffer_forked_access(const struct drm_xe_engine_class_instance *hwe)
+static void map_oa_buffer_forked_access(struct drm_xe_oa_unit *oau)
 {
 	void *vaddr;
 	uint32_t size;
@@ -4526,10 +4526,10 @@ static void map_oa_buffer_forked_access(const struct drm_xe_engine_class_instanc
 }
 
 static void mmap_wait_for_periodic_reports(void *oa_vaddr, uint32_t n,
-					   const struct drm_xe_engine_class_instance *hwe)
+					   struct drm_xe_oa_unit *oau)
 {
 	uint32_t period_us = oa_exponent_to_ns(oa_exponent_default) / 1000;
-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	uint64_t fmt = test_set->perf_oa_format;
 	uint32_t num_periodic_reports = 0;
 	uint32_t report_words = get_oa_format(fmt).size >> 2;
@@ -4547,9 +4547,9 @@ static void mmap_wait_for_periodic_reports(void *oa_vaddr, uint32_t n,
 }
 
 static void mmap_check_reports(void *oa_vaddr, uint32_t oa_size,
-			       const struct drm_xe_engine_class_instance *hwe)
+			       struct drm_xe_oa_unit *oau)
 {
-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	uint64_t fmt = test_set->perf_oa_format;
 	struct oa_format format = get_oa_format(fmt);
 	size_t report_words = format.size >> 2;
@@ -4567,22 +4567,22 @@ static void mmap_check_reports(void *oa_vaddr, uint32_t oa_size,
 			sanity_check_reports(reports - 2 * report_words,
 					     reports - report_words, fmt);
 			pec_sanity_check_reports(reports - 2 * report_words,
-						 reports - report_words, metric_set(hwe));
+						 reports - report_words, oa_unit_metric_set(oau));
 		}
 	}
 
 	igt_assert(timer_reports >= 3);
 }
 
-static void check_reports_from_mapped_buffer(const struct drm_xe_engine_class_instance *hwe)
+static void check_reports_from_mapped_buffer(struct drm_xe_oa_unit *oau)
 {
 	void *vaddr;
 	uint32_t size;
 
 	vaddr = map_oa_buffer(&size);
 
-	mmap_wait_for_periodic_reports(vaddr, 10, hwe);
-	mmap_check_reports(vaddr, size, hwe);
+	mmap_wait_for_periodic_reports(vaddr, 10, oau);
+	mmap_check_reports(vaddr, size, oau);
 
 	munmap(vaddr, size);
 }
@@ -4591,13 +4591,14 @@ static void check_reports_from_mapped_buffer(const struct drm_xe_engine_class_in
  * SUBTEST: closed-fd-and-unmapped-access
  * Description: Unmap buffer, close fd and try to access
  */
-static void closed_fd_and_unmapped_access(const struct drm_xe_engine_class_instance *hwe)
+static void closed_fd_and_unmapped_access(struct drm_xe_oa_unit *oau)
 {
+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	uint64_t properties[] = {
-		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
-		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
-		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
 		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exponent_default,
 	};
 	struct intel_xe_oa_open_prop param = {
@@ -4610,8 +4611,8 @@ static void closed_fd_and_unmapped_access(const struct drm_xe_engine_class_insta
 	stream_fd = __perf_open(drm_fd, &param, false);
 	vaddr = map_oa_buffer(&size);
 
-	mmap_wait_for_periodic_reports(vaddr, 10, hwe);
-	mmap_check_reports(vaddr, size, hwe);
+	mmap_wait_for_periodic_reports(vaddr, 10, oau);
+	mmap_check_reports(vaddr, size, oau);
 
 	munmap(vaddr, size);
 	__perf_close(stream_fd);
@@ -4688,13 +4689,13 @@ test_tail_address_wrap(struct drm_xe_oa_unit *oau, size_t oa_buffer_size)
  * SUBTEST: privileged-forked-access-vaddr
  * Description: Verify that forked access to mapped buffer fails
  */
-typedef void (*map_oa_buffer_test_t)(const struct drm_xe_engine_class_instance *hwe);
+typedef void (*map_oa_buffer_test_t)(struct drm_xe_oa_unit *oau);
 static void test_mapped_oa_buffer(map_oa_buffer_test_t test_with_fd_open,
-				  const struct drm_xe_engine_class_instance *hwe)
+				  struct drm_xe_oa_unit *oau)
 {
-	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	struct intel_xe_perf_metric_set *test_set = oa_unit_metric_set(oau);
 	uint64_t properties[] = {
-		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, oau->oa_unit_id,
 		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
 		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
 		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
@@ -4708,7 +4709,7 @@ static void test_mapped_oa_buffer(map_oa_buffer_test_t test_with_fd_open,
 	stream_fd = __perf_open(drm_fd, &param, false);
 
 	igt_assert(test_with_fd_open);
-	test_with_fd_open(hwe);
+	test_with_fd_open(oau);
 
 	__perf_close(stream_fd);
 }
@@ -5246,28 +5247,28 @@ igt_main_args("b:t", long_options, help_str, opt_handler, NULL)
 
 	igt_subtest_group {
 		igt_subtest_with_dynamic("map-oa-buffer")
-			__for_one_hwe_in_oag(hwe)
-				test_mapped_oa_buffer(check_reports_from_mapped_buffer, hwe);
+			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
+				test_mapped_oa_buffer(check_reports_from_mapped_buffer, oau);
 
 		igt_subtest_with_dynamic("invalid-map-oa-buffer")
-			__for_one_hwe_in_oag(hwe)
-				test_mapped_oa_buffer(invalid_param_map_oa_buffer, hwe);
+			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
+				test_mapped_oa_buffer(invalid_param_map_oa_buffer, oau);
 
 		igt_subtest_with_dynamic("non-privileged-map-oa-buffer")
-			__for_one_hwe_in_oag(hwe)
-				test_mapped_oa_buffer(unprivileged_map_oa_buffer, hwe);
+			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
+				test_mapped_oa_buffer(unprivileged_map_oa_buffer, oau);
 
 		igt_subtest_with_dynamic("non-privileged-access-vaddr")
-			__for_one_hwe_in_oag(hwe)
-				test_mapped_oa_buffer(map_oa_buffer_unprivilege_access, hwe);
+			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
+				test_mapped_oa_buffer(map_oa_buffer_unprivilege_access, oau);
 
 		igt_subtest_with_dynamic("privileged-forked-access-vaddr")
-			__for_one_hwe_in_oag(hwe)
-				test_mapped_oa_buffer(map_oa_buffer_forked_access, hwe);
+			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
+				test_mapped_oa_buffer(map_oa_buffer_forked_access, oau);
 
 		igt_subtest_with_dynamic("closed-fd-and-unmapped-access")
-			__for_one_hwe_in_oag(hwe)
-				closed_fd_and_unmapped_access(hwe);
+			__for_oa_unit_by_type(DRM_XE_OA_UNIT_TYPE_OAG)
+				closed_fd_and_unmapped_access(oau);
 	}
 
 	igt_subtest_with_dynamic("tail-address-wrap") {
-- 
2.48.1

