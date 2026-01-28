Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CFDD25B5B
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:14:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9309510E6EC;
	Wed, 28 Jan 2026 13:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="WeNphOQW";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 288AF10E119
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1DE6C1A2AC1
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E98AE6071F;
 Wed, 28 Jan 2026 13:14:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0F90F119A8823; Wed, 28 Jan 2026 14:14:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606087; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=GBWFnrdQzQVpvgFgg+chbMf+/aWXhPWRHNXb+Vu+LhY=;
 b=WeNphOQWaXf/HP3u2gRa+6Zs/a9LSKgDk32ZCzVLK75tPAQgFFdl/M/5Ll/FxUkg2A1bTB
 Q/euK9l4a6zsRlos2H7S2X+1uzBekfpSvCdfjTZb9nyV1yFmeBgGLbq4Ib9pFvt7XigK32
 WifVFc0/an7zkGwxEf88HpJud7SRwIXz1o8jGusT+E/6EFMJzputRlDxwZuK/NMo754tV5
 Mzi4qy/b5rC15nd49xjpYf5p5gkM0RKs605l8swZ8UH9QMTJ1Q0H6J/kiZ2jUzKDtFBmKs
 vZ84FfmUHch/ooL4BwxfMj0UhlfnIUhGoFVPbX5NqorkoAPs0HY3p+Ofb8gCNQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:14:54 +0100
Subject: [PATCH i-g-t v5 23/48] lib/unigraf: Introduce input configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-23-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4124;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=vKTYW5HeOEZL9fhRJ1CFpBi5tPWmSzJj5SvGfsGESS8=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvKyrrBiETBzcuSrF2W7PXgcwSKlm13vARvZ
 HdqBtUpZayJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLyhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIXXhAAmpEqkRG2V9NuEoOqXsmErqf85X1SOUW
 KWXy5s2qp9cXQhfRmhVBKrgjl7r8oMRGaMhL3ZkukzytGcv36F4VZT3aIgqZOc2Jk1nfeQuD5dG
 IZvVBHBtF3z9ad1rzNK4OexbiFFbOxa8vNyGnInQFCXdCnqLCQpYCs4WKS8atq/LUWtmBOimQPQ
 g4+nTy2M2G+guRN+pgHAyA1ipcLSfI4H/AB2tVNXLnu8MeSQ75FKdbio7TNQ0NglMVf52Ba+Xbn
 qiMa8Snf+Y8ql3as6gpsNOxe+itVvwJ9T+BYzHaqRNLWMB93cJXcKA1Zs/mZA/fTnHTC4uC3Qeu
 f6wRfwaHk0+Zet5+cKF09Y9mHFt6jjUCHaz02SOG/k5VRV/pfGfx8+vMuhwsC9TgXTcZPgwf24J
 vJ+gMgfL5H14BEte3J+ofYP6/KRoYRPv3IF7FaGSWMs1FAn3Po30X9xtkjxTBZ+n8kKCs+jJKp1
 hhDs1COo2oE5Zn9uvs25QSmeh3eNKoq8859IvHvDZvl9kGOw408oCNdfOlrAGCzO8MhvPfQRrf5
 XL/k98nAvuIPDMYNWNaYf4XOJ5xv+FN9nrXHNYu1viX34g/5PLX8eXMWLRajBBHId1hSVXk6zha
 EA+MxfZHKDx9DqvtoFIReihFPFhK1iD+FWosej63geVKoRnI4Heo=
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

As multiple input can be present on unigraf devices, add a configuration
field to select the proper input. By default it will take the first
available.

The configuration can look like:

[Unigraf]
Device=UCD-500 [2434C620]
Role=DisplayPort Source and Sink
Input=DP RX

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index fb901c38453e..1b31f7a44566 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -34,11 +34,21 @@ static char *unigraf_connector_name;
  */
 #define UNIGRAF_CONFIG_DEVICE_ROLE "Role"
 
+/**
+ * UNIGRAF_CONFIG_INPUT_NAME - Key of the input name in the configuration file
+ */
+#define UNIGRAF_CONFIG_INPUT_NAME "Input"
+
 /**
  * UNIGRAF_DEFAULT_ROLE_NAME - Default role name to search on the unigraf device
  */
 #define UNIGRAF_DEFAULT_ROLE_NAME "USB-C, DP Alt Mode Source and Sink"
 
