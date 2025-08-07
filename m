Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60853C87FCF
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102F910E815;
	Thu,  7 Aug 2025 07:46:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dKlnxFYI";
	dkim-atps=neutral
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 040A510E807
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:18 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-451d3f72391so5926975e9.3
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552776; x=1755157576; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1eQBOYGrlKKXUic5OMLEt1dZdmb+Ss3s6kE43aCh0Bc=;
 b=dKlnxFYI5LFkD50a9wVIy3iwujtrzP95fMM4IPOPnJsYXpY9x3h1z3usAqwEanwnJY
 N6bh7U8EygH5FmY5rJAetRlZIchpUnw3ZP0QbQzz6PQ/aTji68qVBUi8DYG71BD0wD9S
 nUQqWAaWRngbvEnvCflBDLmBG+/J7XSDwjqOuZETkvQr1vkWWGHWL3Rr0GQq6hoYy7/Y
 nXi6hMUbsqbT+vQgrvLH9qBfvM3P2fx3y59SslfpQtjCFJf/P0SpSRfKcySWiATzcXah
 4pH9z/SaHdE+Z5cTVmMUk6mIUbyiNrA9hQYF2YnTMuOZ+7YQgnnJ8iNNd8Ohc94GuYCe
 PZKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552776; x=1755157576;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1eQBOYGrlKKXUic5OMLEt1dZdmb+Ss3s6kE43aCh0Bc=;
 b=lX+oWIZAprNA/hyHr7tih4CNK1CQELyFAy+UwvwG390fwg7DtHd9Hh4E9PdQ40nv8M
 Bwe04XcE8TRzmSX8Zj9A7STlwc5yjUVBJtKZpmZX8g6oZKUAeGnci0OMzJGQiVzEPLeo
 rfNSXeOdreAfLWi8t4g1+CxjKqFfoLEUU/OeE5uA7PTjT30eug9y4hp1FvFs5HA6BhqL
 fbMYW++e5SK0LCXcPtpw16IhECpu4U5VhEENhsIMKb+pJagvaZJDB3xYmv5TOT2lPaCC
 +AsW5PyE07F9Jz/idOci3n2s4ZePRKxtFaeOA+ROWAb9nckIdYHO3yPLJ7i0W9+1armJ
 l5Cw==
X-Gm-Message-State: AOJu0Yw8Kaa5hFoKT8uTVUKyoZT//XI4kMoh77rkEKQMlYyzXIJ7BoXz
 MhWT6+hfY10MubmH5iC2l+2G9CyfPm/Ymm0xJk0ZWC0bg51716smJODiFfXugc18
X-Gm-Gg: ASbGnctQiwoiki+lzWz8Ge0uALSvhaiIv9I5gFejSBxe2yXCj+mH+DgWEDBmYtuGFA6
 eczGRQbsAcglf3NVFzgGzJDhnaXOP4c+ngMnU2lZYjXlHT+MotHeMHhKew15XFG5ROUWxgaBZbU
 lpGjeqRyP6rTpL4DjoY6E4YNQEOWf7F0mE3XBtYWW/yUo7HYPD+0HiqymSP5ik2zsUgZxWnyewT
 pUE+iH6kP5hAIK9vATHZibUWVKA/crvy5pnWnUqsbs/3s+zqVqWDFW/yL3K0737eE5qqPW/1Sbj
 5XaSMxAJGaGzA7qgP/VCJpAmFlBOAMlt1M995IPkArx5nrn+4dx41r9hnttJ6Ze3igqjJ6rzgsS
 qqfl5RC+1Ynw+yr+iO1R9fUtGV23hhg==
X-Google-Smtp-Source: AGHT+IGdNuUMtNLSjiDzrabedvGavGaYDrPzO/Nxb60rIcBDvbASV9r3SGQ4S6A7UJ1ytTgDJFJ7bg==
X-Received: by 2002:a05:600c:3103:b0:459:e20e:be2f with SMTP id
 5b1f17b1804b1-459e708e76emr60889785e9.14.1754552776132; 
 Thu, 07 Aug 2025 00:46:16 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:15 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 12/41] tests/vkms_configfs: Test CRTC valid values
Date: Thu,  7 Aug 2025 09:45:21 +0200
Message-ID: <20250807074550.6543-13-jose.exposito89@gmail.com>
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

Test that all valid values for the CRTC "writeback" work and that it
changes accordingly.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 0a62f3d02..1fec83602 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -381,6 +381,30 @@ static void test_crtc_wrong_values(void)
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
@@ -397,6 +421,7 @@ igt_main
 		{ "crtc-default-files", test_crtc_default_files },
 		{ "crtc-default-values", test_crtc_default_values },
 		{ "crtc-wrong-values", test_crtc_wrong_values },
+		{ "crtc-valid-values", test_crtc_valid_values },
 	};
 
 	igt_fixture {
-- 
2.50.1

