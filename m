Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 824EEF53D6D
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:23:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD6E10E2B5;
	Mon, 16 Mar 2026 16:23:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="CWT81IWF";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D55710E2A4
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 0AB121A2E6E;
 Mon, 16 Mar 2026 16:23:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D039F6011D;
 Mon, 16 Mar 2026 16:23:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 020D810372201; Mon, 16 Mar 2026 17:23:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678219; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=PGvNjft8NFIiyHIBxbAtRJ5lhYjIXqfBMrSzF7ctAhk=;
 b=CWT81IWFnBS3kxnHNjtuOtYCfWdrEJEsnKl9VKi0dai6EJ0h+ZBS63/IZu1Qy0juSVrENr
 5tJdlY95UvaLc1KUMrZ/iT8cCNVcJRgSY9/67JmuTGhUGGQYlgSOcKIANp4HHlyzqsS0xE
 /+aBm9gpkU/6eKZXUoDTnkkwaopt1WsFMPwrO6X6zqbY4dPrWC+OxWXbJFYzH1bwLcBnlJ
 jh5w3ZHRRQqftQ3W2O4nfpBVnYTkrBg/lgpH3DooRIKnB2XLUwkwyW22q97i5/dHNSbYSK
 +3A7ERCquOuFHJFeJqjIgvrAevr97m9i3jdxUu8o53S0tH+6+RiFJf/JmFkUUA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:17:49 +0100
Subject: [PATCH i-g-t v9 28/49] lib/unigraf: Allows sst/mst configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-28-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5434;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=91z5EYZvWM5irCz5eFnzetXv6+1CWgt5mKOhiDyfQSs=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6N7JHpqRcrkGAhM3dSjceHaIcMu15oSy/un
 NTqjztonfmJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabgujRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOISEg//QuHCmbzbFXVh2BSRu/YyQodt0VGlU/2
 RGbylPQel4wbxxLpuYfg4/6BL0DhMUzw3DkVaxF28srx+CwCEdV2Yvy/Ox5kEk5wh57caI/6ect
 dYBNBTbX1wahzpeztl92T7nylOu3E4py4uiQAYsH+ozbjKUnGx0vODabsL0ukQLFpZL3Y0/dUme
 Bfydg1wfydVYFvpDaHQPdIUmd+JXAG0MiqO0nD0kDIoD1yEtvc3vpWQkf2UsUw+fke98LXty7+s
 PolVh+cbLkkX+8wKCtnAO61//NwAM2ahlDIBF9dPzrD62LxoOLVt3m9N+VylIiV3T2CtJaWcIgO
 yQbiDYHEB640exT/YrIltrB4oCK8J2/mGnU2BNotVBACO//OFFr8eEcfJVVHHpVnTBDVI1478Xr
 IgIO5V8EQrwaeiy+kx0GEdQ57av1mlU+GpWFl5VmB2YYIwFaOW1ThDRXRURQxIq3dPVdR7P9Mz2
 ES397CYRpERPX2qS/wbmPztsGky9o3wCDOGILr3BLPbKNH4yxZ2yuQtAhfIMa5hatl/jDoFE3qu
 LvtzGBXNFSNIzHmRdjfY0GfHb945S213/6CVPMPnoikHoYM44RUu+JdeZC1g5yT6d8dYnavKHdE
 tT9MdvXlLTz4Hn4oNLKQ/7Q3rrgfJw/36GwcvahCqDMufza3m5uQ=
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

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/unigraf.c | 111 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h |  12 ++++++
 2 files changed, 123 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index 29283b7751b0..b752ff573ace 100644
--- a/lib/unigraf/unigraf.c
+++ b/lib/unigraf/unigraf.c
@@ -108,6 +108,25 @@ static void unigraf_init(void)
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
@@ -306,6 +325,8 @@ void unigraf_require_device(int drm_fd)
 void unigraf_reset(void)
 {
 	unigraf_plug();
+	unigraf_set_mst_stream_count(1);
+	unigraf_set_sst();
 }
 
 /**
@@ -368,3 +389,93 @@ void unigraf_plug(void)
 
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
index ae1f0d8955ab..c2caa9c2c54c 100644
--- a/lib/unigraf/unigraf.h
+++ b/lib/unigraf/unigraf.h
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
2.52.0

