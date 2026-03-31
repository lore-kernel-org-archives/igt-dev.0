Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 720A310F92EF
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 19:05:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A88510E9D5;
	Tue, 31 Mar 2026 19:05:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RgHIJqKZ";
	dkim-atps=neutral
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com
 [74.125.82.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C21510EA08
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 19:04:48 +0000 (UTC)
Received: by mail-dy1-f180.google.com with SMTP id
 5a478bee46e88-2c1632faeb9so10893304eec.0
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 12:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774983888; x=1775588688; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7QyG/aBq07IgE00USjVZ4WPz0ff+71jIay3I9dcyirc=;
 b=RgHIJqKZHAWuAukYF21rrJyQb2wOPBp0lz44UfEtXg6IuoqAsbDK2BQ+lIxOiOet9+
 ZsX1d7bwJFYkrMP3kwU+TrGTc/MmV/2FnUOwGcnoRQ+oH7opJS6SlxFjOr6OVO9Ix/dt
 Tew/stvZ2or6DV69W3bvkS3GYAQe4KaYHUECA1099Iyc/JgxU7eoVEMK+mge2VjeiGsn
 XqYY7x/nM+HPn3MqiN5hqmoMzshi3La90h2lLwoleNhAYET419cAnPGBcptLc+Wa5BC8
 nSbri4uWsRsn61feVNJnF6NAKrH5U1uaDA+h40skMkCvBwAiN+PkeTw4GqM6C45S75QN
 GJBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774983888; x=1775588688;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7QyG/aBq07IgE00USjVZ4WPz0ff+71jIay3I9dcyirc=;
 b=FREsshOvEeXXGAfVY6redr4RIuoj+CIXRxg9e3+rRu0h0MD/hyK497V4VVa2cYr5wo
 yYIDgzEwf30W8viySXRCFfoWlmUaScU09nBZFvn2nwBuNETBdVtAd9gdi1ZCzX6ydiGW
 vpSw3I8wlorGQrKkiZaQ0KCsmzI31wITBDtwk4Y7iPzehAkI5IhQMs8ta/jx4dW8lJ7Q
 Lg4a19+c55RIr8qcqLqkyoYbbEocMBtIVE92RSZ10OYrh6VWK+F3bMzWPy5BGtpTIV2D
 tKchBQgIJTwiPKl1my/SETk3NNi5WSK5CRw+qXbbVUMHisVgbYAhj9RLU+1BbPSwEWeU
 3gzA==
X-Gm-Message-State: AOJu0YzbjfIqFJw6Hx8UeCms1gZSB3m/87uL14AszLLzo1uBkQoL38M1
 AZCN0a/S+7nmZIREFjTi7CIcgRxHqZyIlxpcEpytNlPTRowlPxhTz8Fcz/pFF519
X-Gm-Gg: ATEYQzx8L/PehaIOMm0FLTSB4rC3t4n9p1PZm7op6p9GxEI5n9Z3RIqyx3jwJpqxP5S
 6yRcdYgCIXSpBs98UYBG10JGjZAt1bKhvklq/CkcwsqFk7244rLsB+gJ3lGbvmLhTd4yvoZkYq3
 c+fEkWh2sMaa8goPdNMcbed6qJXSm1c1EhDvVbm1bsk/BCTr0BS5qYn6vG0wG+r2pqkQH4CzWhV
 wjilYeBKqIbGlvxxfdlNQTwtk9YJ8i++1tbhcc36P3zf0LtNu2yq/hfFrRBdE0HiaWrs9kQoBPj
 2xs4OJ7sPQIg3XNidbPw6mW8uceIXuab62jDi/HN6sSH/y2EBMJrsQEylKLTI4w9kX/Y7cHmv6H
 qG5QPacrfyuI7dr6xgnCcvxrbVfNIRty3L69UNxDjYElZu6Gow/PGf7/mEYc9uoTS2kKAin4Z6g
 OBxqOzgV6Ix9k/t+V0hTsrGo3P9wOj1ysOU1SrXHS9vKQbtSGQjvzriYogfWo=
X-Received: by 2002:a05:7301:168b:b0:2c6:cdb3:bd5e with SMTP id
 5a478bee46e88-2c932bb240amr215830eec.28.1774983887728; 
 Tue, 31 Mar 2026 12:04:47 -0700 (PDT)
Received: from localhost ([192.55.55.46]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2c3c68b2c57sm11433954eec.16.2026.03.31.12.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2026 12:04:47 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 3/4] tests/intel/kms_sharpness_filter: restructure
 igt_main
Date: Tue, 31 Mar 2026 22:04:11 +0300
Message-ID: <20260331190412.1907571-4-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260331190412.1907571-1-juhapekka.heikkila@gmail.com>
References: <20260331190412.1907571-1-juhapekka.heikkila@gmail.com>
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
 tests/intel/kms_sharpness_filter.c | 312 +++++++++++++++++------------
 1 file changed, 180 insertions(+), 132 deletions(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index ed8d2e48c..f08d33d7a 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -143,6 +143,131 @@ static const uint32_t scaling_modes[] = {
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
+const struct subtest_entry {
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
+		.filter_strength = -1,
+	},
+	{
+		.name     = "filter-strength",
+		.describe = "Verify that varying strength (0-255) affects the degree of sharpeness applied.",
+		.type     = TEST_FILTER_STRENGTH,
+		.filter_strength = -1,
+		.iter     = ITER_STRENGTH,
+	},
+	{
+		.name     = "filter-modifiers",
+		.describe = "Verify content adaptive sharpness filter with varying modifiers.",
+		.type     = TEST_FILTER_MODIFIERS,
+		.filter_strength = -1,
+		.iter     = ITER_MODIFIER,
+	},
+	{
+		.name     = "filter-rotations",
+		.describe = "Verify content adaptive sharpness filter with varying rotations.",
+		.type     = TEST_FILTER_ROTATION,
+		.filter_strength = -1,
+		.iter     = ITER_ROTATION,
+	},
+	{
+		.name     = "filter-formats",
+		.describe = "Verify content adaptive sharpness filter with varying formats.",
+		.type     = TEST_FILTER_FORMATS,
+		.filter_strength = -1,
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
+		.filter_strength = -1,
+	},
+	{
+		.name     = "filter-dpms",
+		.describe = "Verify content adaptive sharpness filter with DPMS.",
+		.type     = TEST_FILTER_DPMS,
+		.filter_strength = -1,
+	},
+	{
+		.name     = "filter-suspend",
+		.describe = "Verify content adaptive sharpness filter with suspend.",
+		.type     = TEST_FILTER_SUSPEND,
+		.filter_strength = -1,
+	},
+	{
+		.name     = "filter-scaler-upscale",
+		.describe = "Verify content adaptive sharpness filter with 1 plane scaler enabled during upscaling.",
+		.type     = TEST_FILTER_UPSCALE,
+		.filter_strength = -1,
+	},
+	{
+		.name     = "filter-scaler-downscale",
+		.describe = "Verify content adaptive sharpness filter with 1 plane scaler enabled during downscaling.",
+		.type     = TEST_FILTER_DOWNSCALE,
+		.filter_strength = -1,
+	},
+	{
+		.name     = "invalid-filter-with-scaler",
+		.describe = "Negative check for content adaptive sharpness filter "
+			    "when 2 plane scalers have already been enabled and "
+			    "attempt is made to enable sharpness filter.",
+		.type     = TEST_INVALID_FILTER_WITH_SCALER,
+		.filter_strength = -1,
+	},
+	{
+		.name     = "invalid-filter-with-plane",
+		.describe = "Negative check for content adaptive sharpness filter "
+			    "when 2 NV12 planes have already been enabled and "
+			    "attempt is made to enable the sharpness filter.",
+		.type     = TEST_INVALID_FILTER_WITH_PLANE,
+		.filter_strength = -1,
+		.format   = DRM_FORMAT_NV12,
+	},
+	{
+		.name     = "invalid-plane-with-filter",
+		.describe = "Negative check for content adaptive sharpness filter "
+			    "when 1 NV12 plane and sharpness filter have already been enabled "
+			    "and attempt is made to enable the second NV12 plane.",
+		.type     = TEST_INVALID_PLANE_WITH_FILTER,
+		.filter_strength = -1,
+		.format   = DRM_FORMAT_NV12,
+	},
+	{
+		.name     = "invalid-filter-with-scaling-mode",
+		.describe = "Negative check for content adaptive sharpness filter "
+			    "when scaling mode is already enabled and attempt is made "
+			    "to enable sharpness filter.",
+		.type     = TEST_INVALID_FILTER_WITH_SCALING_MODE,
+		.filter_strength = -1,
+		.iter     = ITER_SCALING_MODE,
+	},
+};
+
 typedef struct {
 	int drm_fd;
 	bool limited;
@@ -588,6 +713,48 @@ static void set_data_defaults(data_t *data)
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
@@ -620,142 +787,23 @@ int igt_main_args("l", NULL, help_str, opt_handler, &data)
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
+			if (p->filter_strength != -1)
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

