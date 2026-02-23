Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA9BEA4FAE
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:09:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915CB10E36B;
	Mon, 23 Feb 2026 12:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="FCvsl8N0";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA40A10E35F
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:09 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id B50F14E41030
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 777865FD43;
 Mon, 23 Feb 2026 12:09:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5254310368F99; Mon, 23 Feb 2026 13:09:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848548; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=qzOrbGDtfgo47kjJ6NhXKLzr5s5Z6xB2MYQBvpNT5jA=;
 b=FCvsl8N0POTQzTO+1XI5g7qNI9TX7TwR5oYxJ6leNDEzlpJlHcqRvi9AWYUlSCfqJtu0fA
 KNcnInwnU+mhDTcyxlVEQo++51vyyp236w3cr/ntJ5fW331vXu8lfvd++SnDh81Ag7HH+S
 9nPAA2TMx5e5ghkV+dRRR1KG+yXqhYTgoJzjEC2pMykJEMIZqQa3+3Y7c7af8SQWaQa6G+
 I9mQ4rhWNBQ39azf7mQuBQo7Rrn2kWZvHMLpo2TUeOfLqai3XiTX6Al+qpjLotkfb0XbNR
 AJkExovzqpMa+LohIJQvIVQoVgZg4B68OB9ptWw0sCyQtaZ2i/1LgvVn03SqkQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:30 +0100
Subject: [PATCH i-g-t v7 23/48] lib/unigraf: Introduce input configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-23-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3789;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=lmLHRIZFvVRqqr3ENgpoqT6Lif4Q0LUXOTI6iWQLBAQ=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENpi1dEjrvGxOhs8G5TpAw5JphyF3/d9Si9G
 krmSFBah/SJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDaRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJWrxAA0Dq8JAwyKrLjyqLdyS88XFtuTEdYCe1
 cDwH2k7oDgJhD79MGd7WfQsGI+orK9M/StDQgluO4txekHYWGBESwISVXBJtXsI5401KPjqMlqj
 smT3Rr5X/rS0692cFteEZykvpfOq7T6tnVdy9TmEr3sZ7KmwHxNPkOu07eSuDsedg3d8K+c2cA/
 +kdT2xk3i8PjFPMKSJ5XaBNo6cCRNKFGec1O84zKV2LwP416LeLkLsaFk6ZGEJC47Wub4Adg2Gs
 9bpTVvCePfjUcK9jIYUc318aVKcnJCJVRVoMjlwQiABIGNbUnntrthsilBP1J/4cGHfk+NVnee1
 zYmPAY4rxcl5ZmghliaOCwK9x/+x2Uo86Ot4v4Hfv0S7/q50NMbO0aynoWbGevM1QPESs4Or+Il
 7RAzHZEVbD/igqi0v0/EXCrZa6hkJgP+PMakJaALb5dPCL0ZC8MTWPUeW43De1QVkT60vT4c/PQ
 VPfpIaTwXcUSadCcW6i9tWIwhjUGNxSaZUPme4xABTMICnH0BhYqxps68KTpzL7bU6rPpaER/Ic
 LYIMvvWepuOesLnGtt78DGf6JRFKpVHUErvk7ckJRuhLUfdmjoA1JRFNi5RJvO+x4DR76MRmEnD
 gNBPBC0OMGP1Jo/h4ngLV6KuiQ0zQXC/fiEHieglzjHAPyxlfsYI=
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

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 56 ++++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 614484044398..ec351ebbd89c 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -41,11 +41,21 @@ static char *unigraf_connector_name;
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
 	if (!unigraf_device)
@@ -125,6 +135,22 @@ static int unigraf_find_role(const char *request)
 	return -ENODEV;
 }
 
+static int unigraf_find_input(const char *request)
+{
+	int role_count = unigraf_assert(TSIX_VIN_GetInputCount(unigraf_device));
+
+	for (int i = 0; i < role_count; i++) {
+		char input_name[UNIGRAF_NAME_MAX] = "";
+
+		unigraf_assert(TSIX_VIN_GetInputName(unigraf_device, i,
+						     input_name, UNIGRAF_NAME_MAX));
+		unigraf_debug("Input %d: %s\n", i, input_name);
+		if (!strncmp(input_name, request, UNIGRAF_NAME_MAX))
+			return i;
+	}
+	return -ENODEV;
+}
+
 /**
  * unigraf_open_device() - Search and open a device.
  * @drm_fd: File descriptor of the currently used drm device
@@ -139,10 +165,11 @@ bool unigraf_open_device(int drm_fd)
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
 
@@ -166,6 +193,14 @@ bool unigraf_open_device(int drm_fd)
 			unigraf_debug("No device role configured.\n");
 			cfg_role = NULL;
 		}
+
+		cfg_error = NULL;
+		cfg_input = g_key_file_get_string(igt_key_file, UNIGRAF_CONFIG_GROUP,
+						  UNIGRAF_CONFIG_INPUT_NAME, &cfg_error);
+		if (cfg_error) {
+			unigraf_debug("No input name configured.\n");
+			cfg_input = NULL;
+		}
 	}
 
 	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE, 0));
@@ -210,6 +245,25 @@ bool unigraf_open_device(int drm_fd)
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
2.52.0

