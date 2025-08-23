Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403D0CA0FEC
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 02:20:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A9710E31F;
	Sat, 23 Aug 2025 02:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="kQ8OJmJL";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0618E10E31D
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:20:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id CEB5F4E40C49
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:11:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A916C606A7;
 Sat, 23 Aug 2025 02:11:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0C5161C22D4A8; 
 Sat, 23 Aug 2025 04:11:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1755915116; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Vf7QgIqA24SsKQxQELnelFrlzcsCuJhBszHL3XrZzl8=;
 b=kQ8OJmJLwgtTyGhGPJxrUXaTcqdlhzJ+87ueiZ0KNjuY9SEyHU23+6xYq67uKBIroPzyE/
 fr1hwLmi+3Y+xduUoNvglBxmyU3K6BfBbUMwpg06fDbdl+hbFJWFtWjTDmnQuSXaawQAhw
 Rd8VD97WX/6YBELw7SRXj1gDXQcNfpxkcWp8Nor/Hz9dwF/4KdDAG00nIuNtECwT48/h7Y
 xDlIA1nU4yamfWDNwKPTGBghU5FhjDNa8o/EM/0GTyOoM6RMzduThUIBiLC6r02WoYZzrp
 Y1ibYM6kVWc/W1pjlsvsnVppHrDE9qn3/sTvAPqFHPeKt4Nxkk/oq6sFhy6hqw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 23 Aug 2025 04:11:35 +0200
Subject: [PATCH i-g-t v3 15/29] lib/unigraf: Introduce role configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-unigraf-integration-v3-15-cdc36d5fab4c@bootlin.com>
References: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
In-Reply-To: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4503;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=VJrU5hKnmS933OTMbtbwlmnAGWbqzhflS8qstscsTpc=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoqSNVsS5ZvfJl+hBH5aiU+Z73aPh+QWxZi2wKy
 6HVndvTVh+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaKkjVQAKCRAgrS7GWxAs
 4kw0EACH8+Poq3GYQ6d7je2TaQ0I3XRhrytWiPvPNcxf5+BVQv+3Cn3uqhjqv8fjunl0WBCpAWa
 RkbvnqgAEfUfI7zBeBzosEtan9aR4G2b6q6lorIDTfaNmKqPnmcXDQZbxt9YLZtTZSEPF0am3As
 a+lJM3T9diObUwuczrsp+WqSX32Evqczs/pjMeOw75R/EglMX/qDV8pUSpUm1TS9yX6YEIZeu2f
 Pqv5p9KqSbCldNniQ7OhtIbHa3+jawhJpqQ7SXFVi60+tyFWJoz22rT+LtMNJupCi4HvZJ+Kplb
 Z56Np9CHVQRhYxaQRiDhlEbTwExDV4g6nGKP3LIhB5BU+UARlcm68rgWscIS5lRvXmiXtNZmrWv
 qR91KvCAXF4fOJoTfCzQ+pQyyqAYA1QV1+jSiEzKfYlDFstvKvNmzGQY54Y1OEmzQbsh/9k0a4p
 30+5142rEauR10i5zOUvEPQm2QimhH9j34Waw5oY6ELL0lzP03LwuRkUqkrr7R+4L6/vFlyh01l
 1q2nlYuraf0y+qQq622/Y81FQuyE88gth8q6sUrzL5gdXUKHb8Sk8cMx1joFwkqXBM1WrJpiIKS
 3aSiMQgNdp+phvPF3cX1eB1rfTgjLzA/o1m9ClZGUyOVLUO5eIbAelzbyhuthRMyZMB7kN7nslH
 Fw0M6hDEgvpShEA==
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
 lib/unigraf/unigraf.c | 65 ++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 62 insertions(+), 3 deletions(-)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 304567467b27a5e68cc2db6ce66b3a8b53fb87a3..0b8fe11a957b0ebaf7e9c4c4fc23b5f52c4632df 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -19,18 +19,30 @@ static TSI_HANDLE unigraf_device;
 static char *unigraf_default_edid;
 static char *unigraf_connector_name;
 
+/**
+ * UNIGRAF_NAME_MAX - Maximum name length to be used for TSI functions
+ */
+#define UNIGRAF_NAME_MAX 1024
+
 /**
  * UNIGRAF_CONFIG_GROUP - Name of the unigraf group in the configuration file
  */
 #define UNIGRAF_CONFIG_GROUP "Unigraf"
+
 /**
  * UNIGRAF_CONFIG_DEVICE_NAME - Key of the device name in the configuration file
  */
 #define UNIGRAF_CONFIG_DEVICE_NAME "Device"
+
 /**
- * UNIGRAF_NAME_MAX - Maximum name length to be used for TSI functions
+ * UNIGRAF_CONFIG_DEVICE_ROLE - Key of the device role in the configuration file
  */
-#define UNIGRAF_NAME_MAX 1024
+#define UNIGRAF_CONFIG_DEVICE_ROLE "Role"
+
+/**
+ * UNIGRAF_DEFAULT_ROLE_NAME - Default role name to search on the unigraf device
+ */
+#define UNIGRAF_DEFAULT_ROLE_NAME "USB-C, DP Alt Mode Source and Sink"
 
 static void unigraf_close_device(void)
 {
@@ -93,15 +105,35 @@ static int unigraf_find_device(char *request)
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
 bool unigraf_open_device(int drm_fd)
 {
 	TSI_RESULT r;
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
@@ -125,6 +157,7 @@ bool unigraf_open_device(int drm_fd)
 	if (!cfg_group) {
 		unigraf_debug("No device configured, will try to find the first available.\n");
 		cfg_device = NULL;
+		cfg_role = NULL;
 		unigraf_connector_name = NULL;
 	} else {
 		cfg_device = g_key_file_get_string(igt_key_file, cfg_group,
@@ -133,6 +166,14 @@ bool unigraf_open_device(int drm_fd)
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
@@ -158,6 +199,24 @@ bool unigraf_open_device(int drm_fd)
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
2.50.1

