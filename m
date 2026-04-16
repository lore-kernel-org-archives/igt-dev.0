Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908ABF8D75F
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 15:55:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4671610E8DB;
	Thu, 16 Apr 2026 15:55:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JMU2VYmZ";
	dkim-atps=neutral
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com
 [74.125.82.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA2910E8DB
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 15:55:00 +0000 (UTC)
Received: by mail-dy1-f173.google.com with SMTP id
 5a478bee46e88-2dec803f9f0so426766eec.0
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 08:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776354899; x=1776959699; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SEyhe3uBbJS+h3rAS86UUoTeYvamML66+TmHzDkabuU=;
 b=JMU2VYmZtqw5hdydsgA0PtwiFGnOcSIOT4bO/ZXylmTY3QROrawOzajW1iUIYi2e0H
 LFKD5CrLBbsWK03pGfpVQUJQU6CJcIBLj0c1bcg45MK59IKsJISwfnrVj2Fh6No03MFs
 QTuxAC4lwuNQ+WJrPJdQrIXWsY5cHxnSlQAgWBKmANtPkAYc5+HKfPVFS1L2/Gr4wm47
 Rau5Gl73sZ+jJKCyJOHc+ARxVVarokUepr2KYRWu5kmECGWUDp9/zKDO4noBmNReMCL/
 kfbUxpajKZ3BaJT6eGT8XBAi9W/c14gs42pl7fdQ+Mr/dar0uTGmA/iSfkYTUhiSKxgH
 9BOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776354899; x=1776959699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=SEyhe3uBbJS+h3rAS86UUoTeYvamML66+TmHzDkabuU=;
 b=pPw0g2DtcoqAKVebgQ73EfQP9fUg0ekJC8GBxVOZ+xyMvhQzztYF29wbsCG9xx3qvQ
 lhmbRLa2LH194u+g+1pxh+cmfZd85KgrAlQgxkFNtQcvZbs1SqVQd6aYxtPQDjHu0Z+n
 eHXqdEDlOkiF6hA01DhFZG60+3v/589w5XWnE9FgI5irTVTZGFYZ3MgcqgSi44Kf27W3
 3OqOoUMgOc5BpFCFZuyIj9FfZFEcTnBMnftOCkf+U8DZ79R2NGP9MPQwK350cc/QdDqs
 4NyXNZ5RNO1A9McRJiaQ4FC/xgfqkNbI3BP4jDAyTone9ykyxurxFk1tDS/ioMmTYvsP
 HNJQ==
X-Gm-Message-State: AOJu0YwRsmxj3svVQdD9Aw9BSaulIOid3nRmjyPGkOhCv0U1LW0PBaKx
 nuaxTnnYXErZskE/dOJP8nbMpVMALyDGaZuNBJh6f6N4KUTLCG78cYc7rmDYXinb5LM=
X-Gm-Gg: AeBDiesDl9ufwWLWusodCGczlrIvtKvqQ6NDTmQTRhEIRL96CaHXqBeJKp42GwTDoMf
 EKv/QXKuAcMv9izn6EJeKcRWyY6lWX4fDb6qsPyy1nlLY6oZ4tAfPdHxjEqek3TrYHsmzh3y7uG
 pWNpsFsevK2z9FsMJ/GmHAFtrEtMCepptPTQDnbDYfYEwg1vgL4yCiVWrJXYCuorGinlu8e2Nfh
 4WTpbhq28J2whbmXvQlRJfbVF9j+4t182zN/IqaqX9HnIoKMfV7z+wRO5j4vxvDXjnyCq6s/SI7
 uKWJq49jtdSK3Q/cNSLVLPzWgBeg7hz/NllznoMDcWSGPiU/WT6fXH7oGmYdztDqJ49G6G3BuDJ
 2aqF4ST9efLx/q2hd+dYQLCVEtEELOxxAW4gDVFKTmqvre0oQreEME6WEonxsfQj7b/7WUWADIO
 xNSfgxNo7AVp+YMFQirljpZ9AA3BV29kSVlFn3I2UhS1WxPhJUYnWQZsH1DthRMiKXjN2a5BkN4
 NdpSK9TJg==
X-Received: by 2002:a05:7301:1e95:b0:2c9:7a87:e84d with SMTP id
 5a478bee46e88-2e21cc0e9abmr887805eec.10.1776354899220; 
 Thu, 16 Apr 2026 08:54:59 -0700 (PDT)
Received: from localhost ([192.55.55.44]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2de8eb84511sm7790114eec.17.2026.04.16.08.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2026 08:54:58 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 3/4] tests/intel/kms_sharpness_filter: restructure
 igt_main
Date: Thu, 16 Apr 2026 18:54:20 +0300
Message-ID: <20260416155421.2000-4-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260416155421.2000-1-juhapekka.heikkila@gmail.com>
References: <20260416155421.2000-1-juhapekka.heikkila@gmail.com>
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

collect tests into list and call them through there

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 tests/intel/kms_sharpness_filter.c | 315 +++++++++++++++++------------
 1 file changed, 182 insertions(+), 133 deletions(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index b1c80eecd..98eb671d1 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -19,7 +19,7 @@
  * Description: Verify basic content adaptive sharpness filter.
  *
  * SUBTEST: filter-strength
- * Description: Verify that varying strength (0-255), affects the degree of sharpeness applied.
+ * Description: Verify that varying strength (0-255), affects the degree of sharpness applied.
  *
  * SUBTEST: filter-modifiers
  * Description: Verify content adaptive sharpness filter with varying modifiers.
@@ -88,6 +88,7 @@ IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
 #define MAX_PIXELS_FOR_3_TAP_FILTER	(1920 * 1080)
 #define MAX_PIXELS_FOR_5_TAP_FILTER	(3840 * 2160)
 #define NROUNDS				10
+#define DEFAULT_FILTER_STRENGTH		-1
 
 enum test_type {
 	TEST_FILTER_BASIC,
@@ -142,6 +143,131 @@ static const uint32_t scaling_modes[] = {
 	DRM_MODE_SCALE_ASPECT,
 };
 
+enum subtest_iter {
+	ITER_NONE,
+	ITER_STRENGTH,
+	ITER_MODIFIER,
+	ITER_ROTATION,
+	ITER_FORMAT,
+	ITER_SCALING_MODE,
+};
+
+static const struct subtest_entry {
+	const char *name;
+	const char *describe;
+	enum test_type type;
+	int filter_strength;
+	uint32_t format;
+	enum subtest_iter iter;
+} subtests[] = {
+	{
+		.name     = "filter-basic",
+		.describe = "Verify basic content adaptive sharpness filter.",
+		.type     = TEST_FILTER_BASIC,
+		.filter_strength = DEFAULT_FILTER_STRENGTH,
+	},
+	{
+		.name     = "filter-strength",
+		.describe = "Verify that varying strength (0-255) affects the degree of sharpness applied.",
+		.type     = TEST_FILTER_STRENGTH,
+		.filter_strength = DEFAULT_FILTER_STRENGTH,
+		.iter     = ITER_STRENGTH,
+	},
+	{
+		.name     = "filter-modifiers",
+		.describe = "Verify content adaptive sharpness filter with varying modifiers.",
+		.type     = TEST_FILTER_MODIFIERS,
+		.filter_strength = DEFAULT_FILTER_STRENGTH,
+		.iter     = ITER_MODIFIER,
+	},
+	{
+		.name     = "filter-rotations",
+		.describe = "Verify content adaptive sharpness filter with varying rotations.",
+		.type     = TEST_FILTER_ROTATION,
+		.filter_strength = DEFAULT_FILTER_STRENGTH,
+		.iter     = ITER_ROTATION,
+	},
+	{
+		.name     = "filter-formats",
+		.describe = "Verify content adaptive sharpness filter with varying formats.",
+		.type     = TEST_FILTER_FORMATS,
+		.filter_strength = DEFAULT_FILTER_STRENGTH,
+		.iter     = ITER_FORMAT,
+	},
+	{
+		.name     = "filter-toggle",
+		.describe = "Verify toggling between enabling and disabling content adaptive sharpness filter.",
+		.type     = TEST_FILTER_TOGGLE,
+		.filter_strength = MAX_FILTER_STRENGTH,
+	},
+	{
+		.name     = "filter-tap",
+		.describe = "Verify content adaptive sharpness filter with resolution change; "
+			    "resolution change will lead to selection of distinct taps.",
+		.type     = TEST_FILTER_TAP,
+		.filter_strength = DEFAULT_FILTER_STRENGTH,
+	},
+	{
+		.name     = "filter-dpms",
+		.describe = "Verify content adaptive sharpness filter with DPMS.",
+		.type     = TEST_FILTER_DPMS,
+		.filter_strength = DEFAULT_FILTER_STRENGTH,
+	},
+	{
+		.name     = "filter-suspend",
+		.describe = "Verify content adaptive sharpness filter with suspend.",
+		.type     = TEST_FILTER_SUSPEND,
+		.filter_strength = DEFAULT_FILTER_STRENGTH,
+	},
+	{
+		.name     = "filter-scaler-upscale",
+		.describe = "Verify content adaptive sharpness filter with 1 plane scaler enabled during upscaling.",
+		.type     = TEST_FILTER_UPSCALE,
+		.filter_strength = DEFAULT_FILTER_STRENGTH,
+	},
+	{
+		.name     = "filter-scaler-downscale",
+		.describe = "Verify content adaptive sharpness filter with 1 plane scaler enabled during downscaling.",
+		.type     = TEST_FILTER_DOWNSCALE,
+		.filter_strength = DEFAULT_FILTER_STRENGTH,
+	},
+	{
+		.name     = "invalid-filter-with-scaler",
+		.describe = "Negative check for content adaptive sharpness filter "
+			    "when 2 plane scalers have already been enabled and "
+			    "attempt is made to enable sharpness filter.",
+		.type     = TEST_INVALID_FILTER_WITH_SCALER,
+		.filter_strength = DEFAULT_FILTER_STRENGTH,
+	},
+	{
+		.name     = "invalid-filter-with-plane",
+		.describe = "Negative check for content adaptive sharpness filter "
+			    "when 2 NV12 planes have already been enabled and "
+			    "attempt is made to enable the sharpness filter.",
+		.type     = TEST_INVALID_FILTER_WITH_PLANE,
+		.filter_strength = DEFAULT_FILTER_STRENGTH,
+		.format   = DRM_FORMAT_NV12,
+	},
+	{
+		.name     = "invalid-plane-with-filter",
+		.describe = "Negative check for content adaptive sharpness filter "
+			    "when 1 NV12 plane and sharpness filter have already been enabled "
+			    "and attempt is made to enable the second NV12 plane.",
+		.type     = TEST_INVALID_PLANE_WITH_FILTER,
+		.filter_strength = DEFAULT_FILTER_STRENGTH,
+		.format   = DRM_FORMAT_NV12,
+	},
+	{
+		.name     = "invalid-filter-with-scaling-mode",
+		.describe = "Negative check for content adaptive sharpness filter "
+			    "when scaling mode is already enabled and attempt is made "
+			    "to enable sharpness filter.",
+		.type     = TEST_INVALID_FILTER_WITH_SCALING_MODE,
+		.filter_strength = DEFAULT_FILTER_STRENGTH,
+		.iter     = ITER_SCALING_MODE,
+	},
+};
+
 typedef struct {
 	int drm_fd;
 	bool limited;
@@ -587,6 +713,48 @@ static void set_data_defaults(data_t *data)
 	data->filter_strength = MID_FILTER_STRENGTH;
 }
 
+static int iter_count(enum subtest_iter iter)
+{
+	switch (iter) {
+	case ITER_STRENGTH:
+		return ARRAY_SIZE(filter_strength_list);
+	case ITER_MODIFIER:
+		return ARRAY_SIZE(modifiers);
+	case ITER_ROTATION:
+		return ARRAY_SIZE(rotations);
+	case ITER_FORMAT:
+		return ARRAY_SIZE(formats);
+	case ITER_SCALING_MODE:
+		return ARRAY_SIZE(scaling_modes);
+	default:
+		return 1;
+	}
+}
+
+static void apply_iter_param(data_t *data, const struct subtest_entry *st, int idx)
+{
+	switch (st->iter) {
+	case ITER_STRENGTH:
+		data->filter_strength = filter_strength_list[idx];
+		break;
+	case ITER_MODIFIER:
+		data->modifier = modifiers[idx].modifier;
+		data->modifier_name = modifiers[idx].name;
+		break;
+	case ITER_ROTATION:
+		data->rotation = rotations[idx];
+		break;
+	case ITER_FORMAT:
+		data->format = formats[idx];
+		break;
+	case ITER_SCALING_MODE:
+		data->scaling_mode = scaling_modes[idx];
+		break;
+	default:
+		break;
+	}
+}
+
 static int opt_handler(int opt, int opt_index, void *_data)
 {
 	data_t *data = _data;
@@ -619,142 +787,23 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
 		igt_display_require_output(&data.display);
 	}
 
-	igt_describe("Verify basic content adaptive sharpness filter.");
-	igt_subtest_with_dynamic("filter-basic") {
-		set_data_defaults(&data);
-		run_sharpness_filter_test(&data, TEST_FILTER_BASIC);
-	}
-
-	igt_describe("Verify that varying strength(0-255), affects "
-		     "the degree of sharpeness applied.");
-	igt_subtest_with_dynamic("filter-strength") {
-		set_data_defaults(&data);
-
-		for (int i = 0; i < ARRAY_SIZE(filter_strength_list); i++) {
-			data.filter_strength = filter_strength_list[i];
-
-			run_sharpness_filter_test(&data, TEST_FILTER_STRENGTH);
-		}
-	}
-
-	igt_describe("Verify content adaptive sharpness filter with "
-		     "varying modifiers.");
-	igt_subtest_with_dynamic("filter-modifiers") {
-		set_data_defaults(&data);
-
-		for (int i = 0; i < ARRAY_SIZE(modifiers); i++) {
-			data.modifier = modifiers[i].modifier;
-			data.modifier_name = modifiers[i].name;
-
-			run_sharpness_filter_test(&data, TEST_FILTER_MODIFIERS);
-		}
-	}
-
-	igt_describe("Verify content adaptive sharpness filter with "
-		     "varying rotations.");
-	igt_subtest_with_dynamic("filter-rotations") {
-		set_data_defaults(&data);
-
-		for (int i = 0; i < ARRAY_SIZE(rotations); i++) {
-			data.rotation = rotations[i];
-
-			run_sharpness_filter_test(&data, TEST_FILTER_ROTATION);
-		}
-	}
-
-	igt_describe("Verify content adaptive sharpness filter with "
-		     "varying formats.");
-	igt_subtest_with_dynamic("filter-formats") {
-		set_data_defaults(&data);
-
-		for (int i = 0; i < ARRAY_SIZE(formats); i++) {
-			data.format = formats[i];
-
-			run_sharpness_filter_test(&data, TEST_FILTER_FORMATS);
-		}
-	}
-
-	igt_describe("Verify toggling between enabling and disabling "
-		     "content adaptive sharpness filter.");
-	igt_subtest_with_dynamic("filter-toggle") {
-		set_data_defaults(&data);
-		data.filter_strength = MAX_FILTER_STRENGTH;
-		run_sharpness_filter_test(&data, TEST_FILTER_TOGGLE);
-	}
-
-	igt_describe("Verify that following a resolution change, "
-		     "distict taps are selected.");
-	igt_subtest_with_dynamic("filter-tap") {
-		set_data_defaults(&data);
-		run_sharpness_filter_test(&data, TEST_FILTER_TAP);
-	}
-
-	igt_describe("Verify content adaptive sharpness filter "
-		     "with DPMS.");
-	igt_subtest_with_dynamic("filter-dpms") {
-		set_data_defaults(&data);
-		run_sharpness_filter_test(&data, TEST_FILTER_DPMS);
-	}
-
-	igt_describe("Verify content adaptive sharpness filter "
-		     "with suspend.");
-	igt_subtest_with_dynamic("filter-suspend") {
-		set_data_defaults(&data);
-		run_sharpness_filter_test(&data, TEST_FILTER_SUSPEND);
-	}
-
-	igt_describe("Verify content adaptive sharpness filter "
-		     "with 1 plane scaler enabled.");
-	igt_subtest_with_dynamic("filter-scaler-upscale") {
-		set_data_defaults(&data);
-		run_sharpness_filter_test(&data, TEST_FILTER_UPSCALE);
-	}
-
-	igt_describe("Verify content adaptive sharpness filter "
-		     "with 1 plane scaler enabled.");
-	igt_subtest_with_dynamic("filter-scaler-downscale") {
-		set_data_defaults(&data);
-		run_sharpness_filter_test(&data, TEST_FILTER_DOWNSCALE);
-	}
-
-	igt_describe("Negative check for content adaptive sharpness filter "
-		     "when 2 plane scalers have already been enabled and "
-		     "attempt is made to enable sharpness filter.");
-	igt_subtest_with_dynamic("invalid-filter-with-scaler") {
-		set_data_defaults(&data);
-		run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_SCALER);
-	}
-
-	igt_describe("Negative check for content adaptive sharpness filter "
-		     "when 2 NV12 planes have already been enabled and attempt is "
-		     "made to enable the sharpness filter.");
-	igt_subtest_with_dynamic("invalid-filter-with-plane") {
-		set_data_defaults(&data);
-		data.format = DRM_FORMAT_NV12;
-
-		run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_PLANE);
-	}
-
-	igt_describe("Negative check for content adaptive sharpness filter "
-		     "when 1 NV12 plane and sharpness filter have already been enabled "
-		     "and attempt is made to enable the second NV12 plane.");
-	igt_subtest_with_dynamic("invalid-plane-with-filter") {
-		set_data_defaults(&data);
-		data.format = DRM_FORMAT_NV12;
+	for (int s = 0; s < ARRAY_SIZE(subtests); s++) {
+		const struct subtest_entry *p = &subtests[s];
 
-		run_sharpness_filter_test(&data, TEST_INVALID_PLANE_WITH_FILTER);
-	}
+		igt_describe(p->describe);
+		igt_subtest_with_dynamic(p->name) {
+			set_data_defaults(&data);
 
-	igt_describe("Negative check for content adaptive sharpness filter "
-		     "when scaling mode is already enabled and attempt is made "
-		     "to enable sharpness filter.");
-	igt_subtest_with_dynamic("invalid-filter-with-scaling-mode") {
-		set_data_defaults(&data);
+			if (p->filter_strength != DEFAULT_FILTER_STRENGTH)
+				data.filter_strength = p->filter_strength;
 
-		for (int k = 0; k < ARRAY_SIZE(scaling_modes); k++) {
-			data.scaling_mode = scaling_modes[k];
+			if (p->format != 0)
+				data.format = p->format;
 
-			run_sharpness_filter_test(&data, TEST_INVALID_FILTER_WITH_SCALING_MODE);
+			for (int i = 0; i < iter_count(p->iter); i++) {
+				apply_iter_param(&data, p, i);
+				run_sharpness_filter_test(&data, p->type);
+			}
 		}
 	}
 
-- 
2.43.0

