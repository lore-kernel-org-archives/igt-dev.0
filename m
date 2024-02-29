Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7147C48BF6
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 05:19:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA5410E39F;
	Thu, 29 Feb 2024 05:19:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VZ9EJFpz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D88010E38F
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 05:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709183944; x=1740719944;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=dwybowklZu4fc4tggg3Q3KDDlF3KKhOfEKT7yWuFMNU=;
 b=VZ9EJFpzZ6le4jpvBjSzdBchS0DBrXweOkbDZxBed7PiZdvZ0PVRfCPE
 6xY3WMNgi+eaQ5h7F/BoG7D1ocJ1Zf7IENFxV2XjRYHXsTROVgrM2M9XG
 /1wikE8neO+/TKVB5hUIqpvz5ESFLVfs5osHsT8pjY7J4PXirgR2fq3Qm
 TnlXf0FPtTHuABWzOJrEB71s8ljeuZhTBqZfBYx7eNZmVOfTNttk8xz8W
 jowTZ15hGYFD/t8wcdRuwr9qQca+rywNmNl1nFtbWhBX3NCFrQxcOr77T
 ubIsndfX4Cyj/KHfHvUpoglg1y0SDzf0xxQL0BgPXmgHWh2DIUV5fT3tg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14780759"
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; d="scan'208";a="14780759"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 21:19:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; d="scan'208";a="12250020"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 21:19:02 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t v7 8/8] tests/kms_vrr: Add a max/min test to oscillate between
 rates
Date: Thu, 29 Feb 2024 10:42:50 +0530
Message-ID: <20240229051250.2939774-9-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240229051250.2939774-1-bhanuprakash.modem@intel.com>
References: <20240229051250.2939774-1-bhanuprakash.modem@intel.com>
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

From: Sean Paul <seanpaul@chromium.org>

The new MAXMIN test will oscillate between the max and min
refresh rates every frame to stress test the panel. This is
useful for manual profiling of flicker.

v2:
- Added to the set
v3: (Bhanu)
- Rebase
- Add testplan documentation
v4: (Bhanu)
- Don't execute other stuff in max-min
v5: (Bhanu)
- Adjust Pass/Fail criteria
- Tweak min rate for Intel h/w

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 6d516d8fc..15c62b34b 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -66,6 +66,10 @@
  * Description: Test to switch RR seamlessly without modeset.
  * Functionality: adaptive_sync, drrs
  *
+ * SUBTEST: max-min
+ * Description: Oscillates between highest and lowest refresh each frame for
+ *              manual flicker profiling
+ *
  * SUBTEST: negative-basic
  * Description: Make sure that VRR should not be enabled on the Non-VRR panel.
  */
@@ -86,7 +90,8 @@ enum {
 	TEST_SEAMLESS_VRR = 1 << 4,
 	TEST_SEAMLESS_DRRS = 1 << 5,
 	TEST_FASTSET = 1 << 6,
-	TEST_NEGATIVE = 1 << 7,
+	TEST_MAXMIN = 1 << 7,
+	TEST_NEGATIVE = 1 << 8,
 };
 
 enum {
@@ -537,7 +542,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 			     (range.max + 5), rate[0], result);
 	}
 
-	if (flags & ~TEST_NEGATIVE) {
+	if (flags & ~(TEST_NEGATIVE | TEST_MAXMIN)) {
 		rate[0] = vtest_ns.rate_ns;
 		result = flip_and_measure(data, output, pipe, rate, 1, data->duration_ns);
 		igt_assert_f(result > 75,
@@ -553,6 +558,19 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 			     (range.min - 10), rate[0], result);
 	}
 
+	if (flags & TEST_MAXMIN) {
+		unsigned int range_min =
+			/* For Intel h/w tweak the min rate, as h/w will terminate the vblank at Vmax. */
+			is_intel_device(data->drm_fd) ? (range.min + 2) : range.min;
+		uint64_t maxmin_rates[] = {vtest_ns.max, rate_from_refresh(range_min)};
+
+		result = flip_and_measure(data, output, pipe, maxmin_rates, 2, data->duration_ns);
+		igt_assert_f(result > 75,
+			     "Refresh rates (%u/%u Hz) %"PRIu64"ns/%"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
+			     range.max, range_min, maxmin_rates[0], maxmin_rates[1], result);
+		return;
+	}
+
 	/*
 	 * If we request VRR on a non-VRR panel, it is unlikely to reject the
 	 * modeset. And the expected behavior is the same as disabling VRR on
@@ -802,6 +820,11 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 	igt_subtest_with_dynamic("negative-basic")
 		run_vrr_test(&data, test_basic, TEST_NEGATIVE);
 
+	igt_describe("Oscillates between highest and lowest refresh each frame for manual "
+		     "flicker profiling");
+	igt_subtest_with_dynamic("max-min")
+		run_vrr_test(&data, test_basic, TEST_MAXMIN);
+
 	igt_subtest_group {
 		igt_fixture
 			igt_require_intel(data.drm_fd);
-- 
2.43.0

