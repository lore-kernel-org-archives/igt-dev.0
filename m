Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C0AC87FD2
	for <igt-dev@archiver.kernel.org>; Thu,  7 Aug 2025 07:46:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4358910E805;
	Thu,  7 Aug 2025 07:46:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bq0FysfM";
	dkim-atps=neutral
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5006F10E7FD
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Aug 2025 07:46:23 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-458b885d6eeso3922105e9.3
 for <igt-dev@lists.freedesktop.org>; Thu, 07 Aug 2025 00:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754552781; x=1755157581; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2XC2XPt2POEF6b7S+wcySXwdZyb5kBdGZwdLCN0u6Vc=;
 b=Bq0FysfM7odNlJD4uj8r7Y/yp3hGB1ZsDdC7pE2odnOandIIGaH3LAUNeAMcBHe+6V
 3cW2R8YJMGuCgFq/HemBvw5B6CQ9k7BljGEeF5ORi/mBdQEJnfA/kRZ9VL4CDqhzpsP3
 vKE1ge3Ar8dg2vl6jfkKNeFCG6ubf0ZcGxjhpl9AvrQMsxXxfaDWy5w4jRw9CT9OjbD7
 qBLu9fnlVH/ace28NeMmVCw9IRiiQgbHnTo0KE6ESSUplnUI820uZcRo/5MaXyKhZspX
 7NKMguBtXujmyt6QMj3oRKUbHvla5jiT1XcPcBBXxSI0c774+YUQaoQD9BFr5C6BY3Vv
 fyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754552781; x=1755157581;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2XC2XPt2POEF6b7S+wcySXwdZyb5kBdGZwdLCN0u6Vc=;
 b=TTj72/D+Lhh2myXz2aKfcOJx4HoiCPa9Ps52ImheMnWJuyKMRz+rkapaMxOGS6jESJ
 b9uW/WkQkcwkX9McqgJwS6Gekye/Gz6T0Dai/mFbyt9kwn4m9oSxnw4uPcPqogWXJDy2
 CMQUg2tGu54eFc49hWSBLpPRK95ZY5S9Lxq+yzS4mhZOSdXvZOHui6ZyyXQTP6vB1J8j
 IRDMEtGfuuS0ZkDssa825ZqQ7QPNKVHelfNkWz3oPwf0bMGOr0soiijCowUyxh1w0jyj
 Dz7E30Cu8oF/PqgLnvnRXLGqIko6AMsmuuMvlj2p2SqgZ49XZdLrH6H9aYEo0JQt+y4f
 ZD/g==
X-Gm-Message-State: AOJu0YxKeIf8LYikWyC/LL4/FbWsdHVm36iVKJMQS1lrF4bds8FwuPV+
 5iYn+le53C19RtXvJv5boJR7icFO9zZQuxb4bi6BCm/bMOc/8w8oT5pQPE2S+HTQ
X-Gm-Gg: ASbGnct1Y9sM4SuxJ9UujVARrE+YZzNWR2XWtVqcqh8rwqsgtaC3aKPYR8OCNQeddSY
 6zTIF5XgPSyDOpuL8BHuqT5+9OQtqjzKJZEWuUyR/M2yYu6aFym5wdSJPHtIifGvusEi3VpgAUI
 rfpegt3A2Yu1x/cNWwJYyphzE3BYduN25AK9ZmnD0Bey6yZYqd7ItAl2cvW4mvraSrBDIpBevxz
 FH+LfjQVBmBa8w6J4yRQ559nwRIaE/l8Cvy3lS0RX1VhVkZgFKmp86RurbkNWRUp8yKcLDmP7E+
 gB5iSnh15hw1mP++fP5WNzu4ZfgRZISCvMJGdW2R9eyiTNgpDScNwBb662kqyRqIYPw1dSKzyjy
 qmG1sNak1WR10lQ0xtiE=
X-Google-Smtp-Source: AGHT+IHVpPNleBSrK7DUCoTyUaNfnq/tqIpL2EEcGuQT1iwG9q8vNygGZZdBeOjXHRa5gpc5nYiLkg==
X-Received: by 2002:a05:6000:4382:b0:3b8:d902:e200 with SMTP id
 ffacd0b85a97d-3b8f416668amr5195093f8f.24.1754552781437; 
 Thu, 07 Aug 2025 00:46:21 -0700 (PDT)
Received: from fedora ([94.73.32.0]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm204859355e9.0.2025.08.07.00.46.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 00:46:20 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, zbigniew.kempczynski@intel.com,
 kamil.konieczny@linux.intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH i-g-t v4 17/41] tests/vkms_configfs: Test connector valid
 values
Date: Thu,  7 Aug 2025 09:45:26 +0200
Message-ID: <20250807074550.6543-18-jose.exposito89@gmail.com>
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

Test that all valid values for the connector "status" work and that it
changes accordingly.

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 tests/vkms/vkms_configfs.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/tests/vkms/vkms_configfs.c b/tests/vkms/vkms_configfs.c
index 987491373..55b528a5c 100644
--- a/tests/vkms/vkms_configfs.c
+++ b/tests/vkms/vkms_configfs.c
@@ -534,6 +534,36 @@ static void test_connector_wrong_values(void)
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
@@ -555,6 +585,7 @@ igt_main
 		{ "connector-default-files", test_connector_default_files },
 		{ "connector-default-values", test_connector_default_values },
 		{ "connector-wrong-values", test_connector_wrong_values },
+		{ "connector-valid-values", test_connector_valid_values },
 	};
 
 	igt_fixture {
-- 
2.50.1

