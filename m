Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9A410F92E0
	for <igt-dev@archiver.kernel.org>; Tue, 31 Mar 2026 17:14:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59EED10E18E;
	Tue, 31 Mar 2026 17:14:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="trZBN35J";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7323410EC43
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Mar 2026 17:11:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 634DA1A30B4;
 Tue, 31 Mar 2026 17:11:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 39D8F6029D;
 Tue, 31 Mar 2026 17:11:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4478810450636; 
 Tue, 31 Mar 2026 19:11:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1774977075; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ngmwiTr6a4O31EIXsLql0O6Ar8D/cKiHuZO48ZjFsmA=;
 b=trZBN35Jofs6ZHZjMcPeLu0sz8Q3M366LqUi8dd/x8hEvV10zmCIgLXDlQNqCfjOjfJrIo
 /hKQ0isMIPDGb12gcGomqYSiCcTPHCfBvGu/gU3PCudIwP3vKEy1G3ffH7Ply/QP162ws4
 ctd9kXFz9tVDWhLALemjICo6v0y+6Pp6z6StcvWerIpqGcvrfslhfAvq4pbOvMb+fCY00k
 Tj2XSQFTkq76oNQuXif9J85rFXSrouZ+pnX31PxicD0LbO6FGzwD0rZgdG0H7sN4edYMns
 njZqKA4+38WMOaEnAWEM5E5gTGTghqmSySWdtzOSmtl8eYpiB4dDmX9yR00X9Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 31 Mar 2026 19:11:46 +0200
Subject: [PATCH i-g-t v10 29/49] lib/unigraf: Add helpers to read and write
 edid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-unigraf-integration-v10-29-12266c34cc1d@bootlin.com>
References: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
In-Reply-To: <20260331-unigraf-integration-v10-0-12266c34cc1d@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4031;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=ZB0zXyV74gL1gJp0PBeByoa4mnk4sIyD/SMZpzfTJ/U=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpzAA/PRDDvK7gZ6y/frCqCRDuhZoj/j9Of7HJz
 hbv2GSa0HCJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCacwAPxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKHixAAqyO7IxCAoPX5AWmpaiqFyN5tmj6Vhrs
 DzlxOu5g4uei7XoxUVHntuk74TNacB3VFylgx+dntI29MUx7+zb5GTYZjMeCo0sVAWKXFIVw69p
 eKvwA0SwVulg402WxHlhkwQCyY0F6fHHH6XGVeomQNv8/tFE8j3SBA9wpdUVhKsxlpjwQRVG9C/
 qGbmngaUdEACLqwuBxJ/XervJY5E2jnzKkO7P0VZeOMed4NeT3TBY2qqfJyRawKR8k3bbRs5Jvk
 duUcMwb+rltRgiIp9qsikqDW3NcEz5P/MY+AOmTkhHFFaMbGGpaF+yjUCqeLdrpFIld02C9CIn7
 7OTrTGMWuPgv6eowzmurL1IguHYv8rj2X/ej2832JADmM/On0uANOGU2RsUR7HAuC+IWXNVf2V2
 mafLfOU9ZoN8Yox0A+SZs/CYBUu9rWgDpvqeVlH3DxMQqt+w3ZQpNRFzyGEgIN10f2wrNFbhXsy
 RtbdaFWepxFIIPuHj6LyJWdZgGywVyrGx0pwKZaWPtdFdcSC8uF6AKMLvyk6q7fyT6zH0HB+HTa
 jTsQ2caWwXcd2wSCgFAl7AGQxwD/MmmLrxaB0KpSKchh7FRowFVsfvsD9q26vgGt91EVGgs/fp8
 Srz9HYGNHX5dRxGCZ6DFRb80VOLd/QQippgibmXrUS0ynIEXXGAk=
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

Read and writing EDID on unigraf can be useful to emulate different
screens, add helpers to read and write them.

There is a limitation on the libTSI.so, it is only possible to read EDID
using buffers of size multiple of 128 bytes, and there is no way to query
the actual EDID size. The current implementation can only read EDID up to
2048 bytes.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 lib/vendor/unigraf/unigraf.c | 60 ++++++++++++++++++++++++++++++++++++++++++++
 lib/vendor/unigraf/unigraf.h |  4 +++
 2 files changed, 64 insertions(+)

diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
index 930dd129d091..68c322a0302b 100644
--- a/lib/vendor/unigraf/unigraf.c
+++ b/lib/vendor/unigraf/unigraf.c
@@ -14,6 +14,7 @@
 #include "unigraf.h"
 #include "TSI.h"
 #include "TSI_types.h"
+#include "igt_aux.h"
 #include "igt_rc.h"
 
 #define unigraf_debug(fmt, ...)	igt_debug("TSI:%p: " fmt, unigraf_device, ##__VA_ARGS__)
@@ -57,6 +58,11 @@ static char *unigraf_connector_name;
  */
 #define UNIGRAF_DEFAULT_INPUT_NAME "DP RX"
 
+/**
+ * UNIGRAF_EDID_MAX_SIZE - Max EDID size that can be read from the unigraf. The
+ */
+#define UNIGRAF_EDID_MAX_SIZE 2048
+
 static void unigraf_close_device(void)
 {
 	if (!unigraf_device)
@@ -128,6 +134,20 @@ static void unigraf_init(void)
 		value;												\
 	})
 
+/**
+ * unigraf_write() - Helper to write a value to unigraf
+ * @config: config id to write
+ * @data: data to write
+ * @data_len: length of the data
+ * Returns
+ */
+static void unigraf_write(TSI_CONFIG_ID config, const void *data, size_t data_len)
+{
+	unigraf_debug("Writing %zu bytes to 0x%x\n", data_len, config);
+
+	unigraf_assert(TSIX_TS_SetConfigItem(unigraf_device, config, data, data_len));
+}
+
 /**
  * unigraf_device_count() - Return the number of scanned devices
  *
@@ -333,6 +353,46 @@ void unigraf_reset(void)
 	unigraf_set_sst();
 }
 
+/**
+ * unigraf_read_edid() - Read the EDID from the specified stream
+ * @stream: The stream ID to read the EDID from
+ * @edid_size: Pointer to an integer where the size of the EDID will be stored
+ *
+ * Returns: A pointer to the EDID structure, or NULL if the operation failed. The caller
+ * is responsible to free this pointer.
+ */
+struct edid *unigraf_read_edid(uint32_t stream, uint32_t *edid_size)
+{
+	void *edid;
+
+	unigraf_debug("Read EDID for stream %d...\n", stream);
+
+	edid = calloc(UNIGRAF_EDID_MAX_SIZE, sizeof(char));
+
+	unigraf_write_u32(TSI_EDID_SELECT_STREAM, stream);
+	*edid_size = unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device,
+							  TSI_EDID_TE_INPUT,
+							  edid, UNIGRAF_EDID_MAX_SIZE));
+
+	return edid;
+}
+
+/**
+ * unigraf_write_edid() - Write EDID data to the specified stream
+ * @stream: The stream ID to write the EDID to
+ * @edid: Pointer to the EDID structure to write
+ * @edid_size: Size of the EDID data in bytes
+ *
+ * This function writes the provided EDID data to the specified stream.
+ */
+void unigraf_write_edid(uint32_t stream, const struct edid *edid, uint32_t edid_size)
+{
+	unigraf_debug("Write EDID for stream %d...\n", stream);
+
+	unigraf_write_u32(TSI_EDID_SELECT_STREAM, stream);
+	unigraf_write(TSI_EDID_TE_INPUT, edid, min(edid_size, (uint32_t)UNIGRAF_EDID_MAX_SIZE));
+}
+
 /**
  * unigraf_hpd_assert() - Assert Hot Plug Detect signal
  *
diff --git a/lib/vendor/unigraf/unigraf.h b/lib/vendor/unigraf/unigraf.h
index c2caa9c2c54c..40f706ebd483 100644
--- a/lib/vendor/unigraf/unigraf.h
+++ b/lib/vendor/unigraf/unigraf.h
@@ -42,6 +42,10 @@ void unigraf_require_device(int drm_fd);
 
 void unigraf_reset(void);
 
+struct edid *unigraf_read_edid(uint32_t stream, uint32_t *edid_size);
+
+void unigraf_write_edid(uint32_t stream, const struct edid *edid, uint32_t edid_size);
+
 void unigraf_hpd_deassert(void);
 
 void unigraf_hpd_pulse(int duration);

-- 
2.52.0

