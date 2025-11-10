Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0337CCFA13
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:39:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EEA910E3C2;
	Mon, 10 Nov 2025 13:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Z+5LHwA/";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17EA510E3B9
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 00C5B4E41608;
 Mon, 10 Nov 2025 13:39:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CB5B2606F5;
 Mon, 10 Nov 2025 13:39:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E76F210371914; Mon, 10 Nov 2025 14:39:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762781993; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=8/XRPc7kcND5wBew1zHPUmN4Qq1TkPpdXDvfXTbwwrU=;
 b=Z+5LHwA/5DQE513RCSEPv1+43mPir4dj+apRI55aPbX8nTvQYnqeusWEPnzCkyYa1rErAv
 0nQzjvzBk3shZgYiGMuzNoMaicZIJKPr1I9lYF3YdzmEfHtF9RcMZPPVWGl1rTzQbUvkgm
 4R/XBKTgT7UkCDoaClGPjILa+guRsbh/MkgwcxkK2hsrYgYccU3V6mVUch5C9naH3vW1g2
 p+Ef2ePhqcB0iSKOeFa9vndVOLqgXAFmT1+DklHvQc//K1iyDy7VSc9LJM44a3WwSfzaMF
 HbuTPLSml6H4mF9rGohsC1LBi/mROOm+LotIcN31pBdkWq3SQwetWBexlak7yA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:25 +0000
Subject: [PATCH i-g-t v4 23/46] lib/unigraf: Introduce input configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-23-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4070;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=/VqLa8Lg7RH1a2DxrzgymSuCWJBE5dZ33bUt0fe8oyI=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesQLtITpfPy5xMdycEKPjdzjMCLBFS2sg+FY
 VbFa5sG6tCJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrEAAKCRAgrS7GWxAs
 4kvID/9xFG4rBWzYnc/aQMjWj8AlFUhpyRTmCGkCRJRYsg9oL5ZnXE8dRNUeuRXH3r6b0yPUBRQ
 ib+K/ygS63XiksGk57FpyiCyxQQqXeASp77zfG3TB8BV8GEcSlMYUcUwAR+9/7LhD8CjwKW6b2o
 HLc62kFUO+smmo2XsoyHiV7j5/t+hprY6gJ9QOMabBTxMSnWEqDSTU+nGUc/VQ97pRruTw0Va1+
 40rpWFr3cvnz2kMgeUazgERFzsIDKC2BgFbasxqsHWUwuwmGNZLe6VrYGZVTqik9XFTcEmKzWui
 PBw/hEj5CjzB4RVjdZOXgYGnLGuMoHos6yrsIoKVYAeWNzvujNzltc3vNzFmbbJH4zfaTF2SLTl
 Ca32IFaEoTumvRdrBBw/f2hQohMgepwqgsBu3M+E5KUtfl72oYL30hQhyMfJAhIdRIhVC/Yn1Sd
 iRxcszrP57fiM6L47qMXXUa5WzENuw+CeKXEOFv+jcCjyVur7LgojiFSNkZr9Qr7r3BlzSNx3pe
 4ILbe0MwFFygnmRr6RuSYcMjCkPKaAo6wh6kz6KwNupdTXlrg/3q+LO5YOdNyRDIN0Uks8Hn5Cc
 xHTcO8NPnR8hWdqAo9XMa9jJJtD4HiNTy4LhiXr8VeP1Pc9Mgz3Oj/NLlNLZRecDDJnDC4cmOP2
 g+10bAHViA34Zyw==
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
index 0b8fe11a957b..59a85e1b84c9 100644
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
2.51.0

