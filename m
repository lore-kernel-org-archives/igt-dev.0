Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAC7C83F27
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E497F10E59D;
	Tue, 15 Jul 2025 10:25:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nzny3MRA";
	dkim-atps=neutral
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE3310E592
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:42 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3a4ef2c2ef3so3944776f8f.2
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575140; x=1753179940; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fZFhCBgSv99j9l8PjtTlbITEH3N9/9SHnZA8j5cFFMI=;
 b=Nzny3MRACtnpEhjHKo1jHhD72QsfKHa8oc9OG97mMBXKw2pm2pz1PwzucaV05MKqyT
 sPw90oMOapu5hZeQ31X5sD5nrkQMEAI5QCcdUJK5ImvXChdA7BlCnZq3JK/hRwZN1K9S
 3ihSG9RCIoMuTPgcpZdG43apZkjBC3JfRcqaYQVRb4qUU6zQHvH13mu90wW8DVEP5RbD
 /bUUbmRpbVmK4hN8KTejfjSuNKUuCfB0G857dWSi4JtqleQUTIUD6Pn1pBMdJ85ydcLy
 /3d1MS+42dDhgFjTJD3Wzqzbel5rEzj4azECER2+6/aPCpYmv3Iua5kYBY/XHY77Ks1Y
 hSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575140; x=1753179940;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fZFhCBgSv99j9l8PjtTlbITEH3N9/9SHnZA8j5cFFMI=;
 b=cMqTqjcPveXna8jkJLnD9cTlCmbbqiykxm0ygB1s+q0J5k6Mnq3vsX+/IaE1mji8TF
 1vPdse+iqencl7yx1TwEwP5yQw4ESSZatrlA57MamrC9hG27IklLfq47sVHdBFUDfLmr
 gn4/QoMK93oIw/Tq7B9jwJOmhp6+BTDFYXQlfRlucUBHG7hXLKml/afPZAItWK3fIYNG
 W5g70FiRU+D+QkjLttlj+we3g85jW/y7SQPOPUwhUAAATVlri+eW3RtaenBm3k/SLLPd
 L970oAAQkKXqZCLE/TDbLnsKnxoxwDDHRvQCsRGs+Po8hK7FhvbTaTMNW6AQ16wB6oMw
 XfkQ==
X-Gm-Message-State: AOJu0YzFYwk7Qmq1MF0GGbdAuJYzFHVyyf8CG/u8+DFvBJpoLKtMJctT
 2sG6P7wBV9+dHtK4JOejtOaEOr5ubdzIc71kAIGzXF9b7eIDV81g5yh1DlmnZg==
X-Gm-Gg: ASbGncvymTNbWxzjq/G7dTpMuxHE3ejysByDqW6Xjyx9fj77vdh2iuaBl41+EUGx+0F
 pRYjZwq7rr6n1Hq6nM5/+YUN7+cru9Uq2KkeLTE5DD54jx5fjMUbECqTjnUW4HPZeHEnAIofgNi
 brvJVp0AudvlX21CbVKUxbg/ZT/7WNfiHaJpiMbl87mJCSdRFzk3tgBHGJAYJhbxdkRjH1VIW+l
 3LX8jVajLn314xgLX2QEzvdvQE6F4NQG49hpT4r+wWOq5z5Y1cil+tWYrQGFPai6z4YZVnwfqnx
 43huoJ9JsnO5C+xzsAqIN9TdWLPpv8R5+hTJk39VRsaGFi3M4gQfljNfVtfVqpKVckFcuQn2xuA
 CySjdIiID4zY1ANku8w==
X-Google-Smtp-Source: AGHT+IF7l1yjGYFB4ue7xDV2Ax9QIhyFsqb15K607xYiX11rVhVqXKEHuZ2RUvx9ZEEbVrP6fzUZ2g==
X-Received: by 2002:a05:6000:20c3:b0:3b5:f8b3:d4fc with SMTP id
 ffacd0b85a97d-3b5f8b3d530mr7571305f8f.53.1752575140388; 
 Tue, 15 Jul 2025 03:25:40 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:39 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 22/41] tests/vkms_configfs: Test enablement without
 pipeline items
Date: Tue, 15 Jul 2025 12:24:54 +0200
Message-ID: <20250715102513.5636-23-jose.exposito89@gmail.com>
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

It shouldn't be possible to enable a device without creating and
attaching its pipeline items.

Test that the device is not enabled and also that no actual device was
created using libdrm.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 39 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index c36a795d6..c2cb9dbc0 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -22,6 +22,7 @@
 
 #include "drmtest.h"
 #include "igt.h"
+#include "igt_device_scan.h"
 #include "igt_vkms.h"
 
 struct invalid_value {
@@ -117,6 +118,20 @@ static bool attach(const char *src_path, const char *dst_path,
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
@@ -774,6 +789,29 @@ static void test_attach_connector_to_encoder(void)
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
@@ -799,6 +837,7 @@ igt_main
 		{ "attach-plane-to-crtc", test_attach_plane_to_crtc },
 		{ "attach-encoder-to-crtc", test_attach_encoder_to_crtc },
 		{ "attach-connector-to-encoder", test_attach_connector_to_encoder },
+		{ "enable-no-pipeline-items", test_enable_no_pipeline_items },
 	};
 
 	igt_fixture {
-- 
2.50.0

