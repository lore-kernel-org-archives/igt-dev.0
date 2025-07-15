Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E35EC83F17
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8B510E5A5;
	Tue, 15 Jul 2025 10:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MKmmoPvp";
	dkim-atps=neutral
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BC010E5A7
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:47 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3a6e8b1fa37so4229767f8f.2
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575146; x=1753179946; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uD8US4ofZ9JrLQy473ECqkfmQOC2SMXawcgLEBtCDzI=;
 b=MKmmoPvpKniMkt2Y4KxOaoK/wsKFtgIerUD95s2jW3tkTPgC7z0C3MLPTHZRwkm6fL
 6mDeL7h8S0cE4BxpxfM0KjJMHKYi1KsmSfmBCpn8TetnHzoJ7TB5jFz4oV03seo2ExoW
 pqF3N1nqvhyKOioGdoXgLHi2b0rz4pQvHhs8of48z7URwmfvE6aEoKq5L9DFhtjY+oN4
 QFi6wDgi4+4gK9fK6/htre+2lNjIEgCK6ivCL2NbnnVz/DkVCEu4KFOFmxmKt6bgMLfR
 0uA88ZnkuKGp3pOEVlD/Ko24SU2W9aYnPMIBELP82SqCmi62jIlmJL9uLgIj3ZY/TzUh
 1hOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575146; x=1753179946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uD8US4ofZ9JrLQy473ECqkfmQOC2SMXawcgLEBtCDzI=;
 b=eNJQ//xkgEJVmGTc/ZUwmubP9EOlN/D571zj5MRBFAjEFrSBR0Aknnbg8B/KyjUtbF
 hR84ha3RcXBhqLSk2ywVYjbAEx17GBZ3YFRIdQZyAOTmKO4UNai42W7qVtuTPNHWZPk5
 o29p2MHSNjXaLrxqQX+0cBYWxn8ic/8eB5HJxtRoUvrawDfYNtVuasqi8u7wcdSBsFda
 OBM10dLHV0wCrcZFzSID/Ebsw0uxTqRqf3gTejYZ6eJQIl7EfKj1qstKSiirpIqiNWjD
 Im1S6knOURe3QTuySjRt3v0NDR7ks4arp3rfIFpoFI396QMSjXYJWQrM0wGZHiyKDzJw
 QxCA==
X-Gm-Message-State: AOJu0YytVL9FSGr275RoO7rc/j8conC8zeqSfe7el6EmPzT2deLbUnoh
 WxSs9WqHw451AthvEONCovT6+F2Cdudb4sF7WjL8kS6513L3jUgC34K/3o5ZWA==
X-Gm-Gg: ASbGncusddEXeDzxTI0nAtC1lV15HBY9PSUsAt/gU8wwOMD6fiqjFcevl6TlbIeS1VY
 jDqWsbL5D/Nn5KZZlnnPzI/Ah0yrBIp73Kw6ac8kPCb97a41RlOlTnCInwmvQVmJWLqTMsVDa33
 MGvyU5l6VAFCBCE4M9wWTHGbuU7GJolZC00IEvUsZOeBNvy2/Yy+6jTKQ8WmMsxb55L2X4If/Tn
 CbVzK0B7ZCrYfce2PuHuOs2cgK7FgFw1nEHt2rRNM2epVDgkhDN6ztcmwTizcLtSgSKyFYT/aQm
 fw53IZggX06Td7eqTrPBTbpuTM8yOw716kW2IvSaJgc+0hckuOkwxhA+DELiza4/QfSQuosmhTH
 xiLGuYxKFTz4hD49cMQ==
X-Google-Smtp-Source: AGHT+IFuUwQsoxCNNwa9DzUPbgF9oKscXwC4bLimoO84B1G0+oOLxBN0gemVRd1I3Y1Cl1wkHGOVmg==
X-Received: by 2002:a05:6000:2dc3:b0:3b5:e2ca:1c2 with SMTP id
 ffacd0b85a97d-3b5f187d0c6mr14649553f8f.2.1752575146057; 
 Tue, 15 Jul 2025 03:25:46 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:45 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 29/41] tests/vkms_configfs: Test enabling a device
 without CRTCs
Date: Tue, 15 Jul 2025 12:25:01 +0200
Message-ID: <20250715102513.5636-30-jose.exposito89@gmail.com>
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
2.50.0

