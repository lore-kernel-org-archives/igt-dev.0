Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D223CA0FE9
	for <igt-dev@archiver.kernel.org>; Sat, 23 Aug 2025 02:17:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8723010E1A0;
	Sat, 23 Aug 2025 02:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="H+QxlQyC";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E7C10E1C7
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:17:18 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id BBC091A0D88
 for <igt-dev@lists.freedesktop.org>; Sat, 23 Aug 2025 02:11:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 95817606A7;
 Sat, 23 Aug 2025 02:11:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 060A81C22D3E4; 
 Sat, 23 Aug 2025 04:11:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1755915107; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=oBqYkVLwqwaTm1L2TnlpPeDUo3vlzon04MGekhoopjI=;
 b=H+QxlQyC4bdH1LOWb60ztX5Lp9epGwO4UN77qXPlh+9UE3znWo6Df69LOj/j3H+o2zPJp8
 tnVgh/m3xbQbbHP6Zz+ss+sHdTjHHdnCUPEBSSDOq1kF1wiO/PXSinu+R05+C+BcHQDtSM
 Zc8QvXHFVmqS/MUc22XDFxJo4MPh5BOoHAF9QMboa50apA1DjJY/GwFCIriijZcdBKywU4
 yPiqlPS3c7GLADVB6CE7PsL0TzbSsLXLTpM0iIWns671/iFy0Lb+11z1joUiRui4UhM7JK
 aX6tI5emzDC3CJI/hYPfPSdCtQaPQBwQP0ROHHLiDzs3tdDz+IM2LB7MLcbAzA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Sat, 23 Aug 2025 04:11:30 +0200
Subject: [PATCH DO NOT MERGE i-g-t v3 10/29] lib/unigraf: Add used defines
 for TSI_Types
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-unigraf-integration-v3-10-cdc36d5fab4c@bootlin.com>
References: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
In-Reply-To: <20250823-unigraf-integration-v3-0-cdc36d5fab4c@bootlin.com>
To: igt-dev@lists.freedesktop.org
Cc: thomas.petazzoni@bootlin.com, markyacoub@google.com, 
 khaled.almahallawy@intel.com, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2678;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=rh6kWOcNGyvdvbxfl3TRXrQ8W6gcF9fXpYow5CxcI4c=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoqSNUG4SaqsSCEbw2+WBMyLqwPI3VZ/U2XfjjX
 f3kQbHIy3CJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaKkjVAAKCRAgrS7GWxAs
 4hIaD/4/ZgFN3BZA4IpbVwA6bwNwVdaOV4gi7p678mCYH2kTw9ilwzORjnBNoU7cQG92ftG/Gjo
 sjdR5rfvd7CcWfSJnVvKZ5fQYI2u1j7N2rfhkZHBK3Z5UtKfz6o/GzJ2SGK9lMRLjsSty8rCnZ1
 fkOyXS/z6HfDUqYSZ1Bog8USPNHYn85pq6Wer4jpvmDMV2irqgkSJs957hvIMUQYL955thLgfX+
 PlO6GhKIG4IEgNN8IcZOXRB4Ou/sxYqdodGkDzc9E3UTgengJWyDRnG4/orNEP50EkrFG0FI8Q6
 UGx4s2JgIdQ7qgNtnK9zol/M9u3lpJraEjGRrF60lcRVO1lPMtYfOhivpHPzXSO3UdmJIHe0JWt
 gXlMdZw+fnnuXRjdQzo7EtivxwSuTWTPxG7vqMxGiC8uQrxCjZT5xVkDSkh6cO/j3bw9DjvynWy
 A+BZQlbtsVd4NSrko0u1Ccw+qvowDv4TTyy2JvXuj/qyhy/EfLhvfmw3Zlha2IQ/+EdPOlgetWA
 HaJmMXo35rGikulkeQJszmvixkZI80fE710TRzBb+Y/Ijx/by6T2a43tyQNV9aOK767ilSYhF6j
 /uX3dL0TvEdtOLToVib1vyhR7WKTCw2fnUk0vPLPYzHJRypixhwjIMVBoI7ElhhrzGizHbmxYsu
 PdYOepMRNNb1njQ==
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
some values. The next release of libTSI should include a c-compatible
TSI_types.h file, that will be directly used in place of this file.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 lib/unigraf/TSI_types.h | 50 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/lib/unigraf/TSI_types.h b/lib/unigraf/TSI_types.h
new file mode 100644
index 0000000000000000000000000000000000000000..aea21444ca03f054387f59d4a626d01a84c6946b
--- /dev/null
+++ b/lib/unigraf/TSI_types.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: MIT */
+
+// DO NOT MERGE THIS FILE
+//
+// Current unigraf public release are not c-compatible, this file hardcode some values
+// The next release of libTSI should include a c-compatible TSI_types.h file, that will
+// be directly used in place of this file
+
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
+#define TSI_BASE_HDRX(offset)			(0x50000000u + 0x23000 + (offset))
+#define TSI_HDRX_HPD_CONTROL_W			TSI_BASE_HDRX(0x02)
+
+#define TSI_DPRX_LINK_FLAGS_MST			0x01
+#define TSI_DPRX_LINK_FLAGS_TPS3		0x02
+#define TSI_DPRX_LINK_FLAGS_TPS4		0x03
+#define TSI_DPRX_LINK_FLAGS_EDP			0x04
+#define TSI_DPRX_NOT_DOCUMENTED_SIDEBAND_MSG_SUPPORT	0x20
+
+#define TSI_BASE_DPRX(offset)			(0x50000000u + 0x21000 + (offset))
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
+#define TSI_DPRX_LINK_FLAGS			TSI_BASE_LEGACY_DPRX(0x12)
+#define TSI_DPRX_STREAM_SELECT			TSI_BASE_LEGACY_DPRX(0x13)
+#define TSI_DPRX_CRC_R_R			TSI_BASE_LEGACY_DPRX(0x14)
+#define TSI_DPRX_CRC_G_R			TSI_BASE_LEGACY_DPRX(0x15)
+#define TSI_DPRX_CRC_B_R			TSI_BASE_LEGACY_DPRX(0x16)
+#define TSI_DPRX_HPD_PULSE_W			TSI_BASE_LEGACY_DPRX(0x1B)
+
+#endif

-- 
2.50.1

