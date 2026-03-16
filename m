Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3628F53D6F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:25:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9842010E3BE;
	Mon, 16 Mar 2026 16:25:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="IIDK3RdE";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC01D10E3B3
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:47 +0000 (UTC)
Received: from smtpout-01.galae.net (unknown [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id DCD91C55048;
 Mon, 16 Mar 2026 16:24:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2C0685FC9A;
 Mon, 16 Mar 2026 16:23:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9519B1037220B; Mon, 16 Mar 2026 17:23:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678210; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ad5C9D3WtJfOusx0TFEMQa/cqs7IlstRJSn4bmen3Cw=;
 b=IIDK3RdEYl+0OX7+flIsVqQyo9oLe21slTqWlkRRnKCb+P3DIpZoSFLD2UMi3+49hwNrkz
 poJTfjmu/7FE1HLFlPXL/hddevlKKkaPyYFEn3qHAPtZzaGRz12GjK+FlvqXWXn6yjOcMT
 MSNEjut0f3lCa4C70LLawwCQFja7dFOupD4oxYfly8xkkK06NODw0bDSvGwKmbO9HGeKF4
 0DDXGDpPJWtp2MgzmAeMJwarXRubEmF63ie22pRQf1qua3ZCEk1uNU+jLRAJK2JzVptlwx
 q40ZBhg4xebUJDPP77Yc2KhUq9JJcdoAfr0CJtM9uCpWfxw1+dZD3hjL5hmGfA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:17:44 +0100
Subject: [PATCH i-g-t v9 23/49] lib/unigraf: Introduce role configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-23-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3863;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Aeo8ukbe2cUGsE8gBt7g+aam35z+3imFt4EgBng+gBI=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6M8oDHrqiw+ZHCqjYVfmLyfVNBtfw+2YFzW
 8WcxZbbc9KJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabgujBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKOyxAAv73RUKT3GCs6Gc42TWWibvk9jPh7CdW
 gIlbGdFLKBVXaK0zsIJKQYa1K2DwFcxvb8BqRTsqumkY7KSpmRzpx1MXP1YQdgzNLHwCHlIgYuI
 hT1BrMRfuakzVhhIGXUv3A2CVU5qDRuy/dWK7BngkQ2D6c2LLrdxzrjF0vk+g+bCjOvbDf+SIVw
 FifG4HO7r/TJOiago1UjNanyBXjOHQb0DgoNc2khwMWxQ+ZLGy5wrcmPAPkVmVwF8vtMzeXIR8H
 6O9odIr2SFrTevDvNnwIDTIUO5Ww1G34mFRzJGHFHChJLctAbTpPIck7JDiCB2/OcN4eAoxF1PY
 l36nWBBEJIr2VZA0hGYD2DsYYxTLBNps0j5vOFrGgD6urjKmWvrvZT7aUqWZQc/BrQNV7F2DT/x
 k0Niytuf/FUyMtyxgkOeup7UjgVVDLgvXWS0CEAKJsLHo5QlQLxf1tMPWXZ0lw0LG/AbSSTQKAB
 dv/qIWOCzSK7aZVQ+Baygxs4QsC9/WxGsrDyx40SMEm1tnAA7tGQvfwJHK1nM2JqpXd538rL5ax
 bvrUfoOwABC22fCJybuqvb7pL74RHii3qtB6+k5J9AF7A/6ec0Kmh5XuEFruqau+SMpA6M9Hwdz
 WqdNf8Li+EmlAh+dAXRZwqDtreukJ/48jqy/rBQhI25DXrv6rYv8=
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

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 9d5f0a488bed..cf760357c6be 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -7,6 +7,7 @@
  */
 
 #include "igt_core.h"
+#include <asm-generic/errno-base.h>
 #include <stdint.h>
 
 #include "unigraf.h"
@@ -35,6 +36,16 @@ static char *unigraf_connector_name;
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
@@ -96,6 +107,23 @@ static int unigraf_find_device(char *request)
 	return -ENODEV;
 }
 
+static int unigraf_find_role(const char *request)
+{
+	int role_count = unigraf_assert(TSIX_DEV_GetDeviceRoleCount(unigraf_device));
+
+	for (int i = 0; i < role_count; i++) {
+		char role_name[UNIGRAF_NAME_MAX] = "";
+
+		unigraf_assert(TSIX_DEV_GetDeviceRoleName(unigraf_device, i,
+							  role_name,
+							  UNIGRAF_NAME_MAX));
+		unigraf_debug("Role %d: %s\n", i, role_name);
+		if (!strncmp(role_name, request, UNIGRAF_NAME_MAX))
+			return i;
+	}
+	return -ENODEV;
+}
+
 /**
  * unigraf_open_device() - Search and open a device.
  * @drm_fd: File descriptor of the currently used drm device
@@ -109,9 +137,10 @@ bool unigraf_open_device(int drm_fd)
 	TSI_RESULT r;
 	GError *cfg_error = NULL;
 	char *cfg_device = NULL;
+	char *cfg_role = NULL;
 	int device_count;
 	int chosen_device = 0;
-	int chosen_role = 0;
+	int chosen_role;
 	int chosen_input = 0;
 
 	assert(igt_can_fail());
@@ -128,6 +157,14 @@ bool unigraf_open_device(int drm_fd)
 			unigraf_debug("No device name configured, uses first device available.\n");
 			cfg_device = NULL;
 		}
+
+		cfg_error = NULL;
+		cfg_role = g_key_file_get_string(igt_key_file, UNIGRAF_CONFIG_GROUP,
+						 UNIGRAF_CONFIG_DEVICE_ROLE, &cfg_error);
+		if (cfg_error) {
+			unigraf_debug("No device role configured.\n");
+			cfg_role = NULL;
+		}
 	}
 
 	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE, 0));
@@ -151,6 +188,24 @@ bool unigraf_open_device(int drm_fd)
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

