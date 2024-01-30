Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608E7C47DDB
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jan 2024 05:49:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05CE2112DB4;
	Tue, 30 Jan 2024 05:49:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C13112DB0
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jan 2024 05:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706593758; x=1738129758;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FxVc9lLnOic6HJWrtBoeruwUnET2NqEtlmOdKrQk3P4=;
 b=kG/KT44xY5LN+lD/50cJAwVhCG43ietytr6VpARdQC09+eihl4MJ1Hei
 YNSktmmBkoGq5gAYCWMekjs3pxlVdORwesorEAuW5EqBC+esDTHY8bvYD
 LMId6bWFOxZYLXvMCZt72Yg9ys24WKVHcznv/Grf73ZSrR+xTE0jCIWoy
 /Hxi9GVu+Js+a5LDLEkin9ZioroSJ3LPSVZagyAWh3gZiNc796KyEiKKf
 QSi2Lv4O4il5j3GU3tXL3Zfn1+4TlqZ20DOlMkU9pNqVGx4i2ToeNO2ze
 wG6OnuP0RGlqHilbyLLPpIqgqAxv/QuLpQtUdZalKRstYKvZFCohCqAG3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="393609619"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; d="scan'208";a="393609619"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 21:49:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="3603137"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 21:49:17 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t v5 3/9] tests/kms_vrr: Allow test rate to be altered from the
 command line
Date: Tue, 30 Jan 2024 11:12:29 +0530
Message-ID: <20240130054235.533132-4-bhanuprakash.modem@intel.com>
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

Instead of always using the midpoint, introduce optional argument
--refresh-rate to allow callers to specify the target refresh rate for
the test.

v2:
- Add short opt to the main callsite (Bhanu)
v3: (Bhanu)
- Rebase
v4: (Bhanu)
- Not necessary to keep the refresh rate within the VRR range

Cc: Mark Yacoub <markyacoub@chromium.org>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 43 ++++++++++++++++++++++++++++++++++---------
 1 file changed, 34 insertions(+), 9 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 26e3f257b..a1ca7c967 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -102,7 +102,7 @@ typedef struct range {
 
 typedef struct vtest_ns {
 	uint64_t min;
-	uint64_t mid;
+	uint64_t rate_ns;
 	uint64_t max;
 } vtest_ns_t;
 
@@ -266,10 +266,15 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 	mode = *igt_output_get_mode(output);
 
 	data->vtest_ns.min = rate_from_refresh(data->range.min);
-	data->vtest_ns.mid = rate_from_refresh(
-				(data->range.min + data->range.max) / 2);
 	data->vtest_ns.max = rate_from_refresh(data->range.max);
 
+	/* If unspecified on the command line, default rate to the midpoint */
+	if (data->vtest_ns.rate_ns == 0) {
+		range_t *range = &data->range;
+		data->vtest_ns.rate_ns = rate_from_refresh(
+						(range->min + range->max) / 2);
+	}
+
 	/* Prepare resources */
 	igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
 			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
@@ -418,7 +423,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	prepare_test(data, output, pipe);
 	range = data->range;
 	vtest_ns = data->vtest_ns;
-	rate = vtest_ns.mid;
+	rate = vtest_ns.rate_ns;
 
 	igt_info("VRR Test execution on %s, PIPE_%s with VRR range: (%u-%u) Hz\n",
 		 output->name, kmstest_pipe_name(pipe), range.min, range.max);
@@ -471,7 +476,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	}
 
 	if (flags & ~TEST_NEGATIVE) {
-		rate = vtest_ns.mid;
+		rate = vtest_ns.rate_ns;
 		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
 		igt_assert_f(result > 75,
 			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
@@ -492,7 +497,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	 * a VRR capable panel.
 	 */
 	set_vrr_on_pipe(data, pipe, !(flags & TEST_FASTSET), (flags & TEST_NEGATIVE) ? true : false);
-	rate = vtest_ns.mid;
+	rate = vtest_ns.rate_ns;
 	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
 	igt_assert_f(result < 10,
 		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold exceeded, result was %u%%\n",
@@ -548,7 +553,7 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
 	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
 
-	rate = vtest_ns.mid;
+	rate = vtest_ns.rate_ns;
 	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
 	igt_assert_f(vrr ? (result > 75) : (result < 10),
 		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold %s, result was %u%%\n",
@@ -668,10 +673,30 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
 	}
 }
 
-igt_main
+static int opt_handler(int opt, int opt_index, void *_data)
 {
-	data_t data = {};
+	data_t *data = _data;
+
+	switch (opt) {
+	case 'r':
+		data->vtest_ns.rate_ns = rate_from_refresh(atoi(optarg));
+		break;
+	}
+	return IGT_OPT_HANDLER_SUCCESS;
+}
 
+static const struct option long_opts[] = {
+	{ .name = "refresh-rate", .has_arg = true, .val = 'r', },
+	{}
+};
+
+static const char help_str[] =
+	"  --refresh-rate <refresh-hz>\t\tThe refresh rate to flip at\n";
+
+static data_t data;
+
+igt_main_args("r:", long_opts, help_str, opt_handler, &data)
+{
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
 
-- 
2.43.0

