Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A78C35FF7
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C7410E910;
	Thu, 13 Mar 2025 17:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ui9hoJJL";
	dkim-atps=neutral
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20E0210E90D
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:38 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-43d07ca6a80so8801845e9.1
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887216; x=1742492016; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zJSYPlk2mQ5xb0X70dEJbtugZCVpyemv2qhQ3FNtcxg=;
 b=Ui9hoJJLZ4luvXZy0kfyHE73fv6ibFNtgaDDqZjdJDQsRR28vBHzXdmVlN14RP4CA2
 DTxW9CMmjirW6YXxdGTtvKPLaxRo7m6om+I/oYugozhUck5dG8coSFvh7y1NLq8UBeiG
 FYL34oEzDuO5jKxb+aYlA6R/uY1uQ4d845AoFSGTcevaTW9uey5wlU98pm+tiYXu+ClM
 5s9lYof99C055EYcbu/P+Ir9fuAXnxJopp9W5OV8qaE3ndF3YUMzL9xj8X1CppC/jDF3
 lRADiAoqfx26IHPJ7u9jcsBUBwurGRO+t3BEu3XtZZqCEZSqVIrrqmLlkMCqlyV8UB9C
 BYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887216; x=1742492016;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zJSYPlk2mQ5xb0X70dEJbtugZCVpyemv2qhQ3FNtcxg=;
 b=nYvL5JLE5wDcVktM94SMM/+BDgz3PB5852kQWBjLzxG3DBRuPU79aHKQ7R5zQxad8m
 OEajsIrlGFGo06ZCKWE3knD+UQtEPw8nlNiOKbHI6hSe0U86HaTr4LcJht0YtaPuepF7
 s/qAhW5J1ZW1Lm6btdZSPj3z15SM4yh+W207Z1YTmFIDDwCNrcFmKUDagMPB+HOzF6la
 Qz0KA5iB0UWkX8jjjFuKzptaSazATjFIbdBTZhzsx7tc53C5dNXM+nRM4QSrMNbKQKKG
 SfsMf5Xm3rz3NhvCxkv2tj/s8dWcwIumDu75bxSQOJHaT+lmByZm2HrWMl058eycXE9f
 0jhw==
X-Gm-Message-State: AOJu0Yy52187kojnUR+J2dJYr6tgNtEpsFdXtBRitFgDAn1y45N3i1us
 puICivEqcWlROPFtEBf+4xvi8A5217NL6vERmGtkrAZLFh4H4PDd0RYbBjit
X-Gm-Gg: ASbGncuDbK/e/3aVAZe/pNziihYlLmp2vYY0DCP7zZspoiEaAq8Pa6K+d7xBe2AZnNU
 B/TwLmsAOYI6iox6YinCrQZ2Y6ZrW0udjgL/tHoDlc+R6shXqJ65P4opb3EPssdDSNXWP6Xv636
 agVankbn5XOShQmf03Q/HJ3BKXV8ewHg/e6dACfIfey2iszxN9x0fALCfzSRnlQ2rCMLrpqvPnr
 whgPPDFbR9WAS3d6bzKci75dO1CFKZafaWEiD3t5V0C0TDiLVyQBLnfnKTxj2WNtoLOTRrt1sKp
 l1SvPdsKaqb2+fLkxBZ8+dcyG2oZJUuQTJUqfq0Q8zPC
X-Google-Smtp-Source: AGHT+IEPG9Uf+QM+ymkmfgJDgHHhND2SWFIFnz1e6g8JdSReF5z96g4hlmcDk/ovS675ItL3hfpt7g==
X-Received: by 2002:a05:600c:3b9c:b0:43c:efed:732b with SMTP id
 5b1f17b1804b1-43d1d88f58fmr6207535e9.5.1741887216277; 
 Thu, 13 Mar 2025 10:33:36 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:35 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 14/43] tests/vkms_configfs: Test CRTC valid values
Date: Thu, 13 Mar 2025 18:32:49 +0100
Message-ID: <20250313173318.5818-15-jose.exposito89@gmail.com>
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

Test that all valid values for the CRTC "writeback" work and that it
changes accordingly.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 1d96a627c..860a06f41 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -382,6 +382,30 @@ static void test_crtc_wrong_values(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: crtc-valid-values
+ * Description: Check that setting valid values works.
+ */
+
+static void test_crtc_valid_values(void)
+{
+	igt_vkms_t *dev;
+
+	dev = igt_vkms_device_create(__func__);
+	igt_assert(dev);
+
+	igt_vkms_device_add_crtc(dev, "crtc0");
+
+	/* Test valid values for "writeback" */
+	igt_vkms_crtc_set_writeback_enabled(dev, "crtc0", true);
+	igt_assert(igt_vkms_crtc_is_writeback_enabled(dev, "crtc0"));
+
+	igt_vkms_crtc_set_writeback_enabled(dev, "crtc0", false);
+	igt_assert(!igt_vkms_crtc_is_writeback_enabled(dev, "crtc0"));
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -398,6 +422,7 @@ igt_main
 		{ "crtc-default-files", test_crtc_default_files },
 		{ "crtc-default-values", test_crtc_default_values },
 		{ "crtc-wrong-values", test_crtc_wrong_values },
+		{ "crtc-valid-values", test_crtc_valid_values },
 	};
 
 	igt_fixture {
-- 
2.48.1

