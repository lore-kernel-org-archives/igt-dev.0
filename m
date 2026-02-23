Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3530CEA4FB7
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:09:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE16610E37F;
	Mon, 23 Feb 2026 12:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YssG5Egc";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9244C10E35F
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 8C75BC143C5;
 Mon, 23 Feb 2026 12:09:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 726545FD43;
 Mon, 23 Feb 2026 12:09:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0A35C10368F97; Mon, 23 Feb 2026 13:09:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848546; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=eblzAdC3eLcx5h1FriYRTjoi+ha+5sDMvukvlmNUFVw=;
 b=YssG5EgcxbbBD6Ddysu9HO+mc3jRFSwhKZborhQgcqXbbax5TLhCvq+ZPRRlL8ekHhdvRV
 p+4gGkMrtps8xVcAvHlRQ6gDGYoBV8bHxjCSkV/K4bfwhxvwJc77jU2jO+8UEqrd/y0B2v
 VmavezDSLTb7eDAlW01paXttVnwpkXnmT/tpCv4AVqUrO38j16iG6dgrqsrSiAKNnBG67E
 bfM59Im8jc50Vm7FEjQq7ZsRHQvp5MVLBfPzE2ePf6B4ddQrKWRha7LPPhQkN+WwXrxwOZ
 KiWVpBu9dLlbscTTopeGampuX3W/lYN4BENSJgkn7XxwQKo14sXtL+ejRtqrfQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:29 +0100
Subject: [PATCH i-g-t v7 22/48] lib/unigraf: Introduce role configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-22-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3859;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=JwvdiS4DzoX1zfijeJYJRCzjS04fwoAVJFBBB2+duGQ=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENpZEFygyB52KBP1WLwsEMyNH4CqU924fK5O
 eTLHG+U5BiJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDaRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKR1A//dtsw4t72l00H6niVEmUOPAlqCE8gqbq
 y+S/4Gu6uhnLJOnFfQKAFL7EhQwVbU7c3pfTM2necuWZNLPTDLS2anShx7f50Yn8gXuVXln+/DR
 75LbjK9dBbYe9qASK5Y65wtVk2GqUuSgcqA5xsW4zwkPdMOCqHB+NSdZmu0rjQxFkDU0S8omryx
 YG6/5NglO1R28t6eiZH8g5CFdm+74FANJX7egeWfwxAeKI/oMUTRD8Vye79n4IT3oUPI0I4V3kz
 s7f9eWdKFrJAUej+fpuMA6TDU5t4fD4dES5whf1090ygBzvsdLoV4FKLKWKl62a9IEQSRthMWyn
 HxAV/b4ojWDRG7LlD1JKZQo21zgDsBHhZ7xpLIvkskacgKr8NPmduyMwDHrOY2dh3dIP/2D188v
 6kWLx8xfmwaX7WF3JmejB/GVfuvlOlc0o7znEqa4h5uMv+bmEYtPKitGPTDUe25yj2geDclTGLk
 iusn9bOElKqk46+tWy+ThG+5hW+3YB67VIGhIOmafOpnXhpYVLrZsOoDNPdMTgPafElMcu6ECYb
 XOBPesRjsfXMtjnqtyA1288XaEEQjn/97ySuvMdqdts9XbQNm/4aNzeo26z9nmmYdPHDnsBHQsj
 KWbIFcvDCNL2ZUZWjw8KLm3FWteu6UDUlCmoBeu/fHziOrTHMcSw=
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
index ec709a55c106..614484044398 100644
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
@@ -97,6 +108,23 @@ static int unigraf_find_device(char *request)
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
@@ -110,9 +138,10 @@ bool unigraf_open_device(int drm_fd)
 	TSI_RESULT r;
 	GError *cfg_error = NULL;
 	char *cfg_device = NULL;
+	char *cfg_role = NULL;
 	int device_count;
 	int chosen_device;
-	int chosen_role = 0;
+	int chosen_role;
 	int chosen_input = 0;
 
 	assert(igt_can_fail());
@@ -129,6 +158,14 @@ bool unigraf_open_device(int drm_fd)
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
@@ -154,6 +191,24 @@ bool unigraf_open_device(int drm_fd)
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

