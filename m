Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 295D5D25B60
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:15:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1FB510E6E9;
	Wed, 28 Jan 2026 13:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hf0IeYsI";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD1410E6DB
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:55 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 16B0BC211E5
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8FBDD6071F;
 Wed, 28 Jan 2026 13:14:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B2476119A882C; Wed, 28 Jan 2026 14:14:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606094; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=UkCmq/TfgG10Ov2WwkH0ljU9cMYc23/eQMKWB+MIzIE=;
 b=hf0IeYsInPnytnnTajqfd1g+NXL5YFDwxp1q5l4nafpHdneh07NqhLqftctAd7nSg2pUEX
 HgAVxRmJK7oZ7xAM8nMeDBAEYoMnjxneuCZRH63IHpct0DD3m1djKGdlTYI6Ss84vU9OQg
 IYovKLZvryKPsSIUmVRPl43WmkrOV7OmOvcgA7rCsPuZrir7G2ioxSitluMRnV9CDV0re2
 pZ0s/U9HIiSz4YxciG8sd3hfva1k9VofCR62MKt4dNTbSOK3ms7cKodY8mUIUHFCeCpcNI
 0UW0SO0/I/uL7D8E6R+OG1CC+d4vT0czBrlKcHkprJI6zOdxeewaAkEASfuH6A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:15:03 +0100
Subject: [PATCH i-g-t v5 32/48] lib/unigraf: Add configuration for CRC
 usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-32-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2602;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=VGB/FfXpn1KLqsh6sD8g2OjwrkoyweDR/DRYSLz4QuY=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvLj2/307AF8yRCQNiX23wIrRupCcWc5aztN
 Zzl4QOqSHCJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLyxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOI5ihAAgPCzN22G0xFjZNnm1Z+YuoaWLouLrD/
 gYYEag3xrEMCXWth/6YPEPCLldpeeHaqxFVc9UHaUEqgSeFfWcZN4Etlv9dCwkx6vAAnzhqkT2q
 A8YoinQ3c3OsDBcV5k5D2hKUoz8/taM1fFdfcJjTBeat6vunAQSrJggkzxMocyTuue/SH63tlEL
 uQnghR5m4bxxt3KbY38o0ec8B08huFYgGn1G8UBks0MYt6avft1lwsjPC0HoOHZQdIikmyy4f0h
 VJge0u6BRrQ9lpzpUjIL0aPAlkaspEPojuCev27k2xa0mrly0lFUTytZdYsCMQwlA3DW7MXpA0Z
 M5SQd8sqo+cGr5CAoUaAqWL2Vg0me/LcPzyBdBH466Y92wxKC7B5offARouE1689V8oWwUyxXW2
 6wgNoGiZZTGqCkRasazUM8er/Xco+WABQDlx9BZSCWqWAogVEQvI0rNQER7rIDqzrrr3mvGsU4T
 3kNJHD7T7LAGx64BvZFb3ARR4timH7NmRCsZ0wpMn3yIudRv1VAx/GhcoF5MpcSJdtVOPkDZ5vK
 l3GeovCaOaLbzkagRZU2dJj03Yw/YeQ4foo9t2mFeq7Lj9bxCPKFQDhO55ks1reHfCDYHAXc3uw
 ePIlARgi9dEjkfIAvEORIjIYPqTTJDiJEVQCIgvKqqQc3Q9RDIg4=
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

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 26 ++++++++++++++++++++++++++
 lib/unigraf/unigraf.h |  2 ++
 2 files changed, 28 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index e626fb5e8222..643a3c1169ec 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -17,6 +17,7 @@
 static TSI_HANDLE unigraf_device;
 static char *unigraf_default_edid;
 static char *unigraf_connector_name;
+static bool unigraf_crc;
 
 /**
  * UNIGRAF_NAME_MAX - Maximum name length to be used for TSI functions
@@ -53,6 +54,11 @@ static char *unigraf_connector_name;
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
@@ -337,6 +343,7 @@ bool unigraf_open_device(int drm_fd)
 		cfg_input = NULL;
 		cfg_edid_name = NULL;
 		unigraf_connector_name = NULL;
+		unigraf_crc = true;
 	} else {
 		cfg_device = g_key_file_get_string(igt_key_file, cfg_group,
 						   UNIGRAF_CONFIG_DEVICE_NAME, &cfg_error);
@@ -377,6 +384,14 @@ bool unigraf_open_device(int drm_fd)
 			unigraf_debug("No default EDID set, use IGT default.\n");
 			cfg_edid_name = NULL;
 		}
+
+		cfg_error = NULL;
+		unigraf_crc = g_key_file_get_boolean(igt_key_file, cfg_group,
+						     UNIGRAF_CONFIG_USE_CRC_NAME, &cfg_error);
+		if (cfg_error) {
+			unigraf_debug("CRC usage not configured, using unigraf CRC.\n");
+			unigraf_crc = true;
+		}
 	}
 
 	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE, 0));
@@ -700,3 +715,14 @@ void unigraf_read_crc(int stream, igt_crc_t *out)
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
index 380610622668..1530bb8d540a 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -68,4 +68,6 @@ void unigraf_select_stream(int stream);
 
 void unigraf_read_crc(int stream, igt_crc_t *out);
 
+bool unigraf_use_crc(void);
+
 #endif // UNIGRAF_H

-- 
2.52.0

