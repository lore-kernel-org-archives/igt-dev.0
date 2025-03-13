Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 440A4C282DE
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBFD910E913;
	Thu, 13 Mar 2025 17:33:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jdBxCxX5";
	dkim-atps=neutral
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED0310E918
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:53 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so11508535e9.2
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887232; x=1742492032; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZMqpaLD2guFrC9n623QLd/ssx2vsDFgR0yabKUL0szg=;
 b=jdBxCxX592+VyRXY/UJUcI2fCUgIzOawPfY2pzbX3BhU1qMJByN8f5/6wPnlAMjzfp
 eP3EeLtIRPvJIxc6fgCqm26z9kp2oGwdvGjlBMS/v1G2x+JloFczbrIQQ9r2zMDNRo24
 YnI7xFUG06d2UKo49La3OqwTWzAFVyKOzs5mo20Ro1Z7H8dXq7kyc2EtSdewyjm3fL65
 UIvPgRedUtJxkvra/S59FkqqsKh4lJ55Xdw8JvYQsdgxPQLGMfLilZ9eMqp15EQn5m8C
 Sjpspoo/9fVTpU5AEiNK3FYK5AOp1dx/B725ZIcvKoQFv0qdYDV722wOnQfB3aXNgj+W
 FD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887232; x=1742492032;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZMqpaLD2guFrC9n623QLd/ssx2vsDFgR0yabKUL0szg=;
 b=KmpfBraNGHDnKE9YO468DtrD00NY0z7FbNcmBuCjQ9l2gtjhp7KZlR0di5N9cQMlYo
 Hjck3SN9liqoLpTctQze5P2YmoNqWUBf0ZtWGzVK1YpRiCQnqBnSJGrD0clnCdVQ1bJm
 wiS4m3MBwL3ZquuVhnQ+66e/UY1GV/YDE1g9FzEsp7AqP4YcPxhQ0f8UoWEXMeKlQB9l
 GSdES09DK6OKisCCrwkOVXzDqEJ0XMbUHkVpRN9uRZGcIonabWgtCC2p9GF39GQjJilw
 oOd5u8wPjzOwIqVjjDt4gN1SZ2+HyyAN5h+QJSzQCODKETgRPUW0lg89J5+h6Zh3PkPW
 STzQ==
X-Gm-Message-State: AOJu0YxZ3DZ3c6wPr2Vhk45xdP0n772StdVo3ckp1STjtXiC76AFN8JI
 rZjxGxfJbA4Sy8tfQC6yzcfwxBrAj1LRdoQNR6JU4PI6rVsG34jAGxzTGX62
X-Gm-Gg: ASbGnctgzDKoJCxGRMXby6Pv+8dYld6eahf+bDezwjIu759G4svkv4Dh4q9nCo5cjT5
 2SZsZvX/6Gnmiy/VepOpn27t1i2AIUkJmSYVqrOv9l7WCy9h7x32bylFeqZgViWg0uyLIPPGVx8
 MPHmGZxRuDNPnhpL77XFinTgq4f6yiYgNDMBNQzwCyDxw6bSdy6Aoik4F8t61AsLGIduvaPqfu0
 JsHZDqtpzI7ydbs3FwenFHSX1J8zSo4XP1Kz35k4V4AAjI0wp8eGzvbEApbHZi2+KvA/pNbIqtV
 lHPugzmHc0T6kU8co5lWZNRzRUaxOC823esvM1MsOYr7
X-Google-Smtp-Source: AGHT+IFAYA+6vnnr8SCM/H+eqZeLyuLHLskDKcYl1OEufQIqTqJJOv9P9p/qwwl/eOB3iaAHUVtBhw==
X-Received: by 2002:a05:600c:1c0d:b0:43c:fe5e:f03b with SMTP id
 5b1f17b1804b1-43d1d8f387emr4976115e9.30.1741887232039; 
 Thu, 13 Mar 2025 10:33:52 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:51 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 30/43] tests/vkms_configfs: Test adding a plane
 without possible CRTCs
Date: Thu, 13 Mar 2025 18:33:05 +0100
Message-ID: <20250313173318.5818-31-jose.exposito89@gmail.com>
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

Try to enable a VKMS device with a plane without possible CRTCs and test
that it fails.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 51 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 41dee9c2d..17f57c063 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1072,6 +1072,56 @@ static void test_enable_multiple_cursor_planes(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-plane-no-crtcs
+ * Description: Try to enable a VKMS device with a plane without possible CRTCs
+ *              and test that it fails.
+ */
+
+static void test_enable_plane_no_crtcs(void)
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
+				.possible_crtcs = {},
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
@@ -1103,6 +1153,7 @@ igt_main
 		{ "enable-no-primary-plane", test_enable_no_primary_plane },
 		{ "enable-multiple-primary-planes", test_enable_multiple_primary_planes },
 		{ "enable-multiple-cursor-planes", test_enable_multiple_cursor_planes },
+		{ "enable-plane-no-crtcs", test_enable_plane_no_crtcs },
 	};
 
 	igt_fixture {
-- 
2.48.1

