Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B831EF53D6D
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:24:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C72110E29A;
	Mon, 16 Mar 2026 16:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="zkI89VlO";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6AD510E31F
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:45 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id DAB691A2CD4;
 Mon, 16 Mar 2026 16:23:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B002960050;
 Mon, 16 Mar 2026 16:23:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6717A1037220B; Mon, 16 Mar 2026 17:23:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678224; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=IXboLIJ1RAD6LL1Jo4LOfUo2m9HHoKMdyil5Jliikbc=;
 b=zkI89VlOHBPkBQoND4VpVYLpMZOpRzLNVgEkxj1TZaQAwzkC7zY/ecAPG56FftgSPWmCpW
 lkfL1FwKV8ghjK+aPUBBGltcyMGAWp3g+MUUdmp4ZYjXZIWjXT5mRvqYRv7u2C8fsiXlUm
 bEwpSmD2jjbuYjHpbF0leoZ2+4oPsT8Z2yauQhhpCciTn33DdTjqUeUpyVNrBYs5EmkTTA
 pqIJT4ZuUCMiwk7u95sTs9+nvrFIf+ybv7ipw+AG3/5tbDataobSRP1t1ILoyevKH6eFov
 SBuib5wyhx8EaspCCk7JKo4ipki03RLjWHRwtGn++4tHlcOxyDmpBZTiy6r1FA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:17:54 +0100
Subject: [PATCH i-g-t v9 33/49] lib/unigraf: Add configuration for CRC
 usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-33-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2375;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=9ZDafwYO0pmjpDTyzwCl7ntPTZqhqG2CJDGX7ZLCk2k=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6Nn4urjLCxw0lWbM0/oFo00GkdmeytKBovm
 tFUdHTpxUWJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabgujRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLgng/+IziFUcqFL0hWziViXpaUAGXRw9cBGzf
 2jxE2XAyks8G708lonkW+QeQ0/xzLzUIEKzC5oluH/8CtDa/FeLfLdl5LmRGUAceppzHJHbdORT
 aw0c8j3TakLs2ldJg9Lb3pGOwLYtWgT5Quy+dQGsehahQlVTbTw5tWOlftBQ+OqHzbMdvQKyBki
 zbxY9TA5PB9L3yEsm/fjtZtSKli1mn2rWemiATDNCw0oXBpQZZQzhuym+H77Tk//2KqpzWUVpGp
 yhIHA2Bpd/FqexwZ8C0Ppj/nj6e107uI4YXrP/R3h7q4Om5Orz1RgMeZ4WXP/4kAt/JNIaHWtWy
 pxSUuDPQXPV53CHPIcLjvB6e0yhczvl35BVXAkSXwuBzbeDFuZBaT+ckhD2oDZPhUPGaS+gYIGI
 EF/gcRJPOLI9WqYWpDODZteRo7qz3jMYd2g8hp6rhFQD+xh1n1AhOb+rVTgsSLfm5fRnywJAfZw
 CkMJ3k2j0XnEjWs0cNrNo5myzekdUaTXUhAaZjxZ7IE7fF9ydZQYzqLXlPjoJMPz+C6OaZnc2s3
 jt6h51XikhaCeQ6w396EyTdJN2iC8x4a3+sWgWmB7Gl8URoR/duQSfAdT0z27GGer64BUjPqE8G
 zCfEDx5pJWjDBviugvVAnbIC8rIjH99xXfcXUAMEMn5+abBsI/CU=
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

As Unigraf devices are able to compute a CRC for the input image, add a
configuration file option to use them.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 25 +++++++++++++++++++++++++
 lib/unigraf/unigraf.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 0f56ad998c94..e14f1fd5b050 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -24,6 +24,7 @@
 static TSI_HANDLE unigraf_device;
 static char *unigraf_default_edid;
 static char *unigraf_connector_name;
+static bool unigraf_crc;
 
 /**
  * UNIGRAF_NAME_MAX - Maximum name length to be used for TSI functions
@@ -60,6 +61,11 @@ static char *unigraf_connector_name;
  */
 #define UNIGRAF_CONFIG_EDID_NAME "EDID"
 
+/**
+ * UNIGRAF_CONFIG_USE_CRC_NAME - Key of the CRC selection in the configuration file
+ */
+#define UNIGRAF_CONFIG_USE_CRC_NAME "UseCRC"
+
 /**
  * UNIGRAF_DEFAULT_ROLE_NAME - Default role name to search on the unigraf device
  */
@@ -363,6 +369,14 @@ bool unigraf_open_device(int drm_fd)
 			unigraf_debug("No default EDID set, use IGT default.\n");
 			cfg_edid_name = NULL;
 		}
+
+		cfg_error = NULL;
+		unigraf_crc = g_key_file_get_boolean(igt_key_file, UNIGRAF_CONFIG_GROUP,
+						     UNIGRAF_CONFIG_USE_CRC_NAME, &cfg_error);
+		if (cfg_error) {
+			unigraf_debug("CRC usage not configured, using unigraf CRC.\n");
+			unigraf_crc = true;
+		}
 	}
 
 	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE, 0));
@@ -682,3 +696,14 @@ void unigraf_read_crc(int stream, igt_crc_t *out)
 	out->n_words = 3;
 	out->has_valid_frame = false;
 }
+
+/**
+ * unigraf_use_crc() - Check if Unigraf device should be used for CRC computation
+ *
+ * Returns: true if the Unigraf device should be used for CRC computation,
+ *          false otherwise.
+ */
+bool unigraf_use_crc(void)
+{
+	return unigraf_crc;
+}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 8b38261dca09..f22f4c993622 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -74,4 +74,6 @@ void unigraf_select_stream(int stream);
 
 void unigraf_read_crc(int stream, igt_crc_t *out);
 
+bool unigraf_use_crc(void);
+
 #endif // UNIGRAF_H

-- 
2.52.0

