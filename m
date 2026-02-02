Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571DCE7DEE3
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:32:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F6210E4ED;
	Mon,  2 Feb 2026 14:32:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="UcYnm9Ns";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 810EC10E4E7
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 2440BC237F3;
 Mon,  2 Feb 2026 14:33:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5B05760767;
 Mon,  2 Feb 2026 14:32:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5284D119A8891; Mon,  2 Feb 2026 15:32:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042775; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=UkCmq/TfgG10Ov2WwkH0ljU9cMYc23/eQMKWB+MIzIE=;
 b=UcYnm9Nsoo9/6FKzjyu7xeKy90S6CPsoRa9XpRzlCPvd/HslY1yE3MH1KOkLx7G2N/+1uL
 G7Iae05jxhLcRRhMYF5FpmxSZc3Q9yKPuSBSx336gsgIYeXahnyaqTdPcugV2p5BrVsyFU
 JhQeJAHjUVY5htnMk4RPCPzcYCK4QtCNC4a5jL8G1fuPqDjtYGGudY6ZPhv8gzskBVa2hF
 QCE5/hDlBcj0YBdSVH+MBlJsuNnRVstgr3s0ih/ofxE1VKoqMCFM/O14bxOuK+ftJekXTA
 MJG41ruQCcDBDr6Wjyz43qxGC9rvTNkl8FKLMUoveicBM8Z9DdV+X70c4fWKEQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:33:11 +0100
Subject: [PATCH i-g-t v6 32/48] lib/unigraf: Add configuration for CRC
 usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-32-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2602;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=VGB/FfXpn1KLqsh6sD8g2OjwrkoyweDR/DRYSLz4QuY=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWSOse0/V5YUGE+wiEJG6NK08evNL3wDMh70
 gDxaCJHhrOJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1khsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKJhg//cyaRbYv3xq+SFkWBXpid6MJFRIleB4v
 +Q6eU+Kbviga/WbGpevBtI2p9D6PZFWSiQq6c2xFiucYgtRPDL8pQJmyfKzqz6kCy3T45QrMngX
 fzkUekc26V5Dv0Qbf1XSvVPfDUYTmSfkZJ9y1WFBy/15ATHtI8762greUsV5gO1i9EvG/moMODp
 dtvbKrqVKVXIMQloeu60Jf+Cgzd/Z1URjwJjZ2odg6hahB8wzs5lh5WCtPeCvPDp77etxM1EJw0
 2rMu6X7MqKHoS+9A/qkkwESIZiDaTZT2+/OGgZudBWDzxbiG4Ju9EsdZvB7FQiyk6I8pZ18m22G
 GhzqOS2EA0NL1ZGz6vzDWOBw4UwtpwTQF6RA737yA4LUFAhPUD1ycym9HEMDCgNld0z5akLwsbU
 21YU8HQJIPbTwsZMns6cqM6lf83zZfNvanfpuu1mPNZub7qUzVcSSaJsVev/ccjagFFtGDki/RN
 gbj2MlLvnXQ1IvVV6xXc0Lbhzm4nS0sc+gHdAnX/BHIvTQWiRPt6fa4zayxWAmUKW4jgqAaULjQ
 rYU1V1AkypgW4uwYwQV3TWk2rboy6XdqJwFaJ2KT4UUyB5EaTAqxKhE5mnHFF/JlwzLfeUS5EVL
 CTTRCGt4bt72+k0GrP2UK5rWLi3J3jYcR4WyvB6zBa1VsPgFTdGk=
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

