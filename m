Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE64BE7719E
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 17:46:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61C5610F14F;
	Fri, 10 Jan 2025 17:46:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="YQWmZC8b";
	dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039C510F14F
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 17:46:12 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id DF75AC4B9A
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 17:43:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3BC7140009;
 Fri, 10 Jan 2025 17:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736530977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rqi9Ewp310I9ygq3wEDCVXUkpW79nJCnpKyGbbO0kX0=;
 b=YQWmZC8bgB0f328y7SG8raQqZ1SGPhQ7a/LVCaDs3FhZsZ364rJbsHTn5LxRevyzS/ymAX
 j2/5pEBnyOGn2b4a4b2AF0/BIVNgFr+g4IxnrvFZ1jwW7usrGUkVAEhMYh9Tvf2+m6n3F5
 NNQK3FLgyMqbBxpTyU99PVv9QzPcvHa9DrecZJoiOq9gZ8WtiH442/2zpKNagwGoj3jMl9
 wtwnE8rckVck2zDZIvkH5zmZ0fsHjIdzF2C/UQczYjxbP6riu+wmtDBL/wsSeMRsoQbpCN
 ADRutMcMFY78s50G2EKW73ItHe4in3SAZsI5JfZEczHUBq86lmaK0Y+qZeL4Lw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 10 Jan 2025 18:42:50 +0100
Subject: [PATCH i-g-t v4 1/5] lib/igt_kms: Add a detect timeout value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-b4-cv3-01-igt-kms-v4-1-0b0474708f9f@bootlin.com>
References: <20250110-b4-cv3-01-igt-kms-v4-0-0b0474708f9f@bootlin.com>
In-Reply-To: <20250110-b4-cv3-01-igt-kms-v4-0-0b0474708f9f@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3231;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=LMIdLfxoUZxLmebfH9pWF3gRGVWCwvACopLncnlGzC0=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBngVweA/RHXo5gC6Deh99knY4LJlISiCT0War+s
 cafy8wTISqJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4FcHgAKCRAgrS7GWxAs
 4ooCD/9f0gyB3RRqQZzRLyoDkciLchBOQscIZg/F8qgJ8pCjpTgLf3w9Miwab7v8mwby4XVvsyM
 cnolWKnkQczIAtmwsfCK5oKj3AGt2beyGgC3RfSDPT3CAuLBSMCFVjaOoRsVqCt/IOSUkVO9FgJ
 u7YTnrMtfwvrpFTJ5n2TA5aH98Xpfy8ZydBgaggEekXyRHUZPRDL/orALEFlMgRslCtw1bYhZL2
 YB6fDdiOSltbY9PO0zZ+tHczFeDmgLSsnClNYEJcp6ZZ8QcLZR+R0svHtR0CRbjDUFU1X/6j7tQ
 ZGXS+h6C7QHq1w93+ZpCgc/+9Ss+8VDaSWRsfy+l9osHUJDfXLwqfx6DeEBonZhbjVwTB3bYVsC
 P2tT77VfxCnW3GE4FoSqZlcRhsBd1g9hBtjLRgmpE7j52LWai8tRrL2VbcJuYUZi/l5qFnHVH98
 ywH1WOBn6LZoyXqc8MiwzaJv0MhLqATOM3+cTnW1LsWMIb2xhkrRZ79hu+hQKjztdWOYcAU7sAv
 bNLxaEuoc9kNWfMePGV6b5401q3HgkURppCTxilfcSUVBICHa/Qcz74H7w9qsnhceTGCaZICUDk
 zGOglQ4/u2OyJmywqFme6rg0BgLlOJQJ4DHlT/vK78cUSZKjX7+VFupAXCpPZM3Asw4W/JQDqOT
 NLQMIDPVSDh3gBQ==
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
 lib/igt_core.c |  4 ++++
 lib/igt_kms.c  | 35 +++++++++++++++++++++++++++++++++++
 lib/igt_kms.h  | 10 ++++++++++
 3 files changed, 49 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 407f7b55187ceac4cbc0645c629a7fbb17f89575..796c52b44341c1a40abc87540ca0f65d09ca554f 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -265,6 +265,10 @@
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
index 76f32e1e0ffd60d9542b43881e73c9810e45327b..b3373435b252c9f8c5d5854f738f7f4bbc468964 100644
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
@@ -7210,3 +7211,37 @@ int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *c
 
 	return 0;
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
index 301f370dfeb34e90e6f88dfe0006667d7b6a7213..91a26f2070efd26f9d107841ae3083b281d5e4c6 100644
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
@@ -1269,4 +1277,6 @@ void igt_reset_link_params(int drm_fd, igt_output_t *output);
 int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
 int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
 
+double igt_default_display_detect_timeout(void);
+
 #endif /* __IGT_KMS_H__ */

-- 
2.47.1

