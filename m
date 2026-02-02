Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3921FE7DEEE
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:32:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF19110E4DF;
	Mon,  2 Feb 2026 14:32:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="LEGVYYPT";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C5B210E282
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 06F09C237F3
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 39D8360767;
 Mon,  2 Feb 2026 14:32:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2A385119A8906; Mon,  2 Feb 2026 15:32:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042767; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=GBWFnrdQzQVpvgFgg+chbMf+/aWXhPWRHNXb+Vu+LhY=;
 b=LEGVYYPTxJN+iOunr25OnD24+SxfEgWGF7TdPi8m+n3ue+96kIrKKJDCatDPyTOTqAK29n
 dO36yOGZikBo1WcLsI+1slvhx1xrdKXjNXrCWUHKpc1pT0M2aDxn2YJzKpLG7/yHjfvJ+n
 +ejCKDhpU8IkBktG1gJmWlnaoV5kn9TbChsCnKioQBAZf4/XdgdruGM1RoLWUu9RTJiKhj
 as6g5wa8sxSGaTJc8XYtMdwDh+6w8lm/KGuoCujGMSAVeaSHz+jOW+GZ7NRqy6BEw2IKz7
 96ZeD6INVG5JKpWcTAvcnkjBcEuuEHLA94d/16U5te6+aqKzBtQhHfRYMF1DJw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:33:02 +0100
Subject: [PATCH i-g-t v6 23/48] lib/unigraf: Introduce input configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-23-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4124;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=vKTYW5HeOEZL9fhRJ1CFpBi5tPWmSzJj5SvGfsGESS8=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWRIE5Ga5ciCYwrmj6LEmPF5oPG5MN6jO07N
 5L8LHZmcROJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1kRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKQDRAAkeUb6jAPC9FAfS1ZK+meoq7OV0pIGB6
 N6ultx7hoS2Jm79+I72u9l7ll6FpWRkwVXoT101FaxLtJsvJiNTxzSuhTwY1u5ytT3bSJrnR6Xi
 srLO5xymO/P9gxFdUysxRStMo/vCkG7Dp8zaudeG9JX5QcyDxV9FNWYy2aqxhvNSgR7NTsbHsV5
 lKAv0xouQJrR5//aebVhKiezGHSPD43QPtAEKOvqAcrHEP5RjfXtYVdvQl4R6hfLshZK8a23hDa
 2JjxsK+Z8wdK0hlj48ligvM5L8/n1QvzVn4yVsfuMAjWSztMlw1ewaiMkA8sVoM5iRPBvRlKW5C
 OAf20X8RHLrhlCSQtNNfSfID7n85TuEPbKuzUW4mt4NbK+KzX7UwoR0jUZaJ3dKaKixPw05c55b
 R7YijqbBH3S/4SCUPYKUfSmmF33uepV8Ce6dl8IF3x4tYQU3BoCXXSq//Ud2qjHhv1gXrg+E/qg
 4Ey1t+MbQMR8qTeBoqzkAz0ZeyZAGg0FhfDGtHO2qoJcWy4atPhVa9wLd4uWlT/715XMN57fviW
 gm1UC7dlY7RmgaRik28ShHi+wM/lN+AQMI3UMyVTVeZUxNVpmZVXK50FgeM5nZai1MAcpR31nFh
 HEngRR38n49Rh0GjDIdWad8HUtV4+UKdby7NF2Kd7KuI0joeR93M=
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
index fb901c38453e..1b31f7a44566 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -34,11 +34,21 @@ static char *unigraf_connector_name;
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
@@ -121,6 +131,24 @@ static int unigraf_find_role(const char *request)
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
 /**
  * unigraf_open_device() - Search and open a device.
  * @drm_fd: File descriptor of the currently used drm device
@@ -136,10 +164,11 @@ bool unigraf_open_device(int drm_fd)
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
 
@@ -163,6 +192,7 @@ bool unigraf_open_device(int drm_fd)
 		unigraf_debug("No device configured, will try to find the first available.\n");
 		cfg_device = NULL;
 		cfg_role = NULL;
+		cfg_input = NULL;
 		unigraf_connector_name = NULL;
 	} else {
 		cfg_device = g_key_file_get_string(igt_key_file, cfg_group,
@@ -179,6 +209,14 @@ bool unigraf_open_device(int drm_fd)
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
@@ -223,6 +261,25 @@ bool unigraf_open_device(int drm_fd)
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

