Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22027C54E5D
	for <igt-dev@archiver.kernel.org>; Mon, 18 Mar 2024 23:02:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D9310E220;
	Mon, 18 Mar 2024 23:02:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="JsCsPZYz";
	dkim-atps=neutral
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7E210E220
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2024 23:02:56 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-6e6eb891db9so4542013b3a.3
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2024 16:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1710802974; x=1711407774;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=thiO8/eVssOA2xH3tsQtQVLmZAgvKlIBTNoXXDB8beI=;
 b=JsCsPZYzjff1nq0vfOIWkQxPngKdBzUtBrCIQacYKQBz3tYoqd3zYEwH30UuH4qlGE
 vOyfJcs4NspRx6GcNp49UitQW+RibonyW32mIIOV22eMeabYP/nvX15yrKdWGUwBRM7y
 bA+tW+QgaSwRtKcf9rCulmFvvhCHIOheV68hM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710802974; x=1711407774;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=thiO8/eVssOA2xH3tsQtQVLmZAgvKlIBTNoXXDB8beI=;
 b=COCWNs/ZEwaTNQsDzp/Cx3doGtnLEylFlZrfGclFIrv61IN1nNypR9/iCM0qVhrAnl
 mKfUK9KnlniNOuL9whoOIzjtDTvB0g2ruClg7GBfR6lyTqk7iqKzVICAfJ7HaohEoFnc
 m1UN2eXnKVKcTrGIurCd3Scv+8WdSEXJ/E87ndI7mwKKNekLhMNot5b7afctDTki36UQ
 oqHAUFAlGOnpEcB8SoS0mL4xv06Vw2iK73XDpMYKoK8zgJt/qldznxsqpajCMIkCb8Cm
 MLWafItodT4WPEu1MhFoXadtrxHymvYodhpQsPntga1nvmAQuVjwGw+P84jAgl+nCHrj
 sWbg==
X-Gm-Message-State: AOJu0Yzikvo7zaRvPpqUZMfAjimh7gs4hzGqtsj1+vZIKWkLoD++oJy7
 3XhRto8oizxEu+7SpjD3zJcyF1AmbO2YZOzq4rwcjd8RThdxWw2w2TxYpHu48joUvpxlHOsubEQ
 =
X-Google-Smtp-Source: AGHT+IEoj5DOTW219vwHKdKkMXEOq4EaS7h1sQwaFbuf9qusMMOCw4pt2RAW5pNPxE9NQ8H8M8MJdA==
X-Received: by 2002:a05:6a00:84c4:b0:6e7:2e3f:8465 with SMTP id
 gl4-20020a056a0084c400b006e72e3f8465mr2800979pfb.19.1710802974487; 
 Mon, 18 Mar 2024 16:02:54 -0700 (PDT)
Received: from navaremanasi.c.googlers.com.com
 (219.29.83.34.bc.googleusercontent.com. [34.83.29.219])
 by smtp.gmail.com with ESMTPSA id
 a15-20020aa7864f000000b006e5a6e83f8esm8415495pfo.134.2024.03.18.16.02.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 16:02:54 -0700 (PDT)
From: Manasi Navare <navaremanasi@chromium.org>
To: igt-dev@lists.freedesktop.org
Cc: Manasi Navare <navaremanasi@chromium.org>,
 Drew Davenport <ddavenport@chromium.org>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>
Subject: [PATCH] tests/kms_vrr: Add a subtest for seamless modeset to a
 virtual LRR mode
Date: Mon, 18 Mar 2024 23:02:41 +0000
Message-ID: <20240318230241.3758794-1-navaremanasi@chromium.org>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
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

Cc: Drew Davenport <ddavenport@chromium.org>
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Sean Paul <seanpaul@chromium.org>
Signed-off-by: Manasi Navare <navaremanasi@chromium.org>
---
 tests/kms_vrr.c | 68 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 67 insertions(+), 1 deletion(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 15c62b34b..79400aca9 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -70,6 +70,11 @@
  * Description: Oscillates between highest and lowest refresh each frame for
  *              manual flicker profiling
  *
+ * SUBTEST: seamless-virtual-rr-switch
+ * Description: Test to create a Virtual Mode in VRR range and switch to it
+ * without a full modeset.
+ * Functionality: LRR
+ *
  * SUBTEST: negative-basic
  * Description: Make sure that VRR should not be enabled on the Non-VRR panel.
  */
@@ -92,11 +97,13 @@ enum {
 	TEST_FASTSET = 1 << 6,
 	TEST_MAXMIN = 1 << 7,
 	TEST_NEGATIVE = 1 << 8,
+	TEST_SEAMLESS_VIRTUAL_RR = 1 << 9,
 };
 
 enum {
 	HIGH_RR_MODE,
 	LOW_RR_MODE,
+	VIRTUAL_RR_MODE,
 	RR_MODES_COUNT,
 };
 
@@ -214,6 +221,19 @@ low_rr_mode_with_same_res(igt_output_t *output, unsigned int vrr_min)
 	return mode;
 }
 
