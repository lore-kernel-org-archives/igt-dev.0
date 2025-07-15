Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 646B3C83F1D
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2113410E59E;
	Tue, 15 Jul 2025 10:25:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bsT6fpJP";
	dkim-atps=neutral
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBE710E59E
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:44 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4537edf2c3cso54977905e9.3
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575143; x=1753179943; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zcyKNs1peGbw/AypxSMavWF3VyWVOOqHIWd9YYtJzzk=;
 b=bsT6fpJPfTuhF2h9YyLasi+YmxVQA6czJCyXtBOAsEWJTmuRrjD7SCV9dhREHKX4DH
 2ZG9nDo+orznagWYeE37nKcI529+RuLAurLuAcOThxK1cAwFT3mWZnnyQdkiooTzrnbf
 H9GLDIKAlxz+U1At48o6GHr2RpcA5mSoGd6jEekWb359crfZZ3RhK1Mo+Aw82XXOdM/d
 34lG/Q8QW1qUFkPX30Jv9RaQSMKtLEoN0YDpHSrUDkgCP9q6qVjqTXXPR40yApzEvn1W
 E2sEw2ScmflBnTWEcOvhlLputz0qj9+yEQ8wHJ57jK88s7z+a20L4XyZ49UQ3tI/Rjfn
 mxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575143; x=1753179943;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zcyKNs1peGbw/AypxSMavWF3VyWVOOqHIWd9YYtJzzk=;
 b=mAGH3N9QiOJvA5J4zN1AODE5H4l81FyZGcanvhMkpNcN968koC1uF/MgUMqA8pfwou
 kxU7Dyqg5zdrBEqKiEyzvn+ueiI2QaTGYwPq9ptccW7yJDtu8jvjQO/GnoL2NUCm2co8
 rf2DkXfNRWiCXlXyQRvS5tWsxOlEj8hpDdAxrRdSgxJEaljWgAdDtqR7hOPV46IVxXUp
 iJ8UIV5JS7yt+MoI10Bn/zSkZQQdvuDAEalju3CyJWKUWWMK86aNASpIa+a7HOfHUgS8
 Ue0oe7/yT7r7dKuwkieyjiWQgZT+4YVawvgbYYKz6QdwZw4AJ2d281z9515UCp5rDvdF
 r68Q==
X-Gm-Message-State: AOJu0Yzr8kLpmNj9A2rNW4NZ+YmDwPfBqMn7AJRfwPGt0HMWJEklcys2
 EFPmlTymNP72kZbg+FLTPspGCmfyexj02pG6U6U1GsK+lhxJ6Xzdyx5FFDgShg==
X-Gm-Gg: ASbGncuiBEkiTxLxod33aeAdUpqGq3D+LmuEWfh2diNvq7JWOss0Kh6X43pv010g5Qk
 mLVD4zE8+eInyddpoHl1LSIk0Gjthm7feTxhj52DcYyNKkpBh6x5bH/h7cO5tt2sDAlR047+XhC
 Y5M2yaTJjFfCB0IxdEHQmobsJ43SGLFI5XcyY3vkMsOlNVw+NOS8y2a+CyXn1ZNImNmMfs1iiNV
 wS2EEp8W5oLctwOSK2JEeer65IinakLnM0Od2RoRIWyLaKdzN5vEF3oPA9pDzKPeCuHBszKBpE4
 Ki0NvBty5Dk3mf4Stje16SOZC3IJQZBnsrPKwu0eU4deKOhqfvOVWguC71Yq7O0YroEqVXv6QWp
 OwTbW3/12CTSRhFKsHXK4utCiM8AM
X-Google-Smtp-Source: AGHT+IEwBNDgiKx5JC4vwGsv3hT1Lxi18Q2Hp8D7jR7H6ZIxwbFVHmebHvn5hDIYjNQQG5w/4W5LGg==
X-Received: by 2002:a05:600c:154f:b0:456:1ab0:d56d with SMTP id
 5b1f17b1804b1-456272d268bmr20629975e9.7.1752575142817; 
 Tue, 15 Jul 2025 03:25:42 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:42 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 25/41] tests/vkms_configfs: Test not adding a primary
 plane
Date: Tue, 15 Jul 2025 12:24:57 +0200
Message-ID: <20250715102513.5636-26-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250715102513.5636-1-jose.exposito89@gmail.com>
References: <20250715102513.5636-1-jose.exposito89@gmail.com>
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

Try to enable a VKMS device without a primary plane for one of its
CRTCs and test that it fails.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 51 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index c40c8b11e..c4d4e5bee 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -907,6 +907,56 @@ static void test_enable_too_many_planes(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-no-primary-plane
+ * Description: Try to enable a VKMS device without a primary plane for one of
+ *              its CRTCs and test that it fails.
+ */
+
+static void test_enable_no_primary_plane(void)
+{
+	igt_vkms_t *dev;
+
+	igt_vkms_config_t cfg = {
+		.device_name = __func__,
+		.planes = {
+			{
+				.name = "plane0",
+				.type = DRM_PLANE_TYPE_PRIMARY,
+				.possible_crtcs = { "crtc0" },
+			},
+			{
+				.name = "plane1",
+				.type = DRM_PLANE_TYPE_CURSOR,
+				.possible_crtcs = { "crtc1" },
+			},
+		},
+		.crtcs = {
+			{ .name = "crtc0" },
+			{ .name = "crtc1" },
+		},
+		.encoders = {
+			{ .name = "encoder0", .possible_crtcs = { "crtc0" } },
+			{ .name = "encoder1", .possible_crtcs = { "crtc1" } },
+		},
+		.connectors = {
+			{
+				.name = "connector0",
+				.possible_encoders = { "encoder0", "encoder1" },
+			},
+		},
+	};
+
+	dev = igt_vkms_device_create_from_config(&cfg);
+	igt_assert(dev);
+
+	igt_vkms_device_set_enabled(dev, true);
+	igt_assert(!igt_vkms_device_is_enabled(dev));
+	igt_assert(!device_exists(__func__));
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -935,6 +985,7 @@ igt_main
 		{ "enable-no-pipeline-items", test_enable_no_pipeline_items },
 		{ "enable-no-planes", test_enable_no_planes },
 		{ "enable-too-many-planes", test_enable_too_many_planes },
+		{ "enable-no-primary-plane", test_enable_no_primary_plane },
 	};
 
 	igt_fixture {
-- 
2.50.0

