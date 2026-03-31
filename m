Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDED9FF60F4
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:13:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34D210EC98;
	Tue, 31 Mar 2026 17:13:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="OTqdjozZ";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D5E710EC43
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 5D98E1A30B3;
 Tue, 31 Mar 2026 17:11:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 2E2FA6029D;
 Tue, 31 Mar 2026 17:11:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 362D3104505E4; 
 Tue, 31 Mar 2026 19:11:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977070; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=AXOJ+r0/W6l/8I9jA+IdHKg9ZvRdN75DmnmJ99HMyfg=;
 b=OTqdjozZASv0tfWEfJWIFKbzidbdPyfw6nM7G3aWRngye5cZoVkdylNIlaxZqPI50iWyEy
 cYAjvo/JEOYp7a5+QLzdaxexNwMH1gqPuAOx/mxbvpmWML68rNj7uJvkYH561i7aW7ghdg
 RoQhOpwLoAyrURGcXq4Zhmp2uMsWCONfJ4b5aJu4J5aYsq3jHHVCvMsW+SqC1Xu8iHEsQE
 +gm1909oxXN5HkENz9Zc7xlK2KXM+w/W0aDE7Li/ZwgJT9mXefyTEz27GBxS4MOlWi81kE
 a8qpoSALO8PrBB6EoDhwkBpokkKLzn/9N1sSDi30I0N9XRotGKhIeTtElkmY9A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:11:41 +0200
Subject: [PATCH i-g-t v10 24/49] lib/unigraf: Introduce input configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-24-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3877;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=/r91ZTzCjY/3nn+DYLe2VjQHP4uKN4ogrL7s1lwby/A=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzAA+B69MkarkcBPi0RAo//5UtKl8pFkVjwi9Q
 JiL3mLR5dWJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAPhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOI6iQ/8ChIysy8zLO0FLC2Ix06MyRVUpPa3ke3
 85dJ+qaPHLVHHvLzAd/UbjJgLxWSJkgXwI1hPT9G8R7luyeGctUfRbnXSaYacIqrFZqWZZx+zSZ
 4etuEkNc2NAI6Wj/V2fkjJiRqWxqFfrzpwQcAeq4YeGB3F6BXTRU4lco2kuL1RlnxWRut36coTE
 7EPTbmXgKSJvyb95ofS780DfhivgLWok3gvguAaGSkQHgjsZkQ95a81108EIt7mPQtldQQjkDkB
 olzHmOoR4fVbsRoobk2dIyHOsYRs1hpR1fgyBIYrnUY+/5sJLkUgylWczNq8XS8PyuARfGk3xHJ
 47qT1NSXv5u9XWGxSaIRPTAcEqbC8T0WSbvi8xvFnxGmoixAddf6JqnHqqY8KaqPfwnf85xd7zX
 EkVAPCwb/IlpsVK5610+dC/Dob7VzK09IY5irCIdFGikrzUMWnLwfHUHrrdcSGQXgsv0aSJbQfb
 nHh+Lmsv/9fSj2/bQKRXWbQnG2rheE+WutFp78LN0hZrBJNFbF8bSBs7qIAYyMfcfkqXBdTGjs6
 myRW1vRTrNAeLDf01wYqXS7J0ZWnBx9sPIuxKGovo/G6MKgQYuLr3lu4gkQ2faPTUGy4pH08OnH
 qTJKLDAGEroTGbqRpciwehRCJJX3W6fa9Rt3MxsDxZy79/Z6V0/Y=
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
Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/vendor/unigraf/unigraf.c | 56 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
index 49d326b80b1f..591e99e938b4 100644
--- a/lib/vendor/unigraf/unigraf.c
+++ b/lib/vendor/unigraf/unigraf.c
@@ -42,11 +42,21 @@ static char *unigraf_connector_name;
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
@@ -142,10 +168,11 @@ bool unigraf_open_device(int drm_fd)
 	GError *cfg_error = NULL;
 	char *cfg_device = NULL;
 	char *cfg_role = NULL;
+	char *cfg_input = NULL;
 	int device_count;
 	int chosen_device = 0;
 	int chosen_role;
-	int chosen_input = 0;
+	int chosen_input;
 
 	assert(igt_can_fail());
 
@@ -169,6 +196,14 @@ bool unigraf_open_device(int drm_fd)
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
@@ -211,6 +246,25 @@ bool unigraf_open_device(int drm_fd)
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

