Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C658F5580B
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 11:07:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3785210E4EC;
	Mon, 20 Apr 2026 11:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jo5HzbLt";
	dkim-atps=neutral
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7330710E4E9
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 11:06:18 +0000 (UTC)
Received: by mail-dl1-f46.google.com with SMTP id
 a92af1059eb24-12c19d23b19so3566022c88.0
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 04:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776683177; x=1777287977; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g+R7wIEu4MRYiA445UyuGtDQW+wEopAwB24y5blPUxY=;
 b=jo5HzbLtA3OiKmCmBcd+NWAbLAjXvnBBv/yVP0xkGVrJ26ZRnpoNH051CpFcTpwgeG
 FxN/5bKLbbX2saNwmgBx3EhthtNTfbYsjujvevTLJf7zv0fdTrsgVra7VCFvxj60v5xf
 LiCfS0RzHqwW50iErDPk9Dsq7lnDR6E52A/Pp9znZOs577okrOH5PCftmVQbfD8v+gM6
 ATnns7/GYF0g8JgVlAMAffarGk2B6GpaAmkV0jYVAeg5rKx4fYVDXjTdLY/t4UFAknaa
 DVAZnqNWGw2h05jNZ/A4aTUp2CyP+OqKsFzbknkNC7JABa8DdRG8XGe94Z1xEgSoe6g4
 28YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776683177; x=1777287977;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=g+R7wIEu4MRYiA445UyuGtDQW+wEopAwB24y5blPUxY=;
 b=HXSD7NBRrE3ZW92Tl3IzxJ+M7sXy7P8YBNYI9joNsgXasxCmdMZsGC9SPMYJ4D7Kgg
 LPkVkTFJCvUoYPQIZgaCyDlsBcxVr73xyCPB21zbdEbSeKrV1ZKHm5ngP9yhQohesDZS
 zob61+PE5eZY9gABqKLt78loHTcCzHJtcBqcWpPQ+gZI/QT4Dv1VA0BOicwiNWoFjl+7
 J8oeVDKaBCNqAJs78ywjlh5ZPKNOTLRVbWknc+ce1+0qT2mjgrrpvBvcNp3x3Nx/YPu3
 Pq5GREf6pUMHiOGgsa0l2eQYmW0KquRJUN5+pB6I6kOcvjTD384Q5xh6Ju6+z3aU34PX
 VXQA==
X-Gm-Message-State: AOJu0YyQJyWCAbuler0Hcl3+h3Q59I4y9nAXRlVIle9BEHdABdBZQDQG
 Wl3w7thzVdrau1k49q056tTiyNMD0KOs1ti2ajXVaZgchDQdCt5GESvhbZ3YTpPF
X-Gm-Gg: AeBDieuOGHWESMug0DEvxdLUSu6AaAThmzjxiBl6K7LFsUyQttUWXh7nI8CVo3EfZvY
 2/T8Ufioy1QWuIFZUUp9jq5MIrssiqmaa+WG71UDU65IQUb8HeXVyY9CnS7C94zaAqN0MknUHKl
 eINvk9DfzfzUwqaZwep8g1ocDMUoU8aVBtOQS4y5QbPqsxwhLSRIZ2u63CK6+H3kB7gDXEjsNMM
 paeKG8RWyu0EXso0g1eUZL12nZLiP99Xin5G5TlntcyfGpCl/J9JOZEFtA+1IkZaW7UcmRTW5SQ
 i3ybHJ+ja33c53ADDzIieDK5NMEiDMBoWIQj0E69UTkha7jDbrL95GpUVy/Rg0rTEuaB64zBGNQ
 cFGTVKbew0xP6zfk1XhEPLb3+g6xUl1NtOjQqwzw/92PJRQ2bT2J/UuzH8jsYwSLJGz/OappzbC
 gsU0pNYZCZs7siKHR/X92oDO+fUPn7WlhnJqOsdt/JFU8OAwLk2ru9PPp34xKW5o6oQjk7Ug==
X-Received: by 2002:a05:7022:f98:b0:12a:78c8:df with SMTP id
 a92af1059eb24-12c73f9985fmr6138208c88.22.1776683177226; 
 Mon, 20 Apr 2026 04:06:17 -0700 (PDT)
Received: from localhost ([192.55.54.41]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-12c74a20c55sm14242346c88.13.2026.04.20.04.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2026 04:06:16 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t v3 3/4] tests/intel/kms_sharpness_filter: restructure
 igt_main
Date: Mon, 20 Apr 2026 14:05:52 +0300
Message-ID: <20260420110553.478287-4-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260420110553.478287-1-juhapekka.heikkila@gmail.com>
References: <20260420110553.478287-1-juhapekka.heikkila@gmail.com>
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
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
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

