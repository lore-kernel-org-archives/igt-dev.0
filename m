Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71071C35FF4
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27DCA10E919;
	Thu, 13 Mar 2025 17:33:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hwt5uD4k";
	dkim-atps=neutral
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F04D910E919
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:50 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-388cae9eb9fso702609f8f.3
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887229; x=1742492029; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0DMOHxCJ0bnSrFxnaOmpDQxim9uP18qBPaqWkHocuhQ=;
 b=Hwt5uD4kOJchDfep4RrX17VjMfvjeoV+WHQIlp5HsLRGrsc9AQTORj4DSCkCt4RvR1
 /Jz2XrINtEmdoCf1dgwubZY6oV1iyZyG0tAmkGNSlpEo0Lrd1R5LdRq3dDo6ivaaCZ+q
 U162UPpwWsGhEQX3fXA80X8pXuRwvBDVxQnMI+4GSCjY1ymcFCZOBiXjbeHOOWLsisb1
 7sez2aqeB4L54eXBzU1MM+6XUVMdIYv94UUdXJmqT85YLTb+7/DUhHRexsJMKVXfdyoL
 8utV06gA8/s7JBIDic8PzOfa+wjGiVrO9GKk9+swQ28G3BDMFawic/4hUVO4hyp1fU+6
 KMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887229; x=1742492029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0DMOHxCJ0bnSrFxnaOmpDQxim9uP18qBPaqWkHocuhQ=;
 b=qFa251eUzyrbnP+OuZwbgce0vStt0d5eDnJC/uJ6FQeuK/s5Yp3Uqxqx7azwRDndb1
 O3FbJ+dzoUihW76hcVeW5NGAzj4GP2jIruMR9FDPfFpY96Fu2QVHwFPrd+icHUNrwFyj
 lIPZBczRBG7i9jky1TzDPysJuqeC5jCH7yWqsLnjcrTJL2ntQc5JZSMju5sbBGwYNDgK
 iAopQpDtO13HOxDJZUkjDBTZL27GOHsKNyC6fEGyF9w6vBEentocxZPzuPOGfOnKkhbQ
 SZJ3VUIAcrsQhehrgK33D4a4oSoYiEMzgIM+cLaFEA3QWgw4MoVphJKW9EO4uKV3ajD7
 /XbA==
X-Gm-Message-State: AOJu0YwedWXmNkvxOB7kSz6NQCBGxH4cEXdPD11nyYQag+WRWPh9NWZL
 Hsu5dHrsrURWz9e0V69DaM6hNf9hRrsaTorLloeywThdhpSvFdXQeGY96pCo
X-Gm-Gg: ASbGnct54leC/VnnW8wOGVkwhUWcOQTO9zLIFGGCYx/xTPPrjIcU2tspFf/V7p0E+54
 uzBC5RTTC6PyNFjhwsNHBZxkmpjB26Yez+tdKK+s2AmiSOHI80+lQ2TewZ/moZCfsf9rmEP2cxo
 7moIY92xPHYGqiLWH1qUdBS+41lh9Uhe6jvUltq6Rm3M1ZNvTcp4K9zQfnYJ8EUaZm41Dn8EN6L
 giscWuSRr8KgPgveobLxaYIfXkLZFZ2iEGK53is7nc9AOn80QX/Prk7Mvnm0gBaL9k8n3HFcxCo
 31NuxxtSJkdwwiZ96idH0p2QsrfcqYQ+a/9vgupaM6LN
X-Google-Smtp-Source: AGHT+IGhxVIRyyscQEITK4vB4yoCrpIkb3RV2pyKjm8MYObtNG0ohCmHjL3K5e8Xgg0jeikWroSNZQ==
X-Received: by 2002:a5d:59ae:0:b0:390:d6ab:6c49 with SMTP id
 ffacd0b85a97d-396c326e366mr496045f8f.35.1741887228952; 
 Thu, 13 Mar 2025 10:33:48 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:47 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 26/43] tests/vkms_configfs: Test adding too many
 planes
Date: Thu, 13 Mar 2025 18:33:01 +0100
Message-ID: <20250313173318.5818-27-jose.exposito89@gmail.com>
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

The kernel references pipeline items with 32 bit bitmaks, therefore,
adding more than 31 items causes an overflow.

Make sure that this limit is handled correctly.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 57 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 355f8b72a..c40c8b11e 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -851,6 +851,62 @@ static void test_enable_no_planes(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: enable-too-many-planes
+ * Description: Try to enable a VKMS device with too many planes and test that
+ *              it fails.
+ */
+
+static void test_enable_too_many_planes(void)
+{
+	igt_vkms_t *dev;
+	char plane_names[VKMS_MAX_PIPELINE_ITEMS][8];
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
+		.crtcs = {
+			{ .name = "crtc0" },
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
+	for (int n = 1; n < 32; n++) {
+		ret = snprintf(plane_names[n], sizeof(plane_names[n]),
+			       "plane%d", n);
+		igt_assert(ret >= 0 && ret < sizeof(plane_names[n]));
+
+		cfg.planes[n] = (igt_vkms_plane_config_t){
+			.name = plane_names[n],
+			.possible_crtcs = { "crtc0" },
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
@@ -878,6 +934,7 @@ igt_main
 		{ "attach-connector-to-encoder", test_attach_connector_to_encoder },
 		{ "enable-no-pipeline-items", test_enable_no_pipeline_items },
 		{ "enable-no-planes", test_enable_no_planes },
+		{ "enable-too-many-planes", test_enable_too_many_planes },
 	};
 
 	igt_fixture {
-- 
2.48.1

