Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FE8C54E64
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 23:05:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ED3610EB69;
	Mon, 25 Mar 2024 23:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Hc9RDeEM";
	dkim-atps=neutral
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C5610EB69
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 23:05:24 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-6ea7f2d093aso3151406b3a.3
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 16:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1711407924; x=1712012724;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y60ATwASvO1dmkT5Iw76C/XgfM7PT+rsIm12u5u9RbI=;
 b=Hc9RDeEMxfti7slQGjLKXhirKEfoGUBs/AKOicAj9Ht1tmPxTKWIAG3oqxwt4kK090
 aw08BPlvCQ6GFY6I8cBlOccHDmJbObwlsP0sWBav3mwdRwEopXLiAhbYr7//NPNCLUmh
 3U5dHdaUvrvp2GpBFYx85pUAHO1wsvIy7O0s0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711407924; x=1712012724;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y60ATwASvO1dmkT5Iw76C/XgfM7PT+rsIm12u5u9RbI=;
 b=GJP+d36Vmyc12aCXTOXmlbgdfrL7PxUda/+mRC8EIi9I+YS+073vgL7ATTP6hRvKI2
 lJfNitBrg5KVEmvfdGuzGDDdshTxuNfqBfQwurJytmGVLsThI1Q77C3wOVtp7ug7+cbb
 nPgKl2NWfxxwlQ1BN95H0HJCMI75SAHbtwXajHtnUBd4e03XQSq/Crx9xlSP1d6UoN6s
 GUgJEWhMfSLaWTjpHaqqxkn6oIOH/NK79ot0lqV1VOHXkInI7BD11g+hYsq5fDrGdUkJ
 Pe5ByskrUhbnc/I9mOkZizh7tSLwETobgRxwtbtrw/Y1Gq0VAq6CTfdBTGqCS7sH+7T8
 MqzQ==
X-Gm-Message-State: AOJu0YynhaisO2pwgTcEWYI8ZeD7SXldCZN4gsTYky1EsRPn+m2kooG0
 xpOvQksLaYLG1N3M49k3PIdWzOo3qLvsZ/gdmo9KpR4DCnNDgrm9+GbJWJ2P8oTGF+HZINvsWG0
 =
X-Google-Smtp-Source: AGHT+IGHPC/hs/aIeGUiztclCBP/kI8KUWRdRJAj/FBOFRfXPPTDZgjK0CNeCmFgApTrC0QRHenruQ==
X-Received: by 2002:a05:6a00:178a:b0:6e9:2051:9dfe with SMTP id
 s10-20020a056a00178a00b006e920519dfemr8735424pfg.21.1711407923957; 
 Mon, 25 Mar 2024 16:05:23 -0700 (PDT)
Received: from navaremanasi.c.googlers.com.com
 (219.29.83.34.bc.googleusercontent.com. [34.83.29.219])
 by smtp.gmail.com with ESMTPSA id
 fi4-20020a056a00398400b006e5359e621csm4648030pfb.182.2024.03.25.16.05.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Mar 2024 16:05:23 -0700 (PDT)
From: Manasi Navare <navaremanasi@chromium.org>
To: igt-dev@lists.freedesktop.org
Cc: Manasi Navare <navaremanasi@chromium.org>,
 Drew Davenport <ddavenport@chromium.org>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>
Subject: [PATCH v5] tests/kms_vrr: Add a subtest for seamless modeset to a
 virtual LRR mode
Date: Mon, 25 Mar 2024 23:05:19 +0000
Message-ID: <20240325230519.1787483-1-navaremanasi@chromium.org>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
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

This subtest validates LRR fastset functionality by testing seamless switching
without full modeset to any of the virtual LRR mode within VRR range.
Here we start from highest refresh rate mode and then switch to virtual LRR
modes in the steps of 10Hz within the VRR range.

This is used to test the LRR fastset functionality of the driver.

v4:
- Change the test name to align with drrs/vrr tests (Bhanu)
- Fix some build warnings due to rebase
- Use a local virtual_mode variable

v3:
- Fix build error due to rebase (Manasi)

