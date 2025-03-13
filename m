Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179F3C28B28
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3AE610E90D;
	Thu, 13 Mar 2025 17:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z3LQkYFi";
	dkim-atps=neutral
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A90B10E901
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:52 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-391342fc0b5so1061604f8f.3
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887230; x=1742492030; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/0tjcsVuV42JL8pad725iYHLbnIeZ+X1byUlLtZMDtA=;
 b=Z3LQkYFiqMaFzAFRGEFK9HzIqZO+PKjR1HPwMsbuRNOvJMu3CTyZzagX5n8mwfgHXs
 aIISIsUpsNisQXKcIlCq93/UcmpNbPBedWQ63JDAo/sMhZ2xefdraEudNYZ7WnDjxY0n
 4iXj/21oP7xUVlTlid9QXDjurOmxlNXxw8Xdvf8uAGGxemXZbxyuuDSKyJ17K0IavBTR
 zMG68F7zvi7jaFg+omoykgdfFaO4Ow7GFDWCR225qG7VYS3hreV1Zhz8cBCGvo1ueIsY
 4ZSO9zbk3j0f03Fc+nWgah9vKcOgN7accS+lyKAwe91rfFc0RIhyymYWwG9C57bmcL3F
 UrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887230; x=1742492030;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/0tjcsVuV42JL8pad725iYHLbnIeZ+X1byUlLtZMDtA=;
 b=UYR1qph2SkHk2sjCqvKu/qgagA2SGJFvcjsB1InHY9yh5NjMsAhS7PxCJJlcBicWXN
 hf8it9+1w0q8/fVkIGQePRcoOafpgrxemtcbpvVWIvN5SXsTfOO5hnpWbPLPaHFcbDmS
 Dy7PrW0C+sas6mNO7lTr3CFU0yvYMlSH0/ZfNSuShnkWLG9+/SPV4J9AWvfcKG6J2CMR
 1X6bb/j7mMNHLnzkRgLB1NFR18Vn53HYNK5T1BMYawZwjyTfQQ58TT3sBQjnR6bBzu2n
 +BQZXEtj7xS0SbfBIzRN+W9/JCX++ns9hqW1MFZdW9r4huP+FMiIczHPTrGx/ymuGmXb
 MfFw==
X-Gm-Message-State: AOJu0YzbZQidifJFOTjxdnSLOIBg7VigC0S6Z9U0p9tl9/CAFpFUpe6H
 nIvhYrSPPmtuNn7osQHZm8VQWkzkzub6eOr381kg++3agTWYnxcA5Lu3fIQc
X-Gm-Gg: ASbGnctOJUTykAvUnPwEN0XL5D8FDha/3k/1r2TIu6TgHZVh3f+hX2N5mKBtjWQTaY7
 DyPjamNXx1BRnlG9tEB4zrnWllnGm42K50Irin33M7iADH2SJNeWbE9NNE9WLxpJAaU3l1FIS7T
 rPpIG3G8gS728ph+HZ0JPtmDI1JiVEch72AQ5e+cvPVZWU665qi+Of7KSpKK243BBqS8NYZcer2
 E1KyUozuqvKtvqxLHFFyIYnXjtJNpXMSk6SAPv18RJKhmmFzrCqccGG4UFNN8MVF/g+qGmG2BmE
 obmod45+jGNGgFK4wzDfdc5Z1+ZoppjsTbdnU2RCep/U
X-Google-Smtp-Source: AGHT+IGg71D31zAOnQq42JzpHLF6T6emFx1yX9KvIF9XmOnJ+5aRiqfSqolXca3LY77UAM26rgjuBw==
X-Received: by 2002:a5d:5f8e:0:b0:391:11b:c7e9 with SMTP id
 ffacd0b85a97d-396c25ed315mr405512f8f.28.1741887230322; 
 Thu, 13 Mar 2025 10:33:50 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:49 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 28/43] tests/vkms_configfs: Test adding multiple
 primary planes
Date: Thu, 13 Mar 2025 18:33:03 +0100
Message-ID: <20250313173318.5818-29-jose.exposito89@gmail.com>
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
2.48.1

