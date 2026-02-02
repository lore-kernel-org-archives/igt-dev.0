Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DB4E7DEF1
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:32:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D984610E282;
	Mon,  2 Feb 2026 14:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ZdTVbr6u";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDA010E4E7
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 8197F1A2C19;
 Mon,  2 Feb 2026 14:32:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5909C60767;
 Mon,  2 Feb 2026 14:32:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5BC26119A8904; Mon,  2 Feb 2026 15:32:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042766; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=uJ1LC2+JwfEvh8kWk9AWlNF36UzupwguDnkikKhz3tg=;
 b=ZdTVbr6uLBrW1lbUmSmtxVefGArVU8wgU0uPIsJHsumNWwxvjRD4v69TffKnkC59w8Y/LD
 gNO8AzFbTrNThDL3zhbLHY0uc+IfHiU3q3W5EhC6SgQbJCXDg5e2SFsmvs76cKAwH7Zd43
 HyJpl4X1ZRuOsjhTcZkE9+TJ93udnEz5Eyatf3ePKzclLTCVP6LEmKBdyt/kURfol99jb2
 N/FLBo0LKhe8hSjIYT+TQq7j9RxmDY7a9QeqDAoUn6Y41oMqHvw4zNxKtw/eCe0mgGGp97
 1u7nPeGq0vocCcQIcV1WS2XwDJYkGIONk9PgeX0IXTDA3Oz+8wKSwMl69Ef8kA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:33:01 +0100
Subject: [PATCH i-g-t v6 22/48] lib/unigraf: Introduce role configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-22-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4065;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=sC0no2xY54ZiB2TJNCABgYXIXkr/5ZiAPcddkm8BZew=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWRgffutPNI23U/8YezA2SadrM0HCEB8gKNs
 PQkER9Q6tOJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1kRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJhZQ/8CyolZiDKCzo/RI+0xleuMIJewAJdOwi
 ojt3tZ0qBaPdeNiL86f4sj0Z2Uo0c/6XlqFKhpBFrOIMtR4TElgxfrFUrSdKWRfWgpQWqd7tLR9
 BxVbavVc//xU1N5pxOYqRwEysNvYnbrV4p0HN1Duza4O2Essayc9NbBGAHxoGxi7+N6gqWbN1Ca
 z7HpMKC79qDFGdzynyyYGFfH7BhSyLqxxVSxttnv/U1r8l8JO4NvHcZxqm7MjrFjPFSiSzC8Jyw
 y1p5uLV47ujCUMuSQlCUgh6SkliX/0gMIeZqgiHXIm5wLw/z42Y4qCD6rVq+uoa75KWUSNgWAp0
 ZUga9OBsJ/83w4IJNWoVkWG6SuTBROSrIkG1C/DM+IBU46usiYs/0TjN0lNwmxsasXDtJI/FDlP
 NJ+Kg/Ba6gcb1dMJN4SGlOl5exY9vELZZJAEgRe1VNAvHFXCcA2pHWw/4h/qptCJYeUNE229B4Z
 uGZMfuTgSt8VIFtEFFwMHZrykdjskQzs5N52rMUajRn8/1yCAUoTraBCCVrjS1zAHjlN7N7Joup
 RCKGlMqlFYSaCQXC5vD5a9wsDUzfsIKTCb7zWa5+s1RAkKN3ZEB7plOhVMl2tVtGN6amJfRYoem
 NSP5eHAH4UGvfx+hvrej/yn7qsZF7XNFbPyI9j+pkPKkU3ACuK1g=
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

