Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8211CC87FC8
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 18:46:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2FD210E893;
	Thu, 17 Jul 2025 18:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="M7tvlwiJ";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14AC310E883
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 18:46:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A740F442BA;
 Thu, 17 Jul 2025 18:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752778003;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FDukIDQ5hyfNo68bjVXMlsBvfuCnPKOi8jY93cMChGM=;
 b=M7tvlwiJMiTzcGoxVoe5TKxeYGog+MIaV+wsAU3AmcR19cST1HyEOjh4D6M0AOkhA1rJjP
 apSJiURmI6ace0IQ6I6ILIghpWiu71Tp8AyIY2i0MUrme/XMC3NbPUQPxk6NwzsVCeWqsk
 r6n66av1ukZWqWvRuI+905A8yhle2DydmDhxOQLpVtljZKpMzGqP4L9t/9VBvrx/owSGdj
 iJylTArvmKA+7L4tJal4UvkhCIfqPp2xJ/VUkBnZmzKzBIyiaQxQXnYYFl0N64H7WYxzuT
 fm6uy2CG70xtKE9vwIskwdJ+CeDAIIG6hO/9xW8XNXYgf6ducoJwIXkdt+/jOw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 17 Jul 2025 20:46:34 +0200
Subject: [PATCH i-g-t v2 14/26] lib/unigraf: Introduce role configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-unigraf-integration-v2-14-77dc329e584c@bootlin.com>
References: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
In-Reply-To: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, mark.yacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4385;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=QOXJDn0Sq0pByrxcTF1Bt7KHVKMUyvHMjAEWwSK4Ru4=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoeUULp1FmJZh/+DpcDREG3mWPWCj/fqxzyeaCd
 GPK9ZLNb/GJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaHlFCwAKCRAgrS7GWxAs
 4oCvD/9fz7YI3t/Zgabh1JyrsXM6zNsQa8Wwo0jnNECqDkDb24g1irwXTrfWAElWGLKyRjVzofz
 nB0yywrxCY0umLi/6il2caSDWyG7bMt7ZV9OcyXha0e1kev1WZ5DWFJxp85m+xSW+mSxKqW3Dcp
 K9knZpwEU9xmvt8eoNDlWXmY/IjrsRX3v7yci0vJnqsF8EkVNcOpazH6yeqqsCgGmzgDMpXzDws
 zcg5pKi2j/6pp5Sl8lhrZDHo4r4PSgCNPJeu2WT8kDhGQ7kDRc5dy90psYKqEUCJOo2Jf/hnpbP
 GueL5a9Y2KgYMU5ETtFq/9GwMPkoCj0acMmWqDI3kwEFjlzCgxo2N1ZZ1c7iwlTi46Q1hZ8PtQW
 8FqW3KfJg8Ivj6Kxs7UEjui88xiiKVCq7bMJx72WoM/TiFde7c5ODUEkJfwpVKb0HO8+re8ax7H
 0Xsxj1ucOI/sUSExeW2kt5BqX7X+LdaHwCGaFErcnOwdO9oJkWAkgHZf776AeSFPN2Ck6ITnzSw
 biGzY3f5vQcJS5lSmjCyuj6JNnpqks29sIC6irckKOQcmkQPmA5vtoz7LarYuHLZPj8XsnO4LEa
 plTY5G4Ab+CXkA08mhwFpzjRzNOZ0JD+tiMv7IH5fodwe6WGA/3xs9yWKMw81QYJT82EuUZXr4V
 kSlQdpOH1xiOvgQ==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeiudefgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehtdejtddtteeiiefgleejkeetteevhfdukeegleffjeehgeeivefhgeduffdvvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrieejngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepihhgthdquggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrrhhkrdihrggtohhusgesghhoohhglhgvrdgtohhm
X-GND-Sasl: louis.chauvet@bootlin.com
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
---
 lib/unigraf/unigraf.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 52 insertions(+), 3 deletions(-)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index f4b6183dbacf359c5e91ea70bc3b6acb9488839a..b4401daaac5a69ef02a15ead1b8edf3f2cac3833 100644
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
@@ -90,15 +102,30 @@ static int unigraf_find_device(char *request) {
 	return chosen_device;
 }
 
+static int unigraf_find_role(char *request) {
+	int chosen_role = -1;
+	int role_count = unigraf_assert(TSIX_DEV_GetDeviceRoleCount(unigraf_device));
+	for (int i = 0; i < role_count; i++) {
+		char role_name[UNIGRAF_NAME_MAX];
+		memset(role_name, 0, UNIGRAF_NAME_MAX);
+		unigraf_assert(TSIX_DEV_GetDeviceRoleName(unigraf_device, i, role_name, UNIGRAF_NAME_MAX));
+		unigraf_debug("Role %d: %s\n", i, role_name);
+		if(!strncmp(role_name, request, UNIGRAF_NAME_MAX))
+			chosen_role = i;
+	}
+	return chosen_role;
+}
+
 bool unigraf_open_device(void)
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
@@ -121,6 +148,7 @@ bool unigraf_open_device(void)
 	if(cfg_group == NULL) {
 		unigraf_debug("No device configured, will try to find the first available.\n");
 		cfg_device = NULL;
+		cfg_role = NULL;
 		unigraf_connector_name = NULL;
 	} else {
 		cfg_device = g_key_file_get_string(igt_key_file, cfg_group, UNIGRAF_CONFIG_DEVICE_NAME, &cfg_error);
@@ -128,6 +156,13 @@ bool unigraf_open_device(void)
 			unigraf_debug("No device name configured, uses first device available.\n");
 			cfg_device = NULL;
 		}
+
+		cfg_error = NULL;
+		cfg_role = g_key_file_get_string(igt_key_file, cfg_group, UNIGRAF_CONFIG_DEVICE_ROLE, &cfg_error);
+		if (cfg_error) {
+			unigraf_debug("No device role configured.\n");
+			cfg_role = NULL;
+		}
 	}
 
 	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE, 0));
@@ -153,6 +188,20 @@ bool unigraf_open_device(void)
 	igt_assert(unigraf_device);
 	unigraf_debug("Successfully opened the unigraf device %d.\n", chosen_device);
 
+	if (!cfg_role) {
+		unigraf_debug("No role configured, trying " UNIGRAF_DEFAULT_ROLE_NAME "\n");
+		chosen_role = unigraf_find_role(UNIGRAF_DEFAULT_ROLE_NAME);
+		if (chosen_role < 0) {
+			char role_name[UNIGRAF_NAME_MAX];
+			chosen_role = 0;
+			unigraf_assert(TSIX_DEV_GetDeviceRoleName(unigraf_device, chosen_role, role_name, UNIGRAF_NAME_MAX));
+			unigraf_debug("Role " UNIGRAF_DEFAULT_ROLE_NAME " not found, using role 0 (%s)\n", role_name);
+		}
+	} else {
+		chosen_role = unigraf_find_role(cfg_role);
+		igt_assert_f(chosen_role >= 0, "TSI:%p: Role %s not found.", unigraf_device, cfg_role);
+	}
+
 	unigraf_assert(TSIX_DEV_SelectRole(unigraf_device, chosen_role));
 	unigraf_assert(TSIX_VIN_Select(unigraf_device, chosen_input));
 	unigraf_assert(TSIX_VIN_Enable(unigraf_device, chosen_input));

-- 
2.50.0