Cc: Drew Davenport <ddavenport@chromium.org>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Manasi Navare <navaremanasi@chromium.org>
---
 tests/kms_vrr.c | 72 ++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 68 insertions(+), 4 deletions(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 15c62b34b..d838647bd 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -66,6 +66,11 @@
  * Description: Test to switch RR seamlessly without modeset.
  * Functionality: adaptive_sync, drrs
  *
+ * SUBTEST: seamless-rr-switch-virtual
+ * Description: Test to create a Virtual Mode in VRR range and switch to it
+ * 		without a full modeset.
+ * Functionality: LRR
+ *
  * SUBTEST: max-min
  * Description: Oscillates between highest and lowest refresh each frame for
  *              manual flicker profiling
@@ -89,9 +94,10 @@ enum {
 	TEST_FLIPLINE = 1 << 3,
 	TEST_SEAMLESS_VRR = 1 << 4,
 	TEST_SEAMLESS_DRRS = 1 << 5,
-	TEST_FASTSET = 1 << 6,
-	TEST_MAXMIN = 1 << 7,
-	TEST_NEGATIVE = 1 << 8,
+	TEST_SEAMLESS_VIRTUAL_RR = 1 << 6,
+	TEST_FASTSET = 1 << 7,
+	TEST_MAXMIN = 1 << 8,
+	TEST_NEGATIVE = 1 << 9,
 };
 
 enum {
@@ -214,6 +220,18 @@ low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
 	return mode;
 }
 
+static drmModeModeInfo
+virtual_rr_vrr_range_mode(igt_output_t *output, unsigned int virtual_refresh_rate)
+{
+	drmModeModeInfo mode = *igt_output_get_mode(output);
+	uint64_t clock_hz = mode.clock * 1000;
+
+	mode.vtotal = clock_hz / (mode.htotal * virtual_refresh_rate);
+	mode.vrefresh = virtual_refresh_rate;
+
+	return mode;
+}
+
 /* Read min and max vrr range from the connector debugfs. */
 static range_t
 get_vrr_range(data_t *data, igt_output_t *output)
@@ -641,6 +659,48 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 		     vrr ? "on" : "off", vrr ? "not reached" : "exceeded", result);
 }
 
+static void
+test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
+{
+	uint32_t result;
+	unsigned int vrefresh;
+	uint64_t rate[] = {0};
+
+	igt_info("Use HIGH_RR Mode as default\n");
+	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
+
+	prepare_test(data, output, pipe);
+	rate[0] = rate_from_refresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
+
+	/*
+	 * Sink with DRR and VRR can be in downclock mode so
+	 * switch to highest refresh rate mode.
+	 */
+	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
+	igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL) == 0);
+
+	result = flip_and_measure(data, output, pipe, rate, 1, TEST_DURATION_NS);
+	igt_assert_f(result > 75,
+		     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not reached, result was %u%%\n",
+		     data->switch_modes[HIGH_RR_MODE].vrefresh, rate[0], result);
+
+	/* Switch to Virtual RR */
+	for (vrefresh = data->range.min + 10; vrefresh < data->range.max; vrefresh += 10) {
+		drmModeModeInfo virtual_mode = virtual_rr_vrr_range_mode(output, vrefresh);
+		igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz): \n", vrefresh);
+		kmstest_dump_mode(&virtual_mode);
+
+		igt_output_override_mode(output, &virtual_mode);
+		igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
+
+		rate[0] = rate_from_refresh(vrefresh);
+		result = flip_and_measure(data, output, pipe, rate[0], 1, TEST_DURATION_NS);
+		igt_assert_f(result > 75,
+			     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not reached, result was %u%%\n",
+			     vrefresh, rate[0], result);
+	}
+}
+
 static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	if (vrr_capable(output))
@@ -686,7 +746,7 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
 
 	/* Search for a low refresh rate mode. */
-	if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)))
+	if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | TEST_SEAMLESS_VIRTUAL_RR)))
 		return true;
 
 	data->switch_modes[LOW_RR_MODE] = low_rr_mode_with_same_res(output, data->range.min);
@@ -841,6 +901,10 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 			     "between flip timestamps converges to the requested rate");
 		igt_subtest_with_dynamic("flip-basic-fastset")
 			run_vrr_test(&data, test_basic, TEST_FASTSET);
+
+		igt_describe("Test to switch to any custom virtual mode in VRR range without modeset.");
+		igt_subtest_with_dynamic("seamless-rr-switch-virtual")
+			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
 	}
 
 	igt_fixture {
-- 
2.44.0.396.g6e790dbe36-goog

