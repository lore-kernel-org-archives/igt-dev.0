Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8A6F4644A
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:25:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822AA10E25A;
	Mon, 16 Mar 2026 10:25:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="mnuQSB8E";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2AF310E25A
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 4B4D7C415A5
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C296C5FC4A;
 Mon, 16 Mar 2026 10:24:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8F90910368615; Mon, 16 Mar 2026 11:24:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656655; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=EzEFsZEZNb6Kk+LHCwnPfDdmsXoR56hcGPQN//DL0Gw=;
 b=mnuQSB8EJriGUI9mNU3kn/AZVSCF/VqHXe/hFHOm9JZqnY9nw5vqLSSByAY27mlRJKdOem
 5OAuk6xwnmkuyfnpp0nQo/YHSIr8Rvk0XMToxB1rsIS2Klt7/ljNMky0k1ZhI+Nbp9uZ/K
 hTcnM7vQxacrzQYGV03YPLoIqt7/spSVx7/L0wkkPV2BIZadZZMeyf56bTMm9uhik+yRpc
 Pz3yCsbm3hpnhbZ5WqcgreoLjdV/QYoj0GCSXVk08lBKCYblGXFKSZBntm2oBgqJTuUt70
 oiGGbHadkrPLxsJ3GoCDRti1MSsjJEIhZywzdJBiMsTxhFJrgx8/oHbOGBjZGQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:40 +0100
Subject: [PATCH i-g-t v8 32/49] lib/unigraf: Add unigraf CRC capture
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v8-32-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2194;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=q9AJGSj1/SNGJ+vX6p4l9sOPOApTRj1A69i7IiK6B+E=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pSz84X5Um2pePtwtcQRhFQFen4dENeYJRu1
 8DTAgUyjoqJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaUhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJLcA//Y8ABEZB1Au9bTyWxvfQXThFleU0Fkkk
 mUIsIWKaL8qw5rzPFMSKX4H79YXEO0WcHkp5KlvNeX/7wEG83ho6bPIy/fCl3HOtCU+0UO3gvGR
 i4UXPIzeZWm0M4B7Ww68vxKADN1L/WbY9zSTkaMRVqtia27crfyvx4AV851NIc1dwhbjHJU2xtW
 Nz580FVjmdxVhKd4qWalCZ315vy9SKUSwEz2Ml1gMlb0gS9OKa8+hU31I1P9HSItvLDY/T8mOj9
 BkEzxSfxrKHIkRHbK9Hqo8vuxWfiHklkUgiDtJGQA/6LstGp1kWb5HQogT3NNzRFaor47dxLqp7
 MuRee/LUUXLk9GiiVPXvmvlymc1oQ7qFntRWG43ww88rvYQkXntK6mFkMRTHA2FkNRPH6xyVTJa
 PDvBekYIuIC1jbHloSon57vx60XWxSO9Fonfzny2p5zF9wsd5FxVOmplSUchbAq/juTfjhzhJru
 Bz4zdeciVavTTGRaA1c4Vssucq12JSd1UEXcDog+YbgK7OefERB8zC2j7w7mgLgZXRKtMRTw2tn
 flO8O7J1z5qw+7YFUErainRu7UWhyN0mvjq96IR+YeooiAkAIIVg2aJXV8GYPpA7LDCxn+PLSri
 iKxEXVfhw2OxD5QAZunrXqaZWYaSA8hnePvG1lyzKamTk24w55/I=
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

