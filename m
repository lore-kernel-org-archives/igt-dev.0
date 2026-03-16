Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2461FF46449
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 10:24:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C349E10E25E;
	Mon, 16 Mar 2026 10:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="T+6P1mas";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689E310E25A
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 5BD601A2E70
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 10:24:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 33D655FC4A;
 Mon, 16 Mar 2026 10:24:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4550510369977; Mon, 16 Mar 2026 11:24:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773656651; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=PGvNjft8NFIiyHIBxbAtRJ5lhYjIXqfBMrSzF7ctAhk=;
 b=T+6P1maserqw9JmTiNRd271R8/rL6fKHPg8zaDrd4IQaNCldge1y82F82HpAD4ie8JTnZa
 E0wj3QCaE92Acm4sgUgTIeAFSclcUsoAAcEFUYjwv4SjGPNvD1kOQrSnBR+m/GWa3f0+50
 NAxmULeaT0sN9GtxqQ4stoLPcuTPd0rsgpLZBrc3YtuIZvHlWNpGjXauzRghfrSgcXRVpC
 GvsPlsreqyjiKenkB8FB9praOZGYFhPY82464RtCBnCGgh1bh9L3QwzfDfDrZk5KtPcpHQ
 lPm5Z9tez6d+9pND3RL+KDUTZ8NYmbKwVwTCLi9x01frtvVooc6/aqX8dzPeXQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 11:24:36 +0100
Subject: [PATCH i-g-t v8 28/49] lib/unigraf: Allows sst/mst configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v8-28-4489bf8572be@bootlin.com>
References: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v8-0-4489bf8572be@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5434;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=91z5EYZvWM5irCz5eFnzetXv6+1CWgt5mKOhiDyfQSs=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpt9pSPWFhotuZG2XKF0DknVrrXJ2Bb1LLgjn8I
 gv+QltBYl2JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabfaUhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOK7Vg//ckMIPENIMaEvO3mu4l6osS3ehghuZmM
 be9cocDTnZp63KrkLOqLacaSQ4PH6plU0e0/FQXdAhvwPTrEqQ6O9OMFRaqdzdAuJgMX6mt7jqw
 WMyRT3n/5hvf1QNB8cMSx3ygTBVdpHCURGEnGIGuiM07NWSSexNoJsqTFIrW8St0t8hjm110nnm
 h9FmsaSk5wOuD/2Cyeyjo1kggh8dRmJZRkYlAdol8YC8OB/cPmMeaerOl1WGiOogRSgazdP3QKq
 lyXCZJAOgoyGEG1j3SnQv8kTNkSyr/PGlbd7zhMvKPIGX3qEasE+/PSBUH09eVrSS69R/TpHLVx
 HkbMJWVrNaZtGQf6PP3y13SvLgUxRK6NwTuDAdKkWNHGOLdUrYG5EzAkc40mPRVegXHLdejBsFJ
 rEtcrbxVSokW9NVezHvI0rHGqxSm9rj2+bf55KxqLSdkDcBwQl/M+HAWxOHAGIdks8tIxz55k+Q
 9aG3eDf+jGntYlef9BvVetgAB/31qt6A7nimTVvM0Xm5RoLhutk0hkONDUjmg328/GmGQTLhKva
 bi/SUhXuz6DrgX5WLiuyG4YOUJneZBMBc1NcCvjEju8cjcAL8CxmYEOl04OUd0JGQWPBj+Sz/QX
 FphvMH6Oq47W2Np12BvYTk5WRQd+VYnGkul++19R1wGWhxaU2eAg=
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