+static drmModeModeInfo
+virtual_rr_vrr_range_mode(igt_output_t *output, unsigned int virtual_refresh_rate)
+{
+	int i;
+	drmModeConnectorPtr connector = output->config.connector;
+	drmModeModeInfo mode = *igt_output_get_mode(output);
+	uint64_t clock_hz = mode.clock * 1000;
+
+	mode.vtotal = clock_hz / (mode.htotal * virtual_refresh_rate);
+	mode.vrefresh = virtual_refresh_rate;
+	return mode;
+}
+
 /* Read min and max vrr range from the connector debugfs. */
 static range_t
 get_vrr_range(data_t *data, igt_output_t *output)
@@ -641,6 +661,48 @@ test_seamless_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint3
 		     vrr ? "on" : "off", vrr ? "not reached" : "exceeded", result);
 }
 
+static void
+test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
+{
+	uint32_t result;
+	uint64_t rate;
+	unsigned int vrefresh;
+
+	igt_info("Use HIGH_RR Mode as default\n");
+	kmstest_dump_mode(&data->switch_modes[HIGH_RR_MODE]);
+
+	prepare_test(data, output, pipe);
+	rate = rate_from_refresh(data->switch_modes[HIGH_RR_MODE].vrefresh);
+
+	/*
+	 * Sink with DRR and VRR can be in downclock mode so
+	 * switch to highest refresh rate mode.
+	 */
+	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
+	igt_assert(igt_display_try_commit_atomic(&data->display, DRM_MODE_PAGE_FLIP_EVENT, NULL) == 0);
+
+	result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+	igt_assert_f(result > 75,
+		     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not reached, result was %u%%\n",
+		     data->switch_modes[HIGH_RR_MODE].vrefresh, rate, result);
+
+	/* Switch to Virtual RR */
+	for (vrefresh = data->range.min + 10; vrefresh < data->range.max; vrefresh += 10) {
+
+		data->switch_modes[VIRTUAL_RR_MODE] = virtual_rr_vrr_range_mode(output, vrefresh);
+		igt_info("Requesting Virtual Mode with Refresh Rate (%u Hz): \n", vrefresh);
+		kmstest_dump_mode(&data->switch_modes[VIRTUAL_RR_MODE]);
+		igt_output_override_mode(output, &data->switch_modes[VIRTUAL_RR_MODE]);
+		igt_assert(igt_display_try_commit_atomic(&data->display, 0, NULL) == 0);
+
+		rate = rate_from_refresh(vrefresh);
+		result = flip_and_measure(data, output, pipe, rate, TEST_DURATION_NS);
+		igt_assert_f(result > 75,
+			     "Refresh rate (%u Hz) %"PRIu64"ns: Target threshold not reached, result was %u%%\n",
+			     vrefresh, rate, result);
+	}
+}
+
 static void test_cleanup(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	if (vrr_capable(output))
@@ -686,7 +748,7 @@ static bool output_constraint(data_t *data, igt_output_t *output, uint32_t flags
 	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
 
 	/* Search for a low refresh rate mode. */
-	if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS)))
+	if (!(flags & (TEST_SEAMLESS_VRR | TEST_SEAMLESS_DRRS | TEST_SEAMLESS_VIRTUAL_RR)))
 		return true;
 
 	data->switch_modes[LOW_RR_MODE] = low_rr_mode_with_same_res(output, data->range.min);
@@ -841,6 +903,10 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
 			     "between flip timestamps converges to the requested rate");
 		igt_subtest_with_dynamic("flip-basic-fastset")
 			run_vrr_test(&data, test_basic, TEST_FASTSET);
+
+		igt_describe("Test to switch to any custom virtual mode in VRR range without modeset.");
+		igt_subtest_with_dynamic("seamless-virtual-rr-switch")
+			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
 	}
 
 	igt_fixture {
-- 
2.44.0.291.gc1ea87d7ee-goog

