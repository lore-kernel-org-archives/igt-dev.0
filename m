Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06585C021A4
	for <igt-dev@archiver.kernel.org>; Sat, 15 Feb 2025 01:06:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B27810E4B3;
	Sat, 15 Feb 2025 01:06:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EEkjIgBk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F0110ED50
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Feb 2025 01:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739581590; x=1771117590;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Hu3I6byLOAQ3nXsIl3vhL9YeNHNH0W5gj6xrjjj77I0=;
 b=EEkjIgBkL+hokEzSP43Wl8upf6zsxsCjBOcHo02Vnv76tDzlc13zhT/j
 zb3gyFjJz3xb6L2rNCU43lZNzL/1HbkAw37HlrIc0WmlizJiFY+Z+16Z2
 85f9+vsDkjRow95/VE9mGNf8wgrB0ATNVQl9rZW8dnRLSh2opjgiE0sIT
 s3pKf4yNi6xTdecqJbjvRiSDwW/Zcgr1Eu7TsUIqm/L8FgOdp95FyJ+Ap
 OwM9A2+1dohSot8dxamtvVjpTtV4A/Eedf7MpkaGMPUabPxV+Ov1r8KQT
 IYpgWdcAoPEWqPIzZuCzmbn2jPxVnkt5y1aIAqt8x/Mcta2CLSHqjCyJA w==;
X-CSE-ConnectionGUID: B1fxBueZS0+AJhUjXTrDAg==
X-CSE-MsgGUID: 1uh7FugtQGyzoB9pxCx86w==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="50555117"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="50555117"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 17:06:30 -0800
X-CSE-ConnectionGUID: 22d19amrSxOu5KQUXWeJeA==
X-CSE-MsgGUID: 42dnkpsXRNW6a9lwuCCyyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; d="scan'208";a="118711260"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2025 17:06:28 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH 09/13] tests/intel/xe_oa: Test oa buffer sizes
Date: Fri, 14 Feb 2025 17:06:24 -0800
Message-Id: <20250215010628.1639986-10-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250215010628.1639986-1-umesh.nerlige.ramappa@intel.com>
References: <20250215010628.1639986-1-umesh.nerlige.ramappa@intel.com>
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

Introduce oa buffer size test separately. Pick a random valid buffer
size for the test.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 03d223df4..ee87b7338 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -93,6 +93,23 @@ struct accumulator {
 	uint64_t deltas[MAX_RAW_OA_COUNTERS];
 };
 
+struct oa_buf_size {
+	char name[12];
+	uint32_t size;
+} buf_sizes[] = {
+	{ "128K", SZ_128K },
+	{ "256K", SZ_256K },
+	{ "512K", SZ_512K },
+	{ "1M", SZ_1M },
+	{ "2M", SZ_2M },
+	{ "4M", SZ_4M },
+	{ "8M", SZ_8M },
+	{ "16M", SZ_16M },
+	{ "32M", SZ_32M },
+	{ "64M", SZ_64M },
+	{ "128M", SZ_128M },
+};
+
 /* OA unit types */
 enum {
 	OAG,
@@ -305,6 +322,7 @@ static struct intel_mmio_data mmio_data;
 static igt_render_copyfunc_t render_copy;
 static uint32_t rc_width, rc_height;
 static uint32_t buffer_fill_size;
+static uint32_t num_buf_sizes;
 
 static struct intel_xe_perf_metric_set *metric_set(const struct drm_xe_engine_class_instance *hwe)
 {
@@ -1094,6 +1112,7 @@ init_sys_info(void)
 	rc_width = 1920;
 	rc_height = 1080;
 	buffer_fill_size = SZ_16M;
+	num_buf_sizes = ARRAY_SIZE(buf_sizes);
 	oa_exponent_default = max_oa_exponent_for_period_lte(1000000);
 
 	default_oa_buffer_size = get_default_oa_buffer_size(drm_fd);
@@ -4805,6 +4824,17 @@ igt_main
 		__for_one_hwe_in_oag(hwe)
 			test_buffer_fill(hwe);
 
+	/**
+	 * SUBTEST: buffer-size
+	 * Description: Test various OA buffer sizes
+	 */
+	igt_subtest_with_dynamic("buffer-size") {
+		long k = random() % num_buf_sizes;
+
+		__for_one_hwe_in_oag_w_arg(hwe, buf_sizes[k].name)
+			test_non_zero_reason(hwe, buf_sizes[k].size);
+	}
+
 	igt_subtest_with_dynamic("non-zero-reason")
 		__for_one_hwe_in_oag(hwe)
 			test_non_zero_reason(hwe, 0);
-- 
2.34.1

