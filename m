Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73E5AC021AA
	for <igt-dev@archiver.kernel.org>; Wed, 19 Feb 2025 09:32:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5297910E7CE;
	Wed, 19 Feb 2025 09:32:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="TUWNWwqv";
	dkim-atps=neutral
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDDC10E3F4
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 16:50:50 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43932b9b09aso63860215e9.3
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 08:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739897448; x=1740502248; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5fK4++Dw1f445fcIj5JvexDs84xahRAyq5jAKijLnLs=;
 b=TUWNWwqvRpHrgZQEkYsUUVwtP+UWZdsxsua0S6/A+B0KGqs4pb0/fKakRBEHWR1eJr
 kfyYAzR0fEHf9AaeJKS6lxG6tGH9FoLt22rZWPErUjBzEfk1F42q0z888FTGgdfOd2Y5
 +xOtsAPzNImU5Du9rOhg6sxMwqPTDLLV/tSGMD1DaEbKI7EWYfiBa5LrSgZ/4Hwa7qbJ
 EWgkFFcSYlmDU9ar9CRLzYrAeWn2isdGDmu0BeOzZqfBNkfc+aStNmvYHiOAXL9lvJnF
 FfBdWkj3bg0qIJRt/Tn8B/iwxqw1jhhRAvEtqtc30khu8Dobo8zFn2x19Rb/1lf1u3Hl
 PaQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739897448; x=1740502248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5fK4++Dw1f445fcIj5JvexDs84xahRAyq5jAKijLnLs=;
 b=AFAhDbYLihLWWzplPgvsfYbJHz6LLZdXcPA63HyhBzrey6xlNM6zGqcHkClzX2lGwu
 7uXCGRu8xHBQe/jYYHLtBBny9MJnPVWZycwrzeAaLbyV4uu9SNUzSHZfBGhXgxvmQ3ES
 72T7QyFANqW184jFR3+gRMlQYTGpcF9Nrp/Z4tDNmmEs2nVMKpAKZn/dNTbgpnldhLlr
 F9+FMjHg1nNKnjLmLRX0MA9FRRbFTKvmDrLhz15E1knhcg+LVK+owL5jffaNuXWunReq
 TTIu2GUa/lu85PtwTidHr+5X7K01BzsDMFBKuM6y53R67OZowV+HahIzN6Ae1sUSpkcB
 w2dQ==
X-Gm-Message-State: AOJu0YwwbgSnojWXSaJD+IVPxQNCGOAcnNCX/Dr8/MCVZWHVTBk4h08W
 6ewloOiJNUmAeyvUOQk1KCiJ81fvnT4whozEEiXwvrwMN4HANmvmQbUXS9Bd
X-Gm-Gg: ASbGnctWtecZZ9YT0T13qVa/Stpx+zdzuXKbqTMr+uLoQe6LGtdJUufHPkPayPwY1iM
 LobwpN4UPhsWuohQ2NJdMH+W+br5lY4VBuALYIcGzasyuaHsCEWf4POHgdK3//pgm0EAgeKt0Y5
 HMTildICaH+F1CXPx5JsyJ2iOKahbGSJ/MXty0lfN3mjlkBHNGLAu7x9l7u1zBj+61W0COI+D0/
 e5Pk2WfEirzb4naWIcAk7BXht/7eZm6fkelotvYCt93KetH1eauaS3HIqgejLEziPQGrE2DXN5D
 5SXldwGU+BrVy8xXiw==
X-Google-Smtp-Source: AGHT+IG4doV2EVP3pw7VEjNeuMOxY7yDj8AaiFuOE7a8nsMdAOLX/5YahY1dTxuZk5ItQb6/Wvm1UA==
X-Received: by 2002:a05:600c:3151:b0:439:94f8:fc79 with SMTP id
 5b1f17b1804b1-43994f8ff8amr42960595e9.0.1739897448445; 
 Tue, 18 Feb 2025 08:50:48 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f258ddbbdsm15582024f8f.37.2025.02.18.08.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 08:50:47 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t 36/39] lib/vkms: Test changing enabled device CRTCs
Date: Tue, 18 Feb 2025 17:50:08 +0100
Message-ID: <20250218165011.9123-37-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218165011.9123-1-jose.exposito89@gmail.com>
References: <20250218165011.9123-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 19 Feb 2025 09:31:45 +0000
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
index 3dab7a823..58c71ca08 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -586,6 +586,18 @@ void igt_vkms_device_add_crtc(igt_vkms_t *dev, const char *name)
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
index 03f9cb339..e1f63d809 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -82,6 +82,7 @@ bool igt_vkms_plane_detach_crtc(igt_vkms_t *dev, const char *plane_name,
 				const char *crtc_name);
 
 void igt_vkms_device_add_crtc(igt_vkms_t *dev, const char *name);
+bool igt_vkms_device_remove_crtc(igt_vkms_t *dev, const char *name);
 bool igt_vkms_crtc_is_writeback_enabled(igt_vkms_t *dev, const char *name);
 void igt_vkms_crtc_set_writeback_enabled(igt_vkms_t *dev, const char *name,
 					 bool writeback);
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 066911715..d8ae1f073 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1560,6 +1560,60 @@ static void test_enabled_plane_cannot_change(void)
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
@@ -1598,6 +1652,7 @@ igt_main
 		{ "enable-no-connectors", test_enable_no_connectors },
 		{ "enable-too-many-connectors", test_enable_too_many_connectors },
 		{ "enabled-plane-cannot-change", test_enabled_plane_cannot_change },
+		{ "enabled-crtc-cannot-change", test_enabled_crtc_cannot_change },
 	};
 
 	igt_fixture {
-- 
2.48.1

