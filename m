Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B4BEA4FB2
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 12:09:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACE8810E385;
	Mon, 23 Feb 2026 12:09:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Ym7v5Yqc";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBED610E385
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 12:09:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id ACB681A0993;
 Mon, 23 Feb 2026 12:09:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 719BB5FD43;
 Mon, 23 Feb 2026 12:09:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 548ED10368F7F; Mon, 23 Feb 2026 13:09:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1771848552; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=pu2JOfY6QfF1td4k2eoHNY5cS5DGIEJeUOx5lEIfURo=;
 b=Ym7v5Yqc/8MdIS8v2q8h1zuUs9OtPHLKhHOzqxcRZ+/q4L7OInLK0k82ya/+DS65sLG/op
 m+0vRxMbdcyRzBhsJh6U56PCx4yYq8ZUcqE/KeZqBe38zQYuTLNb9+zqWdFfDpGMgEsACd
 tlmoaEByBbcaAyz95zxeBfjx6A6P6RTqaut2Fg2Feb6HLBzKznes8sciqQHXkkFwIfcukp
 Tp7aUG5JPHN6mAa+nKv9O1S9nsNdpgPkAmlL8LGCE7MLRVJhJHesSk4pzhkXWSaaiLex1m
 LMkhJL2vXzhEJmKpFFl0YrrVW+9/3Y0eH5qlkHrcrdKPowKMQssSzAwFrEk0yQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 23 Feb 2026 13:09:34 +0100
Subject: [PATCH i-g-t v7 27/48] lib/unigraf: Allows sst/mst configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-unigraf-integration-v7-27-73dc9143c8c1@bootlin.com>
References: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
In-Reply-To: <20260223-unigraf-integration-v7-0-73dc9143c8c1@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5378;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=USCqjuCwcyhnXEIcs64maT3WVYMu4iZAye+2K5aqkyY=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpnENqdx15F1lKrB1Lm/Hbv1LyTiCiBYODxMu+s
 0gFToSwuXWJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaZxDahsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLt+xAAoBwQpEvevvANXPukIVZtLNWqFqG4pJ7
 Sjpfzoe2Nm/Fta6h9/Mz34AAhBE9INlSEEX8r61fdhcMR+Diqw7J3nEy4/ZGFVcsqSTHXY5M5iH
 gMECWZoMvgOOh9TkHmW+WbDL+qeV9V01DaNKL//+wR1emUcHkRbDdPBFsrZ7Eyb6UcgfYeo7zss
 XOQr2j3DCOXardMpwz2McFxCfnpj6MdCB11+qWUAo95BV65zZtHKrB9WbowSXhKSXJZo6YlKAmu
 N2gJ3WQdHuY68Wla98lS8kMcr5ZfSBF8bEJ3mMHWcy86HrA+Lt+dGhlccxesrdqJ3ebM/xaGu7H
 fY3N0WcX3TeiyeIlc0lP76NhkhvmjVlH29rV5jRXzmdHi6s/SMGgAEnOPYMH5rEH57l04o8K+Ra
 +Pw4ylZH5Ru4lHnIkCI6gU8aH53SSTgiIHfVp45VbvVG72KilMlOQ8pkDR61lODoKV7+/b1JvD3
 azwlN2o4FWte7J9Rmau88tPgXvpAhWGVeb6me7k8Ve5wiBcTNf2QgHk8KeIIbEGqYgau6y4Cw0a
 S3TWGtUpEiEDA6NpLvMx5mg3Qy/BT0PwVal97bSBR0kIin8YWkfvSUQ2fQYpBDWZ30laULS3RFc
 5EFfLd2zZ+qzyjD33nufxKPUjsWMGpEjwCpFt+yxUxdfZIOmmOpg=
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
 lib/unigraf/unigraf.c | 111 ++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/unigraf/unigraf.h |  12 ++++++
 2 files changed, 123 insertions(+)

diff --git a/lib/unigraf/unigraf.c b/lib/unigraf/unigraf.c
index f148d4fc099f..56a1fbe71827 100644
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
@@ -309,6 +328,8 @@ void unigraf_require_device(int drm_fd)
 void unigraf_reset(void)
 {
 	unigraf_plug();
+	unigraf_set_mst_stream_count(1);
+	unigraf_set_sst();
 }
 
 /**
@@ -371,3 +392,93 @@ void unigraf_plug(void)
 
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

