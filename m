Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D842C35FF3
	for <igt-dev@archiver.kernel.org>; Thu, 13 Mar 2025 17:33:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5032410E90D;
	Thu, 13 Mar 2025 17:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OSAIj4Sw";
	dkim-atps=neutral
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8FCC10E90A
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 17:33:35 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43cfecdd8b2so11050715e9.2
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Mar 2025 10:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741887214; x=1742492014; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5DjLORuBSZJAYi3dmv2A+ATJAVcINk4esmAWLLPaq7I=;
 b=OSAIj4SwXRr6wYeYIHjrNIXq6K0oY5KqkFoX/DYuc7H5BKJcpQhz1ua3miQPXpV1gK
 Yigl7+gyEpZIB48b/4/mFovs+PTuBUnOc4o5BkOKKDCA2zusQ9bEGuC/tOjzBH/Dy5CI
 3nPU5jkdSRWAZF+jKVI4Y++bDNy0EGHrtm6dSrGc8i5Bd1SRRRqSSvv6BlJm4+HP4/Jg
 +STbcTeh5cbjCIBgKhMSmZIcmEsXvSATxeve/AYWGXcJNG24DkXmn6H8XPdF8YrSrfqV
 08a3iLRGAfZPGRspS0I1ku+PGxLyhwe612rN1P0jr2nO0WpVoccu6ht/cd4G1l/0XsBj
 ucBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741887214; x=1742492014;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5DjLORuBSZJAYi3dmv2A+ATJAVcINk4esmAWLLPaq7I=;
 b=hXU+k6bqxabKlwLRxv3iYfaJ/8CcYd33aEpnipUDtmUa/NfWU0E2lNXSVBtwFbuELo
 LCztOum91CFy2OWvwuG9mF6Kn/5KPAiajFJlcvFagm+zvOmqMEa1DeiZRI082oZ2AOoB
 O/N+4KWwCs4whTdp/SNRMisi1UOr1BUgJUFn/GanZcMvmINpbS7/lLkyWe/BfmtPm017
 OSeqU95JPO8dokl7P+7aSTLKxMsdrFxRp6kPnw2xHsDGDXNJqmto7BAeEegi2uG+tUP7
 UmH/M9XAYN1Any2SIUM+xIRoItekYNsA/4ARCEHwR/uXihl5blmz3lTOwHf52aJdSTep
 fTmA==
X-Gm-Message-State: AOJu0YxJSKR3Hu7JHvdCf3fqvCDCaAJsRjbREJL32hKbhOjZhVejU/Hh
 GJYpONSfVe6yPGJTXKhPlRMVx3RH9ua2/UMoQIRJ0AZdXyso4d2bIVdozaEY
X-Gm-Gg: ASbGnctqFTTtfDM8F0MNarfihchfqpE8antvf3pst0sf65FGGAL3CNk/6XkqQU8swM9
 cJlha1ry0Uyw9ty05dNLSUGEdIi6l4r6avEC1d+5J7BYqrL/dcVH7Fz+DkMS7dukbDQiSAYTCl4
 a7KHAXOGz8YnIRXePz4n+ML88MbTtDykOjXtxlfxjdFszFfektXXzbwjCh3nsrRTRidvPk77VRy
 srDL+gOXBWESEnmoK3B+0khyxbsPs3Q9ZapheJ34o8FJWesyPJsnwlge7co+uu+m4pkJcICyo1n
 RoMMVFSn5pOJmsdAaePCrkhnXI9X/ffEXdNqZPldoPSj
X-Google-Smtp-Source: AGHT+IEJmhPrWyvjh3bjHdbxPqiwaZvlcu3c/wL5n6Qcvs24DGjVWKHgaVn3h2tECaw5y4qfILhTwQ==
X-Received: by 2002:a05:6000:188d:b0:391:1652:f0bf with SMTP id
 ffacd0b85a97d-396c26e33eemr490874f8f.33.1741887213417; 
 Thu, 13 Mar 2025 10:33:33 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d18a2aab1sm27172625e9.31.2025.03.13.10.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 10:33:33 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v2 11/43] lib/vkms: Test CRTC default files
Date: Thu, 13 Mar 2025 18:32:46 +0100
Message-ID: <20250313173318.5818-12-jose.exposito89@gmail.com>
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

