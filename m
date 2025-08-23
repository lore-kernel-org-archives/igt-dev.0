Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C62CA0FEF
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 02:17:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877C110EBD8;
	Sat, 23 Aug 2025 02:17:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="epH4mpGQ";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B346010E191
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:17:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 5DC8B1A0D96
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:11:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 35E8D606A7;
 Sat, 23 Aug 2025 02:11:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8C9B61C22D4AD; 
 Sat, 23 Aug 2025 04:11:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1755915116; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ql7eTvUuXFPtahXHdMUiRjPmvuQ7uOoHDkgzceAiqmE=;
 b=epH4mpGQZtNYjQyHvk8aTC8krrhqZd7wAFORHCnUxdI++yn+rx2tbbm8gy+OG+3FQW0I87
 rVXqNLNzgzJff1Z4Ojjl2sTYd4f1hr4aSgVBx6B9qg9mCWeIArbY9OQ9M8zpD0/BJmMR0E
 mrKx1x7Qlc5x0TciLQ4ncXWIEqtdonojtEKpKuihKwYC0K8yV0TB8R0TsC/PN1cJhacBMU
 tA09lUEcjCbITfj/qKFOjVIc6Fzei+85+zPTPD5UObUCV5UhRV/hxQmGTXgeEDjPFpjSHn
 /57082beBbuyN0Q/stWn3pjSDkCRehHtgUcLj5D6I3HelNKaaDRXhkndOpGjoA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 23 Aug 2025 04:11:36 +0200
Subject: [PATCH i-g-t v3 16/29] lib/unigraf: Introduce input configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-unigraf-integration-v3-16-cdc36d5fab4c@bootlin.com>
References: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
In-Reply-To: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4126;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=ZAyJ1tts2V9oeMWckKHfqs0j70moSWSGYK2+QfVNLYM=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoqSNV3sHslIisXaJHnJEEvHdVoU3EwKtIqxh9L
 3+sBfbpanCJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaKkjVQAKCRAgrS7GWxAs
 4ox5EACP4OBeAUQlezHQ9anUVRPpVMlxuTJNCGTEtX6DxDFgL+cNiszNWiTmmy7wLZGDnu0fo5f
 1rJCeYaSRjfRE8/cMAeLDDb0+NqWr6tRVbQ2wM9KYcQ5HY1R4PnA0wJ033zhrzAV2+lUcjXg16V
 jxnYNVxmelsGwmdU65/oxJCg1rYCmBBZWKiuFEVwGsVGxIWrGkSKZwCfQlpAXB0aW4ze1k6e69Z
 4+yhy7ZXKtfTztE2hdRQN1BV+NirbxQOEk6XBJbfYMS5UjopXlQeOpN2MkdEiAP+por2jD2cc4Z
 38dgPOEmO30cBokHUpLUmvxsWdNxE3Jx/FqC76sTWDZouepEotDxM0ElddUNz6WnYQnHcOT74tx
 NAdWrzogFJAcwVz3411BygfOnIq4XvGjq5SDHPZM0XYijY/SNsowReN/AaZFrFmXIeVNBQQaxN8
 BEuPF8fmPr5Xhrxzqzp6mDqQdjwTRv+KBIDu2/T2M8TxxWfm3N7mgouGniT2xGolKvKNNIVQagh
 NqPWYhYghVwTot9MaC1itVpEOTmY6wFbuinSb8FOjDBJQDkJtpZsZYodv1bEO7n4ni/SEPHUOFD
 Nx/QeI3oGNST1VRw90LtUQU8vhF5wOG46VaWv3b8HmfjrAJeJv44cyItaRQTI9fkAWYL7NRiogA
 IzURJh7Vh2JUI1Q==
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
index 0b8fe11a957b0ebaf7e9c4c4fc23b5f52c4632df..59a85e1b84c9df47a56f0273dac37d2dcba175c3 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -39,11 +39,21 @@ static char *unigraf_connector_name;
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
 	unigraf_debug("Closing...\n");
@@ -124,6 +134,24 @@ static int unigraf_find_role(const char *request)
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
 bool unigraf_open_device(int drm_fd)
 {
 	TSI_RESULT r;
@@ -131,10 +159,11 @@ bool unigraf_open_device(int drm_fd)
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
 
@@ -158,6 +187,7 @@ bool unigraf_open_device(int drm_fd)
 		unigraf_debug("No device configured, will try to find the first available.\n");
 		cfg_device = NULL;
 		cfg_role = NULL;
+		cfg_input = NULL;
 		unigraf_connector_name = NULL;
 	} else {
 		cfg_device = g_key_file_get_string(igt_key_file, cfg_group,
@@ -174,6 +204,14 @@ bool unigraf_open_device(int drm_fd)
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
@@ -218,6 +256,25 @@ bool unigraf_open_device(int drm_fd)
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
2.50.1

