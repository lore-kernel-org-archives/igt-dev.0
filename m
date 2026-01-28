Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDFED25B5F
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:15:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61AED10E6E1;
	Wed, 28 Jan 2026 13:15:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="VrpxT1mP";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7827C10E119
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 6B1811A2AC0;
 Wed, 28 Jan 2026 13:14:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3EABC6071F;
 Wed, 28 Jan 2026 13:14:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 652C8119A8822; Wed, 28 Jan 2026 14:14:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606086; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=uJ1LC2+JwfEvh8kWk9AWlNF36UzupwguDnkikKhz3tg=;
 b=VrpxT1mPiEyR/mnCRe0Wf+Db0AigB8UG6fBr9wHAiB8c1K8m024/gKWWcBuZakkh3zblEF
 rGRB6TaCZrNY727pEAW04dRdBv/hIMYZvxJc24/voQk0oIyiKMZ0n1xet872LhpWmiNOZb
 goeQ542No7AeYGhilotGRmf80t5eg/yBJKBo6pXoBSHvc+DTx2KVPtIUR/DgkmghdcCrLn
 M0KzDaW83Y7IPTkUtJJ5UJLZrgPRNeKlqM2suELG9AX2hPaO3U25div8B40v6iLXX5Kead
 xEy/b+Bv4UdRHdYFNT01MtIIgx+4z66u1gyaY2/WzvLteho/ZgKd26vPzs5aaQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:14:53 +0100
Subject: [PATCH i-g-t v5 22/48] lib/unigraf: Introduce role configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-22-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4065;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=sC0no2xY54ZiB2TJNCABgYXIXkr/5ZiAPcddkm8BZew=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvK/+/OSZZAxBQ3SPixCrxjIfkRTnlcW1+vK
 vmHpAZB49WJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLyhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJ+og/9EVlnwi+EWrg29Vsc6ihp6wTI9vJlqy6
 qmTPqhagkWZW1nVDeJEfarhtlUJqS+FEwszf66InFQX68dtogjuhDRyyC0YWY4V0GBVmCe5ysI3
 fyMYAK8G5hkER8hBrSYXgy4ih7DELq/xXpVoTcwf0s4YiiAFkNae4sxr3PBhp5oKLcxZt/lhHLr
 R2r1fa7OW/i+jXYO6hTs0j7BdcfmIq3UR0MRYrZlKlOqL1/Xzs7+Z92L61q3GxMJ1TENF1vKHl+
 sqMgzCSC5IP4LkN2/mOTQenBpOmNkKStDvKKGjKhtiXiQQ1NsQ8RKiqcVHcPk5F1pBEFz8jntrc
 52Kpd6aJZtMibJYYM8wsAEvSp6XVwBNYKNJLRsL7ECwXrKuKq9cm8z/EnzxLwKtZF4lCfiNy496
 XxDCqmprZAyHIy7c02CpPTHO0MhQlCFlYtC2fX0u78Nis58cRZM7fkQ6JvYMQaGD3cZ5uOMJupM
 lSqWu/xkbVKxHgwZvH/KsyKSxLncgkhEcTnFHpZnCwYwcIsPY4KV9/oz4B5u/OtEJYO31h9zL9f
 nLlpITi3DgZl0meuZ6Zj4pC4GjWvNYh+ij60kstIql6ECTvGak/Kp4NP8YpN8ZpUdBpAIMXCQYQ
 zIIKNMtRWXV4M7qyk2tp0DyB1vuH1vQeib1R5Q38P5gnAhvMei5A=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3
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

Some unigraf devices, like the UCD-500 can have multiple hardware
configurations: displayport input/output, usbc input/output.

The device configuration can look like:

[Unigraf]
Device=UCD-500 [2434C620]
Role=DisplayPort Source and Sink

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 800e9c3545f4..fb901c38453e 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -29,6 +29,16 @@ static char *unigraf_connector_name;
  */
 #define UNIGRAF_CONFIG_DEVICE_NAME "Device"
 
