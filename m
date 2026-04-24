Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 927A4FED3F1
	for <igt-dev@archiver.kernel.org>; Fri, 24 Apr 2026 16:58:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A9F98961D;
	Fri, 24 Apr 2026 16:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="OCsFfxPZ";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8CCF10E2E5
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:54:57 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D48264E42A66
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Apr 2026 16:54:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A51A9604EB;
 Fri, 24 Apr 2026 16:54:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6C1EE10720A14; 
 Fri, 24 Apr 2026 18:54:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1777049696; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=LA6Q16UCbr1PMJhGXvIgyuJwQO0E0TqpGxlcZA4r5SY=;
 b=OCsFfxPZr37GYcVONZjBRl94+0rpV0hDLo+G9OMZYQ5xn9tV7r8OaMs7dPbjlSn4K99ZDE
 Euht65VrLgIoqrnYlZrpePr1Pt81DDeIddc2ni/yedtU4yJdljpLrW9i/J9hqjnzejidzK
 kyDkUYl6o6Q86YzbfM8oyEOZg6mdGTB4SAE8JpuDQywzKovdaqZChqLlswnGvl1vE5tKLp
 IQoephVma6kWyZhvF2hvRH8AjW501S7CVcchKoiaXKNlM2pJZ7rcRNHSXOAkPLYxSeY0er
 IwcoE+0UwIcEWCm5LvR9A53aVGjt2RIfC7M2JjnKYj1FxwItm2XKquR2qSEsNg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 24 Apr 2026 18:53:03 +0200
Subject: [PATCH i-g-t v11 28/49] lib/unigraf: Allows sst/mst configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-unigraf-integration-v11-28-0c5f5346ae60@bootlin.com>
References: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
In-Reply-To: <20260424-unigraf-integration-v11-0-0c5f5346ae60@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.16-dev
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

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/vendor/unigraf/unigraf.c | 111 +++++++++++++++++++++++++++++++++++++++++++
 lib/vendor/unigraf/unigraf.h |  12 +++++
 2 files changed, 123 insertions(+)

diff --git a/lib/vendor/unigraf/unigraf.c b/lib/vendor/unigraf/unigraf.c
index 1552a90e05b6..930dd129d091 100644
--- a/lib/vendor/unigraf/unigraf.c
+++ b/lib/vendor/unigraf/unigraf.c
@@ -109,6 +109,25 @@ static void unigraf_init(void)
 		unigraf_assert(TSIX_TS_SetConfigItem(unigraf_device, config_id, &v, sizeof(value)));		\
 	})
 
+/**
+ * unigraf_read_u32 - Read a 32-bit value from a TSI configuration item with error handling
+ * @config_id: The configuration item ID to read from
+ *
+ * This macro reads a 32-bit value from the specified TSI configuration item.
+ * It includes error handling and debug output. This is a macro to have the proper
+ * line information when using unigraf_debug.
+ *
+ * Returns: The 32-bit value read from the configuration item
+ */
+#define unigraf_read_u32(config_id)										\
+	({													\
+		uint32_t value;											\
+		igt_assert(unigraf_device);									\
+		unigraf_assert(TSIX_TS_GetConfigItem(unigraf_device, config_id, &value, sizeof(value)));	\
+		unigraf_debug("Value read: " #config_id "=%d\n", value);					\
+		value;												\
+	})
+
 /**
  * unigraf_device_count() - Return the number of scanned devices
  *
@@ -310,6 +329,8 @@ void unigraf_require_device(int drm_fd)
 void unigraf_reset(void)
 {
 	unigraf_plug();
+	unigraf_set_mst_stream_count(1);
+	unigraf_set_sst();
 }
 
 /**
@@ -372,3 +393,93 @@ void unigraf_plug(void)
 
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
diff --git a/lib/vendor/unigraf/unigraf.h b/lib/vendor/unigraf/unigraf.h
index ae1f0d8955ab..c2caa9c2c54c 100644
--- a/lib/vendor/unigraf/unigraf.h
+++ b/lib/vendor/unigraf/unigraf.h
@@ -52,4 +52,16 @@ void unigraf_plug(void);
 
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
2.54.0

