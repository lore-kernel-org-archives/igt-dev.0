Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A438FED3EF
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 17:04:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B9010E2E5;
	Fri, 24 Apr 2026 17:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="pjn09dAa";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851B68961D
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:54:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 707681A3403;
 Fri, 24 Apr 2026 16:54:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 478A6604EB;
 Fri, 24 Apr 2026 16:54:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 50FC31072089B; 
 Fri, 24 Apr 2026 18:54:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777049691; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=jb4q4C8dCbNyyZAD8kr5K9vfgyM2KpVSUhU3efi2Zn0=;
 b=pjn09dAakMNZSbJsjjErI/FJd+wZtALD0A9Jo9b0mjbmFXWCoBzoHS40x3uTtnjMujSTU5
 KDG7u33xtPdzprxDHSnE8ZlqxRjCGDgGqxOnHbttwhhRAOeKMGVKfodUjf3rqwlGHnvWS6
 30lcynj8uQKeqZD98E3NcjzLCXODTZQO7BbpXstFOdyWh2kYsZrBb4FgYQQTxrM/BT7Mi9
 /IAWFlcNjgtrv83bvhsy9eK0dsB0VFbgKXu20LYK27U+ZkWSiB3N9JirkCxj6t0WL99A9j
 fA5DqNbgBmEOWGR3rH9ByzT5K33fCxYfSAcYrY48Wr/l4F0Id08FdhZ2MWDbaw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 24 Apr 2026 18:52:59 +0200
Subject: [PATCH i-g-t v11 24/49] lib/unigraf: Introduce input configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-unigraf-integration-v11-24-0c5f5346ae60@bootlin.com>
References: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
In-Reply-To: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
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
2.54.0

