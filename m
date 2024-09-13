Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD54EEEC39
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 06:43:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B713310E052;
	Fri, 13 Sep 2024 06:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="buRq3+Hr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A5210E052
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 06:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726209780; x=1757745780;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=g74I/NF4It1Qy5FRyvqAA8/Wgq5y+Uy/da2kS2u6lPc=;
 b=buRq3+HrcdNuS0DZxNWCEz+DjPIXlUSxgu4KYYmcNCnK2jjUUFyDgob4
 VwGVui+rYh5jF/dc7JG0XIAAUsyVV4BglFD3D01gF6nMFHNmsjhJB2ZmJ
 9XckmDAz/NJYl9/70A7/HJodSrRecGSrJflKyX5RPSWnl0czvC7mVsy6/
 ypR7CdNp3oppINGvKldgEp8tO2u46ECTBlSuqsthxfx8S9NtLl3jNGOkA
 ZIYXXOm+V5pkgfK3c/8Tip8muzWExcKVzDpjo5jU3KzaVkWg+zyHIzBYu
 fM12EJqwieP2wtlUrE+wIw4G8M1f0me1+XzFsOZPzk4ZuiJ7Cy6sJ8Oyu A==;
X-CSE-ConnectionGUID: YyxlJIknTFizjjdwNpENEQ==
X-CSE-MsgGUID: faO4z8TgSYyiRCScRJlXSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="25294485"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="25294485"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 23:42:59 -0700
X-CSE-ConnectionGUID: qNkvXMHfSPWM0w6mBs5kQQ==
X-CSE-MsgGUID: 5TGHcPi0RPS2U9brrnqmJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; d="scan'208";a="98763269"
Received: from jeevanb-desk.iind.intel.com ([10.223.74.192])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 23:42:57 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: bhanuprakash.modem@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH] tests/kms_vrr: Update LOBF test to resuse the existing logic
Date: Fri, 13 Sep 2024 12:26:16 +0530
Message-Id: <20240913065616.326959-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
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

Removed the test_lobf function and used test_basic instead to simplify
the code. Improved validation and error messages to make LOBF testing
more reliable.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_vrr.c | 45 ++++++++++++++++++---------------------------
 1 file changed, 18 insertions(+), 27 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 36a22eebe..5d9b321d3 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -640,7 +640,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 			     (range.max + 5), rate[0], result);
 	}
 
-	if (flags & ~(TEST_NEGATIVE | TEST_MAXMIN)) {
+	if (flags & ~(TEST_NEGATIVE | TEST_MAXMIN | TEST_LINK_OFF)) {
 		rate[0] = vtest_ns.rate_ns;
 		result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
 		igt_assert_f(result > 75,
@@ -656,16 +656,24 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 			     (range.min - 10), rate[0], result);
 	}
 
-	if (flags & TEST_MAXMIN) {
+	if (flags & (TEST_MAXMIN | TEST_LINK_OFF)) {
 		unsigned int range_min =
 			/* For Intel h/w tweak the min rate, as h/w will terminate the vblank at Vmax. */
 			is_intel_device(data->drm_fd) ? (range.min + 2) : range.min;
 		uint64_t maxmin_rates[] = {vtest_ns.max, rate_from_refresh(range_min)};
 
 		result = flip_and_measure(data, output, pipe, maxmin_rates, 2, data->duration_ns);
-		igt_assert_f(result > 75,
-			     "Refresh rates (%u/%u Hz) %"PRIu64"ns/%"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
-			     range.max, range_min, maxmin_rates[0], maxmin_rates[1], result);
+
+		if (flags & TEST_LINK_OFF)
+			igt_assert_f(igt_get_i915_edp_lobf_status(data->drm_fd, output->name),
+				     "LOBF not enabled\n");
+		else
+			igt_assert_f(result > 75,
+				     "Refresh rates (%u/%u Hz) %"PRIu64"ns/%"PRIu64"ns: Target "
+				     "VRR on threshold not reached, result was %u%%\n",
+				     range.max, range_min, maxmin_rates[0], maxmin_rates[1],
+				     result);
+
 		return;
 	}
 
@@ -796,27 +804,6 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
  * (Set Context Latency + Guardband) > (First SDP Position + Wake Time)
  * one the depends patches are merged please fix this function.
  */
-
-static void
-test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
-{
-	uint64_t rate[] = {0};
-
-	rate[0] = rate_from_refresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
-	prepare_test(data, output, pipe);
-
-	igt_info("LOBF test execution on %s, PIPE %s with VRR range: (%u-%u) Hz\n",
-		 output->name, kmstest_pipe_name(pipe), data->range.min, data->range.max);
-
-	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
-	flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
-	igt_output_override_mode(output, &data->switch_modes[LOW_RR_MODE]);
-	rate[0] = rate_from_refresh(data->switch_modes[LOW_RR_MODE].vrefresh);
-	flip_and_measure(data, output, pipe, rate, 1, NSECS_PER_SEC);
-	igt_assert_f(igt_get_i915_edp_lobf_status(data->drm_fd, output->name),
-		     "LOBF not enabled\n");
-}
-
 static void
 test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 {
@@ -1098,12 +1085,16 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 			run_vrr_test(&data, test_cmrr, TEST_CMRR);
 		}
 
+		/* FIXME: test_lobf : Lobf can be enabled when
+		 * (Set Context Latency + Guardband) > (First SDP Position + Wake Time)
+		 * one the depends patches are merged please fix this function.
+		 */
 		igt_describe("Test to validate the link-off between active frames in "
 			     "non-PSR operation.");
 		igt_subtest_with_dynamic("lobf") {
 			igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20);
 
-			run_vrr_test(&data, test_lobf, TEST_LINK_OFF);
+			run_vrr_test(&data, test_basic, TEST_LINK_OFF);
 		}
 	}
 
-- 
2.25.1

