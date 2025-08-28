Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 871A2CA0FF6
	for <igt-dev@archiver.kernel.org>; Thu, 28 Aug 2025 21:49:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFF210EAEA;
	Thu, 28 Aug 2025 21:49:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hw2XyM07";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576BD10EAE4
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Aug 2025 21:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756417754; x=1787953754;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=+NitqMZVUC1H67lj0YTYk/p7NKVaYzLZjye3MCGMMX8=;
 b=hw2XyM07Y5otXamQihcyfaRy492mzygRzGE1radHQ//HJ4+B0Ryk3rtS
 MR8mmaKgp2A0dp86Xk8pWCa0Kxs3m2PcPCPPTM0wBGA35ybGr349qYPeF
 OYDVU4Zg9yzgGvkP8Un+/PmcqO5UkJOCbEYsUA1UQ7l0X3xnuGn14XT7C
 UIQb5MRWvQPbcNBoznZSYletd+KdYS+0xGSn9Kvr2smBOu34QS9CtYcTq
 IXAxvdBtPJf2XbLQ/xmgGLVb74OKIU8x7grfW4OWV+Lsjwx5GxkuO8OvJ
 rdLEZTosaP1UfiKLUbWEBQz2Kzds4yp2C+RRlazD1sty/cWjy15xSV+MD A==;
X-CSE-ConnectionGUID: UwHQoX6+TOaR3s5W3uS1KA==
X-CSE-MsgGUID: UuhgdDNoTzyE/Nv1ZC8TkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="62346787"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="62346787"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 14:49:14 -0700
X-CSE-ConnectionGUID: upVdzpfiRP6qDVuKBdu+mw==
X-CSE-MsgGUID: QPoB87m4QueaT1R11xIpfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="170607771"
Received: from dut6306bmgfrd.fm.intel.com ([10.36.25.21])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 14:49:13 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>,
	igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v3 2/2] tests/intel/xe_oa: Add a test for tail address
 wrap
Date: Thu, 28 Aug 2025 21:49:07 +0000
Message-ID: <20250828214907.94311-3-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250828214907.94311-1-umesh.nerlige.ramappa@intel.com>
References: <20250828214907.94311-1-umesh.nerlige.ramappa@intel.com>
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

v3:
- Just wait for buffer overflow status instead of reading reports

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 65 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 3b3cdf9314c2..443e0b1761ef 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4541,6 +4541,63 @@ static void closed_fd_and_unmapped_access(const struct drm_xe_engine_class_insta
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
+test_tail_address_wrap(const struct drm_xe_engine_class_instance *hwe, size_t oa_buffer_size)
+{
+	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
+	u64 exponent = max_oa_exponent_for_period_lte(20000);
+	u64 buffer_size = oa_buffer_size ?: buffer_fill_size;
+	u64 fmt = test_set->perf_oa_format;
+	u64 properties[] = {
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
+	u32 fmt_size = get_oa_format(fmt).size;
+	u32 zero_size = buffer_size % fmt_size;
+	u32 *zero_area, *buffer_end, *buffer_start;
+
+	igt_require(zero_size);
+
+	stream_fd = __perf_open(drm_fd, &param, false);
+	set_fd_flags(stream_fd, O_CLOEXEC);
+
+	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_ENABLE, 0);
+	wait_for_oa_buffer_overflow(stream_fd, 100);
+	do_ioctl(stream_fd, DRM_XE_OBSERVATION_IOCTL_DISABLE, 0);
+
+	buffer_start = mmap(0, buffer_size, PROT_READ, MAP_PRIVATE, stream_fd, 0);
+	igt_assert(buffer_start);
+
+	zero_area = buffer_start + (buffer_size - zero_size) / 4;
+	buffer_end = buffer_start + buffer_size / 4;
+
+	dump_report(zero_area, zero_size / 4, "zero_area");
+	while (zero_area < buffer_end)
+		igt_assert_eq(*zero_area++, 0);
+
+	munmap(buffer_start, buffer_size);
+
+	__perf_close(stream_fd);
+}
+
 /**
  * SUBTEST: map-oa-buffer
  * Description: Verify mapping of oa buffer
@@ -5099,6 +5156,14 @@ igt_main
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

