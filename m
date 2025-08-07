Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC65CA0EC0
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3381B10E804;
	Thu,  7 Aug 2025 07:46:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YzrxFJki";
	dkim-atps=neutral
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C92D710E7FA
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:28 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3b783d851e6so558730f8f.0
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552787; x=1755157587; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mZXjD1lEOfXkuhYQ2W9ZVjaPqYuGKvrnM/ijfLCUSY8=;
 b=YzrxFJkiJoJX2ooLnko7M6Mg6nsfPgy5r/CEfV2k96nmINHt055nmcsJoehZbtfbjq
 FQMsOn6ccaehbisIM6t+QUkmSGSQVIRfu9o/j0WHqF1/cKhiKN3Q0oWvdDAj6I9vt1lZ
 +R9D1pyfK+Fjpq6dlUxR76JiEbyTA2lm69rPjVCt7zfQKHV6O9/Xq+xV7cSZL70BYxJC
 xFm4YUMVI4VbLTysSez8iZ66DsDjl4hqJlkRfcSzEbcg62ZdDEXFjrn+J7BK3eju6ZoD
 URN7s9mBr+filM6QSdoFJ9oxH+R4qPvdZRt5rSaGN+tVBt1PoEPvJ5joG3uWcPTrd689
 ajJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552787; x=1755157587;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mZXjD1lEOfXkuhYQ2W9ZVjaPqYuGKvrnM/ijfLCUSY8=;
 b=XhqmkYi8Mfe03Q2y03B3Kxi3OtJamhaxHEOJxUmPtshVpJtmnRy+Dxg1N844Hl74Ow
 OPZ3vjDpiiOuAUi5bhlTc7bJtuwKYKsXuKWN2aMAOihlXYSxHnFh6JVCw4ugM7Yuer9j
 W4wEztT/hXUCDHbtKk6PPmNtAu0677ezO3dlPDe1BHN8jUdxg3qc2u2xXFV52l+DL/uu
 88gm8WrTK0lZCQ+JF5/K7ESUmg8Cl72zlnuH6IR3kpop44i5QFSbpPKkoY5VcS8Id5FL
 DZn6VmQOLTbpXl056fueyomvODF5K0vFrcK2Q6z/If1VQyS3qGwR7f7bsc3y/i69w9b4
 hHiA==
X-Gm-Message-State: AOJu0Yw2CbR57Krh60x6koaOAtPtZePfDgQLYcTgc1NskeznWaN1okyE
 0/6kwaIGN2BU5TXBiEefsyaOG8ViLhSqTvB55bW/2rPhtXckpODXEAd4sXMQisGA
X-Gm-Gg: ASbGncs8ujPOBM5KWkn4baI5EvM7WavyS7vpGmq5mXjjovORbR9PJGbGgUGeYPdPFQC
 L7xlykLLARbN84bQ5Eh/REVV7SVDizhl1uDERURMHGRGc8n+oFJvxz8Di3SJONrC0cr2fqIbQ7H
 Jdh2FVAV9mblQxWTihC2gtjXlq692bxupeZ4x8+dRamMLunraRSLklV+w7d4dQeLEwQog7a/5m0
 EcULJSsR/WcEe8tlsR2SkCqUocPb3ArLTQwo7HebqPUKzbx893SgkjttamaX5EdE74oBUT0c+65
 S5P35bje9J5lnRYoshVcDIS9JIq0mXEoX0kQdC3u8c+i39N+sn4k10Tz0pCXCWHJbKuKcBiM3px
 2rlaSj55Qh16zzeYIWBo=
X-Google-Smtp-Source: AGHT+IGIcA3o0/4fu6vDOGwzLRUCi7Z1TmKaSD0pE/CPTEfAXzMGmpA6xEJgv8Us5CXtXMmhNZuF3Q==
X-Received: by 2002:a05:6000:2310:b0:3b8:d955:7e9e with SMTP id
 ffacd0b85a97d-3b8f48d8d46mr4199577f8f.17.1754552786875; 
 Thu, 07 Aug 2025 00:46:26 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:26 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 22/41] tests/vkms_configfs: Test enablement without
 pipeline items
Date: Thu,  7 Aug 2025 09:45:31 +0200
Message-ID: <20250807074550.6543-23-jose.exposito89@gmail.com>
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

It shouldn't be possible to enable a device without creating and
attaching its pipeline items.

Test that the device is not enabled and also that no actual device was
created using libdrm.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 39 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 8391513ea..2156b59ca 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -21,6 +21,7 @@
 
 #include "drmtest.h"
 #include "igt.h"
+#include "igt_device_scan.h"
 #include "igt_vkms.h"
 
 struct invalid_value {
@@ -116,6 +117,20 @@ static bool attach(const char *src_path, const char *dst_path,
 	return ret == 0;
 }
 
+static bool find_device(const char *name, struct igt_device_card *card)
+{
+	igt_devices_scan();
+
+	return igt_device_find_card_by_sysname(name, card);
+}
+
+static bool device_exists(const char *name)
+{
+	struct igt_device_card card;
+
+	return find_device(name, &card);
+}
+
 /**
  * SUBTEST: device-default-files
  * Description: Test that creating a VKMS device creates the default files and
@@ -773,6 +788,29 @@ static void test_attach_connector_to_encoder(void)
 	igt_vkms_device_destroy(dev2);
 }
 
+/**
+ * SUBTEST: enable-no-pipeline-items
+ * Description: Try to enable a VKMS device without adding any pipeline items
+ *              and test that it fails.
+ */
+
+static void test_enable_no_pipeline_items(void)
+{
+	igt_vkms_t *dev;
+
+	dev = igt_vkms_device_create(__func__);
+	igt_assert(dev);
+
+	/* Try to enable it and check that the device is not set as enabled */
+	igt_vkms_device_set_enabled(dev, true);
+	igt_assert(!igt_vkms_device_is_enabled(dev));
+
+	/* Check that no actual device was created*/
+	igt_assert(!device_exists(__func__));
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -798,6 +836,7 @@ igt_main
 		{ "attach-plane-to-crtc", test_attach_plane_to_crtc },
 		{ "attach-encoder-to-crtc", test_attach_encoder_to_crtc },
 		{ "attach-connector-to-encoder", test_attach_connector_to_encoder },
+		{ "enable-no-pipeline-items", test_enable_no_pipeline_items },
 	};
 
 	igt_fixture {
-- 
2.50.1

