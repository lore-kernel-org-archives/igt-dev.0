Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23ECDFF60F4
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:13:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D286A10EC97;
	Tue, 31 Mar 2026 17:13:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="xQQUDD7X";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A7910EC43
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:11 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 9A80C1A30B4;
 Tue, 31 Mar 2026 17:11:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 716DA6029D;
 Tue, 31 Mar 2026 17:11:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 40B76104505CB; 
 Tue, 31 Mar 2026 19:11:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977069; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=M8Gyxb44drDW/HpUANtIUP94njlTJcJZOij2pN+VnH8=;
 b=xQQUDD7XAFCzt/7M+4q2l/B50cyIWDq0bVc4Qh55D/8+sHo4Vf4EgzQ4ZV1tosyRBwlJTa
 1qrB47a4+7raZSVTVpALQuEJKPAUvqXuoVfnku+TyrBHY7Oa9GwkO47bElzxbuwlb+264G
 +TuZXH713w6QVrsTjyaUvDPNhONvhK/0XyBEU+M9nmkjDWcWK0p2OISAKLhThyeFAgkSJI
 RBfxfgmU1e16gckGc+fimLtARt5chtD8TzRh/cHyRVjB0RuAr+JOWMtHKvWmn0tU0gdMQc
 aLRr1yxMr5y/rFbIf7MmbgJAsIPqp0qn6lqE0BCSZedZyFo+bwET5n+gNwy11A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:11:40 +0200
Subject: [PATCH i-g-t v10 23/49] lib/unigraf: Introduce role configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-23-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3917;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=7fjA24c51bMg+YOzCpXwGTK2PLvH+gv/j/a8GaaQ8lA=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzAA+vAYUs+N2CnorN6aBu1IDKUS7VbxSehZvO
 vvkeQFMUVqJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAPhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJbfxAAz2Xyghkl0Y4ntlHgAKXZaKomTv89saF
 79MPv2CQd01CmQE3RCx/a9derDTDJ41MsI73q57QGVMYMXLNEi1VqJxtwg66etT9IKsP02zHIfI
 FFonfTSqe7F/OUpWFUdB87+vV+RuLTQzBKzFjNT1ag3t9lsTC2/6Nxw9RyVcxkgTXLu/ZYR86M2
 9N9rHNaRlBNlPJkUkQ83AH091XkFnC5fX4YZLWwbnHCzX1r4fyfMHVC0rsoKUfXZmeap86ZNA9n
 H4QzppJxeMpJLPLp60IHoH7Wgr7AYP5Bwk+NNq5kH+e8ZA4zlSf0wgRpMEHLZDTUINsraGyQUag
 Pe0bSKKcuWi3m1gabCv6dNtWKpB54PmLXfnpWT6IuD5ytQ1VdyBlDE1kpNnGzw9TKeTzferMiLh
 kP5Lb4qA58TPWiZaB/9L1ruuzxce+pqpAoM+mNo1GG+hFhsWFkyf2sA1YhZ5mLLd47Ej9LmzzNf
 uaIQGBC7RArMRBXmSe3rmZuvQt3smoNLjdyuuzzYVWc+MHKTgX6r0NtL1x4DXog+zXnlcn6HB3c
 YJ5UC3R3HW0wFgm8nLZ3OnmbvoG5ypdpSd+UfmCj4pXDG8XslLywZLowVM4sj7M2m5AOF/sO5uL
 aaR3E73sjv2p252J/eA1fkZNHGdx7EyQnmtYzg4bBNfvpJ6caalo=
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
 lib/vendor/unigraf/unigraf.c | 57 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 56 insertions(+), 1 deletion(-)

diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
index bf52357e1dc9..49d326b80b1f 100644
--- a/lib/vendor/unigraf/unigraf.c
+++ b/lib/vendor/unigraf/unigraf.c
@@ -6,6 +6,7 @@
  *   Louis Chauvet <louis.chauvet@bootlin.com>
  */
 
+#include <asm-generic/errno-base.h>
 #include <stdint.h>
 
 #include "igt_core.h"
@@ -36,6 +37,16 @@ static char *unigraf_connector_name;
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
@@ -113,9 +141,10 @@ bool unigraf_open_device(int drm_fd)
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
@@ -132,6 +161,14 @@ bool unigraf_open_device(int drm_fd)
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
@@ -155,6 +192,24 @@ bool unigraf_open_device(int drm_fd)
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

