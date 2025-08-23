Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF96CA0FE8
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 02:17:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8189510E189;
	Sat, 23 Aug 2025 02:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="dDcTCSOX";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCF7410E1A0
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:17:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B41291A0DA5;
 Sat, 23 Aug 2025 02:12:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 8CE3F606A7;
 Sat, 23 Aug 2025 02:12:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D719E1C22CD4A; 
 Sat, 23 Aug 2025 04:12:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1755915121; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=RWTgKkJ0EYBIFazP0Y84ALFT9IXJUg58pGXGgBbKDdE=;
 b=dDcTCSOXlTFy8bDcQhc7Tl9lTqfyia0NnYY3qCOa4s8KMtrdMmrclE8I9Zxo21BMKsf/Mq
 ZZ5UmWjrsp5zZDZ8fmB3mwMIx0XjXPiI8mAE9YsBRErMZ1tw6MKizZ/L/+Ykfx5NRFK5kt
 OCuh2v9gnc1U6B1uFNpe6xxeu5ZetggtErdk8p3tnEtFXl+w+GUwLpjd6S8kQgtIrrv9gd
 pWCQg8ngopStmGD25q2ZfHt4VKGB++G8Gyx78cN3DDLRJXY7KRKIzPe8GfNwIfLT0q4xFM
 OQXm1eQa+K3gPbdZqOLegyk3XTLCg1uOaRjkCwZfRUv0YGVzoNDwB2/1sTge4w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 23 Aug 2025 04:11:43 +0200
Subject: [PATCH i-g-t v3 23/29] lib/unigraf: Add edid configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-unigraf-integration-v3-23-cdc36d5fab4c@bootlin.com>
References: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
In-Reply-To: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3118;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=pssGdxBcRPc9IdrwGxsl+7cgguovPGHUHB3RZNwOvAc=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoqSNXFTViLC4lMcANeePa8n2b5UHUEMt5PJ2Fh
 3xSWpVCaLKJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaKkjVwAKCRAgrS7GWxAs
 4ivtEACbLB/UKPHC2NrQCDwtv9CL/NqHpTKjNLpBuDbR6+u89qHD5b9MYr5UiM0TGEIQ7erWEls
 Clo9BEmTCQm/0qfeKg10zsYl5X13PzTY2XRU9DPEqNns6pgBPY9APxjk+pbfUCT8zYhF4MbPRfX
 SeAA0B+yyjF5vliyWadqfIjX71P7VI/a5h3+lJnGC5re+nGDqcPMPCV7csAxDN3/WmrCSdM6lna
 H9hlv/L7da/djawBeHcHICuq84GmofJkGZ1OH9tzzWhG0DYCYvcYtyCQGbqTwmOw/JbKZDz63sI
 57ifjwYMlKSu3sVOXkuIAwTxLsEoUs+kIY6bdF7xtLNIDTLe1O7l2SMtH/8QcMFhNyVJSKVLWWy
 2yebQWk7QtRgVMb5zmLwGFtILm/+d3KqLpfkA7ksuRgnDQubRPDXy6gkOGbChrWKuGtwYtpQHKX
 cq0dQTqquD0RTAw2+tBCmH9w0WEandaqcmKVh9uhfzrKBgjG+gIc27v672+/QiXM3us7nOfNMlT
 OJrPNlH2g3EsQ28TciXLy+HQKbhI2ir53CRd2Y7IXgDmEK+yCKw8rMNQoZjmOe2ZupQlpQd26JK
 QorF1ePo8fMbCbLRm9Nn0TDgXdLbEU4lQ1TKxEoKxVqk/uP/u9cgyy04wo5F22ex7L0XKHUqpwr
 Q0yABnyJDNYT4TQ==
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

As unigraf could be used as a simple screen for all tests, add a default
EDID configuration to connect the unigraf by default on every tests using
this EDID.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index b90025425d232bd5269adfe9f17f2813eac7754d..5aa5d94660255d9740db7b74c3e1eea0575fa5f2 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -10,8 +10,10 @@
 #include "unigraf.h"
 #include "TSI_types.h"
 #include "TSI.h"
+#include "igt_edid.h"
 #include "igt_kms.h"
 #include "igt_rc.h"
+#include "monitor_edids/monitor_edids_helper.h"
 
 #define unigraf_debug(fmt, ...)	igt_debug("TSI:%p: " fmt, unigraf_device, ##__VA_ARGS__)
 
@@ -50,6 +52,11 @@ static char *unigraf_connector_name;
  */
 #define UNIGRAF_CONFIG_CONNECTOR_NAME "Connector"
 
+/**
+ * UNIGRAF_CONFIG_EDID_NAME - Key of the EDID name in the configuration file
+ */
+#define UNIGRAF_CONFIG_EDID_NAME "EDID"
+
 /**
  * UNIGRAF_DEFAULT_ROLE_NAME - Default role name to search on the unigraf device
  */
@@ -176,6 +183,18 @@ static int unigraf_find_input(const char *request)
 	return chosen_input;
 }
 
+static void unigraf_load_default_edid(void)
+{
+	struct edid *edid = get_edid_by_name(unigraf_default_edid);
+
+	if (edid) {
+		unigraf_write_edid(0, edid, edid_get_size(edid));
+	} else {
+		igt_warn("Impossible to find an edid named \"%s\"", unigraf_default_edid);
+		list_edid_names(IGT_LOG_WARN);
+	}
+}
+
 static void unigraf_autodetect_connector(int drm_fd)
 {
 	int newly_connected_count, already_connected_count, diff_len;
@@ -239,6 +258,7 @@ bool unigraf_open_device(int drm_fd)
 	char *cfg_device = NULL;
 	char *cfg_role = NULL;
 	char *cfg_input = NULL;
+	char *cfg_edid_name = NULL;
 	int device_count;
 	int chosen_device;
 	int chosen_role;
@@ -267,6 +287,7 @@ bool unigraf_open_device(int drm_fd)
 		cfg_device = NULL;
 		cfg_role = NULL;
 		cfg_input = NULL;
+		cfg_edid_name = NULL;
 		unigraf_connector_name = NULL;
 	} else {
 		cfg_device = g_key_file_get_string(igt_key_file, cfg_group,
@@ -300,6 +321,14 @@ bool unigraf_open_device(int drm_fd)
 			unigraf_debug("No connector name configured, will autodetect.\n");
 			unigraf_connector_name = NULL;
 		}
+
+		cfg_error = NULL;
+		cfg_edid_name = g_key_file_get_string(igt_key_file, cfg_group,
+						      UNIGRAF_CONFIG_EDID_NAME, &cfg_error);
+		if (cfg_error) {
+			unigraf_debug("No default EDID set, use IGT default.\n");
+			cfg_edid_name = NULL;
+		}
 	}
 
 	unigraf_assert(TSIX_DEV_RescanDevices(0, TSI_DEVCAP_VIDEO_CAPTURE, 0));
@@ -376,6 +405,11 @@ bool unigraf_open_device(int drm_fd)
 
 	unigraf_hpd_deassert();
 	unigraf_set_sst();
+	if (!cfg_edid_name)
+		cfg_edid_name = strdup("DEL_16543_DELL_P2314T_DP");
+
+	unigraf_default_edid = cfg_edid_name;
+	unigraf_load_default_edid();
 	unigraf_hpd_assert();
 	sleep(1);
 	return unigraf_connector_name != NULL;

-- 
2.50.1

