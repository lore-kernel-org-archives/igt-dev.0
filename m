Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43799C44508
	for <igt-dev@archiver.kernel.org>; Wed, 21 Jan 2026 17:49:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E6A10E0AE;
	Wed, 21 Jan 2026 17:49:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="oF2nNs4R";
	dkim-atps=neutral
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8A4510E1FC
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 17:49:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 6D53C1A29B4
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Jan 2026 17:49:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4397A6070A;
 Wed, 21 Jan 2026 17:49:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 40D75119B191A; Wed, 21 Jan 2026 18:49:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1769017791; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=J6m8hgljKbgRc+UNHuWsHQXY8TEUpTnB8nBOrWMd19Y=;
 b=oF2nNs4RiNfxYE9aAa68cLoDbdpvw0x+WjK/zJW778wasfKJXCsNd0pEjOqIUuQX2j82rH
 VuVaVrtfMKafR+yHj5S9NjDyKkDy7WZJpNghwdI0XyvjA5Z0LEdr8Do98dhh3qGcHUoTjv
 uxPm8o7oJ/lB1k9AiMZb9acJ6XV0dEoxtxdxMA/NJOmdg3CvnCc6Hl50ckRHIi/vp5Iv9w
 P9jO1DQSTNsrr1+X6xOfQ4s/9Fi628mYkcoEWoSc/x0lRbcHkfY/+USQ9NAhBHpyMOO2F0
 Xob9OJbnXRLScnsmrgTYwv9aFXk33OOT9jk5VIuiFtDwc7kU4K3gWLHVTohCeA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 21 Jan 2026 18:49:50 +0100
Message-Id: <DFUGGY0CG33Q.828539M5UNFK@bootlin.com>
Subject: Re: [PATCH i-g-t v4 17/46] lib/unigraf: Add used defines for TSI_Types
Cc: <thomas.petazzoni@bootlin.com>, <markyacoub@google.com>,
 <khaled.almahallawy@intel.com>, "igt-dev"
 <igt-dev-bounces@lists.freedesktop.org>
To: "Louis Chauvet" <louis.chauvet@bootlin.com>,
 <igt-dev@lists.freedesktop.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251110-unigraf-integration-v4-0-0fc7bb1b4101@bootlin.com>
 <20251110-unigraf-integration-v4-17-0fc7bb1b4101@bootlin.com>
In-Reply-To: <20251110-unigraf-integration-v4-17-0fc7bb1b4101@bootlin.com>
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

Hi Louis,

On Mon Nov 10, 2025 at 2:39 PM CET, Louis Chauvet wrote:
> Current unigraf public release are not c-compatible, this file hardcode
> some values. One future release of libTSI may include a c-compatible
> TSI_types.h file with full structure definition, but until then.
>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  lib/unigraf/TSI_types.h | 117 ++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 117 insertions(+)
>
> diff --git a/lib/unigraf/TSI_types.h b/lib/unigraf/TSI_types.h
> new file mode 100644
> index 000000000000..f854c500a82c
> --- /dev/null
> +++ b/lib/unigraf/TSI_types.h
> @@ -0,0 +1,117 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +// DO NOT MERGE THIS FILE

What do you mean? Shoudl this patch be applied or not? Maybe it's a
leftover from the RFC v1?

> +//
> +// Current unigraf public release are not c-compatible, this file hardco=
de some values

Add a '.' at end of sentence.

> +// The next release of libTSI should include a c-compatible TSI_types.h =
file, that will
> +// be directly used in place of this file

Here too.

> +
> +#include <stdbool.h>
> +#include <stdint.h>
> +#ifndef TSI_REG_H

If I got what you mena here, this should be before the includes, and should
be followed by a #define TSI_REG_H.

