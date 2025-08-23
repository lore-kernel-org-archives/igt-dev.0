Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C49CA0FE7
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 02:20:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F53610E31D;
	Sat, 23 Aug 2025 02:20:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="u/mg2X+C";
	dkim-atps=neutral
X-Greylist: delayed 525 seconds by postgrey-1.36 at gabe;
 Sat, 23 Aug 2025 02:20:33 UTC
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3CC10E187
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:20:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 8E861C8EC7C;
 Sat, 23 Aug 2025 02:11:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7566C606A7;
 Sat, 23 Aug 2025 02:12:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A8F0C1C22CEDD; 
 Sat, 23 Aug 2025 04:12:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1755915123; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=InfYxnlsWK/nlKlGqHajndZUVtkUlW/g4NBC24BbOfE=;
 b=u/mg2X+C7Zt77dGO4E7sgNLGW7VYnZoFqXIzF0Gxqrm/tNCsfaAARl/A0DEimy1NFBUAt3
 s1CifN3hwV3ZOJR0RZ3KFrILtOcz0wBnkRlCZVL54q8iTvDsDpzxc9DySSnhqKq0YURdeg
 6JmHHdL3Ke2Rpoy17gEVBVquOJ18WMEyonON7zR6508O8Dot3OpFO4AFQtiqybhHf5fNx2
 o6hsuWBBfmVkZWZYX2KBLlFMVV3xtx3jkw4utyA6r682F7HHP+zD/rr5LBMVlTKSV4hRlT
 DZ3rTLx43nahp+fYFCeagNJoXBJBvj+0hdvn9DOWMYGE33NK2ptiVWP9zT0HMA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 23 Aug 2025 04:11:46 +0200
Subject: [PATCH i-g-t v3 26/29] lib/unigraf: Add configuration for CRC
 usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-unigraf-integration-v3-26-cdc36d5fab4c@bootlin.com>
References: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
In-Reply-To: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2750;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=KrTSNOsz18dnqIcMbBqIWjnKm/WWFes3ow7/4n+5D8o=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoqSNYhsxenjCl7rk93/Se6IwCnApUy5wsQkM5B
 +EDGXaQ4myJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaKkjWAAKCRAgrS7GWxAs
 4k5iD/4xK3sOfGc0frjUGu3rCy2fBGi+obgeXfjySBloKCNIr9+Oo85lVl3DU8TZdHQ+kWzfZtG
 IevN45QZxylJd6/K+vKhUZYvEuue2Oh7pEx8Ybb3HicLS/6TvgphTWf3T2VIZvjNiwA5EQXFzNV
 jYkGP33nlOxdn2ieEpMv0+I0mzUxQUxj/trGzJ2/jI5Q4HpMirEAnlKyf4Y9NCE4TlBioGfKwO3
 9wHxdgV4OJ9i89yuqTP08LJk1bPyRa/ykWy1pvp+8th7Q6pg8lNa6615AV/sc7DN+FZ9FnJ8NBE
 6bRGuJFRP4ZCum4HPzcAqzj56+1AEjc7i8huoNDaXIHv41Nbwu/KBIjrVho5ZDi4KlPbggVBx+J
 zERky2YxH1H74PyHNYD4+2MF6MGXK87ZiThasS0ky4pZPOcboLhnPnMgY4+A/zYJ85KozVPBE8Q
 A9T0uyiG3pPwGPwBJp9nnfoi+JGoa4/g8ZPvbPjVMsT4nkPw5lx4omz1YfMba+WFUi8SOwUdoKs
 KzE/DiugvSqf46wjzcysL2+wVy+MT+6NFb6zD0n7sofDcCvtuLmIQzeG1/dX6lC30W3rlARCoDU
 iU6l8YV/rsB1O6wP1TKqWJ2k9Rs/XvoXS7QyfZVoRDQ6+PSxs7rZO9MoNYDHEZDOvA0d8VWWaZD
 gwcUlfsHD/3thwg==
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
 lib/unigraf/unigraf.c | 20 ++++++++++++++++++++
 lib/unigraf/unigraf.h |  8 ++++++++
 2 files changed, 28 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index e63182ccc61ca23c9333d1c36950a5d73f94b3ea..e2a26f9bb199d83d9a1474ac2613a181450e0530 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -22,6 +22,7 @@ static int unigraf_open_count;
 static TSI_HANDLE unigraf_device;
 static char *unigraf_default_edid;
 static char *unigraf_connector_name;
+static bool unigraf_crc;
 
 /**
  * UNIGRAF_NAME_MAX - Maximum name length to be used for TSI functions
@@ -58,6 +59,11 @@ static char *unigraf_connector_name;
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
@@ -290,6 +296,7 @@ bool unigraf_open_device(int drm_fd)
 		cfg_input = NULL;
 		cfg_edid_name = NULL;
 		unigraf_connector_name = NULL;
+		unigraf_crc = true;
 	} else {
 		cfg_device = g_key_file_get_string(igt_key_file, cfg_group,
 						   UNIGRAF_CONFIG_DEVICE_NAME, &cfg_error);
@@ -330,6 +337,14 @@ bool unigraf_open_device(int drm_fd)
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
@@ -571,3 +586,8 @@ void unigraf_read_crc(int stream, igt_crc_t *out)
 	out->n_words = 3;
 	out->has_valid_frame = false;
 }
+
+bool unigraf_use_crc(void)
+{
+	return unigraf_crc;
+}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index cf37054baf4dd9d8115cd6b2abce70400254c301..e2013e8dd887389b573fbc3faddffb119f10c9b5 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -164,4 +164,12 @@ void unigraf_select_stream(int stream);
  */
 void unigraf_read_crc(int stream, igt_crc_t *out);
 
+/**
+ * unigraf_use_crc() - Check if Unigraf device should be used for CRC computation
+ *
+ * Returns: true if the Unigraf device should be used for CRC computation,
+ *          false otherwise.
+ */
+bool unigraf_use_crc(void);
+
 #endif // UNIGRAF_H

-- 
2.50.1

