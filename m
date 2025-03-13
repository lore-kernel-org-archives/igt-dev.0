Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3833CC282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:34:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78C410E909;
	Thu, 13 Mar 2025 17:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gzREgilm";
	dkim-atps=neutral
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0264310E923
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:34:02 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43d07ca6a80so8804535e9.1
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887240; x=1742492040; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6z8gHM5OSRRWzbXTEjRISlGxRWDSxAZ41lUY7KohRtY=;
 b=gzREgilmDa7enylDQQBWwPrsEFDBSYouA21LxAZ9957vgQXTTzM4A5JOxUHUNGNgPI
 2dvDr0y8gwMX3dVzSaGvdu5/AVHFhUQhpJrx9LGECIhl9KAYKU8LDDQRRp2foQuK3nax
 RjQd6yZgLqkRZ2CTTuVp00wImvUNfNhbm0KUCm/3nhMEYXLWgD4Gty98wEVOEc+SQFaT
 b0qTADiU6INbF008fQZ9OOvaAaHf7f90T4H8KzIm7cAjtcWyAaNQyz276tWenztR0QZe
 297ePN/4mWhfHitTft6OdClYUI3060evZ5YSQAmJ7XsFJLCx7S3AprEN9D789by42JzW
 UCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887240; x=1742492040;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6z8gHM5OSRRWzbXTEjRISlGxRWDSxAZ41lUY7KohRtY=;
 b=fKVoDJ1pOe+0twEy09Cd128Z1950cvJZRACAcW1PUG2Nk/Th8idz9QAc1MUfpkIKTx
 o/Pxvvh6hB4sBcAP8s3YYdngJQMfPZpERNGBO5JhfGrUtJIe0fU+B6MUtEoBLi8mepdq
 SsWXI5AuRb8ouxdRAaBjj9NiEyNaOT4yRiD+trXmmYkZlra4jyUSpJUpL6Tzmsk9JkHi
 vqdgWds63Qzey9wmA7On2lMn6cGbWT52eIaNQpUBE9FioYPGYC9ETA0eYD0qh9vdMM7A
 M+PTzvZeZhRuT/BTDFToGQZ5alcZ/vA+yr6+g+1lBYQTAMp3pmGicpMX6PgSHzxqj4BS
 FTrA==
X-Gm-Message-State: AOJu0Yw+UKs7//uilEP5uLk3sGDZUDQUjaUka2dIGW5qneB+saNqURg+
 fZuagobzphdHV5TquvLyrHzJGLsDSo9tjXnD+ry5HDrCBIJYdHoOaCZXI/hX
X-Gm-Gg: ASbGnctivwC1HTxf2TT+jMhtURVVOxlTaUgdQSnBjpS+xiI1turt/oEPygb5ZJpaB5A
 yLqIjN5UQciV4nWMLWEVIRsTfuUmc0wOTJetksKiV8JPYrxoxudil1v0D85alJZFfLdRXYGBdpK
 f6N0OK8anq8KcssWUqSsKFGe3Lyv5+CYzO2sXK15+FOgAV2TvVau9zbg2M00//FEzPJTSTFm+l9
 J5mS//McDTa3JJIe8OJ80S8J/6ygJXobZNB6qmBqcxz2LFIsmq1+YPDmuicQ1XEsgEK1NbwfeZz
 CYqjf+tu2FA7Z+0CfpjGf6u7UEYKS67c2X02YMIfFmQL
X-Google-Smtp-Source: AGHT+IEGilIxX6+fENoWomy3BKHd490hTeD7lezW9oHqzeGXKYuSg2sGcFgtqcZ0GECdaeIwjihVXw==
X-Received: by 2002:a05:600c:a05:b0:43d:934:ea97 with SMTP id
 5b1f17b1804b1-43d1d8ed219mr4877675e9.27.1741887240021; 
 Thu, 13 Mar 2025 10:34:00 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:59 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 40/43] lib/vkms: Test changing enabled device CRTCs
