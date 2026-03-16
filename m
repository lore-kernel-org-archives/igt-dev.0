Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4776EF53D6D
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:24:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8EE910E31F;
	Mon, 16 Mar 2026 16:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fGTM5W5P";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A49D210E2A4
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 95ACC1A2E6E;
 Mon, 16 Mar 2026 16:23:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6C8E56004F;
 Mon, 16 Mar 2026 16:23:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 653E610372204; Mon, 16 Mar 2026 17:23:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678223; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=EzEFsZEZNb6Kk+LHCwnPfDdmsXoR56hcGPQN//DL0Gw=;
 b=fGTM5W5PKT8U6Q/VOzqzVeQ2ua1VG24aVDhR0V2TCzoGp1Uizm6m0kG7UQ14asdLDKaIqQ
 J86dBWnzpVPKyvPUq41rSv+Bpcf65jDEc81uO+sAFTz0p8EmSPI6qGgmP41YDy6bDDzxPY
 qXfitnRUhQMpU4C+GI2urfZv/8dlz6fgsIOyNnxKL7/1nS45PplhDFFiM4VTkPfFFY8KL5
 5kCRIKD+cG3wVmnw4kEOLJRnXqaO1AVy690+JJy4CfwkuOqUfoZNUvn7+C0UsW38/JSJzU
 /p0YSRdNZ3WEzMYcl2Xr/o6CdH9InjbadF1JJAKmuxhKL4pkuTzMrnJlXlmuYg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:17:53 +0100
Subject: [PATCH i-g-t v9 32/49] lib/unigraf: Add unigraf CRC capture
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-32-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2194;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=q9AJGSj1/SNGJ+vX6p4l9sOPOApTRj1A69i7IiK6B+E=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6NOl4vPM7ptdUYePqdjn/wdzPIANirBh4D/
 3/GUZSCpQWJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabgujRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLnDw//a6ExAB6nA9E4MTdpA7hHRJNhCHD0M1H
 fPbLU9rmgv4Py4ul6Gy6d1Dzb1qB3qc8/FpOn5QWBoCve9TammKz13be7CY5Rf6n90SfBGS6UeR
 Cqfqf/tSP2dA/KoDvaos8dMuCU0aKte09tASEPkoS2NYm+NrwdZ5ZYrk9EKwI42/nXAAEBG/zIU
 dnu73bWk0iFuzfPpKtUXvdQV4EOYOdhHWeqtGBiSUcaD9BhzNLUOLL4o3ZLSFKp6ndIIEMlvOjV
 1+irH3fCbA4bTa1hidCE/Xil+qyzkwrAu4Iebm2pYHVh4/2YKcOxB27tZfonHxNN+F8jmqzOEXN
 S5qQUCtjfph7yraS1CdwHitBk1JbppAgdb3nuek6JB4cGv/7WuxU6LWnwii459AjgXhviuL6MXj
 uHU/9f06c9nEZcaYnuYjdYG4GrX7bj7IwWJaVa1gzUQKE3WO83OK56JrtNDVEHMuT1TULBgRniO
 s6fWneW4NMTBzQth7gOHJAOvQ9b/enrcaDxqOKFVVzbaXRkJ5bsVFFjV2ZsW7R4RgzPMrbWJe7R
 joUahRHysoIHxCb1aJEQjDvjdo0IeA8KbRekuazWul8S547kyzJ/q0GiFsaJBBkttPoTfaB1B4m
 x0P1bScFUXbU2M7R8WlutL3nB/ljaXgrSPRXiAkBMJF/qh3nYpUs=
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

As unigraf devices are able to grab a CRC for the current video stream,
add an helper to read the CRC.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 22 ++++++++++++++++++++++
 lib/unigraf/unigraf.h |  3 +++
 2 files changed, 25 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 6e70df288cbe..0f56ad998c94 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -15,6 +15,7 @@
 #include "TSI_types.h"
 #include "igt_edid.h"
 #include "igt_kms.h"
+#include "igt_pipe_crc.h"
 #include "igt_rc.h"
 #include "monitor_edids/monitor_edids_helper.h"
 
@@ -660,3 +661,24 @@ void unigraf_select_stream(int stream)
 {
 	unigraf_write_u32(TSI_DPRX_STREAM_SELECT, stream);
 }
+
+/**
+ * unigraf_read_crc() - Read the CRC values from the Unigraf device
+ * @stream: Stream to grab the CRC from
+ * @out: Pointer to an igt_crc_t structure where the CRC values will be stored
+ *
+ * This function reads the CRC values from the Unigraf device and stores them in the
+ * provided igt_crc_t structure.
+ */
+void unigraf_read_crc(int stream, igt_crc_t *out)
+{
+	unigraf_select_stream(stream);
+	unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device, TSI_DPRX_CRC_R_R,
+					     &out->crc[0], sizeof(out->crc[0])));
+	unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device, TSI_DPRX_CRC_G_R,
+					     &out->crc[1], sizeof(out->crc[1])));
+	unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device, TSI_DPRX_CRC_B_R,
+					     &out->crc[2], sizeof(out->crc[2])));
+	out->n_words = 3;
+	out->has_valid_frame = false;
+}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index fdc4441740fa..8b38261dca09 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -9,6 +9,7 @@
 #ifndef UNIGRAF_H
 #define UNIGRAF_H
 
+#include "igt_fb.h"
 #include <stdbool.h>
 #include <stdint.h>
 #include <xf86drmMode.h>
@@ -71,4 +72,6 @@ int unigraf_get_mst_stream_max_count(void);
 
 void unigraf_select_stream(int stream);
 
+void unigraf_read_crc(int stream, igt_crc_t *out);
+
 #endif // UNIGRAF_H

-- 
2.52.0

