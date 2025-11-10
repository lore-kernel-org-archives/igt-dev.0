Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8630CCFA13
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:40:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B10A10E3BA;
	Mon, 10 Nov 2025 13:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="BhCpAxvL";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C880A10E3C3
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:40:01 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 2D6ADC108F1;
 Mon, 10 Nov 2025 13:39:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9B5F2606F5;
 Mon, 10 Nov 2025 13:40:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 9106A10371901; Mon, 10 Nov 2025 14:39:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762782000; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=4qtEB+WvXtJEE+ltSX8ElfQaupI4ez/FEOaW9wEjDCI=;
 b=BhCpAxvLPJ0Mf02U6MsqFsvjhOJXFrTBVGPnnnXWjwVg4TSWLsIp6YYSup7OjSjYXiD5a6
 ZxCkPCgK8SsR7iTu3FuksPH6wWWuiiLFfuZEON51xd+mNKRrlZKdU9CLdlY/BYcBd9qOyK
 Igt46HLBmy0iOedja61GHVW78uZJhGWPGNOL7Cxo4JRv1wWoCMuUtPxUJqKldu8PZ6cixM
 xjNSPBStboSyYxXWwknZ3OeEdtuFRJWibm/ZJFX4AUO93T2hjbz7wbS0IQuzgrWd0Xyvod
 FTkiRb1yJObSHyFPN7HTPKXjaD1ODvbXTj7CRJp4I3N1dQo9RJH5o4SXT8uQuA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:34 +0000
Subject: [PATCH i-g-t v4 32/46] lib/unigraf: Add configuration for CRC
 usage
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-32-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2638;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=pMyuc93JZZpbl5xdpq3NMN3ba1yZehT70GShOQTMAyQ=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesRzStnDhpTSvAn6x/RBl8wA2nI2ItxghAq6
 oFLnl+GodeJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrEQAKCRAgrS7GWxAs
 4k9QEACZaPn/Nf9rmNy7AGeBxblvT1dAIxmsm4ehApvxWYJP7/v+oN3cVm7jB+KCgQOWtGgVApk
 6P86uzzC0REmlLm0q/8DLhulJqPpuD0aR3LBtPOuWafXM9ysusISB6lN28eUpBb9NZKW6leXyvj
 iNWA0jr+eJlqH8YKco74NfwA4BLRdmrHgaV3Nc7bl+S1vG1jOTxNjSdnifC9DQ9wZb78F/CDTXJ
 4i8KSRNTiq59o3/bWsbPxIMxDR9i7cKStQOnKvWRJbGCSUeixWUDrMMy8U2f9ZVbDj+Vc1/jjWX
 sbLqCMgZSypj4jeRr9F2BTRc4qGjvqqZmI7zqA9/cVhCRygvPqRcNLa+F82w1ONT3h2sa9ZSilb
 MBBmT7CZPVuH7cwl3VhziAwMoyzWLZT33pXQnGXyJkLOKoCl8gEjAbKiCgRlFG0So2GIpa4c7zn
 p4AJC9y5gQptuTVvEEAiawFMjJ4f3K8zIy5xiPa4hymdONjzYSqLjVL0WEvrnjToAlRPMf3FPNZ
 Ygj1Hy2adf4jbjVUS8XyjXC0bv47W8wW7jHZxopBg9ldqmwCn3K9S4g6bJdHwglhYwVWtx7gQfV
 rUAe9jE6bg0nfFAPf507FFbqW1Cj9bQNnLRkUsDni5k8lXH61XCj7ItGz25UIj2dwGyNk4wLuAq
 Rshy+Vd4mG7J4JQ==
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
index 173e56ccc268..ce8a12a1f889 100644
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
@@ -325,6 +331,7 @@ bool unigraf_open_device(int drm_fd)
 		cfg_input = NULL;
 		cfg_edid_name = NULL;
 		unigraf_connector_name = NULL;
+		unigraf_crc = true;
 	} else {
 		cfg_device = g_key_file_get_string(igt_key_file, cfg_group,
 						   UNIGRAF_CONFIG_DEVICE_NAME, &cfg_error);
@@ -365,6 +372,14 @@ bool unigraf_open_device(int drm_fd)
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
@@ -591,3 +606,8 @@ void unigraf_read_crc(int stream, igt_crc_t *out)
 	out->n_words = 3;
 	out->has_valid_frame = false;
 }
+
+bool unigraf_use_crc(void)
+{
+	return unigraf_crc;
+}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index d00895b64d39..9c7c71a22d82 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -174,4 +174,12 @@ void unigraf_select_stream(int stream);
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
2.51.0

