Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C59BDCD37AC
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 19:09:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 802EC10F019;
	Wed, 13 May 2026 19:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R0KzQpUZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C47810F018
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 19:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778699332; x=1810235332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b1dqHPfTshU5rSHZeP0nUmqDynCgJ/bB1Ke5Jpb+TwQ=;
 b=R0KzQpUZN1D1s7C4v2YVFov6l4NZ18Z2a0bv9ojwsTGuQDUo2OAQV4CH
 AoJbvyB4htVM0GNFveEFbaaW+LLC7YswX9iv8828d73xCU3Zh+olX8CuS
 HNopCi70yu+dEIRWKX41gsLKZXI6CBXAG8nTzXBQSY1G7UeW1IbI8bZ74
 tsyksQDy4KDw36saTNq79FeJQc+TU70n9+UYX5nLu92smw2y9KX1QzToZ
 tVoZL7h4MM2QTzJlJtGRrOgw+qL2aAxDuVifnGgntbJRI8hpqsQvkXvcJ
 7zUcEKj7EiPMjZ+VaPi69iZtKRciZox65qmUb14LehJigFyNRIQ4kmPxY Q==;
X-CSE-ConnectionGUID: 16K5egB1QH6xzRQbdfdICg==
X-CSE-MsgGUID: dIKXu6VEQiqrbRs6yF+SlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79350492"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="79350492"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 12:08:52 -0700
X-CSE-ConnectionGUID: PA8FsgrPSrm8EIqQFgvKTA==
X-CSE-MsgGUID: yFfH4D7fTa+jAS4x3A+uFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="242511702"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 12:08:51 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Nemesa Garg <nemesa.garg@intel.com>
Subject: [PATCH i-g-t, v2 3/3] tests/intel/kms_sharpness_filter: Add
 invalid-filter-with-nearest-neighbor
Date: Thu, 14 May 2026 00:47:32 +0530
Message-Id: <20260513191732.2420879-4-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260513191732.2420879-1-swati2.sharma@intel.com>
References: <20260513191732.2420879-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add a negative subtest that sets the CRTC scaling filter to
"Nearest Neighbor" together with the content adaptive sharpness
filter. The driver must reject this combination since the pipe
scaler cannot run the sharpness filter and Nearest Neighbor
scaling at the same time.

Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Co-developed-by: Claude Opus 4.6
Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>
---
 tests/intel/kms_sharpness_filter.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index 4a7fd6c75..353a9a292 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -59,6 +59,11 @@
  * Description: Negative check for content adaptive sharpness filter
  *              when scaling mode is already enabled and attempt is made to enable
  *              sharpness filter.
+ *
+ * SUBTEST: invalid-filter-with-nearest-neighbor
+ * Description: Negative check for content adaptive sharpness filter when
+ *              the pipe scaling filter is set to Nearest Neighbor and an
+ *              attempt is made to enable the sharpness filter.
 */
 
 IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
@@ -94,6 +99,7 @@ enum test_type {
 	TEST_INVALID_FILTER_WITH_PLANE,
 	TEST_INVALID_PLANE_WITH_FILTER,
 	TEST_INVALID_FILTER_WITH_SCALING_MODE,
+	TEST_INVALID_FILTER_WITH_NEAREST_NEIGHBOR,
 };
 
 const int filter_strength_list[] = {
@@ -212,6 +218,14 @@ static const struct subtest_entry {
 		.filter_strength = DEFAULT_FILTER_STRENGTH,
 		.iter     = ITER_SCALING_MODE,
 	},
+	{
+		.name     = "invalid-filter-with-nearest-neighbor",
+		.describe = "Negative check for content adaptive sharpness filter "
+			    "when the pipe scaling filter is set to Nearest Neighbor "
+			    "and an attempt is made to enable the sharpness filter.",
+		.type     = TEST_INVALID_FILTER_WITH_NEAREST_NEIGHBOR,
+		.filter_strength = DEFAULT_FILTER_STRENGTH,
+	},
 };
 
 typedef struct {
@@ -394,6 +408,7 @@ static bool is_invalid_test(enum test_type type)
 	case TEST_INVALID_FILTER_WITH_PLANE:
 	case TEST_INVALID_PLANE_WITH_FILTER:
 	case TEST_INVALID_FILTER_WITH_SCALING_MODE:
+	case TEST_INVALID_FILTER_WITH_NEAREST_NEIGHBOR:
 		return true;
 	default:
 		return false;
@@ -435,6 +450,11 @@ static void test_sharpness_filter(data_t *data, enum test_type type)
 	if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE)
 		igt_require_f(has_scaling_mode(output), "No connecter scaling mode found on %s\n", output->name);
 
+	if (type == TEST_INVALID_FILTER_WITH_NEAREST_NEIGHBOR)
+		igt_require_f(igt_crtc_has_prop(data->crtc, IGT_CRTC_SCALING_FILTER),
+			      "No CRTC SCALING_FILTER property on pipe %s\n",
+			      igt_crtc_name(data->crtc));
+
 	if (needs_extra_planes(type))
 		set_planes(data, type);
 
@@ -452,6 +472,10 @@ static void test_sharpness_filter(data_t *data, enum test_type type)
 
 	set_filter_strength_on_pipe(data);
 
+	if (type == TEST_INVALID_FILTER_WITH_NEAREST_NEIGHBOR)
+		igt_crtc_set_prop_enum(data->crtc, IGT_CRTC_SCALING_FILTER,
+				       "Nearest Neighbor");
+
 	if (type == TEST_INVALID_FILTER_WITH_SCALING_MODE)
 		ret = igt_display_try_commit_atomic(&data->display, 0, NULL);
 	else
@@ -528,6 +552,7 @@ static const char * const test_type_names[] = {
 	[TEST_INVALID_FILTER_WITH_PLANE]        = "invalid-filter-with-plane",
 	[TEST_INVALID_PLANE_WITH_FILTER]        = "invalid-plane-with-filter",
 	[TEST_INVALID_FILTER_WITH_SCALING_MODE] = NULL,
+	[TEST_INVALID_FILTER_WITH_NEAREST_NEIGHBOR] = "invalid-filter-with-nearest-neighbor",
 };
 
 static void build_test_suffix(data_t *data, enum test_type type,
-- 
2.25.1

