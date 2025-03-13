Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EA9C35FF4
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACAF210E91A;
	Thu, 13 Mar 2025 17:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jWSnDEp5";
	dkim-atps=neutral
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD0810E918
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:55 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43948021a45so11138075e9.1
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887233; x=1742492033; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r5FgRwftR7vkvgpZg3Zsp79l7ZFqc36oirwLAJ7GKWQ=;
 b=jWSnDEp5bPOlUj61+N5SpUH3DDoMbfaDLMXJG5X6d5GWT4JzzBgpjePHTUidgl4eI4
 DQZI+yHscfywJ5p1i6QT5m44FzuKk/p/9cKZFOyXARLCZ04lkjzaSjpBPia8qjbNaVHf
 SDxuwr5pu79H37rMtQElZmT5OFsVd68QcEg6rYLSrf69P2JKzsda0xkKkb+SH2bOO2lk
 k5Ubkscu4zmGskokSzYQiaMIqVFR/uqSfwaLcZaa6USu9SjbakUZnMNOUpQssfFX5BGr
 0C6trosZypHu9Vt8/SY2l9KAs3dMkc7aL00jeGiXvsTQ8uuJSOr57qmxTFyrkVMqVRLJ
 Smog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887233; x=1742492033;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r5FgRwftR7vkvgpZg3Zsp79l7ZFqc36oirwLAJ7GKWQ=;
 b=Pj1pelCE22f/tIRbUcc7nn9Vjkv6fp1xz/C0IX4HL6FYnRU35phDoXZd1os/M5r4fU
 +oSFrzeXHwctSLWLdya9deZBTSM/TPTCGVueTv0Fv3wL5Unwu3T/ybQM/MwQKEuL6q7i
 ZmJi/qIJkfzQiNqhNTzlwNS353IGbiVaTwC2iQU5rPEO6V7d/663j9rDf0q9et3DIi2D
 B4Yl/hX/PHUIoA2ANQTXcE/R7x1nDnmWneEB9d4ggbntZ4R99uRTlAXvtG/eZPF1+Ezj
 cQaOVPO9rjWULrj/AChxcZOu4A5ICZ/Z/1YJN3DIJjsc/9LmECRGd4ljUy0H/um5ddtT
 HJyQ==
X-Gm-Message-State: AOJu0YxbKureW9dZnn/CHC8vOVBvxwzU8D5M5gQStwkWiWLkLa9uR2+/
 +zfUOwYSq18uTGtEkefNZrw2Z/4GLJclPI1uD1uF8e8DzTEKht0YT68eUNJ1
X-Gm-Gg: ASbGncuvGG/wpstYnT+muCXtLCeqRbRi7ecRXr84BopYYK70LMwDTXfKrFLVQWer2wK
 ZplJz+jyl+YGeOpkRoNF34mONTEVqsKOWQ31Vuw0/RpqEOkvKATOztEDzvZ0pWq+MiE2d2YYJ3G
 dLny/KaTgHOFLcnAaZ51zKab1gkOtLV0brQSkRKHO25SvkatrqX8XoDJVP5GicbX/EoLi9652xI
 Ny0PmhBm93kleb1aTmWLT0G+l1KxmKD2WrnZsbjL16uYl72+4Cxx5fdJ33StId/WUlkw0uahUtq
 mTWOatNuFHn3M63+5AXPfYMQwr8r5Z0Hs+jgSg9OOns7
X-Google-Smtp-Source: AGHT+IFqI/NKNZJ0AzhUjim8YQ/ekKbQHaSDF8yIgy9y9kh63FbhchpT/T5gucNlvVebPLhPdS4CIQ==
X-Received: by 2002:a05:600c:34cd:b0:43c:eacc:9d8c with SMTP id
 5b1f17b1804b1-43d1d8e5d2amr3859925e9.24.1741887232671; 
 Thu, 13 Mar 2025 10:33:52 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:52 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 31/43] tests/vkms_configfs: Test enabling a device
 without CRTCs
Date: Thu, 13 Mar 2025 18:33:06 +0100
Message-ID: <20250313173318.5818-32-jose.exposito89@gmail.com>
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

Try to enable a VKMS device without adding CRTCs and test that it fails.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 42 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 17f57c063..22459a547 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1122,6 +1122,47 @@ static void test_enable_plane_no_crtcs(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-no-crtcs
+ * Description: Try to enable a VKMS device without adding CRTCs and test that
+ *              it fails.
+ */
+
+static void test_enable_no_crtcs(void)
+{
+	igt_vkms_t *dev;
+
+	igt_vkms_config_t cfg = {
+		.device_name = __func__,
+		.planes = {
+			{
+				.name = "plane0",
+				.type = DRM_PLANE_TYPE_PRIMARY,
+				.possible_crtcs = {},
+			},
+		},
+		.crtcs = { },
+		.encoders = {
+			{ .name = "encoder0", .possible_crtcs = { "crtc0" } },
+		},
+		.connectors = {
+			{
+				.name = "connector0",
+				.possible_encoders = { "encoder0" },
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
@@ -1154,6 +1195,7 @@ igt_main
 		{ "enable-multiple-primary-planes", test_enable_multiple_primary_planes },
 		{ "enable-multiple-cursor-planes", test_enable_multiple_cursor_planes },
 		{ "enable-plane-no-crtcs", test_enable_plane_no_crtcs },
+		{ "enable-no-crtcs", test_enable_no_crtcs },
 	};
 
 	igt_fixture {
-- 
2.48.1

