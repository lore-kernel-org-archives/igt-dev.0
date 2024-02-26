Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE22C5478C
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 07:26:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DCF710EEE3;
	Mon, 26 Feb 2024 07:26:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a3IvlyVZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC7C410EEE1
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 07:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708932399; x=1740468399;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=6/yTHUTFw6B5izbKf0Gm4idmBGJnbakGuC8WlWX9Qy8=;
 b=a3IvlyVZ3XmWYpXvmvhvYVwVZ9ayvrepXhppwbQoIkgSUxUTJuPUFw0H
 Nhh73KXlAGqGgm1uNHPP9goNPuaWig9e8fG9gtI7ZRSox2PoGlIguUaAN
 9AgtvPS9y0GMilhazLQiVsqFLND3y+CHqGmw6iegoqfZIzhUcwkJB+J0I
 iq1aNKmbPK0+2YJzY4EntK8ppsXCRHekf6+KU1sgrCP5DmvNY+3zfjMEf
 6R68xO2gkR7oAQBGg3NKpyB0OnPnEx5AIGSI1p3nh6zmPm8jtAGLWT/FI
 VjfgQl5MeXG9nq42jtEnrqwNhQjQtrq16KCQWOCLUWMUAwRQUSS08w3TJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="6147566"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6147566"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2024 23:26:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="6923241"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2024 23:26:38 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [i-g-t v6 4/9] tests/kms_vrr: Allow test duration to be specified
 from the command line
Date: Mon, 26 Feb 2024 12:50:30 +0530
Message-ID: <20240226072035.2620383-5-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240226072035.2620383-1-bhanuprakash.modem@intel.com>
References: <20240226072035.2620383-1-bhanuprakash.modem@intel.com>
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

Using --duration argument, otherwise use default.

v2:
- Add short opt to the main callsite (Bhanu)
v3: (Bhanu)
- Rebase
- Nit: 's/d:r:/dr:/'

Cc: Mark Yacoub <markyacoub@chromium.org>
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_vrr.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index a1ca7c967..86bc144ed 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -114,6 +114,7 @@ typedef struct data {
 	range_t range;
 	drmModeModeInfo switch_modes[RR_MODES_COUNT];
 	vtest_ns_t vtest_ns;
+	uint64_t duration_ns;
 } data_t;
 
 typedef void (*test_t)(data_t*, enum pipe, igt_output_t*, uint32_t);
@@ -275,6 +276,9 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
 						(range->min + range->max) / 2);
 	}
 
+	if (data->duration_ns == 0)
+		data->duration_ns = TEST_DURATION_NS;
+
 	/* Prepare resources */
 	igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
 			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
@@ -469,7 +473,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	 */
 	if (flags & TEST_FLIPLINE) {
 		rate = rate_from_refresh(range.max + 5);
-		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+		result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
 		igt_assert_f(result > 75,
 			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
 			     (range.max + 5), rate, result);
@@ -477,7 +481,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 
 	if (flags & ~TEST_NEGATIVE) {
 		rate = vtest_ns.rate_ns;
-		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+		result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
 		igt_assert_f(result > 75,
 			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold not reached, result was %u%%\n",
 			     ((range.max + range.min) / 2), rate, result);
@@ -485,7 +489,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 
 	if (flags & TEST_FLIPLINE) {
 		rate = rate_from_refresh(range.min - 10);
-		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+		result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
 		igt_assert_f(result < 50,
 			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on threshold exceeded, result was %u%%\n",
 			     (range.min - 10), rate, result);
@@ -498,7 +502,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
 	 */
 	set_vrr_on_pipe(data, pipe, !(flags & TEST_FASTSET), (flags & TEST_NEGATIVE) ? true : false);
 	rate = vtest_ns.rate_ns;
-	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+	result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
 	igt_assert_f(result < 10,
 		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold exceeded, result was %u%%\n",
 		     ((range.max + range.min) / 2), rate, (flags & TEST_NEGATIVE)? "on" : "off", result);
@@ -530,7 +534,7 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 	}
 
 	rate = vtest_ns.max;
-	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+	result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
 	igt_assert_f(result > 75,
 		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold not reached, result was %u%%\n",
 		     data->range.max, rate, vrr ? "on" : "off", result);
@@ -542,7 +546,7 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
 
 	rate = vtest_ns.min;
-	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+	result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
 	igt_assert_f(result > 75,
 		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold not reached, result was %u%%\n",
 		     data->range.min, rate, vrr ? "on" : "off", result);
@@ -554,7 +558,7 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 	igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
 
 	rate = vtest_ns.rate_ns;
-	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+	result = flip_and_measure(data, output, pipe, rate, data->duration_ns);
 	igt_assert_f(vrr ? (result > 75) : (result < 10),
 		     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR %s threshold %s, result was %u%%\n",
 		     ((data->range.max + data->range.min) / 2), rate,
@@ -678,6 +682,9 @@ static int opt_handler(int opt, int opt_index, void *_data)
 	data_t *data = _data;
 
 	switch (opt) {
+	case 'd':
+		data->duration_ns = atoi(optarg) * NSECS_PER_SEC;
+		break;
 	case 'r':
 		data->vtest_ns.rate_ns = rate_from_refresh(atoi(optarg));
 		break;
@@ -686,16 +693,18 @@ static int opt_handler(int opt, int opt_index, void *_data)
 }
 
 static const struct option long_opts[] = {
+	{ .name = "duration", .has_arg = true, .val = 'd', },
 	{ .name = "refresh-rate", .has_arg = true, .val = 'r', },
 	{}
 };
 
 static const char help_str[] =
+	"  --duration <duration-seconds>\t\tHow long to run the test for\n"
 	"  --refresh-rate <refresh-hz>\t\tThe refresh rate to flip at\n";
 
 static data_t data;
 
-igt_main_args("r:", long_opts, help_str, opt_handler, &data)
+igt_main_args("dr:", long_opts, help_str, opt_handler, &data)
 {
 	igt_fixture {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
-- 
2.43.0

