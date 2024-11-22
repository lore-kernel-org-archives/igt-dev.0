Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19051E6916C
	for <igt-dev@archiver.kernel.org>; Fri, 22 Nov 2024 15:19:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7E6510EBCE;
	Fri, 22 Nov 2024 15:19:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="AHMVWR8X";
	dkim-atps=neutral
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E42A810EBBF
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Nov 2024 15:19:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E8F6B1C0003;
 Fri, 22 Nov 2024 15:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732288759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ebN9b/Nw0Kb4meo3k4rCy8qSpbPrkIW8+8jfrUmvHA=;
 b=AHMVWR8XTUj5+PQZjONHHJ7riDxBHd9b1x3liEPxDg82bxSymAAMHOqxr2KauGvbvFVcli
 GWX8CTZOpSEFfpcaL9UNPu+da2w5yUmg4QNO+zVUWjwyy2nHXh7rtDl57RUdlWxE8OpxBK
 HPKEvD37KtSkqsTqsJG7gfsIo39Vo4Sbk50eAtoOWAyP6dGep6tB8aA9im4ZYL49ox3hRl
 chEj7I/BHYEbpWCOidNGDuhAW+n2hbP9qBeF4FVX/C4q1MZDtj4LiybvV0diUl66F7/2sX
 37i8hsGmH9fY52SN373kPmKctJj1VwPI1BDCgG3ppgSCoTPvU+VXEJi21Mze5A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 22 Nov 2024 16:19:04 +0100
Subject: [PATCH i-g-t v3 1/5] lib/igt_kms: Add a detect timeout value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241122-b4-cv3-01-igt-kms-v3-1-c5ced6976e11@bootlin.com>
References: <20241122-b4-cv3-01-igt-kms-v3-0-c5ced6976e11@bootlin.com>
In-Reply-To: <20241122-b4-cv3-01-igt-kms-v3-0-c5ced6976e11@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, nicolejadeyee@google.com, 
 seanpaul@google.com, jeremie.dautheribes@bootlin.com, markyacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3154;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=HERdJIw9kljQhu0zKbRgdjQl4Io32dX8uf59nrgNXE8=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQKDzOT5hdQV7doWyJZGJmGZ8lrkJCxe0gzLxh
 +gn5Pn7aOuJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0Cg8wAKCRAgrS7GWxAs
 4gvPD/49kUf4OqGIYWQvSm6YmzFwboYi2S2lSSvvPu8HBCHNYGvJCt0xufIq/4MhHIO6RkNajEX
 a9ySbExnJBUZRkfE7BHsvWT2j6a3HjD74HiI6xQJQVe0lWUgJq9SNkMEHv6y6KJc6rLEXfrruzl
 qnJjX/M4//XgpN5WzjmdNKT2VwYwS6L/kJOFj9OJjWit0gdhRw0bUiWbwAOMDjTZigqy3+rpkkL
 s6Nvb0QgPdDknnGO1lM2YURkUtYCqK75AKS25uMug3QurfddIra1sBp/c3e3fv4hIB/bdRVk9n9
 QxQ36ZZK06o8v0qs7q4nL/N846ju/zb7j6yw7+/eSJPrS3IFevweRyb09fGWmuBnGvror3+q1dl
 yUChllKI1RkvimiTcRoKjV+0kgkC+svo//98PINR1JIckD4YP0iz/1BzApDtGtVixH/l2Q1EXZ6
 I2POKKIn1DWL4hhR9xRtBkDIyh9znSly8PweLilWx3rf3LBBbFFRgfUrR5k3atA79y/3Ubq6kAf
 lc6vMnmYb/HUZIBE/lagGB4uA4bIKnfPSrvXaI+jx0PtBdV1Bz6S47p8ymJvnGRHaH++ympw1vn
 Q4AgNzsg7RhyIRtcQr1yJ8y1OQRDADeCkfCUK4/2rVAc4SSmRpY+bsBIvaCDf47Bva5uEkvS8Fu
 5X4GZ66SYi1syFg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
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

Some tests need to wait for a specific connector status. In order to make
the timeout customisable for each target, add an option in the
configuration file.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/igt_core.c |  3 +++
 lib/igt_kms.c  | 33 +++++++++++++++++++++++++++++++++
 lib/igt_kms.h  |  9 +++++++++
 3 files changed, 45 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 407f7b55187ceac4cbc0645c629a7fbb17f89575..22d80a1497a9faca85def70d688427cd7d553d60 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -265,6 +265,9 @@
  *	&num; It is not mandatory and allows overriding default values.
  *	[DUT]
  *	SuspendResumeDelay=10
+ *	&num; The following option define the timeout for detection feature
+ *	&num; (waiting for a connector status)
+ *	DisplayDetectTimeout=10.0
  * ]|
  *
  * Some specific configuration options may be used by specific parts of IGT,
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 5d8096a17596ca592a274800140804edec6d7422..0b76a47eb2135cca21881d97c2fd78e724d9a30e 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -58,6 +58,7 @@
 #include "intel_chipset.h"
 #include "igt_debugfs.h"
 #include "igt_device.h"
+#include "igt_rc.h"
 #include "igt_sysfs.h"
 #include "sw_sync.h"
 #ifdef HAVE_CHAMELIUM
@@ -7185,3 +7186,35 @@ int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *c
 
 	return 0;
 }
+
+/**
+ * igt_default_detect_timeout:
+ *
+ * Get the default timeout value for detection feature
+ *
+ * Some tests requires to wait for a specific connector status. This value will determine the
+ * timeout value for this waiting.
+ */
+float igt_default_detect_timeout(void)
+{
+	static double timeout = 0.0;
+	static bool first_call = true;
+	GError *error = NULL;
+
+	if (first_call) {
+		if (igt_key_file) {
+			timeout = g_key_file_get_double(igt_key_file, "DUT", "DisplayDetectTimeout", &error);
+			if (error) {
+				igt_warn("Failed to read DisplayDetectTimeout, defaulting to %f\n", DEFAULT_DETECT_TIMEOUT);
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
index bd154d1c19e9f36ec61f29d953df149b0642465d..3509283b6da5b3fdbd70ebdc9bdd241326bc5073 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -40,6 +40,13 @@
 #include "igt_fb.h"
 #include "ioctl_wrappers.h"
 
+/**
+ * define DEFAULT_DETECT_TIMEOUT - Default timeout used for some detection functions
+ *
+ * It can be overiden by option DetectTimeout in the .igtrc file.
+ */
+#define DEFAULT_DETECT_TIMEOUT 10.0
+
 /* Low-level helpers with kmstest_ prefix */
 
 /**
@@ -1266,4 +1273,6 @@ void igt_reset_link_params(int drm_fd, igt_output_t *output);
 int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
 int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
 
+float igt_default_detect_timeout(void);
+
 #endif /* __IGT_KMS_H__ */

-- 
2.47.0