> +
> +#define TSI_VERSION_TEXT			0x80000001
> +#define TSI_DEVCAP_VIDEO_CAPTURE		0x00000001
> +#define TSI_SEARCHOPTIONS_SHOW_DEVICES_IN_USE	0x00000001
> +
> +#define TSI_EDID_TE_INPUT			0x1100
> +#define TSI_EDID_SELECT_STREAM			0x1102
> +
> +#define TSI_BASE_LEGACY_GENERIC(offset)		(0x210 + (offset))
> +#define	TSI_FORCE_HOT_PLUG_STATE_W		TSI_BASE_LEGACY_GENERIC(0x2)
           ^
Tab instead of space

> +
> +#define TSI_BASE_LEGACY_DPRX_MSA(offset)		(0x260 + (offset))
> +#define	TSI_DPRX_MSA_COMMAND_W				TSI_BASE_LEGACY_DPRX_MSA(0x0)
           ^
Tab instead of space


> +#define TSI_DPRX_MSA_STREAM_COUNT_R			TSI_BASE_LEGACY_DPRX_MSA(0x1)
> +#define TSI_DPRX_MSA_STREAM_SELECT			TSI_BASE_LEGACY_DPRX_MSA(0x3)
> +#define TSI_DPRX_MSA_HTOTAL_R				TSI_BASE_LEGACY_DPRX_MSA(0x6)
> +#define TSI_DPRX_MSA_VTOTAL_R				TSI_BASE_LEGACY_DPRX_MSA(0x7)
> +#define TSI_DPRX_MSA_HACTIVE_R				TSI_BASE_LEGACY_DPRX_MSA(0x8)
> +#define TSI_DPRX_MSA_VACTIVE_R				TSI_BASE_LEGACY_DPRX_MSA(0x9)
> +#define TSI_DPRX_MSA_HSYNC_WIDTH_R			TSI_BASE_LEGACY_DPRX_MSA(0xa)
> +#define TSI_DPRX_MSA_VSYNC_WIDTH_R			TSI_BASE_LEGACY_DPRX_MSA(0xb)
> +#define TSI_DPRX_MSA_HSTART_R				TSI_BASE_LEGACY_DPRX_MSA(0xc)
> +#define TSI_DPRX_MSA_VSTART_R				TSI_BASE_LEGACY_DPRX_MSA(0xd)
> +
> +#define TSI_DPRX_LINK_FLAGS_MST				0x01
> +#define TSI_DPRX_LINK_FLAGS_TPS3			0x02
> +#define TSI_DPRX_LINK_FLAGS_TPS4			0x03
> +#define TSI_DPRX_LINK_FLAGS_EDP				0x04
> +#define TSI_DPRX_NOT_DOCUMENTED_DP_128_132_SUPPORTED	0x10
> +#define TSI_DPRX_NOT_DOCUMENTED_SIDEBAND_MSG_SUPPORT	0x20
> +
> +#define TSI_BASE_DPRX(offset)			(0x50000000u + 0x21000 + (offset))
> +#define TSI_DPRX_HW_CAPS_R			TSI_BASE_DPRX(0x4)
> +
> +/**
> + * struct TSI_DPRX_HW_CAPS_R_s - Structure representing the hardware cap=
abilities of the DP RX.
> + *
> + * This structure defines the bitfields and fields that describe the har=
dware
> + * capabilities of the DP RX (DisplayPort Receiver) interface. Each fiel=
d
> + * corresponds to a specific capability or feature supported by the hard=
ware.
> + *
> + * This structure is used to interpret the value read from the
> + * TSI_DPRX_HW_CAPS_R register.
> + *
> + * @mst: MST support
> + * @hdcp_1_x: HDCP 1.x support.
> + * @hdcp_2_x: HDCP 2.x support.
> + * @fec_8_10_b: FEC for 8/10 link support.
> + * @dsc_8_10_b: DSC for 8/10 link support.
> + * @three_lanes: Three lane link configuration support.
> + * @edp_link_rate: eDP link rate support.

I thought this was a rate (an amount of bits per time unit or so) but it's
a bool, so perhaps it means "eDP link rates are supported" or similar I
guess. Can you clarify?

If my guess is right, this could be renamed edp_link_rates_supported for
clarity.

> + * @mst_stream_count: Number of MST streams supported.
> + * @max_link_rate: Maximum link rate supported.

And I guess it is an amount (it's not a bool), so what's the unit?

> + * @force_link_config: Forced link configuration support.
> + * @power_provision: Power provision support on DP_PWR pin of receptacle=
 connector.
> + * @aux_swing_voltage_control: AUX output voltage swing control support.
> + * @custom_dp_rate: Custom DP 2.0 rate support.
> + * @custom_bit_rate: Custom bit rate support.
> + * @fec_128_132_b: FEC for 128/132 link support.
> + * @dsc_128_132_b: DSC for 128/132 link support.
> + */
> +struct TSI_DPRX_HW_CAPS_R_s {
> +	bool mst:1;
> +	bool hdcp_1_x:1;
> +	bool hdcp_2_x:1;
> +	bool fec_8_10_b:1;
> +	bool dsc_8_10_b:1;
> +	bool reserved_1:1;
> +	bool three_lanes:1;
> +	bool edp_link_rate:1;

Sure the rate is bool? BTW knowing the unit would help finding the
answer. :)

