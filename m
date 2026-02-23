Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2BD3EA4FAE
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:09:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E9410E37D;
	Mon, 23 Feb 2026 12:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="2wFRXDfP";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F4B10E35F
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:19 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 4A0461A0993
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F06ED5FD43;
 Mon, 23 Feb 2026 12:09:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A994110368F8C; Mon, 23 Feb 2026 13:09:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848557; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=K7dqwcyTdtRf91dkPFxbrTkpnaJdujzTca6EhAkStuo=;
 b=2wFRXDfP0cXo35CI+Z24nsMF6fG/Q2L6ezpVOHJ9EE5a0qkj67EkxamA29+NLUXYhVPN87
 VkPEp/CGO5/NX0ip2TGc1jajl/1OBPYEUdqlcz8dp3HmDS9uPCaeSX8B2exQ+LqZLCke5Q
 qOEOiqgeLx8biFPpxA+LG60pEHQLQOWGJEBbHXh8Z5qcp8gCWw1vMQdGBsVBYMqqLyq8Jh
 wNis7hFKnCCYSluentyC4Nhb/7uR6zVRTHAXQjTPBI+5RBpCC35eGI1tZNjTrHK88B4RE8
 /1ZRn5hxvlrqxl74Xche5OWcPiaYV2D0q+ObSGydvmqTUkJsniWoX5sKdOe50Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:39 +0100
Subject: [PATCH i-g-t v7 32/48] lib/unigraf: Add configuration for CRC
 usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-32-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2375;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=DV1dXtp7T3aoI1n576LXQHgHTZWYWxLZHmgPMt1BrYc=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENqF6FyiLESZ+RoWlvIV2YQh9tQUagMcp19P
 n8hRkhq2PiJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDahsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJfPw//aIzWRIybpeXbpBCXgylXwbmiT4fuEvM
 ybFNSK09B9kShoVmzS073rTkcG4UXqK4HN4d8nUyCxbrjrgUIyUuYq3a6zRIFo+MylOXEeP0DGQ
 EzADRJtIfLZ+FU3S+f8BUF71SvBMeAsiB3aYLjNRjrUTuihxtYPcrP7iXEgPxs0DZDFO6I0UyRs
 RXMQXSOiL7IORmkwN/+yakwR9UFY03uppVzRWif06Y5EemHwWqiv9wfe0DADv2sxPYgzbOs+Vif
 bVn1n6mK37g2VP8ZytMIGlhinxOvM79BKVSE85Kmpe1V4R/JGOxiwBO8eOUnrOZtJ/NBBRS0jja
 lNB9AvFVtPXuY5oi+rRk/PWsiniHfgGzZrYRQi9Zp1ow0oDi9huJBlTwSwTiTkPXvjMRBUYlF4f
 /iH1GKfjLFmdTznzZDWzwtwOgeYKI6FQNl7699W7RPdbZAzPlYcMzW3TtkT4VtW8kdTnl7i6im5
 g31Kt4d3N1KMwCgvzqzUJx/5HIbzLRLkmGqCBktEhNVi7E7GpLFX76BDuNLYJJhbmL49uZ4QVhj
 O1YDDGMEMIxXQV/Y+z1xZ/Cyc8yqnvJsmrlGwbFwujnBMD/tSomkcc7wePIkrCtUbcYPLtLOLeh
 KPkS9L4axlEE9cOJLdyDp+CFdHMkkhfxx7FFj2vuZxvRaxxJ20Oc=
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

As Unigraf devices are able to compute a CRC for the input image, add a
configuration file option to use them.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 25 +++++++++++++++++++++++++
 lib/unigraf/unigraf.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 927eee3d184d..e9c9beb80c44 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -24,6 +24,7 @@
 static TSI_HANDLE unigraf_device;
 static char *unigraf_default_edid;
 static char *unigraf_connector_name;
+static bool unigraf_crc;
 
 /**
  * UNIGRAF_NAME_MAX - Maximum name length to be used for TSI functions
@@ -60,6 +61,11 @@ static char *unigraf_connector_name;
  */
 #define UNIGRAF_CONFIG_EDID_NAME "EDID"
 
+/**
+ * UNIGRAF_CONFIG_USE_CRC_NAME - Key of the CRC selection in the configuration file
+ */
+#define UNIGRAF_CONFIG_USE_CRC_NAME "UseCRC"
+
 /**
  * UNIGRAF_DEFAULT_ROLE_NAME - Default role name to search on the unigraf device
  */
@@ -358,6 +364,14 @@ bool unigraf_open_device(int drm_fd)
 			unigraf_debug("No default EDID set, use IGT default.\n");
 			cfg_edid_name = NULL;
 		}
+
+		cfg_error = NULL;
+		unigraf_crc = g_key_file_get_boolean(igt_key_file, UNIGRAF_CONFIG_GROUP,
+						     UNIGRAF_CONFIG_USE_CRC_NAME, &cfg_error);
+		if (cfg_error) {
+			unigraf_debug("CRC usage not configured, using unigraf CRC.\n");
+			unigraf_crc = true;
+		}
 	}
 
 	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE, 0));
@@ -680,3 +694,14 @@ void unigraf_read_crc(int stream, igt_crc_t *out)
 	out->n_words = 3;
 	out->has_valid_frame = false;
 }
+
+/**
+ * unigraf_use_crc() - Check if Unigraf device should be used for CRC computation
+ *
+ * Returns: true if the Unigraf device should be used for CRC computation,
+ *          false otherwise.
+ */
+bool unigraf_use_crc(void)
+{
+	return unigraf_crc;
+}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 8b38261dca09..f22f4c993622 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -74,4 +74,6 @@ void unigraf_select_stream(int stream);
 
 void unigraf_read_crc(int stream, igt_crc_t *out);
 
+bool unigraf_use_crc(void);
+
 #endif // UNIGRAF_H

-- 
2.52.0

