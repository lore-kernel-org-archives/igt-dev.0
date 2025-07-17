Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92203C83F38
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 18:47:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E9B110E89B;
	Thu, 17 Jul 2025 18:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="XPMHNhPQ";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0595310E15A
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 18:46:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F653442AB;
 Thu, 17 Jul 2025 18:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752778006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6/kllooFo0SpdpdK2nVI1GB5W0BIO+MQ8EWwCc6hJdU=;
 b=XPMHNhPQ04HnxTRVW3r++6mLL0Awg41jgLo6OSK31mZ94KOfT4xm1KIeuT1Eb39kf0V2or
 /C+IBeRIF95yC+NSOGNm26uDcgK5Dnc5seYTEvG/TgfBcbQgjIkJaDIyvg9w5BI+4IetH4
 F24iDL7AncbZNc7WfR7WfLis7USY4MKk8LSJc0OVrPBvd6oybilXeLwrF8ZaVXPLxcAfnP
 Acctnr7IDfLM50o6pV1XALKDBjOjcNYGltJRjgUakH0Aah/YwB1KSGL2KX9KOUMNFFY8G+
 ltlA8FgXf+XUVhT8WfxCTIoVzfbpzzPhVSHEqHO8KfMyK8cP/OTxIzBYp3dUEA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 17 Jul 2025 20:46:45 +0200
Subject: [PATCH i-g-t v2 25/26] lib/unigraf: Add configuration for CRC
 usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-unigraf-integration-v2-25-77dc329e584c@bootlin.com>
References: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
In-Reply-To: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, mark.yacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2473;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=WFeNZvCv8zcrFC8p1z8agjre4IE2Hk015lMxhGS46ho=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoeUUOLxpBeVFS0RtiAG1e+zGkteeGsHyI3SMNR
 teNAntRsFuJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaHlFDgAKCRAgrS7GWxAs
 4qczD/oDa11EdMNjfif/its/NdbA3sHR7JP3DPpqOuQcstJibVpyToR1F3zJ8f3+hn7Sj3m4MGC
 fnAHMke451wzYo9sGZIThl67E7vlVhgDl2xP8UhJIpOEzbvokdpYGwdUeqk5ydYoZub6W9BzRwb
 rAQx2XJVHK+B8MqMzeyQXujIBw16iwCU8xlf2nhDP1mYHpAU89PM0GLZnsyNVa9fk8Dgo75yY5O
 8599hklR3mXmtA1z8hbFTjJzEr0oDfz0E07tSGLCljvMiUjkCzgHv3SJg8J1XeDA7l42KW+Obay
 ZGaX+ElZl27DZS7l5k7NDybn6L+cL80E0OnxCzVgKzMgq/2OyVuHu5Dg3avd/gf99Bw9EFXmOiA
 /c8YBpqGFDw8uv09gUgN8Vh9jNUE/dVEG0HSE1W1l4INg1GPCE1HqP1+tTqgPnbhOdg3rKmVTDc
 hfMFRAoQyB6MfCqa5GPFktzi/RHJTF8qQKI6UxDqcxZzzdG99HSaMBv4zeqqjehanSLIAfFj+ni
 B2O0mPbtvw1YYmEsobnApQtddrxwcwUOAkJ+7kiKiV8GSHuw4d//LViV6Ky7Q0sW2WzvgN3WykQ
 F2/x555a4b4shQcrGEBvWdwrcRTu8piTSR2/gMgAqcj1Q7KOOAAZX5MKnS3JiIm0Du4rI4/T9HE
 PRV0Br0cYaVr9og==
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

As Unigraf devices are able to compute a CRC for the input image, add a
configuration file option to use them.
---
 lib/unigraf/unigraf.c | 14 ++++++++++++++
 lib/unigraf/unigraf.h |  8 ++++++++
 2 files changed, 22 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 9ccd53e55ab5d261d236348fa8a3c7721e87698f..caff77293b6820c8dd179c8abd3def894c3bb879 100644
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
@@ -276,6 +282,7 @@ bool unigraf_open_device(void)
 		cfg_role = NULL;
 		cfg_input = NULL;
 		unigraf_connector_name = NULL;
+		unigraf_crc = true;
 	} else {
 		cfg_device = g_key_file_get_string(igt_key_file, cfg_group, UNIGRAF_CONFIG_DEVICE_NAME, &cfg_error);
 		if (cfg_error) {
@@ -310,6 +317,13 @@ bool unigraf_open_device(void)
 			unigraf_debug("No default EDID set, use IGT default.\n");
 			unigraf_connector_name = NULL;
 		}
+
+		cfg_error = NULL;
+		unigraf_crc = g_key_file_get_boolean(igt_key_file, cfg_group, UNIGRAF_CONFIG_USE_CRC_NAME, &cfg_error);
+		if (cfg_error) {
+			unigraf_debug("CRC usage not configured, using unigraf CRC.\n");
+			unigraf_crc = true;
+		}
 	}
 
 	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE, 0));
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 11e483312699fd9f304586bffcc5616c10fb637d..2ff3dc5f3b8b06d2df7d1fd9b58e2b3a9b8b6729 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -157,4 +157,12 @@ int unigraf_get_mst_stream_max_count(void);
  */
 void unigraf_read_crc(igt_crc_t *out);
 
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
2.50.0

