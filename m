Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7A7F53D6F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 16:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7611B10E292;
	Mon, 16 Mar 2026 16:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="1DM9hziP";
	dkim-atps=neutral
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A42F10E2A4
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 16:23:27 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 137BC4E42609;
 Mon, 16 Mar 2026 16:23:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DED535FC4A;
 Mon, 16 Mar 2026 16:23:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D57FD10372219; Mon, 16 Mar 2026 17:23:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1773678205; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=505SuVCPuBljd/6y93uw0wy79oxxtCj2tugWie5CPsw=;
 b=1DM9hziPzp1ABflqYMgGcc1bWYPA1rCec7aowfM9RlT9G6dfb0GqzS6KXfOJS3Df7YYoaD
 0E6d2exv9NviydGcfX5l6JQhEjaj7cKc6497oOzK631bjcqJJCIeTPRoKOgrwnoSaaZ9qt
 nfbN0y8ZiDIOqIhCtx45OI7tzDcIdNgAeqvQMjtLM/8sdNQ/L7o/L9AJZr2DG2OHditOHc
 H686zrxk+MTBI36vtFoe+nBaBchtwDm/KxIBLg/lSAO8Cum0KPmJ7kXQTIc8Dutd5RlQkp
 6JI89goMT66x1TWbUmkg92h6T+MrO/TGorVgpqSvjeqDY7AyME1HN1Uzw1EN3g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 16 Mar 2026 17:17:39 +0100
Subject: [PATCH i-g-t v9 18/49] lib/unigraf: Add used defines for TSI_Types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260316-unigraf-integration-v9-18-a01dffc3b0cb@bootlin.com>
References: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
In-Reply-To: <20260316-unigraf-integration-v9-0-a01dffc3b0cb@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, luca.ceresoli@bootlin.com, 
 kory.maincent@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6064;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=VC7Ced49IL4MEUBoMhflsmtRt/nXemq9wc/IY7PJFFA=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpuC6LQYCQq7o4tLvvXB+RzHzf3x3I7JZvwayDN
 sip390Bq62JAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCabguixsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJk0xAA1bwXBOCziaN912Bd3phAfJXS6s+ui+n
 FAxtWtytQy9AsdTUjh80AyZXrsHLWfMV7fplM61HfV8Z1IN8Vw5lD2TzWGpNJ1SmUkbQqtVXOOu
 h5Eh8eRV0Lr9o5bwByOIxlNa6WtCcCRmbctb33LetRmDV5VRh1VB6i+ypTt11f26tiUOGZo3ixV
 6BOb+lqZYvar4ueeaE8BBHs2N3R74PdswwFeRhM9j71sNx5od0S78Y0mW5fZkrkj2EoFslHP3YG
 Qv6c0DvJqu3ODiOTdXVXGoTSUw2w7ghGcLPHcx3SyiO+CK4ZBIsBI6aQn01yIJBxWo9Ta9ddndx
 O9dsT8HJfAz8r5eWWHp+k0DUP7XVClD90ELpsPsW0aaJa1IxzxtWE7AvAYWQrqVSmEbL8Ah2snK
 LtOlurk5jMFvUQlxfTE0ebvX0ipd4B/01on4ZEy8mB2vC3IxFcmaEjRBdCOMxbxTc67+d4fKMJv
 VCSX1BVq3UUgsAhPJNgTO0UfMRYsZkwB8DLRoUffycYVwfGnyj6/7Yv0GtoiEUnCU62osTTTXel
 zoTZEvhX+TM1plBnpcSuWB/pIgnTcpH4SsKxlABuHyLwdZVX3ncH3t8cNJO+hiNjCVqEItJOTIx
 T5gguPp8wTxBaI5qP4gtXIhkXtLe0km5h35z2l6pw6UHnfgn2YJ8=
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

Current unigraf public release are not c-compatible, this file hardcode
some values. One future release of libTSI may include a c-compatible
TSI_types.h file with full structure definition, but until then.

