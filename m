Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8829CCF9E3
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:39:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 917AA10E3BD;
	Mon, 10 Nov 2025 13:39:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hpGIWSU2";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1375110E3BA
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 66A06C108F0;
 Mon, 10 Nov 2025 13:39:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id BFBF4606F5;
 Mon, 10 Nov 2025 13:39:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DB1D6103718FC; Mon, 10 Nov 2025 14:39:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762781974; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=N8q2TA3AIJWUBy0W/ajBiUn+vX5faRlfzPV+efieFu8=;
 b=hpGIWSU2JEGgqnMHgSKmlO0/nXYEK+WLhjzkRb5+nlr7kB/dxFLhkV7gV/5JcvbF1NaB/3
 v74VcrCY3RhqeVQIwXRdE/Ja6ZMMxX7L+kPXcBVAYgq7IIOUN4+U4HZQXpUQxW5DP4E/GE
 TP/RAY0kRE7FEveX149Ldl7Iz/fsqrzJOIi6T9lL765qgcQ6PAqILwpmEqpm7T8dcq+amm
 nwCrRktf71aWHXO+FKVXfV8pyJ06nANuNTc45P8/byY6d7S0inVVkUaDHgDTUZGwhGdd6Q
 WgGNBvSbboPNYJi9gpEQsbWXNOMlxoaKhW0q7zOiOvJyN2QSDUuHiMGvuOR+rQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:03 +0000
Subject: [PATCH i-g-t v4 01/46] lib/igt_kms: Add a detect timeout value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-1-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3022;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=ghjTxmI94rBFmNw4Ar8QPsbIBz6NKb2lRMOK1iLaQs0=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesLcsx9sXXz1/p2S/qMxvnHGV3HXFegYi8eY
 USfvWcCg0GJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrCwAKCRAgrS7GWxAs
 4qCyD/9gQfoH0YdROzlolDw8ay+RbM1KXRSv7B8lPe5kpO4flT1ZqLjxpPxjC96xeVvtUg7ua+f
 uPqp7beS8fAGVicL8JlViC4rkpBn0xHn8xDtfniEVurc4GKTI+Y8JbairZODP0K2x/eakqeI/9o
 GW6mdyt3bpfFMO/kWKvoM1p++d+GNLAibF/FTbT6eLX2wxu4OMBUnZQkh0wwbrJdw5HI6eIM34O
 QqVwxveLkw8fwsX3B2vJYVRON3lhn8VUtGXSwXlQzgINfkkCssb8sprM/r1KmYNT4v5uywbriW6
 0HFMfQae5Za2AkzUZVBe7srWQGqnC0vTOoPrVjmwb8qAUadhFV+7Oxo2D2DVHKSeSlZT7MZQC1U
 uiAFFLC8BgrMw/FIqvowX6h1EKaAJ9X8Ac2jTC97qj7hE05b2ww//78J1XxZJCFkiVrYCRGrxX4
 r3StbQRoR+Z+8B1M1zJp717uJAARmELoTM7zHLinJGaRilU+4kJnIfv3SzTRv9tG/IKHiIjK04v
 xc6jyXaJRRtFKVCM6zSCtezr4b1B+ll0fRS13B0L7640o1YBmvDRHyZs06NnsIGjv2POq/ix5Os
 c5KSPCunrRq/Mm35pIqgtnc2+3I/hGk25BXqvdtuJKyrBs6UKjxTB6hrtaxtseBpt+EAIQgM46G
 g0wRDLvkKhrJ6lQ==
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
 lib/igt_kms.c  | 35 +++++++++++++++++++++++++++++++++++
 lib/igt_kms.h  | 10 ++++++++++
 3 files changed, 49 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 4477cfef157a..1f4b4c256e64 100644
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
index 9208c8dbfc86..708cf82ae357 100644
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
@@ -7585,3 +7586,37 @@ bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output)
                                               buf, sizeof(buf));
         return res == 0;
 }
+
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
index eff76f0de0b3..513e1ff59d22 100644
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
@@ -1292,4 +1300,6 @@ uint32_t igt_get_connected_output_count(igt_display_t *display);
 
 drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output);
 
+double igt_default_display_detect_timeout(void);
+
 #endif /* __IGT_KMS_H__ */

-- 
2.51.0

