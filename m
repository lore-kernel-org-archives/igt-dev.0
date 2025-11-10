Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F85CD13D9
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 13:39:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4487B10E3C0;
	Mon, 10 Nov 2025 13:39:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="E+Z471Uw";
	dkim-atps=neutral
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C50110E3BB
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:50 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 95538C108F0
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 13:39:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0FCA1606F5;
 Mon, 10 Nov 2025 13:39:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3B0351037190C; Mon, 10 Nov 2025 14:39:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1762781988; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=5islGi5rsG1RJG4FE+M8HSk9Rjp2j2jYyrifaONk4xY=;
 b=E+Z471Uwe2fvG2xrR8rBxKJY1ObS4Q/74liQsQjlETYfhVZkgfFDJnk29q1qooXraiQ9NE
 R7OIRRkVKXuaoiqTl1yYI7I21+NIeQWMopnfo9lJCZVhZz0qAsPhjuLfHjby0ICfFbLC2H
 2PGqb1nM9XfAp1RmJCgWnrPESqqiiJk/+jhuZqqDvX7eY/XmkThIjNEyaUHyWYupqAQdop
 xryff0Z9thWejc6943nt/b5zK9Ira+ZX7ndwxL+AjxA7UPxDZ6udIFnjwvrs/AQxsqHknh
 j4TXU97kaSjfrOZsUQWoIiVKCMYFlPf0hBr8CXyhklUG652+Wr4YtygHPuk6Dg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 10 Nov 2025 13:39:19 +0000
Subject: [PATCH i-g-t v4 17/46] lib/unigraf: Add used defines for TSI_Types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-unigraf-integration-v4-17-0fc7bb1b4101@bootlin.com>
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5460;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=yfb1NwYUR6H6GWgMlBvH+AyVfPeNszUzP7T5slI7UMo=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBpEesOjr16gAZBCmiBlybTVUcsTjVGhZGwQB+ZX
 ru8bWXIYPuJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaRHrDgAKCRAgrS7GWxAs
 4qA3D/45puYtbtuWcB75JjYMMWSAzcJfFvlQqAh27ulfLnIQWRJ5+u2BU3CjDecsKalra9O2TI9
 HEPBsO8a93H2VK/6oeb8hIdSX/vrFalrt8Jq9/JR/3fxDJFPvM3FMtIIqIaiQp+lI/Kl0Dl4VOT
 bAAhm7HI9ljKwL8ftKOGD2VpXQnyTgMMcGn0sj9wEx/7uyLBPygf23DsIDHZ/eAGqf17ssXLXAt
 DeDdTLdKcuN4OsxiynrrroO0nedZkXPfhre27CKkBQY23Or2/R9FzOUcf5SQ7A6hvktd5W3TN/g
 gaNAxse+c+iAqErA006P00Zdi2LsuFBOpQs3HiBtOGDJ2NZ+MQ6YZtthFYaCtDU8Y3sSyvfJp5N
 YmILT34mAc44nZfM+m0nB2KO5VXFz/hTYvh7fCVJp1Agw0Ns0ZY/3Ug/MgRr1RL3wWcBq3dQn4c
 tZtu8xIStGm6nrkiDSKieC8e3PTvTfpOkMK78z8NR9bw1HGZhUlkMpAJF7+37ml/XVCXka1BqtN
 jxg6W2co68yKDTag8X6lB0NmZOqb7sAtn98lCF/HYdOoF821/hJJDLbrXArWzo5GC+pfzn7aCAc
 eoTZiSHWsx0Rj8Cx1V5QTw9OhfRlbeTAczFi5MuU5CE+w+gED2Jsi7nVpPicHy3kz/ucsNvBb2C
 cLKOWCJ+8rpO8Hg==
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

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/TSI_types.h | 117 ++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/lib/unigraf/TSI_types.h b/lib/unigraf/TSI_types.h
new file mode 100644
index 000000000000..f854c500a82c
--- /dev/null
+++ b/lib/unigraf/TSI_types.h
@@ -0,0 +1,117 @@
+/* SPDX-License-Identifier: MIT */
+
+// DO NOT MERGE THIS FILE
+//
+// Current unigraf public release are not c-compatible, this file hardcode some values
+// The next release of libTSI should include a c-compatible TSI_types.h file, that will
+// be directly used in place of this file
+
+#include <stdbool.h>
+#include <stdint.h>
+#ifndef TSI_REG_H
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
+#define	TSI_DPRX_MSA_COMMAND_W				TSI_BASE_LEGACY_DPRX_MSA(0x0)
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
+ * @edp_link_rate: eDP link rate support.
+ * @mst_stream_count: Number of MST streams supported.
+ * @max_link_rate: Maximum link rate supported.
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
+	bool edp_link_rate:1;
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
+#endif

-- 
2.51.0

