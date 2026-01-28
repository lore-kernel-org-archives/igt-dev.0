Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C50D25B59
	for <igt-dev@archiver.kernel.org>; Wed, 28 Jan 2026 13:14:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F64B10E6D0;
	Wed, 28 Jan 2026 13:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="AI3ppi8t";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22AD310E6D0
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:32 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0F6E01A2AC1
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jan 2026 13:14:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D9F776071F;
 Wed, 28 Jan 2026 13:14:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EA76F119A880F; Wed, 28 Jan 2026 14:14:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769606070; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=NHXkvLx+yKucjI0o5LEfbSjKJ3mRqY3wFrvs8+PuvMk=;
 b=AI3ppi8tAi5ca2sHwbutau//MQfqWR8KxfQGvZRlrVQHLdsBR3GLHn4hRJJqCcCJE8GDdu
 oIO6Ts5NhxommOkcJ97NZLeEpe8jdbp/5zqjq4jzIKbgWB55JYdmDuJiM11YHIGeyxHp4w
 5WRtGUBmlKx52jv+i0uJ17a7fPYBZvZzIja6D5DCP6tN1wP3oz+gH9EOzN/6NdZ2wUdzwM
 R/LmpscS8ERI02OU++ciiSJc5nvWcKPQW4C11q3c1J7r2pxf/LSRTlo/SVjSHCGTK7R7Jz
 +O3cKaprfldWnrXjhpaHH0Po4FoQhqBCy+XLQ/zIhhsjThtVSGdO5Sbk2zE4jg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 28 Jan 2026 14:14:32 +0100
Subject: [PATCH i-g-t v5 01/48] lib/igt_kms: Add a detect timeout value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-unigraf-integration-v5-1-fbf2e997a011@bootlin.com>
References: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
In-Reply-To: <20260128-unigraf-integration-v5-0-fbf2e997a011@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3125;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=gsLL5rcwvFDRdnz30RuEYKJcLP9kJ0dPsLv7emMHTDU=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpegvHBNxBiJKnzp9EIZ5W+Esq708/K4E2TUpk/
 aOAzee5VyiJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaXoLxxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLFWQ/+PBswIYmyljeWREK0b3BbXiFVV8rtGzu
 v39metZXq6NQHYbZanxoFFLllECt2FbjmjF2wjMPk8FFQxYN4pmjcTkBdR/yVa6GwjalotBdDZg
 B3yrZ/BtOrZse98F4PDK6PilTZgxwMuCMsg8svqBTvzpARxye2gkfp9r3HkAzyypIDiHw6qukWF
 d3msDvQiFfUYqK17Z1I06l0GsMOPuCQbEJVHfpJNxzHUSf6dR5hJOM2EUvNhYY3MGaKfL3kgUeK
 pRRe7ZZ4hZQQQlA5ngH1Gcldu+C+6ADctY+l924+DEtu2SXfOnHHC6RN2KjbDndbzWsX7iC0x3l
 Tm1/w7551cyyOA2TSM/oCH2MLYeMw0eABsBgs23IhMzyRdz267jf+2CPnIZBfnHsVCxspG6Cba2
 iNRNkZNQx17Snfm3LCKJ5VDFNW0cq82j6GXkt7DEpLTg8WkfaDdIvGQmgbxKlYoATL4N6LiGpo4
 kevo519Hwl9a9CgbXv9wDLtyfbX9WgXOlbcNCVMxi2CYDq6JD06TT2mW87OrKtWuXAhF7M0vIoU
 2ttFVpbVpAG2jQPSh1RKVxMSWVrDa5xBl442HKhpbnqJdoIx8ptINT4r1meg/e7vnrLWnxebrrb
 sygy6bu7wYrBTUw+/98P0kuBfi17IoJ11I3+Tfg9Gh3nPK3PxUuo=
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
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 lib/igt_core.c |  4 ++++
 lib/igt_kms.c  | 35 +++++++++++++++++++++++++++++++++++
 lib/igt_kms.h  |  9 +++++++++
 3 files changed, 48 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 3ee670a41a91..da2453cc1028 100644
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
index 7b6102cb7319..897b7fc7039b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -60,6 +60,7 @@
 #include "igt_debugfs.h"
 #include "igt_device.h"
 #include "igt_pipe_crc.h"
+#include "igt_rc.h"
 #include "igt_sysfs.h"
 #include "sw_sync.h"
 #ifdef HAVE_CHAMELIUM
@@ -7988,3 +7989,37 @@ bool igt_has_lobf_debugfs(int drmfd, igt_output_t *output)
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
index b291673c2f7f..c25f0fa95cb0 100644
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
@@ -1302,5 +1310,6 @@ void igt_detach_crtc(igt_display_t *display, igt_output_t *output);
 void igt_get_and_wait_out_fence(igt_output_t *output);
 
 igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
+double igt_default_display_detect_timeout(void);
 
 #endif /* __IGT_KMS_H__ */

-- 
2.52.0

