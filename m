Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CCCC83F17
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F03810E1F4;
	Tue, 15 Jul 2025 10:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="YbpnShVw";
	dkim-atps=neutral
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E99910E59E
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:38 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-4560add6cd2so20672775e9.0
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575136; x=1753179936; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9roE24eyVN3/jKtWJ1YTDuaPdvKrpSy1K/oX9A7K8+I=;
 b=YbpnShVwWK5zboYLmaiL/KLpFn8pyt8aEstghT+CX0cPWe8G/INUeOsQ0O8Z+VziDu
 2QKKsF+RILK+/qzudY7jCi4UPLCWK8UbfsCZYgErSjgvqX38tDTQJmNzl+bIDdJitDdY
 UK502Wyg34UrzklxQHKg7vXNlCk++i1veXjgkgPr+NcuehLF96ZciincDUQGmtL+CIWs
 l2IKToSeyyY2o+AdKPvIsPfK4/CFnxgT1P87eb1G8RuHD9NPHHz3U0ejwYtCIbeg2o4w
 YjU499dnQp46Y36aQFiAxbO6r3GAQW0OjAvmsrKLmQe+DoCUTtrC3J3A8wrZl+Zc4XZ0
 zX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575136; x=1753179936;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9roE24eyVN3/jKtWJ1YTDuaPdvKrpSy1K/oX9A7K8+I=;
 b=U+LNJP1P4yl7nQWYjzpwRs0E67s4wBn0sSW7wgwgfRjg9dcSM6h7IU02pqyxlYnqId
 8rQX1W4i0wnvfMgAzMj6UXkJsrYXRJq95VVqNJ+Is8ARylBfpL1Mlr6spVXLphLszlwF
 YBBM1f+wkhaythWd7SSeVg0YmzBYClPW0fGH2LZplF7qEIOgFsec1UMN/802CP723yag
 XjnwvIM6fRUO8rLov4A5gswMHaE6ltyMFXwAnbEvEkM+ZpkQk8MGrdS9kP2/SSkXI2Zk
 q1uQLm3o/zcARNnnqSdvITsSF1nrJ10carQyIdEc8O1gSQ+nScMwzgBlcbO9c6H028Nz
 6nrg==
X-Gm-Message-State: AOJu0Yx5cI+A7H/y2GQTVXZW9Y0RSyIwjiBHemfhzg9qaPdfRJjK9/l3
 CfAY1okrfg+n9MeXSQhCBR2TKE2VCAH0rcsD8o1N9YTvZ7rRyS3YfHdN7WnHXw==
X-Gm-Gg: ASbGncse2WjYs9iGPT9jYmbsoKq9dlq3AytQ2QQCq6ZXjT9ix4iEkzaYaTFu4XPFDgg
 /OoVMPsenv1b6AMA3EDzrXhE8faTVJGUntBi/ZNQNk8yjI1M9joZo8vk+7YpQS8/ixM7GpZCDz5
 as/+ZDKFxyJo7KKcQxs0/f78a7a/JNamm5qCJrAslEEoheQQ7FZTuvawWsxsc1TvWoUbpAbYdc3
 OcJiCx/CDTDX+SGe1lpSJ+og539iGxsHfkIwr2NvJKgXdLsFcolz/G76QKT/mOuIxRukSYBj1HO
 PXpG6uke6j94kGq9bCC9kX1o04i/KQRqTjap/5Fdw774FlUwqnOa+KUtfVQOTKhjH0U87V6R91x
 yLjzEYYNK0apss67shA==
X-Google-Smtp-Source: AGHT+IGxWd8n1YQiBrXxYhd4BZ3M1q+Jjpjwsg/HbxkytN8UqyyKKRfdZDqiR7ofhCnWM8Hjpy2wGg==
X-Received: by 2002:a05:600c:548c:b0:456:22f8:3aa1 with SMTP id
 5b1f17b1804b1-45625e124d7mr25984335e9.2.1752575136097; 
 Tue, 15 Jul 2025 03:25:36 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:35 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 17/41] tests/vkms_configfs: Test connector valid
 values
Date: Tue, 15 Jul 2025 12:24:49 +0200
Message-ID: <20250715102513.5636-18-jose.exposito89@gmail.com>
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

Test that all valid values for the connector "status" work and that it
changes accordingly.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index c74bbc15f..407310e52 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -535,6 +535,36 @@ static void test_connector_wrong_values(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: connector-valid-values
+ * Description: Check that setting valid values works.
+ */
+
+static void test_connector_valid_values(void)
+{
+	igt_vkms_t *dev;
+
+	dev = igt_vkms_device_create(__func__);
+	igt_assert(dev);
+
+	igt_vkms_device_add_connector(dev, "connector0");
+
+	/* Test valid values for "status" */
+	igt_vkms_connector_set_status(dev, "connector0", DRM_MODE_DISCONNECTED);
+	igt_assert_eq(igt_vkms_connector_get_status(dev, "connector0"),
+		      DRM_MODE_DISCONNECTED);
+
+	igt_vkms_connector_set_status(dev, "connector0", DRM_MODE_CONNECTED);
+	igt_assert_eq(igt_vkms_connector_get_status(dev, "connector0"),
+		      DRM_MODE_CONNECTED);
+
+	igt_vkms_connector_set_status(dev, "connector0", DRM_MODE_UNKNOWNCONNECTION);
+	igt_assert_eq(igt_vkms_connector_get_status(dev, "connector0"),
+		      DRM_MODE_UNKNOWNCONNECTION);
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -556,6 +586,7 @@ igt_main
 		{ "connector-default-files", test_connector_default_files },
 		{ "connector-default-values", test_connector_default_values },
 		{ "connector-wrong-values", test_connector_wrong_values },
+		{ "connector-valid-values", test_connector_valid_values },
 	};
 
 	igt_fixture {
-- 
2.50.0

