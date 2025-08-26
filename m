Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0355CA0FF7
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 22:44:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5971E10E5FF;
	Tue, 26 Aug 2025 22:44:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aeTxqSxT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55D9010E2F7
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 22:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756248272; x=1787784272;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lO+b5M0dJPdC+iq31OnpIGl8ZHiA5eJ063mBdTO48XU=;
 b=aeTxqSxTor5XFV/zQ1whRdON3Se9c8wM0y5trsujMEpUZaYqVarwNJAz
 8d39KsZqLfeDcwopyUqLQ1b2r4odSSiPQDP8CZdinnisigbyXKlB/n0Wk
 HhcT1ciHyWP3AmQVxTgQ913iGrvUiEQf0+MdRDIpIoUg7k8RQKrSHyOtS
 7rqkS2IJLIxsuqPBOpnFi+9y/FlX8I06r2AA5kdbQRVYCZTCTJpPXFpIm
 2u9PpQoHo9o0tF2RSnHcbPh3mJiabGXeNza+gsBqzOke+NqmAoA42I7/b
 /i78QM8VThRbU65SY8pg714jL524S03OjKcDiqfCUBdGlGm0R6alwTNZM w==;
X-CSE-ConnectionGUID: LwxwlQBrSUa8TjPsYPG9dA==
X-CSE-MsgGUID: I8aF6K87Q8m6T9W/kpJ/oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="58595532"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="58595532"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 15:44:32 -0700
X-CSE-ConnectionGUID: BziUzymBSgSe6qIniIjVIQ==
X-CSE-MsgGUID: +eW6TcGFTHe0iuiGE36M1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="200647271"
Received: from unerlige-desk1.jf.intel.com ([10.165.21.138])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 15:44:29 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t v2 3/4] tests/intel/xe_oa: Add a test for tail address
 wrap
Date: Tue, 26 Aug 2025 15:43:00 -0700
Message-ID: <20250826224256.510692-9-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250826224256.510692-6-umesh.nerlige.ramappa@intel.com>
References: <20250826224256.510692-6-umesh.nerlige.ramappa@intel.com>
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

v2:
- Make test more robust

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 97 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index d10ef00d6abc..24442e4b83c6 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4537,6 +4537,95 @@ static void closed_fd_and_unmapped_access(const struct drm_xe_engine_class_insta
 	try_invalid_access(vaddr);
 }
 
+static void read_reports(int fd, uint8_t *buf, size_t size)
+{
+	int len, total = 0;
+
+	while (total < size) {
+		len = read(fd, &buf[total], size - total);
+		if (len == -1 && (errno == EIO || errno == EINTR))
+			continue;
+
+		igt_assert(len);
+		total += len;
+	}
+}
+
+/**
+ * SUBTEST: tail-address-wrap
+ * Description: Test tail address wrap on odd format sizes. Ensure that the
+ * format size is not a power of 2. This means that the last report will not be
+ * broken down across the OA buffer end. Instead it will be written to the
+ * beginning of the OA buffer. We will check the end of the buffer to ensure it
+ * has zeroes in it.
+ */
+static void
+test_tail_address_wrap(const struct drm_xe_engine_class_instance *hwe, size_t oa_buffer_size)
+{
+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	uint64_t exponent = max_oa_exponent_for_period_lte(20000);
+	uint64_t buffer_size = oa_buffer_size ?: buffer_fill_size;
+	uint64_t fmt = test_set->perf_oa_format;
+	uint64_t properties[] = {
+		DRM_XE_OA_PROPERTY_OA_UNIT_ID, 0,
+		DRM_XE_OA_PROPERTY_SAMPLE_OA, true,
+		DRM_XE_OA_PROPERTY_OA_METRIC_SET, test_set->perf_oa_metrics_set,
+		DRM_XE_OA_PROPERTY_OA_FORMAT, __ff(fmt),
+		DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT, exponent,
+		DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE, hwe->engine_instance,
+		DRM_XE_OA_PROPERTY_OA_BUFFER_SIZE, buffer_size,
+		DRM_XE_OA_PROPERTY_OA_DISABLED, true,
+	};
+	struct intel_xe_oa_open_prop param = {
+		.num_properties = ARRAY_SIZE(properties) / 2,
+		.properties_ptr = to_user_pointer(properties),
+	};
+	uint32_t fmt_size = get_oa_format(fmt).size;
+	uint32_t fit_reports = buffer_size / fmt_size;
+	uint32_t extra_reports = 10;
+	uint32_t total_reports = fit_reports + extra_reports;
+	uint32_t total_size = total_reports * fmt_size;
+	uint8_t *buf = malloc(total_size);
+
+	uint32_t wrap_offset = (fit_reports * fmt_size) >> 2;
+	uint32_t end_offset = buffer_size >> 2;
+	uint32_t *zero_area, *buffer_end, *buffer_start;
+	int i;
+
+	/* Ensure report does not fit */
+	igt_require(wrap_offset < end_offset);
+
+	stream_fd = __perf_open(drm_fd, &param, false);
+
+	/* Read fit_reports + extra_reports */
+	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
+	read_reports(stream_fd, buf, total_size);
+	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
+
+	/* Quick check for valid reports */
+	for (i = 0; i < total_reports; i++) {
+		uint32_t *report = (uint32_t *)&buf[i * fmt_size];
+
+		igt_assert(report_reason(report) && oa_timestamp(report, fmt));
+	}
+
+	/* mmap the buffer and check that the end of the buffer has zeroes */
+	buffer_start = mmap(0, buffer_size, PROT_READ, MAP_PRIVATE, stream_fd, 0);
+	igt_assert(buffer_start);
+
+	zero_area = buffer_start + wrap_offset;
+	buffer_end = buffer_start + end_offset;
+
+	/* Ensure HW did not write to this area */
+	while (zero_area < buffer_end)
+		igt_assert_eq(*zero_area++, 0);
+
+	munmap(buffer_start, buffer_size);
+
+	__perf_close(stream_fd);
+	free(buf);
+}
+
 /**
  * SUBTEST: map-oa-buffer
  * Description: Verify mapping of oa buffer
@@ -5095,6 +5184,14 @@ igt_main
 				closed_fd_and_unmapped_access(hwe);
 	}
 
+	igt_subtest_with_dynamic("tail-address-wrap") {
+		long k = random() % num_buf_sizes;
+
+		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
+		__for_one_hwe_in_oag_w_arg(hwe, buf_sizes[k].name)
+			test_tail_address_wrap(hwe, buf_sizes[k].size);
+	}
+
 	igt_subtest_group {
 		igt_fixture {
 			perf_init_whitelist();
-- 
2.43.0

