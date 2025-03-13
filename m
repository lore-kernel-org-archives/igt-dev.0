Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E12BC282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C798610E901;
	Thu, 13 Mar 2025 17:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SaQ8cj4b";
	dkim-atps=neutral
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9762D10E901
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:51 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so11508185e9.2
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887230; x=1742492030; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PorwSA/ct2nr7DnQv77OeyrmGDlAUfZYFp+tNGdGb4g=;
 b=SaQ8cj4b9Y1S8WAHiMiCquMDZbsNrQ8jC4/IaHD2RHD1HkoFs9EUN3FuDd0e1xX/3K
 /P3U1U0G6V3BYMJ66kaUdbxCTPm318NRn668mfe+i6Gzv3veHAUenkNRmsiyiNs8kkEf
 YmSYC7YzCuiksVoADZSwEtNjy98FoHhynnd8Un/jbT5cSB7N9TU7JulOnEKkjq6uVjJE
 iDI1CcFd47WN+5mHvUGnfnC3ODsagWOS/MJazZJgTGzPD+E7wcvYXKsEaYQkvbUNHyhM
 4kkW0gZlZBPoTYM3eHLaSn5y2MKznF3t4PNysILbt5kprARFDH85yjopYqH6NlVAOu7T
 tNJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887230; x=1742492030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PorwSA/ct2nr7DnQv77OeyrmGDlAUfZYFp+tNGdGb4g=;
 b=aS9SYppRMfpeMYMSFMc/7hp3+IneB2AAxfJbTa5SoRUgX/6UL75L9B8h6BJAx3sWFq
 tCq9cHW5Xu+p2Ts23x/A2fPzsxRi7uyAXz8Nnn+qzjldTgFOD7atVJ6OL3MIyrPzE/MG
 UCa4W14StEd9vFPmnMxDTp1L6e6kt9OPh9M3HD8HtVyDWLj/PHPgjwl9SreCGQi1Wz+P
 Ch2y6nH8GHGOfALwdiwlE15UOxZaVQENblDEGhcuR5HHXt7Z/iGAjf88uzGVQISMnrHF
 65UmdbZRBvuRe0kvrFSjaAVDorM+QvNvjesEGwSGjxIGqKUE4b8Tx4A8NzNa3sPNHaa5
 v/TQ==
X-Gm-Message-State: AOJu0YyDbL9htBNtmKZDFZNycIMKNUUJMS8nWiGk/zmz+c28TZ07Kq7/
 GrJoVJc4vBz7anrSM4lF+LCpLp0xt9Ev6zV2Mlp3wWHurZUkjkXayuc3YNE4
X-Gm-Gg: ASbGncvl0V+p/5f+H9KtMH7i4cDPrnp3mqiYcCrkoiab1lwsK0GvwfBFTtvbmj8vEoZ
 X/79PFI3UzTs1R+LPoVrzZwCgRf5zS3DmtIYEwBn1hKZwTrGfapNPzsghmDv3TQXhBYEjCXhcoA
 cEZdj9goF1GlmxMPBG2S/74CPTihKwMW4UHMQcMInuQJ2KUF3/o1TsAZO9E6grqNM7j5nsWHzs/
 MVSsQvG1neNaDZyRBDdfk9AuiDFUNCOGN/CS5USNKHgaB1GrQgp22m6/iLPCBPsXAn0gsLF/a2d
 AH61fQAQU7G88Xn6WCO1BZwFq0wnrSKdyB7RL+/CtE8oyd+3rEvEvZQ=
X-Google-Smtp-Source: AGHT+IH6xkfM73GlddgNiWc6H3JSNNeSbgL4ipNWTfx7mF8Mj270VpXfO3flt++p7+AT6CE/KOLDnQ==
X-Received: by 2002:a05:600c:3502:b0:43c:eb63:415d with SMTP id
 5b1f17b1804b1-43d1d8c34ffmr6084815e9.14.1741887229601; 
 Thu, 13 Mar 2025 10:33:49 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:49 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 27/43] tests/vkms_configfs: Test not adding a primary
 plane
Date: Thu, 13 Mar 2025 18:33:02 +0100
Message-ID: <20250313173318.5818-28-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313173318.5818-1-jose.exposito89@gmail.com>
References: <20250313173318.5818-1-jose.exposito89@gmail.com>
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
2.48.1

