Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA7EE7DEF4
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 14:32:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953B510E4EE;
	Mon,  2 Feb 2026 14:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="glkQG3vG";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BA310E4EE
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:52 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 98D1C1A2C16
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 14:32:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6E91E60767;
 Mon,  2 Feb 2026 14:32:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5DB6E119A890A; Mon,  2 Feb 2026 15:32:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770042770; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=sqA3RNGjoDbUSThqVDa2PHeiUiRDxnGTWO+cAdBpbZw=;
 b=glkQG3vGqtlblkgi19xtw8V3jtRegsH9KIoWvWwXH3I+/p9ntgZInXTjAIyj6+SgO7G0ms
 83Xn63hOTlAeFAUIkWRZbiHzfCP8Qk988tVq8pom5JAVg0q0uQiM2Y41FRF24Amm9+vPhB
 yZtyTIupaTxhwdb4ILX4Imn8Np8sz6HfizNFaBsckF6UnbYUrQmSA7Yf9pa13BxVQMrBsI
 mqfkAprnzVsIy0ZB1hKR/QWBz4bCn/c3YhyisrUI6v7FoTYY6MpplbiStERvL5EVBgBcEN
 vqUOb6M7g3TZbrhhKz+FZjEAmd36U6JNxKMYhDoReEXKFlOoevqTrABPynsGtA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 02 Feb 2026 15:33:06 +0100
Subject: [PATCH i-g-t v6 27/48] lib/unigraf: Allows sst/mst configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-unigraf-integration-v6-27-834af822eee7@bootlin.com>
References: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
In-Reply-To: <20260202-unigraf-integration-v6-0-834af822eee7@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5047;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=QcXRX1DBqwWq5pV2LHgu3ocJeYM4UOkNhsqLFaJb000=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpgLWS8eME/xOPo90PoBgQdHAniDlzg12uwE837
 jJkpDicOzSJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaYC1khsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLdoBAA0JjFzJfmHK0y/LNA+xdd6dHy9+YrOb5
 rsdNeDO6yGIGI40CgSRsEeHPzsZBFvKzJKHS7F+bZfHtWjyBWwIgrpZm+dAJ7NHkFDucrhictoO
 UkFFPXN4EPWiC8gq8yPnll/WzbLyVmgjNNC4dxZOD0mF1zuKS5ch/Ahqdzv9tZGEKFX6ET5wFQp
 CibZmHib9SHo/O9GvmALM/fodC2xOq6+F+YpRLZ9qEq27cfoXzA0xknPEjYyfccx/OGy3cYkhhS
 rcHNdF6GB8BsWaHSbkYX9N6Z0Y22fFKN+aMS01RcYHbnIdI3ia0IoGJHZJjQTFp7UrIfvapaaK8
 NF9LtG/uDC/R+A0gemFOA1X06ACmtOTsj/+C2NbRC1Nok+nzubkMuSDTQdVP1TkygKE+Wwdw4gS
 GzYVwwOY3RjSlx4/DMsUrJexDI+XK+IUoRx+cWDOCzwSiFREFyZHu2f6qz2WRkwtcJxZKii+XNK
 H+idf/NFmCiIhiRX+SeoqZBZBvNJiqjvHoRIseqaWRS13L2tSj2dUIbS7IrGJO3fgDqxHrepcOY
 GYuM7J9hBdpP1bIJhU8SP6vx/rrbdVN9W9ZddM5Xg+/4HF2vsfPwokg+4zN3VYULOzMgy3nSbSt
 i5w3K3zC92Y2uXwGsWu1bGJ3IG4fwRd86prUw+3gBs5qVlk0HtDQ=
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

Unigraf devices can emulate both SST and MST display port. In order to
write tests using both, add fews helper to manipulate them.

The define TSI_DPRX_NOT_DOCUMENTED_SIDEBAND_MSG_SUPPORT is taken from the
python SDK, as it was not defined by the C sdk nor documented.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 109 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h |  12 ++++++
 2 files changed, 121 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 966e7d2a5077..4a3b0a5fc28e 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -105,6 +105,23 @@ static void _unigraf_write_u32(TSI_CONFIG_ID config_id, uint32_t value)
 		_unigraf_write_u32(config_id, v);				\
 	})
 
