Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1278C47DA9
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jan 2024 05:49:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FEEF112DBE;
	Tue, 30 Jan 2024 05:49:29 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0606112DBC
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jan 2024 05:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706593767; x=1738129767;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2qo2EANTbdJ+fyNt0PcMEa9iunPEhRR8qmmhK8zXgxQ=;
 b=br88/r0OLldugZ705Bcfy1s/BbM7J/jGM/Felz3Kow1+3APcoAFdIan/
 vuYPdT4IR3EVrR3OyOyTBpv8kwsRN637La/JN4J5MoKrTvCu5y8+BDecR
 sjZd+puj7LFKOBPwzhRhtNcN1FXbXzxA/ha9PViRSHEYHh3y6uwoFOS92
 zdxARDqBcjHqKB9utvlsYkLVuuB5F1tQec074gFlPe7kpBae6ua2Z0o5c
 hj0OPeRb4EhsZO46M54790VIOlKlEgQFm7mAycyjUszxxiaGBC7cCs/Oz
 GCjRlmi7dIWqcEWbaUA+XV44cI06d5Fu+iQ9tK3UlONXAoSGLEZt7rQhP g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="393609672"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="393609672"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 21:49:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="3603187"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 21:49:25 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t v5 8/9] tests/kms_vrr: Add a max/min test to oscillate between
 rates
Date: Tue, 30 Jan 2024 11:12:34 +0530
Message-ID: <20240130054235.533132-9-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240130054235.533132-1-bhanuprakash.modem@intel.com>
References: <20240130054235.533132-1-bhanuprakash.modem@intel.com>
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
Cc: Sean Paul <seanpaul@chromium.org>
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

Signed-off-by: Sean Paul <seanpaul@chromium.org>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 2d58f2179..166602ac8 100644
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
@@ -553,6 +558,16 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 			     (range.min - 10), rate[0], result);
 	}
 
+	if (flags & TEST_MAXMIN) {
+		uint64_t maxmin_rates[] = {vtest_ns.max, vtest_ns.min};
+
+		result = flip_and_measure(data, output, pipe, maxmin_rates, 2, data->duration_ns);
+		igt_assert_f(result < 50,
+			     "Refresh rates (%u/%u Hz) %"PRIu64"ns/%"PRIu64"ns: Target VRR on threshold exceeded, result was %u%%\n",
+			     range.max, range.min, maxmin_rates[0], maxmin_rates[1], result);
+		return;
+	}
+
 	/*
 	 * If we request VRR on a non-VRR panel, it is unlikely to reject the
 	 * modeset. And the expected behavior is the same as disabling VRR on
@@ -802,6 +817,11 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
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

