Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25848F4644B
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:25:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF45510E26F;
	Mon, 16 Mar 2026 10:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="T84GmEoV";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F043E10E258
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 5E7D1C40404;
 Mon, 16 Mar 2026 10:24:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D714A5FC4A;
 Mon, 16 Mar 2026 10:24:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BE94610369F53; Mon, 16 Mar 2026 11:24:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656647; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ad5C9D3WtJfOusx0TFEMQa/cqs7IlstRJSn4bmen3Cw=;
 b=T84GmEoVWrV7JHNRLX+soIefqJ+hvxbRdDVgF+EN+Rb/7kNHCHaxXPQEkcCUQXMCV2VCyd
 Wag/A7FTkbdOIkrErxNOcMwb1d65XsmzRbtrVOxLesO7x/QZyxT4M5oaCwORlgXENeb75v
 iPNhyBwGSh0hXHvTbAEuJ+LZaZFCg2W3/3ULyaWKQ9TOCeHercJyKX3eSy9HOVpOha6xvO
 8A8CT0Sk517d68aYHzmLIpWNWYOleqppgonrMQUeDuHrnlbF6DwTCTD2MrJiawyHImTmsE
 rs1Zz5twfJZ4jyhJVC59eYPWy6FZET09S9vBJShPpQOa+rMo14SnAgMY/HJ+5A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:31 +0100
Subject: [PATCH i-g-t v8 23/49] lib/unigraf: Introduce role configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v8-23-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3863;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Aeo8ukbe2cUGsE8gBt7g+aam35z+3imFt4EgBng+gBI=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pRfk81Mlu3XIjYxlxP0Ilka5nPD1ErTdpoj
 tafRiifTEuJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaURsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJ4Cg//c3qYrsBNnYNFfjxGjg4LxbT0BSQ7TSa
 /DpxqLXgQbvEe7gEzpQH6cxPD278tyzkjgokp/O7otPJQ5VzJLtfhuLdnvd9r/G5yQ2Xop4vsxl
 7C80/VUlD8Mp3qHnteoh0FW5jHhMX1D/y9ugG6zlLBCHIvQgcCdnah1I5ykWExX67YREPa7+lBD
 k9yEp6L6ZA+co35KqKAtRERzi+rj3REJ+L/d0qJTpkRflBYO/fhUCEDDX9jisbmFqxranHEDcGy
 Jjwhq+rbQboOHfI9cnVdaYG3nqXgzFNT2u2SvV6tSxIbfyihfQlEZ8q7Eg8aJRX83S7p05/oTqA
 +lfkCqRhF7WfuCykhPZ5QHr9PZp7Nu5aLSIxw7+bGlNYjQDqF8CDx1SpsLURsSjuLs6dB4YJDmA
 nUUSC9E8GmTYfF8hDeT7mA3/8ylHjuPodQhmxWx8/sjpybg3yAj3XfGCX9I8TnaaPtQGbpe4iOw
 uK5D584X7i5551ejOFR8QjlkdzfwaOnImJMYwFP8zgxO/cDKK4xmnnDje8Xar2FBBe7pMbJDyRB
 54KuLg2irRj804D+BX4D4QJCXTWSotSl+UGde3qL3+8uoCKKmsrcLwyhaNd5A++whLu3YtwGxxH
 77ObQWBnsKP4x880UYFqmVjXK9fn59z4I/Zv+i9CX84lrTKSxqsw=
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

