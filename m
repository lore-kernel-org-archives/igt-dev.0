Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0F2CF58FF
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 09:33:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A75510E7EF;
	Fri, 20 Sep 2024 09:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EXX0wE6T";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198A610E7EF
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Sep 2024 09:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726824808; x=1758360808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1xy+4uYFQ/ZJIlOQVT6mcO5d2XgJvOxzlmLXGyPQTwU=;
 b=EXX0wE6T/zmjK0hal8j8vW/OHyllOY6MKO0VGu4raat7R+llhLx63gqE
 /PJDCRtr+cC0Ea/AGTRoQUvX70t0wxCdjTqyADMcIrOtuJiJpRsMZSetX
 R4aGTXtOMMJM57TQuZtXYjA+zlthV4xHAJQlKbqegn9XS57ETFcOnGrp0
 +jAysK4N54evFy8qPWf9V50OvoXcPBGK10WgebdKXBWyFf1uZMsV6X4TT
 EY8BuK0uytD/e4l1vUflLr2OprlXb+4CCRoVY2UGitV5m+54GJQYtcfZx
 zFaJ3kXP4AhzkyAL8RLvsxMagitfeP33rQ72EkUapkscZGNc3dUyNa6E6 Q==;
X-CSE-ConnectionGUID: e85tciA8ROOMC7FvgPuEPw==
X-CSE-MsgGUID: XGTizj/RQQqzej2YPg/cfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="28721546"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="28721546"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 02:33:28 -0700
X-CSE-ConnectionGUID: /iJX8KVVQyqUi/w/QgZdqA==
X-CSE-MsgGUID: KjKQnQGmSi6pprJ8IjGgWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="70276752"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 02:33:26 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ramanaidu.naladala@intel.com, santhosh.reddy.guddati@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 2/2] tests/kms_vrr: Update LOBF test to reuse the
 existing logic
Date: Fri, 20 Sep 2024 15:15:21 +0530
Message-Id: <20240920094521.1222304-3-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240920094521.1222304-1-jeevan.b@intel.com>
References: <20240920094521.1222304-1-jeevan.b@intel.com>
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

v2: Fix typo and add aux-less alpm check.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_vrr.c | 52 +++++++++++++++++++------------------------------
 1 file changed, 20 insertions(+), 32 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 36a22eebe..d5a6304c3 100644
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
 
@@ -792,31 +800,6 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
 	}
 }
 
-/* FIXME: test_lobf : Lobf can be enabled when
- * (Set Context Latency + Guardband) > (First SDP Position + Wake Time)
- * one the depends patches are merged please fix this function.
- */
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
@@ -895,7 +878,8 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 		    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL))
 			psr_disable(data->drm_fd, data->debugfs_fd, NULL);
 
-		if (igt_get_i915_edp_lobf_status(data->drm_fd, output->name)) {
+		if (igt_get_i915_edp_lobf_status(data->drm_fd, output->name) &&
+		    igt_get_aux_less_alpm_status(data->drm_fd, output->name)) {
 			igt_info("%s: LOBF not supported.\n", igt_output_name(output));
 			return false;
 		}
@@ -1098,12 +1082,16 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
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

