Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA2ACA0FEE
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 02:17:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD67610EBD2;
	Sat, 23 Aug 2025 02:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="O5OGPUR2";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF4710E189
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:17:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8EFD61A0DA1;
 Sat, 23 Aug 2025 02:12:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 67BC2606A7;
 Sat, 23 Aug 2025 02:12:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B52DD1C22C86E; 
 Sat, 23 Aug 2025 04:11:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1755915120; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Y9KnSIRbO1Sq29W20TIZINSckcxZdC6klk1PO+QQ0jI=;
 b=O5OGPUR2zZ1UESCRSMZ46h9i5gVN2n7E+Dx7LfoZVTQ8Vgc8IYkTt+4AbcXViEJbmwBlJI
 fw1OwyB3lx5u48X/PXhxveWPlp+/HOdFpBgmX+4h+LTHvHfiHHO3iVNYglEaWwyZlsrD86
 SwY+AABxMSq0PVyWxrceY/yvPGV+lfzzKQjoRsu16+S/22gcirqvSpg7ll/fyBluMbVysi
 vFZI/KDFfj6QHoh/45DjBJ0i/QHf0jZgx+PVEU7Br0f8jLmgemwNglUt+mv8nMpSSF1Qr0
 jbuUj2NJA5+x/Jk3pAbd/ycHXUbgMOukwEm7q4J4OMcuB3DlUZtYyKsY63K0XQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 23 Aug 2025 04:11:41 +0200
Subject: [PATCH i-g-t v3 21/29] lib/unigraf: Add connector configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-unigraf-integration-v3-21-cdc36d5fab4c@bootlin.com>
References: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
In-Reply-To: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3124;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=CJbV49QmFmjhdDoaQ0utH7yFrPxkTjIxvfe+PSz4VJU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoqSNWqYt+HUPSbC3VaYC3y3O0OzbdS/HgNDdvV
 XT9ISOHY+iJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaKkjVgAKCRAgrS7GWxAs
 4tuJD/9v3W7ItvZKel8iGT1LpGyDEYHLut6dTII0CIL5ce+AwhaFW77F9DxrFB7pOb5tgHSLLnz
 xiQ1fu8yn/IpHEi9Rm1WxUUxRXhl3qCchcec855NepbT1RvgCc+HfOXarsCYPWqo91Y7FFFx48v
 JL2C/u9oz+DIEqQbC1aTqW9cSUk+11moNI5BFXszuTW025wUx1FDlMp1lioxavPFEODYd1nA0FA
 cqJFp7cfwmXH3h2Nrp8jlOYIqAHGh9riT0yh3aMsOCTvTUCbXNFaPtiuT9TBCS4aHYrTOf6VU2C
 95BawAh5jECw/Ilg4S1kv/yGXmmbQR+OtWhxgNtpIXpxZmbJxyZJrbkg7eLbz6BQ30bPYjKzgDl
 oQbeUvyOuHGfZ5azBK332FqWN+nYOiM2CANH5H383qYSlSE4eVTPgtPT4snWFCa1HWsZLsrmNaJ
 bdMW0Hr6PVlIDepHu4MSujCP4k/GEdeORfCrd6IipAnUCk0OBOgWVR02KgSvq+hfsxaaLdRUO2k
 ctdIb5hbLZO7q/6CnmPks9KTOrfsBYrYa4mU1ZtFkksK5TOs7E1HQlAfgSZHQCtxi92LcVEw8Mb
 dyGGntbYw6XAVSGIvtsQWkwHi4ZEwK+QTjWX9aQvcUJc1wINc2IXr6N3Ecn8Xj2Lh7ZqWjd9MLT
 E0OUN+whfNwNEMw==
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

As multiple connectors can be present on the DUT, add a configuration to
tell which connector is used by the Unigraf.

The configuration will look like:

[Unigraf]
Device=UCD-500 [2434C620]
Role=DisplayPort Source and Sink
Input=DP RX
Connector=DP-4

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 20 ++++++++++++++++++++
 lib/unigraf/unigraf.h | 11 +++++++++++
 2 files changed, 31 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 6b11fb7744a78d003b064183127c2666d4c36c74..41c1015aa942ccaf9c93890656d403997b19e661 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -10,6 +10,7 @@
 #include "unigraf.h"
 #include "TSI_types.h"
 #include "TSI.h"
+#include "igt_kms.h"
 #include "igt_rc.h"
 
 #define unigraf_debug(fmt, ...)	igt_debug("TSI:%p: " fmt, unigraf_device, ##__VA_ARGS__)
@@ -44,6 +45,11 @@ static char *unigraf_connector_name;
  */
 #define UNIGRAF_CONFIG_INPUT_NAME "Input"
 
+/**
+ * UNIGRAF_CONFIG_CONNECTOR_NAME - Key of the connector name in the configuration file
+ */
+#define UNIGRAF_CONFIG_CONNECTOR_NAME "Connector"
+
 /**
  * UNIGRAF_DEFAULT_ROLE_NAME - Default role name to search on the unigraf device
  */
@@ -170,6 +176,11 @@ static int unigraf_find_input(const char *request)
 	return chosen_input;
 }
 
+drmModeConnectorPtr unigraf_get_connector(int drm_fd)
+{
+	return igt_get_connector_from_name(drm_fd, unigraf_connector_name);
+}
+
 bool unigraf_open_device(int drm_fd)
 {
 	TSI_RESULT r;
@@ -230,6 +241,15 @@ bool unigraf_open_device(int drm_fd)
 			unigraf_debug("No input name configured.\n");
 			cfg_input = NULL;
 		}
+
+		cfg_error = NULL;
+		unigraf_connector_name = g_key_file_get_string(igt_key_file, cfg_group,
+							       UNIGRAF_CONFIG_CONNECTOR_NAME,
+							       &cfg_error);
+		if (cfg_error) {
+			unigraf_debug("No connector name configured, will autodetect.\n");
+			unigraf_connector_name = NULL;
+		}
 	}
 
 	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE, 0));
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 95c86a8cd428725d4e3a28bb91158800c840654c..553a732d746e5465472a81405f885add6a3a7c47 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -5,6 +5,7 @@
 
 #include <stdbool.h>
 #include <stdint.h>
+#include <xf86drmMode.h>
 
 /**
  * unigraf_assert: Helper macro to assert a TSI return value and retrieve a detailed error message.
@@ -47,6 +48,16 @@ bool unigraf_open_device(int drm_fd);
  */
 void unigraf_require_device(int drm_fd);
 
+/**
+ * unigraf_get_connector() - Get a DRM connector for the Unigraf device
+ * @drm_fd: DRM file descriptor
+ *
+ * Returns: A pointer to the drmModeConnector connected to the unigraf device,
+ * or NULL if the operation failed. The caller is responsible for freeing this
+ * pointer with drmModeFreeConnector().
+ */
+drmModeConnectorPtr unigraf_get_connector(int drm_fd);
+
 /**
  * unigraf_read_edid() - Read the EDID from the specified input
  * @dev: The device handle

-- 
2.50.1

