Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89D5CA0EC1
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C17F10E803;
	Thu,  7 Aug 2025 07:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hKMgLyAz";
	dkim-atps=neutral
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D3B10E804
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:44 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-459ddf83023so4041225e9.0
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552803; x=1755157603; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fz2JJjqDRhL1G0PcCDGaYzcMsaT2ObO3ODRm941m818=;
 b=hKMgLyAzFXWeMZZ1XEta/xnEYBYQvhFdeKXyvA/QM7mRnJPx5zJ/+I0bRTwFuMhSOz
 EGoSg5+n6nT8nGBHHzTcBba66u4Rf7cbFXJyifsUgl6wlKm9lPHyIXhGsI96azCzf8Cq
 kZsSe/IzdW1MUllcODlBQ7MAr+z/+61s6IyTrIIMn2OJYPwwN2C3GMzlVSyVRa/rdU23
 vSidtHq4MkUDJ+5e34BRYQfEo6Fk3pLUH22RYhBgGWlvQNpa+NKDAz9UCC1jV40v5TMr
 3h3L2F46y+dnVEJbksOFJjZUVbCXYJ7Q9Ws03cQLa8pzSVJEVb9gSlDeHCerOD8UCY35
 DHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552803; x=1755157603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Fz2JJjqDRhL1G0PcCDGaYzcMsaT2ObO3ODRm941m818=;
 b=awwqlmh2frhucNqUjAJjW5i4CBV2cqrxcL/whfN4pmvfmNME4g1mdhobFkTGj4RQJT
 7iVKlPhKM+F+3vWJpAyxhlUxKWBYf4gf008R0WKMKsjPNkOBiTmkeQ57mqn9qeB4vgYm
 eNnG+O8zpZ1EgI67JcERGxaLJ4eOwDzmRMKBlvoFgxzLkXkrLkLg1Tr7mG6scdmu6Ehf
 e0BznNIt48um5d+NaxzKsGN7dME4AJzK3WrB7MxD1XdJJBkoN2BRu74//h+a0JYvFMKs
 vc+Q/1BkO5AhFBXcl+8nxU05aPed6nUMLsru6X/JeDjkRn6Z2LPB7spu7x9yXNUyUEY9
 wyvQ==
X-Gm-Message-State: AOJu0YyTDRSoUPXfu6YUOiz9FquOOTZ0igLAPhXAa9X/boP8sHHm4EjE
 k7tP7gLF2CrVkQUO/B1pY0I9NyzuSSTMdREeUD1lUklfm+N/94acgKzGoG+yTlxO
X-Gm-Gg: ASbGncuiZb5aPutQiKD6iCtAbYoJ/NzT0oqvn61MYbVcf6qlt2Cn4gl6QC3HnBm8TFj
 0wuzHvUPwPPZjSzki6vLVbcC/Ld3jN6WGkyypXuJbiSgyzwizyqsSI614/nvLeHCuHu2Y/1my4s
 2FTxN7153k+FW2WDsnA2NzyGM6/fyFBAtkBHAf6cBhaHSkSVVoIzh5xyMHfYI/Y9fhHEYe3wqqJ
 ykihaDz1ZpkuWGN5QnOM8NN7Nfy/gFoA9+X9WF9ggqWda/48pdsN5U4xyqCsTFNXaUrw6QEZUvG
 eC5DCPWVu9fcTdyp+Sn/Dc1QnBhRcFXIfzTmpnVmkErIbQ3prOBxwYJLUUvDVLK/MGGEJLjv+8E
 g9E7Fzxw7AXclnCVhyB0=
X-Google-Smtp-Source: AGHT+IHJKhcue/nMQhFy6dB2FLRvya7gvq32iKd+bv/DDm47Xv6Fq8UIj40y1cI9e4oR+zaN/8hGdQ==
X-Received: by 2002:a05:600c:1d09:b0:458:bbed:a81a with SMTP id
 5b1f17b1804b1-459e744f673mr62112225e9.10.1754552802731; 
 Thu, 07 Aug 2025 00:46:42 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:41 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 38/41] lib/vkms: Test changing enabled device CRTCs
Date: Thu,  7 Aug 2025 09:45:47 +0200
Message-ID: <20250807074550.6543-39-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250807074550.6543-1-jose.exposito89@gmail.com>
References: <20250807074550.6543-1-jose.exposito89@gmail.com>
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 12 +++++++++
 lib/igt_vkms.h             |  1 +
 tests/vkms/vkms_configfs.c | 55 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index 96bce58f6..06cd3e52e 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -803,6 +803,18 @@ void igt_vkms_device_add_crtc(igt_vkms_t *dev, const char *name)
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
index 839a7a6ef..66d10074a 100644
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
index 56ef54acc..f8f78144f 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1634,6 +1634,60 @@ static void test_enabled_plane_cannot_change(void)
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
@@ -1675,6 +1729,7 @@ igt_main
 		{ "enable-no-connectors", test_enable_no_connectors },
 		{ "enable-too-many-connectors", test_enable_too_many_connectors },
 		{ "enabled-plane-cannot-change", test_enabled_plane_cannot_change },
+		{ "enabled-crtc-cannot-change", test_enabled_crtc_cannot_change },
 	};
 
 	igt_fixture {
-- 
2.50.1

