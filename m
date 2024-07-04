Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F02C3DA41
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jul 2024 01:11:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0977410E32D;
	Thu,  4 Jul 2024 01:11:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BWtJMAXl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF0210E02A
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jul 2024 01:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720055507; x=1751591507;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=YS2dJhBgUR6wJ8TxxzjqQs5x8piZ+WPj7wYuv2qsCTc=;
 b=BWtJMAXlJ6BbooCn1RnLUZ0V02F1+XGAAkVhE0pxr3IrWtGv35jkZCE1
 9z/n28tHZRlYPMOX7DlmRHsY6eC9odpRAfnNvqFy1F6TmFYrLRSyySxhG
 lgTvyEJBGGiXJX07Zn+TN7g31ApeRw0h6M34CixnKcbBfFQi23WoOdFZa
 5wx3JhMhO0ZKEVTTNFWvSoGEGDaRk7hfKlHQbjg67ku+E3Ni2aT3eVSii
 Mjl6FpVnAxmthg+Z6WEc+F5+BpDKKTI1S4BwYgYER2RsEAVzmIh1hrF5Z
 1IvngPYi0VHLH+ndpS4Y5oRNyZoiB6KBl7lrvMkuaoIWawpytq1qdHg1p Q==;
X-CSE-ConnectionGUID: 0uree0iDRn+2GnnWVRkm3A==
X-CSE-MsgGUID: 5zoU9qO9TKKfSsxP6EA77A==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17450020"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="17450020"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 18:11:47 -0700
X-CSE-ConnectionGUID: IMD/ztbdTIalUCxayCgMZw==
X-CSE-MsgGUID: TTItJfrARqyuUwcuEPtknw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; d="scan'208";a="46320147"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2024 18:11:46 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 12/15] tests/intel/xe_oa: OA buffer mmap tests
Date: Wed,  3 Jul 2024 18:11:39 -0700
Message-ID: <20240704011142.2618968-13-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240704011142.2618968-1-ashutosh.dixit@intel.com>
References: <20240704011142.2618968-1-ashutosh.dixit@intel.com>
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

Add the following tests:
* "map-oa-buffer"
* "invalid-map-oa-buffer"
* "non-privileged-map-oa-buffer"
* "non-privileged-access-vaddr"
* "privileged-forked-access-vaddr"
* "closed-fd-and-unmapped-access"

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 251 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 251 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 327f4271da..91f2a1759a 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4022,6 +4022,231 @@ test_oa_unit_concurrent_oa_buffer_read(void)
 	igt_waitchildren();
 }
 
