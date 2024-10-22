Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966E0D1CDD3
	for <igt-dev@archiver.kernel.org>; Tue, 22 Oct 2024 10:29:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F81E10E30D;
	Tue, 22 Oct 2024 10:29:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="BtH5EynD";
	dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA7610E313
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 10:29:11 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 08916C30B0
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Oct 2024 10:28:42 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 825F640005;
 Tue, 22 Oct 2024 10:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1729592921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AciYqIN3XfcKu1YBhNQZEMkgxSONT1TR7gG4knSuKOU=;
 b=BtH5EynDWP9AZ2JeyzAeMM7HUHF+FY7aZuqECuADNXZhqdU3SGkmLO9n74MYCzlSzpdwyR
 caxZYqHrIuTZlB/phxk6DRSqs5p8mX7a5K+KaEAKIh7nJ/LE9G/NsfGJBm8zw3oJVJWDD9
 6csDYqYuJbD2Sys/7aoIs/LoHpYyMlWqS4vUYa1YNZEER7Tk9oYpLxFNlbykMkHIwHn9n5
 xtfIOLWTBF1zkkSqh4HGVngxfdpilTTcqVQNcdZBQIIlmXGpsidaiYwtf5mnS/Qf6UIg4b
 jSAQrynox9Wn9rcQeF8K72Hk0Wk/ebmhKCLthVo3a0df/j7A0fppDwjAjP0afA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 22 Oct 2024 12:28:35 +0200
Subject: [PATCH i-g-t v2 1/5] lib/igt_kms: Add a detect timeout value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-b4-cv3-01-igt-kms-v2-1-8f654694b513@bootlin.com>
References: <20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com>
In-Reply-To: <20241022-b4-cv3-01-igt-kms-v2-0-8f654694b513@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <adrinael@adrinael.net>, Arkadiusz Hiler <arek@hiler.eu>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>, 
 Ashutosh Dixit <ashutosh.dixit@intel.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, nicolejadeyee@google.com, 
 seanpaul@google.com, jeremie.dautheribes@bootlin.com, markyacoub@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2753;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=07jjrZgfWR+x9ZeZmnQF2hvLUJIdtSHDbpfUc0J+0GI=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnF35V3vPx3tSKlQwCBVAJp6sqUnUcriEMG4CD+
 ByHEh8eH5GJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZxd+VQAKCRAgrS7GWxAs
 4lmiEACeJ3mv6fvWIGSA84MNZ/sZBV7AYR6slG8MhslftdIbesPFA6IvGm0NnytU1j2OLkeUy+q
 CNbihqMK8A90OJnxKM/pibO4LQFTtV8tVg0NrBeRf0RCd2mzgqgE9jEY6YiDI4Gb/9eJJC8arcE
 bkc4hTlYt82RBP8APpQfjinH2ZKSPZilFi0eOru4HJq5nb2AxDBgioHe6lE7ShveeeDw90yHeJ8
 fi8SHXdWna8SDA9DgVaDPasHKcJsxOR4o0Bu3SpxZwdKF+pMgyg6A6jdn3DtjN9/iqGlhFLMoqY
 o9qUPx0WZ92T0h+pS1tOAfG7Nk89TeZc0CvizfTeG2dNbJ/bJoj1sHshWBlley1YoKYvMsvOIRE
 gIpaUHXvTJ/3t4TFOGpLvXvyhxXrwAsAeKxXJHQzTU7E2mQrkMypj9kdz2ywh9qL+nFxUNMmevo
 Z2IoBy1Eg8LJeuNmAaEOg5bhktMyvbrUUaC4n2Nwt7XOUus5/k0pMkr77QjrT8z7N8EEu986F5g
 LHb9slTWA4EMn602/Qo1ceHM0zVR8h+I5yn0ZpR8rkwaHoAbKGCS/F3lJlQGQNhOOxiz2aCgyQZ
 uNENsORFlwTael43/uS2bdsIGbNelAkQrs2G1sU17c3VWvUetCYCBS+p0CdEc0wdPZLQA34Dxiz
 Hzih5Fat5DBacaA==
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
index 407f7b55187c..5f75141cc42e 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -265,6 +265,9 @@
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
index bb35d4b82c5a..195868646a14 100644
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
@@ -7119,3 +7120,26 @@ void igt_reset_link_params(int drm_fd, igt_output_t *output)
 	temp = drmModeGetConnector(drm_fd, output->config.connector->connector_id);
 	drmModeFreeConnector(temp);
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
index 2b26d2bbfff1..4f0030264d9f 100644
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
@@ -1254,4 +1261,6 @@ int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output);
 int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output);
 void igt_reset_link_params(int drm_fd, igt_output_t *output);
 
+float igt_default_detect_timeout(void);
+
 #endif /* __IGT_KMS_H__ */

-- 
2.46.2

