Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 490BDC35FF3
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB33F10E91C;
	Thu, 13 Mar 2025 17:33:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="do6C/J9o";
	dkim-atps=neutral
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5999E10E918
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:55 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4394a0c65fcso11891665e9.1
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887233; x=1742492033; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2XlyySXDbNcqLRBZqZ3FpVc6b6odRc38uUEtmgfJHTw=;
 b=do6C/J9oZ3zawbfUYvA2pzTntUuDwgiwobT/4a+yvgikPbSqcZtaHyt90ukuBR8x7J
 VKDGJlGLcdBI+VgG4NHMtANH3AWNB4SvyEVya1MLn1OtC3MLQCS4a3Zq0bl2EImDi63y
 SuZJ9rhj8WEKphjZHINd+KwWeOUnSkjOY/0xIiDNlNOgMixfxxmtwM68eTE6qbUfTeqk
 F7RJLxF2sZbCcoM6icHPo3dhZgzwiCRjh/GX31qRuRChg/39ETwq5sOi0bIsDcIFDnC5
 YJ/beO+v7SbLwJW7EWE5o9beida/vrPKqZgPiWhP/HUZKoeDYebuF9lu+uJk0yHrZk1y
 1PGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887233; x=1742492033;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2XlyySXDbNcqLRBZqZ3FpVc6b6odRc38uUEtmgfJHTw=;
 b=jYUiD0echqmO4xP7pGottslLzAVF2RV9wJljrdWY+AZqrhUVe18TornurjKyATp7jI
 5nUW8Vvio3ClNL8GQQh/xadYBd0k47tx1U3d0UAmeWa4mxwcb+9pL62+o1zgnmcfWABo
 TDI4yG15SBIjy6MLikaCeRD1DX1bMRAsk2GMmUIzhfgE/vpXt7p56euN9F6TkQMHqaq4
 BJHG61fHGMWKkxuVvRyc7P3ZX4DNRnSOz9CnF1ILM/OcWb/99ZqjDYA86g6DJu6mC7fi
 npz9jRaI2e2dcmal8znrE1hQUfTJxSdcdixpE7E8Lmz9I73jYts9IdTMMZqpj7fJDz/t
 b55g==
X-Gm-Message-State: AOJu0YxlKIkc4O3n6XbV1uKd4X2AqX1qHwhRmah0ypP8+DCwkdujK3gj
 tspdcsXuVtE8yFkw4P+SFch+27T5uMrPkXGxfZ3/XVVgdA2CY2R7zepRR9I4
X-Gm-Gg: ASbGncvvt8JJS1Qni3DwSI6YpRxa/nGV7l8FpkA3zjsUlNnG/44ab93B3BkucAUXsBE
 fQVEviAI8qbgnI7kRhsMVHNrw9u7kgfvWaFNdibZLfHd0lCpgZIuJ5xjnV/ky2AE/Ne9OMrgoLf
 s5x/iOl+X5ccNznrPmKcm7bRERC13O9jTTthOx/DaemicwinVjz7eTNGvNiGolQ+hklUKbu7nHm
 1r+tLu3zes23AmYsBwVTim5d0PknPrQJi7czhkhEKu0ZQHppzC+t14YAwf5+Be+elaMwhYnzSD1
 r8lNMB/xN81vf/0pEFS59kYL81Rwe98UF1jK0E6EWJp8
X-Google-Smtp-Source: AGHT+IEUn6p0fPIhr6vhAOUhoYvupmkcOSPwCLKUQvU2f6ZE7VmQ/Hp6x19+IZI3Z8Ks2aapGbZyQQ==
X-Received: by 2002:a05:600c:a05:b0:43c:fbe2:df3c with SMTP id
 5b1f17b1804b1-43d1d8ebc67mr4108915e9.26.1741887233374; 
 Thu, 13 Mar 2025 10:33:53 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:53 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 32/43] tests/vkms_configfs: Test enabling a device
 with too many CRTCs
Date: Thu, 13 Mar 2025 18:33:07 +0100
Message-ID: <20250313173318.5818-33-jose.exposito89@gmail.com>
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

Try to enable a VKMS device with too many CRTCs and test that it fails.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 54 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 22459a547..be856876b 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1163,6 +1163,59 @@ static void test_enable_no_crtcs(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-too-many-crtcs
+ * Description: Try to enable a VKMS device with too many CRTCs and test that it
+ *              fails.
+ */
+
+static void test_enable_too_many_crtcs(void)
+{
+	igt_vkms_t *dev;
+	char crtc_names[VKMS_MAX_PIPELINE_ITEMS][7];
+	int ret;
+
+	igt_vkms_config_t cfg = {
+		.device_name = __func__,
+		.planes = {
+			{
+				.name = "plane0",
+				.type = DRM_PLANE_TYPE_PRIMARY,
+				.possible_crtcs = { "crtc0" },
+			},
+		},
+		.crtcs = {},
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
+	for (int n = 0; n < 32; n++) {
+		ret = snprintf(crtc_names[n], sizeof(crtc_names[n]),
+			       "crtc%d", n);
+		igt_assert(ret >= 0 && ret < sizeof(crtc_names[n]));
+
+		cfg.crtcs[n] = (igt_vkms_crtc_config_t){
+			.name = crtc_names[n],
+		};
+	}
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
@@ -1196,6 +1249,7 @@ igt_main
 		{ "enable-multiple-cursor-planes", test_enable_multiple_cursor_planes },
 		{ "enable-plane-no-crtcs", test_enable_plane_no_crtcs },
 		{ "enable-no-crtcs", test_enable_no_crtcs },
+		{ "enable-too-many-crtcs", test_enable_too_many_crtcs },
 	};
 
 	igt_fixture {
-- 
2.48.1

