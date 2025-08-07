Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184FEC87FDA
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD14510E7FC;
	Thu,  7 Aug 2025 07:46:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jr+dBWiF";
	dkim-atps=neutral
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 089CA10E80C
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:42 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-458aee6e86aso3871895e9.3
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552800; x=1755157600; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oxe9xUmOiUIW+ae50cNfXSeP1MzSwpa3VJvWMmIGISI=;
 b=jr+dBWiFQ6/gNE+BY1F0PyervWe1SQPuEvw66YCVe28AgGGfYyF6OmF66L21/3xr+t
 JmEImIkY0ICwogInn9h3VwqWST9P5j75HvHt12wsrAnXo0PF8jQPmX9Vh8vVTVqE+KI4
 VDs6+D2tviLPeKWfA8h61hW2dkOU1bQZlRAJZ5mpm4sGTZ3OnnKPZGKWjJVEo+UEnv5x
 VcwOaX7uTMa2YzZfPYAuUElCquf4vkVqxz8KkygH+hmFvGuE7sAqPZUpwICsg8uQdrg8
 kH+3UOfXSIa5dDrR1LeD1bRnlwQLO6bPES96GxOLjhvZhg79BbgcLsXzfno05AMDGlWl
 9SMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552800; x=1755157600;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oxe9xUmOiUIW+ae50cNfXSeP1MzSwpa3VJvWMmIGISI=;
 b=kmDbk5Eklgj1J1XVRP48cNee6PCB55TUoV1Cqu+d3gmH8+KhcQXV7vHUfIflrL3L3T
 Zp82WvCWmZk6DOqYms1gGKWVbUa3gsJyP7Xpls7IqyBro5L8yhEfZvUBjsXoSTUv00MC
 ULvqrKhi6+qhsqJfNObWJAXAu+A6bm6zZB13AzL5MEjH/CTOKPUqD5H/bxTqPXa9e71b
 LwvepOqGnNYUON0mAvzWPb3w7B8MASJS7tq82RmHtbXGupZ5c2wMDI0iVUaNhXNO2ozr
 DySFM4/hhSwQ/ds6EqPgMqV07hsEzaeYyh9LYkgmVLzmAhaNsCxrwD2A2EK76X921+TN
 FJOA==
X-Gm-Message-State: AOJu0YxBxCstn+HSkL1JmFkiJVGBVGlsYgrdZ4AO6qakLGITpFOroeET
 ihzPDZW6VsZMWmelzcVhwoFggOlHTz53/Hcxb9Tidlwp60LaXxPw8y2OV0ObIRE4
X-Gm-Gg: ASbGnctguNl+VnNQSwXQzzCoOmpQ4rxwSnoNHTpcCx6Sr0XCD+tI9CAZuyznpt1t7hB
 HRvRhUZuSMX40opJ+XUOo1DQ0CsKkBitTJtHAdCOYPNiJIkdCzlWeRCrduoa8vGsVULKEMNLvA/
 bteShauOW82DX0Vx477LHSU68IH8Z9R7wkbDMN9d8FLn/mqq6QFC7MWHpNtp+018F8OOtMgZ0Dz
 qOUq+aO6QW9jspTlUJLASlMs0aNWpF8I3fFtjq+4FmjBFQbHHfpLnyQKyZ8WFv9GygeZwc4bcZh
 w/FYlsYjO3KA5O+8jYko78EvAXETKKMigXY54NEIni38hl9I57prme/1OQaWA5zKYA2UzkQ1/sT
 DEu4pnhNX7VX38GiieTc=
X-Google-Smtp-Source: AGHT+IEgLDTz3k4lMY7dWJyGg00+41g6lhfcw6Q1zmlfCAc3sqE2SXDeIrtQdVmsr5mDbohvS/a0Mg==
X-Received: by 2002:a05:600c:4fd5:b0:456:26a1:a0c1 with SMTP id
 5b1f17b1804b1-459e70eeb5cmr60130725e9.17.1754552799977; 
 Thu, 07 Aug 2025 00:46:39 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:39 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 35/41] tests/vkms_configfs: Test enabling a device
 without connectors
Date: Thu,  7 Aug 2025 09:45:44 +0200
Message-ID: <20250807074550.6543-36-jose.exposito89@gmail.com>
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

Enable a VKMS device without adding connectors and test that it is
created with the specified configuration.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 39 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 0b6d395cb..d9cbc24ae 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1403,6 +1403,44 @@ static void test_enable_crtc_no_encoder(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-no-connectors
+ * Description: Try to enable a VKMS device without adding connectors and test
+ *              that it fails.
+ */
+
+static void test_enable_no_connectors(void)
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
+			{ .name = "crtc0" },
+		},
+		.encoders = {
+			{ .name = "encoder0", .possible_crtcs = { "crtc0" } },
+		},
+		.connectors = { },
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
@@ -1441,6 +1479,7 @@ igt_main
 		{ "enable-too-many-encoders", test_enable_too_many_encoders },
 		{ "enable-encoder-no-crtcs", test_enable_encoder_no_crtcs },
 		{ "enable-crtc-no-encoder", test_enable_crtc_no_encoder },
+		{ "enable-no-connectors", test_enable_no_connectors },
 	};
 
 	igt_fixture {
-- 
2.50.1

