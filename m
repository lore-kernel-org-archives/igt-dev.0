Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D883CC35FF3
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:34:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 865C310E257;
	Thu, 13 Mar 2025 17:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kd2JUeIF";
	dkim-atps=neutral
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B81210E91E
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:59 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43bb6b0b898so11686175e9.1
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887237; x=1742492037; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PnqbqkHjj6pgS0Fa4xVkMYoOe8EBHLMg7kt7JxHZHoA=;
 b=kd2JUeIFW1LQWbHiq/Ldm7dpkq1AO89ByEHpY71Ui2fvlWFmwqV45crZMaVhSYAlki
 wBcPNS5KkpST7jCLS1s13CSxTPeZ9Be/nyPaW3GcX9VRj7oUsTtpDa5bjFwbsaLLJ9/D
 YhNmk2v45T5QsDJaYVdX58qyxGa2ra60aweUW2prlT+5re0fZSV/LlOnWEWMvqWBceZn
 u7gIsEs8m/vEuqKpf+uk/1SgqzbRUn/vAQDxjVcwlhqII25UP4UOxbpx5fhFbgtgfJn4
 0f6KvKOFERA66OMWQ5d1Tc02o6rbqhrJke+OsArJ6ruIhcFDtNaL/+s8oWM5T4FgHiHe
 uPnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887237; x=1742492037;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PnqbqkHjj6pgS0Fa4xVkMYoOe8EBHLMg7kt7JxHZHoA=;
 b=mS07WqUxtpSQ1FB5sLMZr48/5Hugqsgdb8wd7NKiq38mIUNgtMTZG4RhcXKx2D0CtK
 72Rlui0zuADLdBmcfWCGmnmkPncsLvIQxgGLWVJVYLTttcjPG0+tBpBj/xGN7BaGrNBa
 w7ttH1ZpAwdcQR/6NXqIacV72c+S4crlH0Jjg3MFaQ9EvVCK9ttY0v53bRllbOp390LP
 OzLnfUoQ/lMvCPybgu0NxRlCob6tn3E9b8FETvpwVkQzXgAg4Z3UMukueQFU4df0v3cv
 56YlpGc+ewd78E9WtuV4jQAqIS9X1trjJ0NmHxL3mnxVDf+LXy5597vni3l1Ikj8oUc6
 jdyQ==
X-Gm-Message-State: AOJu0YyeRvTphbTnE3QIuAsRMKamEbuwu5SbaHNqsPy3TVTxlJ3qedwE
 VNxE8pUb1wVBmRHHfOpE9OaMywJL0tEU3y0qIeI3hNtkVVT55yugtpcWUgYn
X-Gm-Gg: ASbGncum8u3BXv6dAGuRa2OIu2v9uUQyo7ViuEq0WLF3Cf3uvfpSyHDG3YtfD5b21nl
 eh5yiwKrhI8QV0kY9KWtomPj7NUAF6Py28E0lCnjnzKrrCxQXKtKnhh76/b4BfxGuu3vD13dFOb
 j2nshbldjCJ1JkRS6PpdROUArPbXINayHwkI8p2hh+ndpPXeb5eSe7+x6b7yigXmcjEExth0wVD
 18SGaMhe5OUNA/uIPgM7vVFTWuDuADg0Z+MyHACM1g7soWUGQJZAl+V6E9SBg0gZk72XWmyuV7J
 3zoE8GAvqrRxnLeng/zaMHElVrWmoiEZvsieRHbp+eMT
X-Google-Smtp-Source: AGHT+IGvNg6SswxRz06ASNH6PsD4+SUzTUejPjXE/Wo6QMjac7BCBKBWf5+WNMiS1Fx5f26wuDacPA==
X-Received: by 2002:a05:600c:1d12:b0:43c:eec7:eab7 with SMTP id
 5b1f17b1804b1-43d01bdd224mr151426455e9.11.1741887237428; 
 Thu, 13 Mar 2025 10:33:57 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:57 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 36/43] tests/vkms_configfs: Test adding a CRTC
 without encoders
Date: Thu, 13 Mar 2025 18:33:11 +0100
Message-ID: <20250313173318.5818-37-jose.exposito89@gmail.com>
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

Try to enable a VKMS device with a CRTC without encoders and test that
it fails.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 51 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 1743625b4..8fb5f9569 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1354,6 +1354,56 @@ static void test_enable_encoder_no_crtcs(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-crtc-no-encoder
+ * Description: Try to enable a VKMS device with a CRTC without encoders and
+ *              test that it fails.
+ */
+
+static void test_enable_crtc_no_encoder(void)
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
+		},
+		.crtcs = {
+			{ .name = "crtc0" },
+			{ .name = "crtc1" },
+		},
+		.encoders = {
+			{ .name = "encoder0", .possible_crtcs = { "crtc0" } },
+			{ .name = "encoder1", .possible_crtcs = { "crtc0" } },
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
@@ -1391,6 +1441,7 @@ igt_main
 		{ "enable-no-encoders", test_enable_no_encoders },
 		{ "enable-too-many-encoders", test_enable_too_many_encoders },
 		{ "enable-encoder-no-crtcs", test_enable_encoder_no_crtcs },
+		{ "enable-crtc-no-encoder", test_enable_crtc_no_encoder },
 	};
 
 	igt_fixture {
-- 
2.48.1

