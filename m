Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B7F1C83F34
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 18:47:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D222010E324;
	Thu, 17 Jul 2025 18:47:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="V+Gtgc/p";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E74510E15A
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 18:46:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id ED384442D9;
 Thu, 17 Jul 2025 18:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752778004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pzJ5BwupCKV2O5JJ7Wim73tKk8yzANAJR7MEqARc2MU=;
 b=V+Gtgc/pkJBHqHTsTS7uSlZrPirFW1kzVrqLiybEWA8LC2xIX0TUYd3+y/uB+2re5Mi6vR
 RTqvkTW/MtaaIn/aEMxnouJemFqU1XbM5Nf1MSDIY5tw78OWmnP/iGH8MEPyITlDwOV7+s
 wGudD15Jmnd2AWdQww7tAtVVAQ3qt6b7X/43i1LojyQ02eJ696rU6l9/5Gs+K50rqVrugi
 I5x+Y5JXIsqz7yfmgl3Li18aGH8RdRywCE8ucLiahS1+Q0I11WQ1DoJybvW+MDyM9aKpwG
 JUz5qxZL9uccFSayPX2XUsBf+iSZQX1O6b2fJ7Chs8H7i5B7ZHXJ3GHndiFezg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 17 Jul 2025 20:46:35 +0200
Subject: [PATCH i-g-t v2 15/26] lib/unigraf: Introduce input configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-unigraf-integration-v2-15-77dc329e584c@bootlin.com>
References: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
In-Reply-To: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, mark.yacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4024;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=KBjUVvpW31PaHSBf21onu3PJQNZpfb9aMX4bmkzhrXM=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoeUULKlIT0bIFnkZYXAWPwTwsi7Zdc5TLNOaLl
 8HmnhgpBZaJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaHlFCwAKCRAgrS7GWxAs
 4mT3D/9A9Qw8BEvZTNv1gJ86p6YuLslZhbdOJ7u1AJ3UQKLZqXJelZhXgTlMLzSZiVpq5P2w3so
 sWqCtiLO8k7xNgN9JC/bLB+8tgNgdq5nWGSU9PEYZjYjKzHi1t6bQxOaGnoXXe+Kgp7a3OxAtv0
 Fy8dyM4aF9dJHI/zr2yXKd6zM0LkLeixW9aiGCyR0N6Q+i7zQ04VzBlvL1lrVLRZrrOWUVhhR0p
 8ZCNozPGWqJUhohaBwM8JrfeUlAXb+3ykwvsyYlH8fAQ/Oj+/zvGgd7t/TkNAsU7HWdmsQh8lwN
 fU2rTJ15rRYaMcq9D7xtfQk/M5igBfAbX94RGUt7y4RdWFD7sOAU/m5IbJKQmuPSruWsddKw0av
 N9UdpCyNA7+INPxk5I6ZcNxFIUNw+TPtyAr1B2Y6AfQ+7T3Lsvdbq+AfuT4L4lCadrWE9tbqd8G
 LEbvFzgdX26b8tFJAh/HB8OZfYmRRpWVpPwDjdfcXY/YXZkPTvG6Cno9qLwGtUYNHKrRroNpXcA
 pEfxamyO0ItkaMdgXTVE0pJEbVY8kr4iZ9yvoYMZZ+9GISS0/sEEn+aE4qytxnRZl5PI5ezM9hN
 4WZ4bQZowE1yv8T08rNkik5VuN+sUDBV+H1xCQ68rlwkZtUcwjnKHrLqFZ5Yq0Ad6CC5OAErnIE
 RUm6RzvPYBCY0gA==
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

As multiple input can be present on unigraf devices, add a configuration
field to select the proper input. By default it will take the first
available.

The configuration can look like:

[Unigraf]
Device=UCD-500 [2434C620]
Role=DisplayPort Source and Sink
Input=DP RX
---
 lib/unigraf/unigraf.c | 50 +++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index b4401daaac5a69ef02a15ead1b8edf3f2cac3833..d9e9d80a4cf19c6be67977050ef2a17f2cb489d7 100644
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
+#define UNIGRAF_DEFAULT_INPUT_NAME "USB-C, DP Alt Mode Source and Sink"
+
 static void unigraf_close_device(void)
 {
 	unigraf_debug("Closing...\n");
@@ -116,6 +126,20 @@ static int unigraf_find_role(char *request) {
 	return chosen_role;
 }
 
+static int unigraf_find_input(char *request) {
+	int chosen_input = -1;
+	int role_count = unigraf_assert(TSIX_VIN_GetInputCount(unigraf_device));
+	for (int i = 0; i < role_count; i++) {
+		char input_name[UNIGRAF_NAME_MAX];
+		memset(input_name, 0, UNIGRAF_NAME_MAX);
+		unigraf_assert(TSIX_VIN_GetInputName(unigraf_device, i, input_name, UNIGRAF_NAME_MAX));
+		unigraf_debug("Input %d: %s\n", i, input_name);
+		if(!strncmp(input_name, request, UNIGRAF_NAME_MAX))
+			chosen_input = i;
+	}
+	return chosen_input;
+}
+
 bool unigraf_open_device(void)
 {
 	TSI_RESULT r;
@@ -123,10 +147,11 @@ bool unigraf_open_device(void)
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
 
@@ -149,6 +174,7 @@ bool unigraf_open_device(void)
 		unigraf_debug("No device configured, will try to find the first available.\n");
 		cfg_device = NULL;
 		cfg_role = NULL;
+		cfg_input = NULL;
 		unigraf_connector_name = NULL;
 	} else {
 		cfg_device = g_key_file_get_string(igt_key_file, cfg_group, UNIGRAF_CONFIG_DEVICE_NAME, &cfg_error);
@@ -163,6 +189,13 @@ bool unigraf_open_device(void)
 			unigraf_debug("No device role configured.\n");
 			cfg_role = NULL;
 		}
+
+		cfg_error = NULL;
+		cfg_input = g_key_file_get_string(igt_key_file, cfg_group, UNIGRAF_CONFIG_INPUT_NAME, &cfg_error);
+		if (cfg_error) {
+			unigraf_debug("No input name configured.\n");
+			cfg_input = NULL;
+		}
 	}
 
 	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE, 0));
@@ -203,6 +236,21 @@ bool unigraf_open_device(void)
 	}
 
 	unigraf_assert(TSIX_DEV_SelectRole(unigraf_device, chosen_role));
+
+	if (!cfg_input) {
+		unigraf_debug("No input configured, trying " UNIGRAF_DEFAULT_INPUT_NAME "\n");
+		chosen_input = unigraf_find_input(UNIGRAF_DEFAULT_INPUT_NAME);
+		if (chosen_input < 0) {
+			char input_name[UNIGRAF_NAME_MAX];
+			chosen_input = 0;
+			unigraf_assert(TSIX_VIN_GetInputName(unigraf_device, chosen_input, input_name, UNIGRAF_NAME_MAX));
+			unigraf_debug("Input " UNIGRAF_DEFAULT_INPUT_NAME " not found, using input 0 (%s).\n", input_name);
+		}
+	} else  {
+		chosen_input = unigraf_find_input(cfg_input);
+		igt_assert_f(chosen_input >= 0, "TSI:%p: Input %s not found.", unigraf_device, cfg_input);
+	}
+
 	unigraf_assert(TSIX_VIN_Select(unigraf_device, chosen_input));
 	unigraf_assert(TSIX_VIN_Enable(unigraf_device, chosen_input));
 

-- 
2.50.0