+/**
+ * UNIGRAF_DEFAULT_INPUT_NAME - Default input name to search on the unigraf device
+ */
+#define UNIGRAF_DEFAULT_INPUT_NAME "DP RX"
+
 static void unigraf_close_device(void)
 {
 	if (!unigraf_device)
@@ -121,6 +131,24 @@ static int unigraf_find_role(const char *request)
 	return chosen_role;
 }
 
+static int unigraf_find_input(const char *request)
+{
+	int chosen_input = -1;
+	int role_count = unigraf_assert(TSIX_VIN_GetInputCount(unigraf_device));
+
+	for (int i = 0; i < role_count; i++) {
+		char input_name[UNIGRAF_NAME_MAX];
+
+		memset(input_name, 0, UNIGRAF_NAME_MAX);
+		unigraf_assert(TSIX_VIN_GetInputName(unigraf_device, i,
+						     input_name, UNIGRAF_NAME_MAX));
+		unigraf_debug("Input %d: %s\n", i, input_name);
+		if (!strncmp(input_name, request, UNIGRAF_NAME_MAX))
+			chosen_input = i;
+	}
+	return chosen_input;
+}
+
 /**
  * unigraf_open_device() - Search and open a device.
  * @drm_fd: File descriptor of the currently used drm device
@@ -136,10 +164,11 @@ bool unigraf_open_device(int drm_fd)
 	GError *cfg_error = NULL;
 	char *cfg_device = NULL;
 	char *cfg_role = NULL;
+	char *cfg_input = NULL;
 	int device_count;
 	int chosen_device;
 	int chosen_role;
-	int chosen_input = 0;
+	int chosen_input;
 
 	assert(igt_can_fail());
 
@@ -163,6 +192,7 @@ bool unigraf_open_device(int drm_fd)
 		unigraf_debug("No device configured, will try to find the first available.\n");
 		cfg_device = NULL;
 		cfg_role = NULL;
+		cfg_input = NULL;
 		unigraf_connector_name = NULL;
 	} else {
 		cfg_device = g_key_file_get_string(igt_key_file, cfg_group,
@@ -179,6 +209,14 @@ bool unigraf_open_device(int drm_fd)
 			unigraf_debug("No device role configured.\n");
 			cfg_role = NULL;
 		}
+
+		cfg_error = NULL;
+		cfg_input = g_key_file_get_string(igt_key_file, cfg_group,
+						  UNIGRAF_CONFIG_INPUT_NAME, &cfg_error);
+		if (cfg_error) {
+			unigraf_debug("No input name configured.\n");
+			cfg_input = NULL;
+		}
 	}
 
 	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE, 0));
@@ -223,6 +261,25 @@ bool unigraf_open_device(int drm_fd)
 	}
 
 	unigraf_assert(TSIX_DEV_SelectRole(unigraf_device, chosen_role));
+
+	if (!cfg_input) {
+		unigraf_debug("No input configured, trying " UNIGRAF_DEFAULT_INPUT_NAME "\n");
+		chosen_input = unigraf_find_input(UNIGRAF_DEFAULT_INPUT_NAME);
+		if (chosen_input < 0) {
+			char input_name[UNIGRAF_NAME_MAX];
+
+			chosen_input = 0;
+			unigraf_assert(TSIX_VIN_GetInputName(unigraf_device, chosen_input,
+							     input_name, UNIGRAF_NAME_MAX));
+			unigraf_debug("Input " UNIGRAF_DEFAULT_INPUT_NAME " not found, using input 0 (%s).\n",
+				      input_name);
+		}
+	} else  {
+		chosen_input = unigraf_find_input(cfg_input);
+		igt_assert_f(chosen_input >= 0, "TSI:%p: Input %s not found.",
+			     unigraf_device, cfg_input);
+	}
+
 	unigraf_assert(TSIX_VIN_Select(unigraf_device, chosen_input));
 	unigraf_assert(TSIX_VIN_Enable(unigraf_device, chosen_input));
 

-- 
2.52.0