Add a helper to create a CRTC and a test checking that the default
files and directories are created.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 lib/igt_vkms.c             | 27 +++++++++++++++++++++++++++
 lib/igt_vkms.h             |  4 ++++
 tests/vkms/vkms_configfs.c | 29 +++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+)

diff --git a/lib/igt_vkms.c b/lib/igt_vkms.c
index eb3830685..e780e4af2 100644
--- a/lib/igt_vkms.c
+++ b/lib/igt_vkms.c
@@ -226,6 +226,21 @@ void igt_vkms_get_plane_type_path(igt_vkms_t *dev, const char *name, char *path,
 				    VKMS_FILE_PLANE_TYPE, path, len);
 }
 
+/**
+ * igt_vkms_get_crtc_path:
+ * @dev: Device containing the CRTC
+ * @name: CRTC name
+ * @path: Output path
+ * @len: Maximum @path length
+ *
+ * Returns the plane path.
+ */
+void igt_vkms_get_crtc_path(igt_vkms_t *dev, const char *name, char *path,
+			    size_t len)
+{
+	get_pipeline_item_path(dev, VKMS_PIPELINE_ITEM_CRTC, name, path, len);
+}
+
 /**
  * igt_vkms_device_create:
  * @name: VKMS device name
@@ -449,3 +464,15 @@ void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type)
 
 	write_int(path, type);
 }
+
+/**
+ * igt_vkms_device_add_crtc:
+ * @dev: Device to add the CRTC to
+ * @name: CRTC name
+ *
+ * Add a new CRTC to the VKMS device.
+ */
+void igt_vkms_device_add_crtc(igt_vkms_t *dev, const char *name)
+{
+	add_pipeline_item(dev, VKMS_PIPELINE_ITEM_CRTC, name);
+}
diff --git a/lib/igt_vkms.h b/lib/igt_vkms.h
index b5f9a5b24..d44131407 100644
--- a/lib/igt_vkms.h
+++ b/lib/igt_vkms.h
@@ -27,6 +27,8 @@ void igt_vkms_get_plane_path(igt_vkms_t *dev, const char *name, char *path,
 			     size_t len);
 void igt_vkms_get_plane_type_path(igt_vkms_t *dev, const char *name, char *path,
 				  size_t len);
+void igt_vkms_get_crtc_path(igt_vkms_t *dev, const char *name, char *path,
+			    size_t len);
 
 igt_vkms_t *igt_vkms_device_create(const char *name);
 void igt_vkms_device_destroy(igt_vkms_t *dev);
@@ -39,4 +41,6 @@ void igt_vkms_device_add_plane(igt_vkms_t *dev, const char *name);
 int igt_vkms_plane_get_type(igt_vkms_t *dev, const char *name);
 void igt_vkms_plane_set_type(igt_vkms_t *dev, const char *name, int type);
 
+void igt_vkms_device_add_crtc(igt_vkms_t *dev, const char *name);
+
 #endif /* __IGT_VKMS_H__ */
diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 76aa6e432..ab15f29f9 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -310,6 +310,34 @@ static void test_plane_valid_values(void)
 	igt_vkms_device_destroy(dev);
 }
 
+/**
+ * SUBTEST: crtc-default-files
+ * Description: Test that creating a CRTC creates the default files and
+ *              directories.
+ */
+
+static void test_crtc_default_files(void)
+{
+	igt_vkms_t *dev;
+	char path[PATH_MAX];
+
+	const char *files[] = {
+		"writeback",
+	};
+
+	dev = igt_vkms_device_create(__func__);
+	igt_assert(dev);
+
+	igt_vkms_device_add_crtc(dev, "crtc0");
+	igt_vkms_get_crtc_path(dev, "crtc0", path, sizeof(path));
+
+	assert_default_files(path,
+			     files, ARRAY_SIZE(files),
+			     NULL, 0);
+
+	igt_vkms_device_destroy(dev);
+}
+
 igt_main
 {
 	struct {
@@ -323,6 +351,7 @@ igt_main
 		{ "plane-default-values", test_plane_default_values },
 		{ "plane-wrong-values", test_plane_wrong_values },
 		{ "plane-valid-values", test_plane_valid_values },
+		{ "crtc-default-files", test_crtc_default_files },
 	};
 
 	igt_fixture {
-- 
2.48.1

