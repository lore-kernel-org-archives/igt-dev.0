Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F6DC83F1D
	for <igt-dev@archiver.kernel.org>; Tue, 15 Jul 2025 10:25:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27BA10E5A1;
	Tue, 15 Jul 2025 10:25:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LCv0JJyo";
	dkim-atps=neutral
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 223B610E599
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 10:25:33 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3b49ffbb31bso3005145f8f.3
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jul 2025 03:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1752575131; x=1753179931; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/r93bzcq2NMXkJ/nf/+TY1PXTyWCgW2PwWQ84jlyjfc=;
 b=LCv0JJyoFgmmfP2S4BoG/aI8DiBEvbMixoOa/AkpVFdI9S0AK/BrqbTVtOY+BtN7mQ
 BgL0wf4pNo8cWIyjSWpLSpOVTc3ptpqR7bjVcRVhj34gO5/0C1GheWLSlSqsrVV66y/Q
 P9BkLhtz+cPAk6EweK07x3TufYYjwUkiNB0b3Edx/YTiOibvJnCJMilJ28ZO535gdbVx
 WLqUpPs8qP5IydeaG5tDghg2njaHX99FmwwVo5fBDOcPrraeZ5V/fnN4h5cEZz25pXbt
 VCgUfJthHPOYvRMine7arZX4UgcBtFOSEUuSMYl0szvwn83+m+GlIr+wmWtecLbnQYK5
 fRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752575131; x=1753179931;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/r93bzcq2NMXkJ/nf/+TY1PXTyWCgW2PwWQ84jlyjfc=;
 b=j+uU4dXPR4YfP2t4tQCZek9vT5Tq2dqNJfHKF5Qf6ecr60U3LbKO56BJIu+Cm7xq7n
 E86OVJHbOVOgMaeJWhsYG7Q6+0tCPdZcahUpqtY9MbIeM2QIwtQKTD7hKYVcj4vu7GX4
 B6PgHJE327ns5iFYyjP9H8WYVuVm7JUMPS3eSMvHhrgl1O53soCTmlUnZo4LJ3uQ5EPc
 c/gBInY7ETlXM0P2JfMyKJaNZz7EM/g/g/6kX2/vkWK1jUSFMURY57YJJI5xLm/zT/P+
 urmY6sdt6YiawTQVMlX85ozZ5aSp6/PncNXIjmKwjEFYG5vpqHQC2D9FdM5MyeFGijcI
 vo4g==
X-Gm-Message-State: AOJu0YxAqCv8QS8kvqrN+0h8F+5yJURXB9/GSoWBSk2qT61Bh1tNu44U
 iKjkB0TMC+vt5Wl9MWitsrArzKJ1FgRK2M5HPTvibc6XTlwhY6wGHIkRzZsa4A==
X-Gm-Gg: ASbGncvl0KShLHgq0pkOVwjVIyYeRspIH4mQTrl3KXgDf3qeEKDVDshHyLkGUi68NoS
 GPn2DlwTbfNqR8DbWqb12e0B+iMNZ8BscA8Na2d722l97ljJiCpsUM9slhAwZxp+uEH0GYcfEnj
 wFHOBG2VExLzfx3dmDVVPXGoRlu2q9EEl/t8lRTG6IjW5LjipIvLv5zJqXutOuPkD3XueBR37sH
 8oeHAD8BGYK9Cs9b3pbq3NXFVojP0wtgx3APBRcE3KotaffCRCJOzFuk3prVb7rckfx3K2GGVMW
 CaPCTnri4WuFrtF8ZAiy9BN5xdq8LKlKooFd4MnOnyUh8Qs/KvKdh05volm9pLaauByMlChNR5t
 uexKHm6a7/8/39/reyuysr3TtMdJ9
X-Google-Smtp-Source: AGHT+IGtJwP+IOcC/rvogzW4W8GHdxLDEUA7MGwXUU7nGYXHnX8IvipwzKrJobbAEG4gNre8nhItKA==
X-Received: by 2002:a05:6000:4412:b0:3a6:d145:e2cc with SMTP id
 ffacd0b85a97d-3b5f187e927mr9383112f8f.15.1752575131133; 
 Tue, 15 Jul 2025 03:25:31 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4560394e061sm100368305e9.31.2025.07.15.03.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 03:25:30 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v3 11/41] lib/vkms: Test CRTC invalid values
Date: Tue, 15 Jul 2025 12:24:43 +0200
Message-ID: <20250715102513.5636-12-jose.exposito89@gmail.com>
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

For a VKMS CRTC, it is only possible to set invalid values in the
writeback connector status.

Test that setting wrong values fails and that the CRTC status is not
accidentally changed.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 18 ++++++++++++++++++
 lib/igt_vkms.h             |  2 ++
 tests/vkms/vkms_configfs.c | 26 ++++++++++++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index 0c3c9812a..0a14f9af7 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -509,3 +509,21 @@ bool igt_vkms_crtc_is_writeback_enabled(igt_vkms_t *dev, const char *name)
 
 	return read_bool(path);
 }
+
+/**
+ * igt_vkms_crtc_set_writeback_enabled:
+ * @dev: Device the CRTC belongs to
+ * @name: CRTC name
+ * @writeback: Enable or disable the writeback connector
+ *
+ * Set the VKMS CRTC writeback connector is status.
+ */
+void igt_vkms_crtc_set_writeback_enabled(igt_vkms_t *dev, const char *name,
+					 bool writeback)
+{
+	char path[PATH_MAX];
+
+	igt_vkms_get_crtc_writeback_path(dev, name, path, sizeof(path));
+
+	write_bool(path, writeback);
+}
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index 23c0560f8..90cfde77a 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -45,5 +45,7 @@ void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type);
 
 void igt_vkms_device_add_crtc(igt_vkms_t *dev, const char *name);
 bool igt_vkms_crtc_is_writeback_enabled(igt_vkms_t *dev, const char *name);
+void igt_vkms_crtc_set_writeback_enabled(igt_vkms_t *dev, const char *name,
+					 bool writeback);
 
 #endif /* __IGT_VKMS_H__ */
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 7f0e07121..1d96a627c 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -357,6 +357,31 @@ static void test_crtc_default_values(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: crtc-wrong-values
+ * Description: Check that setting unexpected values doesn't work.
+ */
+
+static void test_crtc_wrong_values(void)
+{
+	igt_vkms_t *dev;
+	char path[PATH_MAX];
+
+	/* Test invalid values for "writeback" */
+	dev = igt_vkms_device_create(__func__);
+	igt_assert(dev);
+
+	igt_vkms_device_add_crtc(dev, "crtc0");
+	igt_vkms_crtc_set_writeback_enabled(dev, "crtc0", true);
+	igt_assert(igt_vkms_crtc_is_writeback_enabled(dev, "crtc0"));
+	igt_vkms_get_crtc_writeback_path(dev, "crtc0", path, sizeof(path));
+
+	assert_wrong_bool_values(path);
+	igt_assert(igt_vkms_crtc_is_writeback_enabled(dev, "crtc0"));
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -372,6 +397,7 @@ igt_main
 		{ "plane-valid-values", test_plane_valid_values },
 		{ "crtc-default-files", test_crtc_default_files },
 		{ "crtc-default-values", test_crtc_default_values },
+		{ "crtc-wrong-values", test_crtc_wrong_values },
 	};
 
 	igt_fixture {
-- 
2.50.0