+static void *map_oa_buffer(u32 *size)
+{
+	void *vaddr = mmap(0, OA_BUFFER_SIZE, PROT_READ, MAP_PRIVATE, stream_fd, 0);
+
+	igt_assert(vaddr != NULL);
+	*size = OA_BUFFER_SIZE;
+	return vaddr;
+}
+
+static void invalid_param_map_oa_buffer(const struct drm_xe_engine_class_instance *hwe)
+{
+	void *oa_vaddr = NULL;
+
+	/* try a couple invalid mmaps */
+	/* bad prots */
+	oa_vaddr = mmap(0, OA_BUFFER_SIZE, PROT_WRITE, MAP_PRIVATE, stream_fd, 0);
+	igt_assert(oa_vaddr == MAP_FAILED);
+
+	oa_vaddr = mmap(0, OA_BUFFER_SIZE, PROT_EXEC, MAP_PRIVATE, stream_fd, 0);
+	igt_assert(oa_vaddr == MAP_FAILED);
+
+	/* bad MAPs */
+	oa_vaddr = mmap(0, OA_BUFFER_SIZE, PROT_READ, MAP_SHARED, stream_fd, 0);
+	igt_assert(oa_vaddr == MAP_FAILED);
+
+	/* bad size */
+	oa_vaddr = mmap(0, OA_BUFFER_SIZE + 1, PROT_READ, MAP_PRIVATE, stream_fd, 0);
+	igt_assert(oa_vaddr == MAP_FAILED);
+
+	/* do the right thing */
+	oa_vaddr = mmap(0, OA_BUFFER_SIZE, PROT_READ, MAP_PRIVATE, stream_fd, 0);
+	igt_assert(oa_vaddr != MAP_FAILED && oa_vaddr != NULL);
+
+	munmap(oa_vaddr, OA_BUFFER_SIZE);
+}
+
+static void unprivileged_try_to_map_oa_buffer(void)
+{
+	void *oa_vaddr;
+
+	oa_vaddr = mmap(0, OA_BUFFER_SIZE, PROT_READ, MAP_PRIVATE, stream_fd, 0);
+	igt_assert(oa_vaddr == MAP_FAILED);
+	igt_assert_eq(errno, EACCES);
+}
+
+static void unprivileged_map_oa_buffer(const struct drm_xe_engine_class_instance *hwe)
+{
+	igt_fork(child, 1) {
+		igt_drop_root();
+		unprivileged_try_to_map_oa_buffer();
+	}
+	igt_waitchildren();
+}
+
+static jmp_buf jmp;
+static void __attribute__((noreturn)) sigtrap(int sig)
+{
+	siglongjmp(jmp, sig);
+}
+
+static void try_invalid_access(void *vaddr)
+{
+	sighandler_t old_sigsegv;
+	uint32_t dummy;
+
+	old_sigsegv = signal(SIGSEGV, sigtrap);
+	switch (sigsetjmp(jmp, SIGSEGV)) {
+	case SIGSEGV:
+		break;
+	case 0:
+		dummy = READ_ONCE(*((uint32_t *)vaddr + 1));
+		(void) dummy;
+	default:
+		igt_assert(!"reached");
+		break;
+	}
+	signal(SIGSEGV, old_sigsegv);
+}
+
+static void map_oa_buffer_unprivilege_access(const struct drm_xe_engine_class_instance *hwe)
+{
+	void *vaddr;
+	uint32_t size;
+
+	vaddr = map_oa_buffer(&size);
+
+	igt_fork(child, 1) {
+		igt_drop_root();
+		try_invalid_access(vaddr);
+	}
+	igt_waitchildren();
+
+	munmap(vaddr, size);
+}
+
+static void map_oa_buffer_forked_access(const struct drm_xe_engine_class_instance *hwe)
+{
+	void *vaddr;
+	uint32_t size;
+
+	vaddr = map_oa_buffer(&size);
+
+	igt_fork(child, 1) {
+		try_invalid_access(vaddr);
+	}
+	igt_waitchildren();
+
+	munmap(vaddr, size);
+}
+
+static void check_reports(void *oa_vaddr, uint32_t oa_size,
+			  const struct drm_xe_engine_class_instance *hwe)
+{
+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	uint64_t fmt = test_set->perf_oa_format;
+	struct oa_format format = get_oa_format(fmt);
+	size_t report_words = format.size >> 2;
+	uint32_t *reports;
+	uint32_t timer_reports = 0;
+
+	for (reports = (uint32_t *)oa_vaddr;
+	     timer_reports < 20 && reports[0] && oa_timestamp(reports, fmt);
+	     reports += report_words) {
+		if (!oa_report_is_periodic(oa_exp_1_millisec, reports))
+			continue;
+
+		timer_reports++;
+		if (timer_reports >= 3)
+			sanity_check_reports(reports - 2 * report_words,
+					     reports - report_words, fmt);
+	}
+
+	igt_assert(timer_reports >= 3);
+}
+
+static void check_reports_from_mapped_buffer(const struct drm_xe_engine_class_instance *hwe)
+{
+	void *vaddr;
+	uint32_t size;
+	uint32_t period_us = oa_exponent_to_ns(oa_exp_1_millisec) / 1000;
+
+	vaddr = map_oa_buffer(&size);
+
+	/* wait for approx 100 reports */
+	usleep(100 * period_us);
+	check_reports(vaddr, size, hwe);
+
+	munmap(vaddr, size);
+}
+
+/**
+ * SUBTEST: closed-fd-and-unmapped-access
+ * Description: Unmap buffer, close fd and try to access
+ */
+static void closed_fd_and_unmapped_access(const struct drm_xe_engine_class_instance *hwe)
+{
+	uint64_t properties[] = {
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, default_test_set->perf_oa_metrics_set,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(default_test_set->perf_oa_format),
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
+	};
+	struct intel_xe_oa_open_prop param = {
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+	void *vaddr;
+	uint32_t size;
+	uint32_t period_us = oa_exponent_to_ns(oa_exp_1_millisec) / 1000;
+
+	stream_fd = __perf_open(drm_fd, &param, false);
+	vaddr = map_oa_buffer(&size);
+
+	usleep(100 * period_us);
+	check_reports(vaddr, size, hwe);
+
+	munmap(vaddr, size);
+	__perf_close(stream_fd);
+
+	try_invalid_access(vaddr);
+}
+
+/**
+ * SUBTEST: map-oa-buffer
+ * Description: Verify mapping of oa buffer
+ *
+ * SUBTEST: invalid-map-oa-buffer
+ * Description: Verify invalid mappings of oa buffer
+ *
+ * SUBTEST: non-privileged-map-oa-buffer
+ * Description: Verify if non-privileged user can map oa buffer
+ *
+ * SUBTEST: non-privileged-access-vaddr
+ * Description: Verify if non-privileged user can map oa buffer
+ *
+ * SUBTEST: privileged-forked-access-vaddr
+ * Description: Verify that forked access to mapped buffer fails
+ */
+typedef void (*map_oa_buffer_test_t)(const struct drm_xe_engine_class_instance *hwe);
+static void test_mapped_oa_buffer(map_oa_buffer_test_t test_with_fd_open,
+				  const struct drm_xe_engine_class_instance *hwe)
+{
+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	uint64_t properties[] = {
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(test_set->perf_oa_format),
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, oa_exp_1_millisec,
+		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
+	};
+	struct intel_xe_oa_open_prop param = {
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+
+	stream_fd = __perf_open(drm_fd, &param, false);
+
+	igt_assert(test_with_fd_open);
+	test_with_fd_open(hwe);
+
+	__perf_close(stream_fd);
+}
+
 static const char *xe_engine_class_name(uint32_t engine_class)
 {
 	switch (engine_class) {
@@ -4224,6 +4449,32 @@ igt_main
 	igt_subtest("whitelisted-registers-userspace-config")
 		test_whitelisted_registers_userspace_config();
 
+	igt_subtest_group {
+		igt_subtest_with_dynamic("map-oa-buffer")
+			__for_one_hwe_in_oag(hwe)
+				test_mapped_oa_buffer(check_reports_from_mapped_buffer, hwe);
+
+		igt_subtest_with_dynamic("invalid-map-oa-buffer")
+			__for_one_hwe_in_oag(hwe)
+				test_mapped_oa_buffer(invalid_param_map_oa_buffer, hwe);
+
+		igt_subtest_with_dynamic("non-privileged-map-oa-buffer")
+			__for_one_hwe_in_oag(hwe)
+				test_mapped_oa_buffer(unprivileged_map_oa_buffer, hwe);
+
+		igt_subtest_with_dynamic("non-privileged-access-vaddr")
+			__for_one_hwe_in_oag(hwe)
+				test_mapped_oa_buffer(map_oa_buffer_unprivilege_access, hwe);
+
+		igt_subtest_with_dynamic("privileged-forked-access-vaddr")
+			__for_one_hwe_in_oag(hwe)
+				test_mapped_oa_buffer(map_oa_buffer_forked_access, hwe);
+
+		igt_subtest_with_dynamic("closed-fd-and-unmapped-access")
+			__for_one_hwe_in_oag(hwe)
+				closed_fd_and_unmapped_access(hwe);
+	}
+
 	igt_fixture {
 		/* leave sysctl options in their default state... */
 		write_u64_file("/proc/sys/dev/xe/observation_paranoid", 1);
-- 
2.41.0

