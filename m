Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB8EC2BD09
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 15:34:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 039EF10E5AA;
	Tue,  9 Jul 2024 15:34:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="olddxwAQ";
	dkim-atps=neutral
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8973C10E5B4
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 15:34:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC6ED20008;
 Tue,  9 Jul 2024 15:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1720539292;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=27gBwnMNWpyDnZWYsgonn7pGe4Gq+ZzExQrmmKl1suA=;
 b=olddxwAQpTE2W+cXnZdNKBLYd2B1XBjhdXzzpap+LsXN2XRlob6j7FIqo+Qebg0getHqiE
 5FffgrIHgm0RVs8CrY2/OH7XcE63fKeWDatCd94/77hozTVdi84CCMncoG1Yf5iuv9SSlP
 EqgN12PXgAmaHRuMZzSN3wg+Ggig2LZqHoFXuW9DfVnGE5hozhMO5+ZD426WpkPctTgYng
 ZnRMbdDY2mQALuvMkV/WVO75wighqq83I1tGj3loKD+Gif9QOCTyzfi5JOTF1cbrKK93/Q
 ZcPBjPGWfNU4pB+nlzY9Z+dCl/6gpPJCB1fjNGDtsQuGk3J/PyMJU/TWycAaYw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 09 Jul 2024 17:34:17 +0200
Subject: [PATCH i-g-t v2 01/39] lib/igt_kms: Add a detect timeout value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-dev-remove-static-ports-v2-1-5adfc6985778@bootlin.com>
References: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
In-Reply-To: <20240709-dev-remove-static-ports-v2-0-5adfc6985778@bootlin.com>
To: igt-dev@lists.freedesktop.org, ihf@google.com, markyacoub@google.com, 
 thomas.petazzoni@bootlin.com, jeremie.dautheribes@bootlin.com
Cc: Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2617;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=Gzs9GHV4w0dJgFUoFqoiO1DBvRo4m6FIqJqT1HSWpHQ=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmjViWGV0ssnJOQV9Qfp/K+lfGzIrXhn4sIAKCg
 +ZCWqD4oJ6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZo1YlgAKCRAgrS7GWxAs
 4gGWD/9ADViMy1oZ5V/ouOMJpFJAcpoMAtkPtce5BnzPeAjtIc8JVz6PQY/Dd+AKVD74hWQxPyM
 PGwOlH/UBmgtKG0ooB2e011tIz48txVtqPyD/Xe02+PRc2eFeq9nTvuNcIM+yX69aOyg8IK1tab
 IfFyT4d8cQ8oNIZ1ad2mM6dk+uRoMPb7ZboapmNfzUoP8FZEkwlgf9HDVkfKzymTsvXCG/+1qgK
 BptqidiU40xakjUHzfjK2cA2p6qhHN9hUsqh+YfUjlAcQTfnQlvu29l1zGAxPJD+dseJu9nsjBg
 ie6XGX8fxYLxDeaKv003OaUThzrCQjEeqcPmtyyGOYd69MOy1lOtytIuXNLV7/iakAU5swA8AmM
 P3+IWFHTfINDJVjIG/2rdxLkB5QM0axxxF4+rSC5vCa10wXOfuCJUEeJf8SxwifQZiMuG+d3hn7
 /aubsGVZN0wszHXknxxr5SKyLiETMJlNpaTnbDqBhUOh69L+9Y5RQDGYA9Ce92CK82V2YlaTOe7
 R3Z9ZE5Cy1fB6YG9IYUqFiR9LCiWjkIcXa7EP/aySfjO93CtpIYeOF6nrQAa3du8bUKJZYwzLmi
 x/hZdy3tUifeVKTykPTY1sutgyB9iUTBQFH4H8fD/vcTACLaHoBP1vQORXE1CNHEKAO50tQ9pbk
 nDYChjxFypLvovg==
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
 lib/igt_kms.c  | 24 ++++++++++++++++++++++++
 lib/igt_kms.h  |  9 +++++++++
 3 files changed, 36 insertions(+)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 3ff3e0392316..5f5adb553629 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -260,6 +260,9 @@
  *	&num; It is not mandatory and allows overriding default values.
  *	[DUT]
  *	SuspendResumeDelay=10
+ *	&num; The following option define the timeout for detection feature
+ *	&num; (waiting for a connector status)
+ *	DetectTimeout=10.0
  * ]|
  *
  * Some specific configuration options may be used by specific parts of IGT,
diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 64318ef7fb15..4877da4c6c9d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -57,6 +57,7 @@
 #include "intel_chipset.h"
 #include "igt_debugfs.h"
 #include "igt_device.h"
+#include "igt_rc.h"
 #include "igt_sysfs.h"
 #include "sw_sync.h"
 #ifdef HAVE_CHAMELIUM
@@ -6662,3 +6663,26 @@ int get_num_scalers(int drm_fd, enum pipe pipe)
 
 	return num_scalers;
 }
+
+/**
+ * igt_default_detect_timeout - Get the default timeout value for detection feature
+ *
+ * Some tests requires to wait for a specific connector status. This value will determine the
+ * timeout value for this waiting.
+ */
+float igt_default_detect_timeout(void)
+{
+	static double timeout = 0.0;
+	static bool first_call = true;
+
+	if (first_call) {
+		if (igt_key_file)
+			timeout = g_key_file_get_double(igt_key_file, "DUT", "DetectTimeout", NULL);
+		else
+			timeout = DEFAULT_DETECT_TIMEOUT;
+
+		first_call = false;
+	}
+
+	return timeout;
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 501d48763fb6..f89e1be86b30 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -39,6 +39,13 @@
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
@@ -1224,4 +1231,6 @@ bool igt_check_output_is_dp_mst(igt_output_t *output);
 int igt_get_dp_mst_connector_id(igt_output_t *output);
 int get_num_scalers(int drm_fd, enum pipe pipe);
 
+float igt_default_detect_timeout(void);
+
 #endif /* __IGT_KMS_H__ */

-- 
2.44.2

