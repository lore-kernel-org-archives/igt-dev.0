Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39269C282D3
	for <igt-dev@archiver.kernel.org>; Wed,  5 Mar 2025 00:57:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D39BA10E6D4;
	Wed,  5 Mar 2025 00:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aGF/491y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0506610E0CF
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Mar 2025 00:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741136241; x=1772672241;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=+iag/NPLZKRYs3Uk53drjrNKIs63hblkF/IhdUW3BkE=;
 b=aGF/491yFtPVqaZs8geWpU3+AgBcJm/9eE72yVZl6zXcJwwvh8eAbktU
 yz11Kyvp3T9MxXwSISB+1q6HjPb8aa9HPR4V8xqSHiFTMydOCQTK7Fxss
 jYzNupsc1XNjonnVMFIcYrCQK+Q67S0k5wfNIeXPUMkvBX+eCGfg8HTLI
 O1iYjBNtnxwTpPECgIzV0lzWexqFBZo/Hm6pQSd8Au8LEZ9kcfOU/i172
 8E8OCByW+xL3MnExmYD3w3QPbAcsH13Olncn2F/tTGAKhmlpP4/a/252g
 s0JUU4yRKWATJsgW2501bQRK5uc1j+7mOp4F+1A52MztFwh63/RdkC7Nx g==;
X-CSE-ConnectionGUID: wk5pw1Y3QByN/c9+06kmhw==
X-CSE-MsgGUID: k11hDZnMSieOza+9vM8stw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="44889462"
X-IronPort-AV: E=Sophos;i="6.14,221,1736841600"; d="scan'208";a="44889462"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 16:57:21 -0800
X-CSE-ConnectionGUID: XVxMtrodRVOAZnUeovLRgQ==
X-CSE-MsgGUID: Y8NfT+nXRrm1FWjpd3CGHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="119043943"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.25])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 16:57:20 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: igt-dev@lists.freedesktop.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_oa: Enable OA tests for simulation
Date: Tue,  4 Mar 2025 16:57:16 -0800
Message-Id: <20250305005716.168646-3-umesh.nerlige.ramappa@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250305005716.168646-1-umesh.nerlige.ramappa@intel.com>
References: <20250305005716.168646-1-umesh.nerlige.ramappa@intel.com>
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

Simulation runs are slow, so account for that by modifying the scope of
the tests.

- Set parameters specific to simulation during init.
- Skip tests that are heavily reliant on timing and that only test SW
  functionality.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/intel/xe_oa.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index e5744d830d39..06d324159211 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -1111,13 +1111,25 @@ init_sys_info(void)
 
 	intel_xe_perf_load_perf_configs(intel_xe_perf, drm_fd);
 
-	min_oa_exponent = 5;
-	max_oa_exponent = 20;
-	rc_width = 1920;
-	rc_height = 1080;
-	buffer_fill_size = SZ_16M;
-	num_buf_sizes = ARRAY_SIZE(buf_sizes);
-	oa_exponent_default = max_oa_exponent_for_period_lte(1000000);
+	if (igt_run_in_simulation()) {
+		igt_debug("SIMULATION run\n");
+		min_oa_exponent = 5;
+		max_oa_exponent = 10;
+		rc_width = 64;
+		rc_height = 36;
+		buffer_fill_size = SZ_128K;
+		num_buf_sizes = 3;
+		oa_exponent_default = max_oa_exponent_for_period_lte(1000);
+	} else {
+		igt_debug("HW run\n");
+		min_oa_exponent = 5;
+		max_oa_exponent = 20;
+		rc_width = 1920;
+		rc_height = 1080;
+		buffer_fill_size = SZ_16M;
+		num_buf_sizes = ARRAY_SIZE(buf_sizes);
+		oa_exponent_default = max_oa_exponent_for_period_lte(1000000);
+	}
 
 	default_oa_buffer_size = get_default_oa_buffer_size(drm_fd);
 	igt_debug("default_oa_buffer_size: %zu\n", default_oa_buffer_size);
@@ -4758,6 +4770,7 @@ igt_main
 			test_enable_disable(hwe);
 
 	igt_subtest_with_dynamic("blocking") {
+		igt_require(!igt_run_in_simulation());
 		__for_one_hwe_in_oag(hwe)
 			test_blocking(40 * 1000 * 1000 /* 40ms oa period */,
 				      false /* set_kernel_hrtimer */,
@@ -4766,6 +4779,7 @@ igt_main
 	}
 
 	igt_subtest_with_dynamic("polling") {
+		igt_require(!igt_run_in_simulation());
 		__for_one_hwe_in_oag(hwe)
 			test_polling(40 * 1000 * 1000 /* 40ms oa period */,
 				     false /* set_kernel_hrtimer */,
@@ -4805,8 +4819,10 @@ igt_main
 		igt_subtest("oa-unit-exclusive-stream-exec-q")
 			test_oa_unit_exclusive_stream(false);
 
-		igt_subtest("oa-unit-concurrent-oa-buffer-read")
+		igt_subtest("oa-unit-concurrent-oa-buffer-read") {
+			igt_require(!igt_run_in_simulation());
 			test_oa_unit_concurrent_oa_buffer_read();
+		}
 	}
 
 	igt_subtest("rc6-disable") {
-- 
2.45.2

