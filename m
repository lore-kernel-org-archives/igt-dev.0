Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870ABC83F27
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B4D10E5A8;
	Tue, 15 Jul 2025 10:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SkZcBSPV";
	dkim-atps=neutral
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93AE510E59E
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:45 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4561ed868b5so12414135e9.0
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575144; x=1753179944; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7dgm86nFUO3mN4ssDN9I1hm4JFysjMH4fstp+6V/QEo=;
 b=SkZcBSPVMdY1mQFefXJgepbpZuHkm5SDsHw8eKgGpXHfDMmXtj06grnBVAeYG3COKy
 hGRKHmJ0Nffhjjqh+nk0EUmOGBVODssRL5UNHLKU37kZNFpg090hmhfjv75UK0niB0be
 XI48XOGXBU1r83LAmw6XFWjwdARdvihtJC+6qej0EoC6cP3XhvGbxIjSciwW6MQ0Dlwb
 II0H2yzp7L9BAeI0+df4Q5KBTmM9zWMk0JCV7fSABawdTXDNrL2hmf5gydXvHTuLh9UZ
 QM5jlXTwkEtejXESdirl5mezppLlviJZ13ccrWhOsGsbzt4WPRN0WyDzenC7WBi3GbNH
 t+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575144; x=1753179944;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7dgm86nFUO3mN4ssDN9I1hm4JFysjMH4fstp+6V/QEo=;
 b=GN3BIoIiXw/6aITrhl5/MjoMfnDrfLyYZcqB19Hi4TvZbHMFd/tDYpCeDH1MT5tPDW
 jl3FWp5GikCAqKMFN/URnH2PW9wf7H0V9JfJmQJUKfHrEnipHhRpC/JB1ISzjJLCnNBT
 Leeidmu5ywlUCZV/INYQMF/FwQh13wjwIcahiU4v2DFgKvClpu7KxH00KnzO7fDthhP9
 z/EereK+4vWFOBpB3Nq07bO4VN6tcAgl3AikO8qE+8i58PdJ2YuVll+Vi9JA1D+EPE2f
 cunfwPoz/JBhJE4A321YvpoJpiZ8rTB+HFbP/STe1yLsyFDJUuIiYaMGlHfsfRpgsj4l
 4BBQ==
X-Gm-Message-State: AOJu0YwDo/M5dfsGkS7cOXTAVBz3DnDCNnIA+Ttj9DeRYu5Pn1Na6hM7
 IZUeXb/eThZcsCfK30cUWJBhLtm3YCmuzmZwyXKdiwW02JbpG3BThiBpK7cFgA==
X-Gm-Gg: ASbGncsb839Rk+cprv2BFQGaJ7D7wyBeqwOtFwfXtajBBEGa79KQExQjnkVkDyOfdHn
 fMnJwCqD20NmaY4a6UTooUtiyc0gGmjLvyJU5tggN0RGK61EM0R8YR/qn9Jw4Eo5HscuRfeDl0m
 JDuL62bsBkv6JDFa1GXK6lsqEAiUwAl/UgPSUCLiE/xUGNb6o/Su1IvTU3huZ66yZqMYdCfhJkr
 8G7lVThVt7fjsVevJ15+LB50O8gNxCEkf8nNHBWEZqt+LL/2KQNJMb3VHp6h4m68jHUppJKRMvk
 CgwW3iFXeefnOAXwVaAcEDixL+PR05t4Agm5pDfe9Ya40UEgx6O3qAybEi+uFStoZFhm0HC0tQ7
 6NG6c5xjunww3gxk9gg==
X-Google-Smtp-Source: AGHT+IHau6iDJUMZ/0TeNnkL0IVY0G4nGs6aUTLhGnwQamWrpqF/5hbqZlT92K3Y2Z5c/fvHnL4OKw==
X-Received: by 2002:a05:600c:1c22:b0:43c:ea1a:720a with SMTP id
 5b1f17b1804b1-455f7ed2251mr117927355e9.1.1752575143571; 
 Tue, 15 Jul 2025 03:25:43 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:43 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 26/41] tests/vkms_configfs: Test adding multiple
 primary planes
Date: Tue, 15 Jul 2025 12:24:58 +0200
Message-ID: <20250715102513.5636-27-jose.exposito89@gmail.com>
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

Try to enable a VKMS device with multiple primary planes for one of its
CRTCs and test that it fails.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 56 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index c4d4e5bee..413be4a46 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -957,6 +957,61 @@ static void test_enable_no_primary_plane(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-multiple-primary-planes
+ * Description: Try to enable a VKMS device with multiple primary planes for one
+ *              of its CRTCs and test that it fails.
+ */
+
+static void test_enable_multiple_primary_planes(void)
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
+				.type = DRM_PLANE_TYPE_PRIMARY,
+				.possible_crtcs = { "crtc1" },
+			},
+			{
+				.name = "plane2",
+				.type = DRM_PLANE_TYPE_PRIMARY,
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
@@ -986,6 +1041,7 @@ igt_main
 		{ "enable-no-planes", test_enable_no_planes },
 		{ "enable-too-many-planes", test_enable_too_many_planes },
 		{ "enable-no-primary-plane", test_enable_no_primary_plane },
+		{ "enable-multiple-primary-planes", test_enable_multiple_primary_planes },
 	};
 
 	igt_fixture {
-- 
2.50.0