> +	uint8_t mst_stream_count:3;
> +	uint8_t reserved_2:5;
> +	uint8_t max_link_rate;
> +	bool force_link_config:1;
> +	bool reserved_3:1;
> +	bool power_provision:1;
> +	bool aux_swing_voltage_control:1;
> +	bool custom_dp_rate:1;
> +	bool custom_bit_rate:1;
> +	bool fec_128_132_b:1;
> +	bool dsc_128_132_b:1;
> +};
> +
> +#define TSI_DPRX_LT_LANE_COUNT_R		TSI_BASE_DPRX(0x0B)
> +#define TSI_DPRX_LT_RATE_R			TSI_BASE_DPRX(0x0C)
> +#define TSI_DPRX_HPD_FORCE			TSI_BASE_DPRX(0x12)
> +#define TSI_DPRX_MST_SINK_COUNT			TSI_BASE_DPRX(0x9D)
> +
> +#define TSI_BASE_DP_RX(offset)                  (0x00010100 + (offset))
> +#define TSI_DP_RX_DUT_MAX_LANE_COUNT		TSI_BASE_DP_RX(0xf)
> +
> +#define TSI_BASE_DP_LTT(offset)                 (0x00010700 + (offset))
> +#define TSI_DP_LTT_MAX_LANE_COUNT		TSI_BASE_DP_LTT(0x01)
> +
> +#define TSI_BASE_LEGACY_DPRX(offset)		(0x2b0 + (offset))
> +#define TSI_DPRX_DPCD_BASE_W			TSI_BASE_LEGACY_DPRX(0x9)
> +#define TSI_DPRX_DPCD_DATA			TSI_BASE_LEGACY_DPRX(0xA)
> +#define TSI_DPRX_MAX_LANES			TSI_BASE_LEGACY_DPRX(0x10)
> +#define TSI_DPRX_MAX_LINK_RATE			TSI_BASE_LEGACY_DPRX(0x11)
> +#define TSI_DPRX_LINK_FLAGS			TSI_BASE_LEGACY_DPRX(0x12)
> +#define TSI_DPRX_STREAM_SELECT			TSI_BASE_LEGACY_DPRX(0x13)
> +#define TSI_DPRX_CRC_R_R			TSI_BASE_LEGACY_DPRX(0x14)
> +#define TSI_DPRX_CRC_G_R			TSI_BASE_LEGACY_DPRX(0x15)
> +#define TSI_DPRX_CRC_B_R			TSI_BASE_LEGACY_DPRX(0x16)
> +#define TSI_DPRX_HPD_PULSE_W			TSI_BASE_LEGACY_DPRX(0x1B)
> +#endif

A comment would be nice:

  #endif /* TSI_REG_H */

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
