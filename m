Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B47C369AB
	for <igt-dev@archiver.kernel.org>; Fri, 18 Apr 2025 20:02:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2611610E256;
	Fri, 18 Apr 2025 20:02:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NCDq5sv/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CAFA10E256
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Apr 2025 20:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745006546; x=1776542546;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e1y5aLYZ/VUpfoXCYL7y6+935vDsNStxETB9gRjDCwQ=;
 b=NCDq5sv/YDnf0WHjwFV+IHRjjgk+p01jabahifu0oW1UIt2ttSu2SsVx
 ICUW0fKnJKd1icDxTI5IfxUXllEzUbqNbZVxQBXCjqgfxwRKAwzMTK5tf
 iGpZOeg2tLhLSXJOSVb949U7gHL0VtS7bj86qcMfuT0Wk263s7ON2Q5NU
 pxNcT/dFE/GTVCKUWHdGQ5L1CFGWwgaGCCO2a5kFThkKemTTSCAq+5N6y
 3iJr0nM7tMTscuYlXmK5JXO1r/d7GnydAyZcnZ007g/n+3qzBlQWEZr5k
 Ez6S+kMD8cMmW1kNhLxO0TTZtNDMT5vMm5K1Jxj1FWyk8F9jWinAbNW/u A==;
X-CSE-ConnectionGUID: DX6/ln47Tf2k9/jOsVMC1Q==
X-CSE-MsgGUID: xtqdmP6SRPOJ3Zy9UtkfKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11407"; a="72031576"
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="72031576"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 13:02:25 -0700
X-CSE-ConnectionGUID: SqbfQil1RNyZctpkxAeRjQ==
X-CSE-MsgGUID: WEJUBOLeRGCzeSTckMa3zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,222,1739865600"; d="scan'208";a="132085596"
Received: from dut4046ptlh.fm.intel.com ([10.105.8.209])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2025 13:02:26 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 umesh.nerlige.ramappa@intel.com, ashutosh.dixit@intel.com
Subject: [PATCH] tests/intel/xe_oa: Dynamically set report rate in buffer-size
 tests
Date: Fri, 18 Apr 2025 20:02:25 +0000
Message-ID: <20250418200225.306041-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

In the test xe_oa@buffer-size, a random power-of-2 buffer size is
selected between SZ_128K and SZ_128M, inclusively.  The test then sets
the oa report rate to 20 micro seconds.  With the given report rate and
a buffer size of SZ_128K, however, the buffer will have filled
completely before the CPU is able to read the buffer data, resulting in
a buffer overflow error.

Decreasing the report rate from 20 micro seconds to 50 micro seconds
prevents this issue from occurring, but doing so universally can
dramatically increase the execution time of subtests that use larger
buffer sizes.  To counteract this, only decrease the report rate of the
SZ_128K buffer size subtests.  This is accomplished by assigning a
report rate in micro seconds to each possible size.

On paper, this implementation would allow for subtests using larger
buffer sizes to execute with a higher report rate, and by extension,
for them to complete faster.  Unfortunately, the effective report rate
is clamped to the nearest lower power of 2 by
max_oa_exponent_for_period_lte.  For a 20 micro second report rate, the
returned exponent is 8, and using the next-lowest exponent of 7 causes
test instablity.  As such, all other tests will continue to use a 20
micro second report rate.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/4541
Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Suggested-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
---
 tests/intel/xe_oa.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 1fc8bfaafe..3504e2c04b 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -96,18 +96,19 @@ struct accumulator {
 struct oa_buf_size {
 	char name[12];
 	uint32_t size;
+	uint32_t oa_exponent_us;
 } buf_sizes[] = {
-	{ "128K", SZ_128K },
-	{ "256K", SZ_256K },
-	{ "512K", SZ_512K },
-	{ "1M", SZ_1M },
-	{ "2M", SZ_2M },
-	{ "4M", SZ_4M },
-	{ "8M", SZ_8M },
-	{ "16M", SZ_16M },
-	{ "32M", SZ_32M },
-	{ "64M", SZ_64M },
-	{ "128M", SZ_128M },
+	{ "128K", SZ_128K, 50},
+	{ "256K", SZ_256K, 20},
+	{ "512K", SZ_512K, 20},
+	{ "1M", SZ_1M, 20},
+	{ "2M", SZ_2M, 20},
+	{ "4M", SZ_4M, 20},
+	{ "8M", SZ_8M, 20},
+	{ "16M", SZ_16M, 20},
+	{ "32M", SZ_32M, 20},
+	{ "64M", SZ_64M, 20},
+	{ "128M", SZ_128M, 20},
 };
 
 /* OA unit types */
@@ -2456,10 +2457,13 @@ test_buffer_fill(const struct drm_xe_engine_class_instance *hwe)
  * Description: Test reason field is non-zero. Can also check OA buffer wraparound issues
  */
 static void
-test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe, size_t oa_buffer_size)
+test_non_zero_reason(const struct drm_xe_engine_class_instance *hwe,
+		     size_t oa_buffer_size,
+		     uint32_t oa_exponent_us)
 {
-	/* ~20 micro second period */
-	int oa_exponent = max_oa_exponent_for_period_lte(20000);
+	/* Period set dynamically based on buffer size */
+	uint32_t oa_exponent_ns = (oa_exponent_us * 1000) ?: 20000;
+	int oa_exponent = max_oa_exponent_for_period_lte(oa_exponent_ns);
 	struct intel_xe_perf_metric_set *test_set = metric_set(hwe);
 	uint64_t fmt = test_set->perf_oa_format;
 	size_t report_size = get_oa_format(fmt).size;
@@ -4757,13 +4761,15 @@ igt_main
 
 		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
 		__for_one_hwe_in_oag_w_arg(hwe, buf_sizes[k].name)
-			test_non_zero_reason(hwe, buf_sizes[k].size);
+			test_non_zero_reason(hwe,
+					     buf_sizes[k].size,
+					     buf_sizes[k].oa_exponent_us);
 	}
 
 	igt_subtest_with_dynamic("non-zero-reason") {
 		igt_require(oau->capabilities & DRM_XE_OA_CAPS_OA_BUFFER_SIZE);
 		__for_one_hwe_in_oag(hwe)
-			test_non_zero_reason(hwe, 0);
+			test_non_zero_reason(hwe, 0, 0);
 	}
 
 	igt_subtest("disabled-read-error")
-- 
2.43.0