Reviewed-by: Kory Maincent <kory.maincent@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/TSI_types.h | 126 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/lib/unigraf/TSI_types.h b/lib/unigraf/TSI_types.h
new file mode 100644
index 000000000000..c387ab4e1941
--- /dev/null
+++ b/lib/unigraf/TSI_types.h
@@ -0,0 +1,126 @@
+/* SPDX-License-Identifier: MIT */
+
+// Current unigraf public release are not c-compatible, this file hardcode some values.
+// The next release of libTSI should include a c-compatible TSI_types.h file, that will
+// be directly used in place of this file.
+
+#ifndef TSI_REG_H
+
+#include <stdbool.h>
+#include <stdint.h>
+
+#define TSI_VERSION_TEXT			0x80000001
+#define TSI_DEVCAP_VIDEO_CAPTURE		0x00000001
+#define TSI_SEARCHOPTIONS_SHOW_DEVICES_IN_USE	0x00000001
+
+#define TSI_EDID_TE_INPUT			0x1100
+#define TSI_EDID_SELECT_STREAM			0x1102
+
+#define TSI_BASE_LEGACY_GENERIC(offset)		(0x210 + (offset))
+#define	TSI_FORCE_HOT_PLUG_STATE_W		TSI_BASE_LEGACY_GENERIC(0x2)
+
+#define TSI_BASE_LEGACY_DPRX_MSA(offset)		(0x260 + (offset))
+#define TSI_DPRX_MSA_COMMAND_W				TSI_BASE_LEGACY_DPRX_MSA(0x0)
+#define TSI_DPRX_MSA_STREAM_COUNT_R			TSI_BASE_LEGACY_DPRX_MSA(0x1)
+#define TSI_DPRX_MSA_STREAM_SELECT			TSI_BASE_LEGACY_DPRX_MSA(0x3)
+#define TSI_DPRX_MSA_HTOTAL_R				TSI_BASE_LEGACY_DPRX_MSA(0x6)
+#define TSI_DPRX_MSA_VTOTAL_R				TSI_BASE_LEGACY_DPRX_MSA(0x7)
+#define TSI_DPRX_MSA_HACTIVE_R				TSI_BASE_LEGACY_DPRX_MSA(0x8)
+#define TSI_DPRX_MSA_VACTIVE_R				TSI_BASE_LEGACY_DPRX_MSA(0x9)
+#define TSI_DPRX_MSA_HSYNC_WIDTH_R			TSI_BASE_LEGACY_DPRX_MSA(0xa)
+#define TSI_DPRX_MSA_VSYNC_WIDTH_R			TSI_BASE_LEGACY_DPRX_MSA(0xb)
+#define TSI_DPRX_MSA_HSTART_R				TSI_BASE_LEGACY_DPRX_MSA(0xc)
+#define TSI_DPRX_MSA_VSTART_R				TSI_BASE_LEGACY_DPRX_MSA(0xd)
+
+#define TSI_DPRX_LINK_FLAGS_MST				0x01
+#define TSI_DPRX_LINK_FLAGS_TPS3			0x02
+#define TSI_DPRX_LINK_FLAGS_TPS4			0x03
+#define TSI_DPRX_LINK_FLAGS_EDP				0x04
+#define TSI_DPRX_NOT_DOCUMENTED_DP_128_132_SUPPORTED	0x10
+#define TSI_DPRX_NOT_DOCUMENTED_SIDEBAND_MSG_SUPPORT	0x20
+
+#define TSI_BASE_DPRX(offset)			(0x50000000u + 0x21000 + (offset))
+#define TSI_DPRX_HW_CAPS_R			TSI_BASE_DPRX(0x4)
+
+/**
+ * struct TSI_DPRX_HW_CAPS_R_s - Structure representing the hardware capabilities of the DP RX.
+ *
+ * This structure defines the bitfields and fields that describe the hardware
+ * capabilities of the DP RX (DisplayPort Receiver) interface. Each field
+ * corresponds to a specific capability or feature supported by the hardware.
+ *
+ * This structure is used to interpret the value read from the
+ * TSI_DPRX_HW_CAPS_R register.
+ *
+ * @mst: MST support
+ * @hdcp_1_x: HDCP 1.x support.
+ * @hdcp_2_x: HDCP 2.x support.
+ * @fec_8_10_b: FEC for 8/10 link support.
+ * @dsc_8_10_b: DSC for 8/10 link support.
+ * @three_lanes: Three lane link configuration support.
+ * @edp_link_rate: eDP link rates are supported.
+ * @mst_stream_count: Number of MST streams supported.
+ * @max_link_rate: Maximum link rate supported. The unit is not specified in documentation,
+ *                 it is probably like other config rate = 0.27GHz * value
+ * @force_link_config: Forced link configuration support.
+ * @power_provision: Power provision support on DP_PWR pin of receptacle connector.
+ * @aux_swing_voltage_control: AUX output voltage swing control support.
+ * @custom_dp_rate: Custom DP 2.0 rate support.
+ * @custom_bit_rate: Custom bit rate support.
+ * @fec_128_132_b: FEC for 128/132 link support.
+ * @dsc_128_132_b: DSC for 128/132 link support.
+ */
+struct TSI_DPRX_HW_CAPS_R_s {
+	bool mst:1;
+	bool hdcp_1_x:1;
+	bool hdcp_2_x:1;
+	bool fec_8_10_b:1;
+	bool dsc_8_10_b:1;
+	bool reserved_1:1;
+	bool three_lanes:1;
+	bool edp_link_rates_supported:1;
+	uint8_t mst_stream_count:3;
+	uint8_t reserved_2:5;
+	uint8_t max_link_rate;
+	bool force_link_config:1;
+	bool reserved_3:1;
+	bool power_provision:1;
+	bool aux_swing_voltage_control:1;
+	bool custom_dp_rate:1;
+	bool custom_bit_rate:1;
+	bool fec_128_132_b:1;
+	bool dsc_128_132_b:1;
+};
+
+#define TSI_DPRX_LT_LANE_COUNT_R		TSI_BASE_DPRX(0x0B)
+#define TSI_DPRX_LT_RATE_R			TSI_BASE_DPRX(0x0C)
+#define TSI_DPRX_HPD_FORCE			TSI_BASE_DPRX(0x12)
+#define TSI_DPRX_MST_SINK_COUNT			TSI_BASE_DPRX(0x9D)
+
+#define TSI_BASE_DP_RX(offset)                  (0x00010100 + (offset))
+#define TSI_DP_RX_DUT_MAX_LANE_COUNT		TSI_BASE_DP_RX(0xf)
+
+#define TSI_BASE_DP_LTT(offset)                 (0x00010700 + (offset))
+#define TSI_DP_LTT_MAX_LANE_COUNT		TSI_BASE_DP_LTT(0x01)
+
+#define TSI_BASE_LEGACY_DPRX(offset)		(0x2b0 + (offset))
+#define TSI_DPRX_DPCD_BASE_W			TSI_BASE_LEGACY_DPRX(0x9)
+#define TSI_DPRX_DPCD_DATA			TSI_BASE_LEGACY_DPRX(0xA)
+#define TSI_DPRX_MAX_LANES			TSI_BASE_LEGACY_DPRX(0x10)
+#define TSI_DPRX_MAX_LINK_RATE			TSI_BASE_LEGACY_DPRX(0x11)
+#define TSI_DPRX_LINK_FLAGS			TSI_BASE_LEGACY_DPRX(0x12)
+#define TSI_DPRX_STREAM_SELECT			TSI_BASE_LEGACY_DPRX(0x13)
+#define TSI_DPRX_CRC_R_R			TSI_BASE_LEGACY_DPRX(0x14)
+#define TSI_DPRX_CRC_G_R			TSI_BASE_LEGACY_DPRX(0x15)
+#define TSI_DPRX_CRC_B_R			TSI_BASE_LEGACY_DPRX(0x16)
+#define TSI_DPRX_HPD_PULSE_W			TSI_BASE_LEGACY_DPRX(0x1B)
+
+#define H2_SINK_LOAD_PROD_KEYS                         0x002
+#define H2_SINK_UNLOAD_KEYS                            0x003
+#define H2_SINK_SET_CAPABLE                            0x004
+#define H2_SINK_CLEAR_CAPABLE                          0x005
+
+#define TSI_BASE_LEGACY_HDCP2(offset)                  (0x290 + (offset))
+#define TSI_HDCP_2X_COMMAND_W                          TSI_BASE_LEGACY_HDCP2(0x1)
+
+#endif /* TSI_REG_H */

-- 
2.52.0