+/**
+ * UNIGRAF_CONFIG_DEVICE_ROLE - Key of the device role in the configuration file
+ */
+#define UNIGRAF_CONFIG_DEVICE_ROLE "Role"
+
+/**
+ * UNIGRAF_DEFAULT_ROLE_NAME - Default role name to search on the unigraf device
+ */
+#define UNIGRAF_DEFAULT_ROLE_NAME "USB-C, DP Alt Mode Source and Sink"
+
 static void unigraf_close_device(void)
 {
 	if (!unigraf_device)
@@ -92,6 +102,25 @@ static int unigraf_find_device(char *request)
 	return chosen_device;
 }
 
+static int unigraf_find_role(const char *request)
+{
+	int chosen_role = -1;
+	int role_count = unigraf_assert(TSIX_DEV_GetDeviceRoleCount(unigraf_device));
+
+	for (int i = 0; i < role_count; i++) {
+		char role_name[UNIGRAF_NAME_MAX];
+
+		memset(role_name, 0, UNIGRAF_NAME_MAX);
+		unigraf_assert(TSIX_DEV_GetDeviceRoleName(unigraf_device, i,
+							  role_name,
+							  UNIGRAF_NAME_MAX));
+		unigraf_debug("Role %d: %s\n", i, role_name);
+		if (!strncmp(role_name, request, UNIGRAF_NAME_MAX))
+			chosen_role = i;
+	}
+	return chosen_role;
+}
+
 /**
  * unigraf_open_device() - Search and open a device.
  * @drm_fd: File descriptor of the currently used drm device
@@ -106,9 +135,10 @@ bool unigraf_open_device(int drm_fd)
 	char *cfg_group = NULL;
 	GError *cfg_error = NULL;
 	char *cfg_device = NULL;
+	char *cfg_role = NULL;
 	int device_count;
 	int chosen_device;
-	int chosen_role = 0;
+	int chosen_role;
 	int chosen_input = 0;
 
 	assert(igt_can_fail());
@@ -132,6 +162,7 @@ bool unigraf_open_device(int drm_fd)
 	if (!cfg_group) {
 		unigraf_debug("No device configured, will try to find the first available.\n");
 		cfg_device = NULL;
+		cfg_role = NULL;
 		unigraf_connector_name = NULL;
 	} else {
 		cfg_device = g_key_file_get_string(igt_key_file, cfg_group,
@@ -140,6 +171,14 @@ bool unigraf_open_device(int drm_fd)
 			unigraf_debug("No device name configured, uses first device available.\n");
 			cfg_device = NULL;
 		}
+
+		cfg_error = NULL;
+		cfg_role = g_key_file_get_string(igt_key_file, cfg_group,
+						 UNIGRAF_CONFIG_DEVICE_ROLE, &cfg_error);
+		if (cfg_error) {
+			unigraf_debug("No device role configured.\n");
+			cfg_role = NULL;
+		}
 	}
 
 	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE, 0));
@@ -165,6 +204,24 @@ bool unigraf_open_device(int drm_fd)
 	igt_assert(unigraf_device);
 	unigraf_debug("Successfully opened the unigraf device %d.\n", chosen_device);
 
+	if (!cfg_role) {
+		unigraf_debug("No role configured, trying " UNIGRAF_DEFAULT_ROLE_NAME "\n");
+		chosen_role = unigraf_find_role(UNIGRAF_DEFAULT_ROLE_NAME);
+		if (chosen_role < 0) {
+			char role_name[UNIGRAF_NAME_MAX];
+
+			chosen_role = 0;
+			unigraf_assert(TSIX_DEV_GetDeviceRoleName(unigraf_device, chosen_role,
+								  role_name, UNIGRAF_NAME_MAX));
+			unigraf_debug("Role " UNIGRAF_DEFAULT_ROLE_NAME " not found, using role 0 (%s)\n",
+				      role_name);
+		}
+	} else {
+		chosen_role = unigraf_find_role(cfg_role);
+		igt_assert_f(chosen_role >= 0, "TSI:%p: Role %s not found.",
+			     unigraf_device, cfg_role);
+	}
+
 	unigraf_assert(TSIX_DEV_SelectRole(unigraf_device, chosen_role));
 	unigraf_assert(TSIX_VIN_Select(unigraf_device, chosen_input));
 	unigraf_assert(TSIX_VIN_Enable(unigraf_device, chosen_input));

-- 
2.52.0

