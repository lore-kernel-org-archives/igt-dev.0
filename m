Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6B4C83F38
	for <igt-dev@archiver.kernel.org>; Thu, 17 Jul 2025 18:46:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF20A10E884;
	Thu, 17 Jul 2025 18:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="CKzpVKaG";
	dkim-atps=neutral
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE92110E15A
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jul 2025 18:46:41 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2385A442A9;
 Thu, 17 Jul 2025 18:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1752778000;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BVqGmZlJO++E9w4xgtbmzvU/Bg1dCoFLVISyjTA2sH8=;
 b=CKzpVKaG2hVkBdZ8IcxJnP2tKET6saFRI5K7BEW9bAnKxi1dcuNc0bvD6C9pIEF+wDMPWN
 shvmZGIY3+QsyAECk+VjNrrYiat/P6KxCgCucUy+Hl+7p76i2xwif2CAWZQUDVi6jHk9Ff
 6lSA46zopk1yzLEJoJZmZUAQWCxuBV370mOIxNUWNcjx9t97vuRmw3ZA7BOznbdG1cLvHG
 2Mc4zfMQ8pUGjYMwfL/O8vv4UWOBUvkybS3qFXzyiD40OlDG97RNbx4pSBFWQ1lBfOHyzM
 H2JDyV2oymr2R+WioRXZ48Tq8KXNQExuhxZzEgozfis665tDlCX37tp/jUdlMg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 17 Jul 2025 20:46:21 +0200
Subject: [PATCH i-g-t v2 01/26] lib/igt_kms: Add a detect timeout value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-unigraf-integration-v2-1-77dc329e584c@bootlin.com>
References: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
In-Reply-To: <20250717-unigraf-integration-v2-0-77dc329e584c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, mark.yacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3228;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=hVo607AACj32TkulEsOc71NvjnzcaEzRmIYUwVnaErs=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoeUUHTPiIjotXYSf/Onjxh2KUCDd9nutE8ZzqO
 t5brStDLDeJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaHlFBwAKCRAgrS7GWxAs
 4s1BD/91fpJA2jy7A8i25Cy4gIvp68OwJ06VltqggiX5qYJQlzGE2ICHv9TG+x+nw0wzVGgsr12
 LXpJEPNeJE6Em5SQo320BgCA4yQcer3Sp3LxcIvOSQjQQO/GmqpKU6/OtR2p/ilWPalOTt7cmCu
 su7BI+CDATEoaCA7tqEqBlKN1DN21z5HX3xU4nXJz0zlOSkT8HN2NAq3pZI0Lc1z73+EmhBB5w2
 QR1beISI03/wnLCGylEAgOmMtw1TqMVxslTXAjSyPIqnrsPyfYIZHYQOaGRbdS2MMiJmxbwmshQ
 g+7lBoFBoKTYb0Obdqd+Iz5vwyADPgrWcAQIG/iNTBCE//bjYpefw/HbiHNtiArsEL7JCo0A5Ql
 W7npwx8+y90aauQPbD2dTcvhp7Hrgtj0XbLTsGM163HawIZsMsQ4ahChNU04NflxXGd5ScrGsIu
 p5rm0TW+ajGLmOlBZ5nwWq4PthD1MtvRl/130DvdQjL2XvFXkSGDCLAC2dUNE6w7foKSjjxMioF
 ZbjKttJTfFPpw+XvLB6w/a3ilqTiLXyF9Za6u7o5mluAgRtVQKPlUFCYWoXR+UBoM8Rg9y7c3qT
 pCHmDMquQ8DOyFX22x+7ZkvUGLzcwi/Y0BTrJl2VaWcLEl0p/JrbBVtvzPwgiRC1ODEXSvK50Fq
 3s25C9b0lnlqq6w==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeiudeffecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehtdejtddtteeiiefgleejkeetteevhfdukeegleffjeehgeeivefhgeduffdvvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrdegvddrieejngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepihhgthdquggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepmhgrrhhkrdihrggtohhusgesghhoohhglhgvrdgtohhm
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
index c2674a27203cbbe5413cb579153dbeed105621bc..3bafaf971c4c9f0fe8718cab261464c0f4477d3f 100644
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
index 9ee03e87092716841a91322d38da8023aaaae611..d0dcce5d008eb0e1953a2b60a6670c98562ba7a1 100644
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
@@ -7472,3 +7473,37 @@ int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *c
 
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
index a85fee515f56206d14394682f878e84cde62a758..e39745b0a68cbac4bd57c4c4ceae82a64cfab5a9 100644
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
@@ -1281,4 +1289,6 @@ void igt_set_link_params(int drm_fd, igt_output_t *output,
 int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
 int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
 
+double igt_default_display_detect_timeout(void);
+
 #endif /* __IGT_KMS_H__ */

-- 
2.50.0