+static uint32_t _unigraf_read_u32(TSI_CONFIG_ID config_id)
+{
+	uint32_t value;
+
+	igt_assert(unigraf_device);
+	unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device, config_id, &value, sizeof(value)));
+	return value;
+}
+
+#define unigraf_read_u32(config_id)						\
+	({									\
+		uint32_t value;							\
+		value = _unigraf_read_u32((config_id));				\
+		unigraf_debug("Value read: " #config_id "=%d\n", value);	\
+		value;								\
+	})
+
 /**
  * unigraf_device_count() - Return the number of scanned devices
  *
@@ -329,6 +346,8 @@ void unigraf_require_device(int drm_fd)
 void unigraf_reset(void)
 {
 	unigraf_plug();
+	unigraf_set_mst_stream_count(1);
+	unigraf_set_sst();
 }
 
 /**
@@ -390,3 +409,93 @@ void unigraf_plug(void)
 
 	unigraf_write_u32(TSI_DPRX_HPD_FORCE, d);
 }
+
+/**
+ * unigraf_set_sst() - Configure the device for Single Stream Transport mode
+ *
+ * This function sets the device to operate in Single Stream Transport (SST) mode.
+ */
+void unigraf_set_sst(void)
+{
+	int link_flags = 0xFFFFFFFF;
+
+	unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device, TSI_DPRX_LINK_FLAGS,
+					     &link_flags, sizeof(link_flags)));
+	link_flags &= ~(TSI_DPRX_LINK_FLAGS_MST | TSI_DPRX_NOT_DOCUMENTED_SIDEBAND_MSG_SUPPORT);
+	unigraf_write_u32(TSI_DPRX_LINK_FLAGS, link_flags);
+}
+
+/**
+ * unigraf_set_mst() - Configure the device for Multi Stream Transport mode
+ *
+ * This function sets the device to operate in Multi Stream Transport (MST) mode.
+ */
+void unigraf_set_mst(void)
+{
+	int link_flags = 0xFFFFFFFF;
+
+	unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device, TSI_DPRX_LINK_FLAGS,
+					     &link_flags, sizeof(link_flags)));
+	link_flags |= TSI_DPRX_LINK_FLAGS_MST | TSI_DPRX_NOT_DOCUMENTED_SIDEBAND_MSG_SUPPORT;
+	unigraf_write_u32(TSI_DPRX_LINK_FLAGS, link_flags);
+}
+
+/**
+ * unigraf_get_mst_stream_max_count() - Get the maximum number of stream count accepted by the
+ * device
+ * Caution: This function can be destructive to some configuration: the only way to get the
+ * information is to try and read the new value.
+ */
+int unigraf_get_mst_stream_max_count(void)
+{
+	struct TSI_DPRX_HW_CAPS_R_s caps;
+
+	unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device, TSI_DPRX_HW_CAPS_R,
+					     &caps, sizeof(caps)));
+
+	return caps.mst_stream_count;
+}
+
+/**
+ * unigraf_get_mst_stream_count() - Get the current number of MST streams
+ *
+ * Returns: The current number of MST streams configured on the device.
+ */
+int unigraf_get_mst_stream_count(void)
+{
+	return unigraf_read_u32(TSI_DPRX_MST_SINK_COUNT);
+}
+
+/**
+ * unigraf_set_mst_stream_count() - Set the number of accepted stream count
+ *
+ * Returns true when the stream count was properly applied, false if the final stream count
+ * is not the one requested
+ */
+bool unigraf_set_mst_stream_count(int count)
+{
+	int new_count;
+
+	igt_assert_lte(count, unigraf_get_mst_stream_max_count());
+
+	unigraf_write_u32(TSI_DPRX_MST_SINK_COUNT, count);
+	new_count = unigraf_get_mst_stream_count();
+
+	igt_warn_on_f(count != new_count,
+		      "IGT:%p: Requested MST stream count (%d) differs from what was applied by the device (%d)\n",
+		      unigraf_device, count, new_count);
+
+	return count == new_count;
+}
+
+/**
+ * unigraf_select_stream() - Select the active stream for the device
+ * @stream: The stream index to select
+ *
+ * This function selects the active stream for the device. The stream index
+ * should be a valid stream number that the device supports.
+ */
+void unigraf_select_stream(int stream)
+{
+	unigraf_write_u32(TSI_DPRX_STREAM_SELECT, stream);
+}
diff --git a/lib/unigraf/unigraf.h b/lib/unigraf/unigraf.h
index 97b8c3661f1f..7ff6dbda71fe 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
@@ -46,4 +46,16 @@ void unigraf_plug(void);
 
 void unigraf_unplug(void);
 
+void unigraf_set_sst(void);
+
+void unigraf_set_mst(void);
+
+int unigraf_get_mst_stream_count(void);
+
+bool unigraf_set_mst_stream_count(int count);
+
+int unigraf_get_mst_stream_max_count(void);
+
+void unigraf_select_stream(int stream);
+
 #endif // UNIGRAF_H

-- 
2.52.0

