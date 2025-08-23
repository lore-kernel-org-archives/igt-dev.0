Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56822CA0FE8
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 02:17:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBDF410EBD1;
	Sat, 23 Aug 2025 02:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Vl/teLr3";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B752310E199
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:17:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 7F1C61A0D74
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:11:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 45DAD606B0;
 Sat, 23 Aug 2025 02:11:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5FC9B1C22D355; 
 Sat, 23 Aug 2025 04:11:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1755915101; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=6r/0J/YHq1MDu3EzZEcszTj4Aee+dPWg62IhOCmF/TY=;
 b=Vl/teLr31TVgnxbVFQthdlVn14F5PXJ8+sOlQwxMqHMHa/1uKoq4HWZrAJ/VvfhoFBz+zC
 JHMKnMuS95FgEX8gfvZc1Ck+2Ko/YCyitmUkU/SUyTd8aPpSid3emhJLiOjemm6gymQCUZ
 poEUxnh08VOH3vSMb4qVwV1vrnN7IIrSrig12Jet9rmkm1bytDPfl1qw2KKJFqICVNRAbV
 AW1d0EAcSddlGQiQTtqWHCftvK9/57mM9vIHYf32zFjszU+/HLYwCSNdQ1tBiq1xUgf7ZE
 zmvoUtJSJRHy/f4z9zFgY/KwPLfu4Z9HSv24ymYWvJ126ZsWYA+XqUo2EHfHfA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 23 Aug 2025 04:11:21 +0200
Subject: [PATCH i-g-t v3 01/29] lib/igt_kms: Add a detect timeout value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-unigraf-integration-v3-1-cdc36d5fab4c@bootlin.com>
References: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
In-Reply-To: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3126;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=XwAx7CkiZ3KAVB35Ml5U8FSr0NuuLTf23xLfcXpd9VU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoqSNSSFj5RBpM8fKVbizRnDaHaOH2FKU/UwV5K
 tJxDa7ehG6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaKkjUgAKCRAgrS7GWxAs
 4k1mEACDcM5RHnWPt5U1LDY4qJgQdhvyWMBbZWZNQn118ERDADL1AGauenD3sgaJi6Few0ITzWY
 NwYosIHUCauPA04Mx6yGwTild+G3y5xjT++aUYNc08AVEEHVtu7TZZCf+yMAVTCNDluWVKtXqDI
 JF37CSOhLG3RzcCcuvwM9iODjPRBDDSdtWV/uBxeOdbu/j5pMxjt1Y0mWbSaR8RKxYgWmADFJM5
 ViLyHhN655h4HSM1WDue1sYGsdWyZGToBNKK7IxSWcsYuNBn1Uxk9f5DbUTHcddsLKmzdDpLA9P
 99FqkU4HzjjxreWvGPiVxXIXE2KUYo3Qltmzdbc8Nb/udkNfNqU+Df9CynlbHPpc+f0DGYQFTjv
 38iG3lldGqn6pgmKs+LmRYBbS8A8laHrUkfbW03IFF+keA1N/cySVwq5GP4+ASwzRPekgXA/Onx
 Ef7b7Wejlh7xJ3M0CYhgHoVh876SVVooDm3pFUJBb3yx0PZKWSD9lKHq61pPeZZOhpb1luX1TWo
 ZGc9wB0b/z0yVld3YFJZ68EjoMDT51KY4z37khRPioyuGFFXgJyGfi4yYHM6vNkQda4gtaqMJjd
 LoRnsN+r3PkZXj6NElNCtRTw6BzACCqjllSg+YIMe0LP1X3iukdiyr8Q0lv5/3ZpLO6u/iC+OmR
 udDPJG+y6bF51EA==
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

Some tests need to wait for a specific connector status. In order to make
the timeout customisable for each target, add an option in the
configuration file.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_core.c |  4 ++++
 lib/igt_kms.c  | 34 ++++++++++++++++++++++++++++++++++
 lib/igt_kms.h  | 10 ++++++++++
 3 files changed, 48 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 4477cfef157a26d33552a2dd9209c130bb26afb8..1f4b4c256e64e87712e5f20dfb02adf56e2d6e02 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -271,6 +271,10 @@
  *	&num; It is not mandatory and allows overriding default values.
  *	[DUT]
  *	SuspendResumeDelay=10
+ *
+ *	&num; The following option define the timeout for detection feature
+ *	&num; (waiting for a connector status)
+ *	DisplayDetectTimeout=10.0
  * ]|
  *
  * Some specific configuration options may be used by specific parts of IGT,
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index d240c7ac5bdaae6b30281a701f437252ae84ca55..11e957171a1000889601d56b2c12af9d3d95f754 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -59,6 +59,7 @@
 #include "intel_chipset.h"
 #include "igt_debugfs.h"
 #include "igt_device.h"
+#include "igt_rc.h"
 #include "igt_sysfs.h"
 #include "sw_sync.h"
 #ifdef HAVE_CHAMELIUM
@@ -7538,3 +7539,36 @@ uint32_t igt_get_connected_output_count(igt_display_t *display)
 	}
 	return conn_outputs;
 }
+/**
+ * igt_default_display_detect_timeout:
+ *
+ * Get the default timeout value for detection feature
+ *
+ * Some tests requires to wait for a specific connector status. This value will determine the
+ * timeout value for this waiting.
+ */
+double igt_default_display_detect_timeout(void)
+{
+	static double timeout = 0.0;
+	static bool first_call = true;
+	GError *error = NULL;
+
+	if (first_call) {
+		if (igt_key_file) {
+			timeout = g_key_file_get_double(igt_key_file, "DUT", "DisplayDetectTimeout",
+							&error);
+			if (error) {
+				igt_debug("Failed to read DisplayDetectTimeout, defaulting to %f\n",
+					  DEFAULT_DETECT_TIMEOUT);
+				g_clear_error(&error);
+				timeout = DEFAULT_DETECT_TIMEOUT;
+			}
+		} else {
+			timeout = DEFAULT_DETECT_TIMEOUT;
+		}
+
+		first_call = false;
+	}
+
+	return timeout;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 6ef6871d5a97c7beecb364453bb2ffdfc3c5c6e9..83d1ed427cdf39875a8f9db48b17eb20978ebfc2 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -40,6 +40,14 @@
 #include "igt_fb.h"
 #include "ioctl_wrappers.h"
 
+/**
+ * define DEFAULT_DETECT_TIMEOUT - Default timeout in second used for some screen detection
+ * functions
+ *
+ * It can be overiden by option DetectTimeout in the .igtrc file.
+ */
+#define DEFAULT_DETECT_TIMEOUT 10.0
+
 /* Low-level helpers with kmstest_ prefix */
 
 /**
@@ -1289,4 +1297,6 @@ uint32_t igt_get_connected_output_count(igt_display_t *display);
 
 drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output);
 
+double igt_default_display_detect_timeout(void);
+
 #endif /* __IGT_KMS_H__ */

-- 
2.50.1

