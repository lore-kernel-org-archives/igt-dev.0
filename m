Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52353CA0EFF
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 00:35:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38FC310E088;
	Sat, 23 Aug 2025 00:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RkQbgQhZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBEA410E069
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 00:35:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755909335; x=1787445335;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5w61LJUykYpdQlXQaFZO5xlwmN40n815IZnCXljEcbw=;
 b=RkQbgQhZCBBYF7GxspHKiDdQUBwXmoaJjF7orwrDte4Cufxd+UyomFpV
 hJyHha6gtAdx0AHCst8OQbsT4/jndjuk9WiXwqKuhcblNRkgPU37tXxE1
 ToQa7aNq1HO96KcVne1rlFzEqtitn4npYG0jefIHVl0O770hy7LrZ7rCZ
 5T1YhRErd+ldCEc3/+QxEBukL9xmtpUM7T5cPIAKobDAbqWtuN8CR/IuX
 RcoA3D6bnDFK11hJ7lSIAsVd2E8mYPAAneWjZNpNUZsNbfFvL3KKtv3pV
 HxnAPw9iTDRpSpVFjcj5+iidubWb5vQlsWn4WmaLnR6DkyH+2tLFhFVMA Q==;
X-CSE-ConnectionGUID: yVAvmgeCQL6MuJkM6UH+OQ==
X-CSE-MsgGUID: 7IBahkEtROSgvBRfU2o92g==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58146830"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58146830"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 17:35:35 -0700
X-CSE-ConnectionGUID: XOjkhu15SfKP4c1Sm6J2TQ==
X-CSE-MsgGUID: WF/HtpfbQjyaUTd4DBZlaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="168732396"
Received: from unerlige-desk1.jf.intel.com ([10.165.21.138])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2025 17:35:34 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t 3/4] tests/intel/xe_oa: Add a test for tail address wrap
Date: Fri, 22 Aug 2025 17:34:05 -0700
Message-ID: <20250823003401.109978-9-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250823003401.109978-6-umesh.nerlige.ramappa@intel.com>
References: <20250823003401.109978-6-umesh.nerlige.ramappa@intel.com>
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

Add a test to verify that the HW wraps to start of the OA buffer when a
report does not fit in the remaining space in the buffer.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 74 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 745f364e52e9..7381e7b9bd44 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4535,6 +4535,76 @@ static void closed_fd_and_unmapped_access(const struct drm_xe_engine_class_insta
 	try_invalid_access(vaddr);
 }
 
+/**
+ * SUBTEST: tail-address-wrap
+ * Description: Test tail address wrap on odd format sizes. Ensure that the
+ * format size is not a power of 2. This means that the last report will not be
+ * broken down across the OA buffer end. Instead it will be written to the
+ * beginning of the OA buffer. We will check the end of the buffer to ensure it
+ * has zeroes in it.
+ */
+static void
+test_tail_address_wrap(const struct drm_xe_engine_class_instance *hwe)
+{
+#define TIMER_PERIOD_US 20
+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	uint64_t exponent = max_oa_exponent_for_period_lte(TIMER_PERIOD_US * 1000);
+	uint64_t fmt = test_set->perf_oa_format;
+	uint64_t properties[] = {
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, exponent,
+		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
+		DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE, buffer_fill_size,
+	};
+	struct intel_xe_oa_open_prop param = {
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+	uint32_t fmt_size = get_oa_format(fmt).size;
+	uint32_t fit_reports = buffer_fill_size / fmt_size;
+	uint32_t wrap_offset = (fit_reports * fmt_size) >> 2;
+	uint32_t end_offset = buffer_fill_size >> 2;
+	uint32_t *report, *zero_area, *buffer_end;
+	void *buffer_start;
+	int i, tolerance = 10;
+
+	igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
+
+	/* Ensure report does not fit */
+	igt_require(wrap_offset < end_offset);
+
+	/* mmap the buffer */
+	stream_fd = __perf_open(drm_fd, &param, false);
+	buffer_start = mmap(0, buffer_fill_size, PROT_READ, MAP_PRIVATE, stream_fd, 0);
+	igt_assert(buffer_start);
+
+	/* Wait for reports to fill the buffer with some tolerance */
+	report = buffer_start;
+	for (i = 0; fit_reports && i < fit_reports + tolerance; i++) {
+		usleep(TIMER_PERIOD_US);
+		if (*report && oa_timestamp(report, fmt)) {
+			fit_reports--;
+			report += (fmt_size >> 2);
+		}
+	}
+
+	/* Let some reports land in the start of the buffer */
+	usleep(tolerance * TIMER_PERIOD_US);
+
+	zero_area = (uint32_t *)buffer_start + wrap_offset;
+	buffer_end = (uint32_t *)buffer_start + end_offset;
+
+	/* Ensure HW did not write to this area */
+	while (zero_area < buffer_end)
+		igt_assert_eq(*zero_area++, 0);
+
+	munmap(buffer_start, buffer_fill_size);
+	__perf_close(stream_fd);
+}
+
 /**
  * SUBTEST: map-oa-buffer
  * Description: Verify mapping of oa buffer
@@ -5091,6 +5161,10 @@ igt_main
 		igt_subtest_with_dynamic("closed-fd-and-unmapped-access")
 			__for_one_hwe_in_oag(hwe)
 				closed_fd_and_unmapped_access(hwe);
+
+		igt_subtest_with_dynamic("tail-address-wrap")
+			__for_one_hwe_in_oag(hwe)
+				test_tail_address_wrap(hwe);
 	}
 
 	igt_subtest_group {
-- 
2.43.0