Date: Thu, 13 Mar 2025 18:33:15 +0100
Message-ID: <20250313173318.5818-41-jose.exposito89@gmail.com>
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

Test that, once a VKMS device is enabled, the CRTC values can't change
and that deleting it or the attached planes/encoders doesn't change the
VKMS device.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 12 +++++++++
 lib/igt_vkms.h             |  1 +
 tests/vkms/vkms_configfs.c | 55 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index 96f13d628..5923e8527 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -804,6 +804,18 @@ void igt_vkms_device_add_crtc(igt_vkms_t *dev, const char *name)
 	add_pipeline_item(dev, VKMS_PIPELINE_ITEM_CRTC, name);
 }
 
+/**
+ * igt_vkms_device_remove_crtc:
+ * @dev: Device to remove the CRTC from
+ * @name: CRTC name
+ *
+ * Remove an existing CRTC from the VKMS device.
+ */
+bool igt_vkms_device_remove_crtc(igt_vkms_t *dev, const char *name)
+{
+	return remove_pipeline_item(dev, VKMS_PIPELINE_ITEM_CRTC, name);
+}
+
 /**
  * igt_vkms_crtc_is_writeback_enabled:
  * @dev: Device the CRTC belongs to
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index 786db224e..9785a64e9 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -105,6 +105,7 @@ bool igt_vkms_plane_detach_crtc(igt_vkms_t *dev, const char *plane_name,
 				const char *crtc_name);
 
 void igt_vkms_device_add_crtc(igt_vkms_t *dev, const char *name);
+bool igt_vkms_device_remove_crtc(igt_vkms_t *dev, const char *name);
 bool igt_vkms_crtc_is_writeback_enabled(igt_vkms_t *dev, const char *name);
 void igt_vkms_crtc_set_writeback_enabled(igt_vkms_t *dev, const char *name,
 					 bool writeback);
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 11dea86ed..62dfb99be 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1635,6 +1635,60 @@ static void test_enabled_plane_cannot_change(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enabled-crtc-cannot-change
+ * Description: Test that, once a VKMS device is enabled, the CRTC values can't
+ *              change and that deleting it or the attached planes/encoders
+ *              doesn't change the VKMS device.
+ */
+
+static void test_enabled_crtc_cannot_change(void)
+{
+	igt_vkms_t *dev;
+
+	igt_vkms_config_t cfg = {
+		.device_name = __func__,
+		.planes = {
+			{
+				.name = "plane0",
+				.type = DRM_PLANE_TYPE_PRIMARY,
+				.possible_crtcs = { "crtc0"},
+			},
+		},
+		.crtcs = {
+			{ .name = "crtc0", .writeback = true },
+		},
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
+	igt_assert(igt_vkms_device_is_enabled(dev));
+	assert_device_config(&cfg);
+
+	/* Try to change values */
+	igt_vkms_crtc_set_writeback_enabled(dev, "crtc0", false);
+	igt_assert(igt_vkms_crtc_is_writeback_enabled(dev, "crtc0"));
+
+	/* Deleting pipeline items doesn't affect the device */
+	igt_assert(igt_vkms_plane_detach_crtc(dev, "plane0", "crtc0"));
+	igt_assert(igt_vkms_encoder_detach_crtc(dev, "encoder0", "crtc0"));
+	igt_assert(igt_vkms_device_remove_crtc(dev, "crtc0"));
+	assert_device_config(&cfg);
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -1676,6 +1730,7 @@ igt_main
 		{ "enable-no-connectors", test_enable_no_connectors },
 		{ "enable-too-many-connectors", test_enable_too_many_connectors },
 		{ "enabled-plane-cannot-change", test_enabled_plane_cannot_change },
+		{ "enabled-crtc-cannot-change", test_enabled_crtc_cannot_change },
 	};
 
 	igt_fixture {
-- 
2.48.1

