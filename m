Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04942C35FF6
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:34:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB90110E920;
	Thu, 13 Mar 2025 17:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QJWTQxQS";
	dkim-atps=neutral
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0637410E91E
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:34:00 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so8564265e9.2
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887238; x=1742492038; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PiGbkQCEBJxn7LuzFQA0QohikwmNnVo2jQdb6iV1j7I=;
 b=QJWTQxQSw9FLo8AEaKzTPRqTJ0zf9iOpS6nUVSzmeJmGudySSrU3HjsmLrHtxhYQWn
 MxqIa+y5NW8s/Ig0oFJ8Gg2BfQKRcKqjxoACe7BErt7uK9INqfz5ugPStNxP4HQ1/Oju
 jXFexI70peBRQwzl6tOJYqYJi8ZqTWAbS9TtIwCI8Hqb6jweFl/ZInPfzrb7DIOuDgis
 6BtN6CecbA8mZmeQgZjCZcuID6J9rKTKPTZVkgcv08VeUJC2VRlj/jIgJI80wkIGcnqC
 4ej4EayJLvIIbT+gPSF0q+PFuJYFZqs9K+00usquvN84N2JSHq49B/fnhl1muCELvH2I
 27GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887238; x=1742492038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PiGbkQCEBJxn7LuzFQA0QohikwmNnVo2jQdb6iV1j7I=;
 b=IYsCbkj6yuh40X3AwWPD4nnjKQi1VgPDkZuTTdChPl/6gdJ4Fh1JMgxPG6GV7yCkSP
 u8B2efvMGzN/lGvkrO9iPS6aA74ZEpqJ47HsgV3rhwaHvZ0nONUjeXyAN3rvKhILZbxN
 Agpz24xkMsqRgIxa7PXJK6/zlB5kZosuAN/MZabrAslztVYfVpcvidVV+7dHw4Umwmxu
 c4IKw+8xp4U6/12aEctXPskENvYuOwtddS1mLWmB+eEan8ar1RPSK69kJ/0tytXke2ZA
 9/lDsLcGkzs7ZS+5xeQ7UvGxgg4DUr6gd6sAMCkkaganYkBaquFGxLKH/SYVF+EtWtRW
 sOSQ==
X-Gm-Message-State: AOJu0YxHhxmMVcGsXkVRValteoUMAaJZhpk323kNuGnEtwC3iCGmqGzU
 Le7LOYzF7TsKennrb2NN7jEJrjS1r6BSeNoAgI/hBUBRh9zmHWzXSl1u0fAu
X-Gm-Gg: ASbGncvs1w3LjZBDP3KfDXwEFLEVTpqmK1qdH+3r0SS+R6bVPs11n5etIWRsVvZvwS/
 izqD/Mm1XenhKeW7dGMMVaK8m00JpKEAJ0e581FYaQC4cWJjyQ9pURyMNadQloRt3Ize06BeCWE
 lBle7H1zhj9qL9rB58TPvOajdAvXfnHNgOLYdETCaAoTDVT5GHvxSRBB0TqEcBgcEcZ59nE/5Sn
 Jvc564V9nPIpxLTXaUheqBybtdcWlXpBrEjJ5Tb5LzLxXQDbGWKcJ+OHuyIYmx3dDaYAnaC3bLR
 3KaLva70jLemwgSS5vx/IYZruoUFtToXEsMRm4Oquzje
X-Google-Smtp-Source: AGHT+IFeoOBqbH37riymwBzjJEcNjEzxsgj2y1g+WJGv+IsfilIz8n9nhEiJfC+kr02gggxJUgjaag==
X-Received: by 2002:a05:600c:13ca:b0:43c:ec28:d301 with SMTP id
 5b1f17b1804b1-43d1dd036a7mr512895e9.26.1741887238123; 
 Thu, 13 Mar 2025 10:33:58 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:57 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 37/43] tests/vkms_configfs: Test enabling a device
 without connectors
Date: Thu, 13 Mar 2025 18:33:12 +0100
Message-ID: <20250313173318.5818-38-jose.exposito89@gmail.com>
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

Enable a VKMS device without adding connectors and test that it is
created with the specified configuration.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 39 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 8fb5f9569..a915cb15e 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -1404,6 +1404,44 @@ static void test_enable_crtc_no_encoder(void)
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
@@ -1442,6 +1480,7 @@ igt_main
 		{ "enable-too-many-encoders", test_enable_too_many_encoders },
 		{ "enable-encoder-no-crtcs", test_enable_encoder_no_crtcs },
 		{ "enable-crtc-no-encoder", test_enable_crtc_no_encoder },
+		{ "enable-no-connectors", test_enable_no_connectors },
 	};
 
 	igt_fixture {
-- 
2.48.1

