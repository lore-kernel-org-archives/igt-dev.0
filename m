Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FC810854D7
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 09:31:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01E9310E782;
	Wed, 18 Mar 2026 09:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jmJ+RlyE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64CD10E768
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 09:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773826276; x=1805362276;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=7VKdHLYGybElwcxYG9WHECuI8HRz40A8z2b/ENe5e4s=;
 b=jmJ+RlyEFeVO9/Yv/hr3J3ksFkaGHB1XSr1+3xQlPX+baw5QlquAWHDX
 wZ555TPuTm0ScF+914yQpVnnc8zP8LPjY/tXiGCs2iCjW1FiurjPlDSFU
 Wv+LZNq5AkDJUBRbcHRkawZAucsdWV/vioASL60Kee/wzcal+IWvjMzvq
 eJIN2NtnfyCy6EMdc1EaUiysLG1f7ZeEe7oQ/mhx3RbOYuZaAAr8HGlTe
 urcROQM8en3ie3B19Poc7qWkWvbgGqXCfbl1vtbFNW1xW2Q9uvkd2PoPf
 7vPfl6AWGoQP4ef6Oy4jk8dGc19gIJpLTyAsOnsGmzExkAg2ZfOswZBFG g==;
X-CSE-ConnectionGUID: YqONQPPNTmWCirHb1HE/pQ==
X-CSE-MsgGUID: jUFSc0wbTaimJVqMWbp+Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74056303"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="74056303"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2026 02:31:14 -0700
X-CSE-ConnectionGUID: tKy7EBJsTaKsvtya6tsHMQ==
X-CSE-MsgGUID: G/BIokqqTs2xxidIBH78Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; d="scan'208";a="221806337"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 02:31:13 -0700
Date: Wed, 18 Mar 2026 10:30:57 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Alex Hung <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org, wayne.lin@amd.com, Mark.Broadworth@amd.com
Subject: Re: [PATCH 1/3] lib/igt_hdr: Extract HDR helpers into igt_hdr library
Message-ID: <20260318093057.yj23hd3zsg6n553m@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org,
 wayne.lin@amd.com, Mark.Broadworth@amd.com
References: <20260317175136.3754576-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260317175136.3754576-1-alex.hung@amd.com>
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

Hi Alex,
On 2026-03-17 at 11:51:30 -0600, Alex Hung wrote:
> Move HDR utility functions from kms_hdr test into a reusable library
> module. This includes metadata filling, EDID parsing, and conversion
> functions.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  lib/igt_hdr.c   | 220 ++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_hdr.h   |  58 +++++++++++++
>  lib/meson.build |   1 +
>  tests/kms_hdr.c | 179 ++-------------------------------------
>  4 files changed, 287 insertions(+), 171 deletions(-)
>  create mode 100644 lib/igt_hdr.c
>  create mode 100644 lib/igt_hdr.h
> 
> diff --git a/lib/igt_hdr.c b/lib/igt_hdr.c
> new file mode 100644
> index 000000000..6368ae78b
> --- /dev/null
> +++ b/lib/igt_hdr.c
> @@ -0,0 +1,220 @@
> +/*

Add SPDX here.

> + * Copyright © 2026 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a

Remove this and below text, we use now SPDX instead.

> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + */
> +
> +#include <string.h>
> +#include <drm.h>
> +#include <drm_mode.h>
> +
> +#include "igt.h"
> +#include "igt_hdr.h"
> +#include "igt_edid.h"
> +
> +/**
> + * SECTION:igt_hdr
> + * @short_description: HDR (High Dynamic Range) helper library
> + * @title: HDR
> + * @include: igt_hdr.h
> + *
> + * This library provides helper functions for working with HDR metadata
> + * and HDR display capabilities.
> + */
> +
> +/**
> + * igt_hdr_calc_hdr_float:
> + * @val: The value to convert
> + *
> + * Converts a double to 861-G spec FP format
> + *
> + * Returns: The value converted to HDR floating point format
> + */
> +uint16_t igt_hdr_calc_hdr_float(double val)
> +{
> +	return (uint16_t)(val * 50000.0);
> +}
> +
> +/**
> + * igt_hdr_fill_output_metadata_st2084:
> + * @meta: Pointer to hdr_output_metadata structure to fill
> + *
> + * Fills HDR output metadata structure with test values for ST2084 (PQ) EOTF.
> + * Uses Rec. 2020 color primaries and typical HDR mastering display characteristics.
> + *
> + * Note: there isn't really a standard for what the metadata is supposed
> + * to do on the display side of things. The display is free to ignore it
> + * and clip the output, use it to help tonemap to the content range,
> + * or do anything they want, really.
> + */
> +void igt_hdr_fill_output_metadata_st2084(struct hdr_output_metadata *meta)
> +{
> +	memset(meta, 0, sizeof(*meta));
> +
> +	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
> +	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_SMPTE_ST2084;
> +
> +	/* Rec. 2020 */
> +	meta->hdmi_metadata_type1.display_primaries[0].x =
> +		igt_hdr_calc_hdr_float(0.708); /* Red */
> +	meta->hdmi_metadata_type1.display_primaries[0].y =
> +		igt_hdr_calc_hdr_float(0.292);
> +	meta->hdmi_metadata_type1.display_primaries[1].x =
> +		igt_hdr_calc_hdr_float(0.170); /* Green */
> +	meta->hdmi_metadata_type1.display_primaries[1].y =
> +		igt_hdr_calc_hdr_float(0.797);
> +	meta->hdmi_metadata_type1.display_primaries[2].x =
> +		igt_hdr_calc_hdr_float(0.131); /* Blue */
> +	meta->hdmi_metadata_type1.display_primaries[2].y =
> +		igt_hdr_calc_hdr_float(0.046);
> +	meta->hdmi_metadata_type1.white_point.x = igt_hdr_calc_hdr_float(0.3127);
> +	meta->hdmi_metadata_type1.white_point.y = igt_hdr_calc_hdr_float(0.3290);
> +
> +	meta->hdmi_metadata_type1.max_display_mastering_luminance =
> +		1000; /* 1000 nits */
> +	meta->hdmi_metadata_type1.min_display_mastering_luminance =
> +		500;				   /* 0.05 nits */
> +	meta->hdmi_metadata_type1.max_fall = 1000; /* 1000 nits */
> +	meta->hdmi_metadata_type1.max_cll = 500;   /* 500 nits */
> +}
> +
> +/**
> + * igt_hdr_fill_output_metadata_sdr:
> + * @meta: Pointer to hdr_output_metadata structure to fill
> + *
> + * Fills HDR output metadata structure with test values targeting SDR.
> + */
> +void igt_hdr_fill_output_metadata_sdr(struct hdr_output_metadata *meta)
> +{
> +	memset(meta, 0, sizeof(*meta));
> +
> +	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
> +	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_TRADITIONAL_GAMMA_SDR;
> +
> +	/* Rec. 709 */
> +	meta->hdmi_metadata_type1.display_primaries[0].x =
> +		igt_hdr_calc_hdr_float(0.640); /* Red */
> +	meta->hdmi_metadata_type1.display_primaries[0].y =
> +		igt_hdr_calc_hdr_float(0.330);
> +	meta->hdmi_metadata_type1.display_primaries[1].x =
> +		igt_hdr_calc_hdr_float(0.300); /* Green */
> +	meta->hdmi_metadata_type1.display_primaries[1].y =
> +		igt_hdr_calc_hdr_float(0.600);
> +	meta->hdmi_metadata_type1.display_primaries[2].x =
> +		igt_hdr_calc_hdr_float(0.150); /* Blue */
> +	meta->hdmi_metadata_type1.display_primaries[2].y =
> +		igt_hdr_calc_hdr_float(0.006);
> +	meta->hdmi_metadata_type1.white_point.x = igt_hdr_calc_hdr_float(0.3127);
> +	meta->hdmi_metadata_type1.white_point.y = igt_hdr_calc_hdr_float(0.3290);
> +
> +	meta->hdmi_metadata_type1.max_display_mastering_luminance = 0;
> +	meta->hdmi_metadata_type1.min_display_mastering_luminance = 0;
> +	meta->hdmi_metadata_type1.max_fall = 0;
> +	meta->hdmi_metadata_type1.max_cll = 0;
> +}
> +
> +/**
> + * igt_hdr_cta_block_has_hdr:
> + * @edid_ext: Pointer to CTA extension block data
> + *
> + * Checks if a CTA extension block indicates HDR support.
> + *
> + * Byte 1: 0x07 indicates Extended Tag
> + * Byte 2: 0x06 indicates HDMI Static Metadata Block
> + * Byte 3: bits 0 to 5 identify EOTF functions supported by sink
> + *         where ET_0: Traditional Gamma - SDR Luminance Range
> + *               ET_1: Traditional Gamma - HDR Luminance Range
> + *               ET_2: SMPTE ST 2084
> + *               ET_3: Hybrid Log-Gamma (HLG)
> + *               ET_4 to ET_5: Reserved for future use
> + *
> + * Returns: true if the block indicates HDR support, false otherwise
> + */
> +bool igt_hdr_cta_block_has_hdr(const char *edid_ext)
> +{
> +	if ((((edid_ext[0] & 0xe0) >> 5 == USE_EXTENDED_TAG) &&
> +	     (edid_ext[1] == HDR_STATIC_METADATA_BLOCK)) &&
> +	    ((edid_ext[2] & HDMI_EOTF_TRADITIONAL_GAMMA_HDR) ||
> +	     (edid_ext[2] & HDMI_EOTF_SMPTE_ST2084)))
> +			return true;
> +
> +	return false;
> +}
> +
> +/**
> + * igt_hdr_is_panel_hdr:
> + * @drm_fd: DRM file descriptor
> + * @connector_id: KMS connector ID
> + *
> + * Checks if a panel/display supports HDR by parsing its EDID.
> + * Looks for HDR Static Metadata Block in CTA extension.
> + *
> + * Returns: true if the panel supports HDR, false otherwise
> + */
> +bool igt_hdr_is_panel_hdr(int drm_fd, uint32_t connector_id)
> +{
> +	bool ok;
> +	int i, j, offset;
> +	uint64_t edid_blob_id;
> +	drmModePropertyBlobRes *edid_blob;
> +	const struct edid_ext *edid_ext;
> +	const struct edid *edid;
> +	const struct edid_cea *edid_cea;
> +	const char *cea_data;
> +	bool ret = false;
> +
> +	ok = kmstest_get_property(drm_fd, connector_id,
> +			DRM_MODE_OBJECT_CONNECTOR, "EDID",
> +			NULL, &edid_blob_id, NULL);
> +
> +	if (!ok || !edid_blob_id)
> +		return ret;
> +
> +	edid_blob = drmModeGetPropertyBlob(drm_fd, edid_blob_id);
> +	igt_assert(edid_blob);
> +
> +	edid = (const struct edid *) edid_blob->data;
> +	igt_assert(edid);
> +
> +	drmModeFreePropertyBlob(edid_blob);
> +
> +	for (i = 0; i < edid->extensions_len; i++) {
> +		edid_ext = &edid->extensions[i];
> +		edid_cea = &edid_ext->data.cea;
> +
> +		/* HDR not defined in CTA Extension Version < 3. */
> +		if ((edid_ext->tag != EDID_EXT_CEA) ||
> +		    (edid_cea->revision != CTA_EXTENSION_VERSION))
> +				continue;
> +		else {
> +			offset = edid_cea->dtd_start;
> +			cea_data = edid_cea->data;
> +
> +			for (j = 0; j < offset; j += (cea_data[j] & 0x1f) + 1) {
> +				ret = igt_hdr_cta_block_has_hdr(cea_data + j);
> +
> +				if (ret)
> +					break;
> +			}
> +		}
> +	}
> +
> +	return ret;
> +}
> diff --git a/lib/igt_hdr.h b/lib/igt_hdr.h
> new file mode 100644
> index 000000000..a6faef443
> --- /dev/null
> +++ b/lib/igt_hdr.h
> @@ -0,0 +1,58 @@
> +/*

Same here, add SPDX.

> + * Copyright © 2026 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a

Same here, remove it.

> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the next
> + * paragraph) shall be included in all copies or substantial portions of the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
> + * IN THE SOFTWARE.
> + */
> +
> +#ifndef IGT_HDR_H
> +#define IGT_HDR_H
> +
> +#include "config.h"

Why this header here?

> +
> +#include <stdbool.h>
> +#include <stdint.h>
> +#include <linux/types.h>
> +
> +struct hdr_output_metadata;
> +struct igt_fb;
> +
> +/* HDR EDID parsing. */
> +#define CTA_EXTENSION_VERSION		0x03
> +#define HDR_STATIC_METADATA_BLOCK       0x06
> +#define USE_EXTENDED_TAG		0x07
> +
> +/* DRM HDR definitions. Not in the UAPI header, unfortunately. */
> +enum hdmi_metadata_type {
> +	HDMI_STATIC_METADATA_TYPE1 = 0,
> +};
> +
> +enum hdmi_eotf {
> +	HDMI_EOTF_TRADITIONAL_GAMMA_SDR,
> +	HDMI_EOTF_TRADITIONAL_GAMMA_HDR,
> +	HDMI_EOTF_SMPTE_ST2084,
> +};
> +
> +uint16_t igt_hdr_calc_hdr_float(double val);
> +void igt_hdr_fill_output_metadata_st2084(struct hdr_output_metadata *meta);
> +void igt_hdr_fill_output_metadata_sdr(struct hdr_output_metadata *meta);
> +bool igt_hdr_cta_block_has_hdr(const char *edid_ext);
> +bool igt_hdr_is_panel_hdr(int drm_fd, uint32_t connector_id);
> +
> +#endif /* IGT_HDR_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index cd03e8f63..71ca60e66 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -114,6 +114,7 @@ lib_sources = [
>  	'igt_psr.c',
>  	'igt_amd.c',
>  	'igt_edid.c',
> +	'igt_hdr.c',

Sort alphabetically, so after igt_eld.c

I know that it is already not sorted but lets try to cleanup it.

Regards,
Kamil

>  	'igt_eld.c',
>  	'igt_infoframe.c',
>  	'igt_color.c',
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index f30902b72..382fcd823 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -33,6 +33,7 @@
>  #include <termios.h>
>  #include <unistd.h>
>  #include "igt_edid.h"
> +#include "igt_hdr.h"
>  
>  /**
>   * SUBTEST: bpc-switch
> @@ -70,24 +71,8 @@
>  
>  IGT_TEST_DESCRIPTION("Test HDR metadata interfaces and bpc switch");
>  
> -/* HDR EDID parsing. */
> -#define CTA_EXTENSION_VERSION		0x03
> -#define HDR_STATIC_METADATA_BLOCK       0x06
> -#define USE_EXTENDED_TAG		0x07
> -
>  #define BACKLIGHT_PATH "/sys/class/backlight"
>  
> -/* DRM HDR definitions. Not in the UAPI header, unfortunately. */
> -enum hdmi_metadata_type {
> -	HDMI_STATIC_METADATA_TYPE1 = 0,
> -};
> -
> -enum hdmi_eotf {
> -	HDMI_EOTF_TRADITIONAL_GAMMA_SDR,
> -	HDMI_EOTF_TRADITIONAL_GAMMA_HDR,
> -	HDMI_EOTF_SMPTE_ST2084,
> -};
> -
>  /* Test flags. */
>  enum {
>  	TEST_NONE = 1 << 0,
> @@ -148,50 +133,6 @@ static void draw_hdr_pattern(igt_fb_t *fb)
>  	igt_paint_test_pattern_color_fb(fb->fd, fb, 1.0, 1.0, 1.0);
>  }
>  
> -/* Converts a double to 861-G spec FP format. */
> -static uint16_t calc_hdr_float(double val)
> -{
> -	return (uint16_t)(val * 50000.0);
> -}
> -
> -/* Fills some test values for ST2084 HDR output metadata.
> - *
> - * Note: there isn't really a standard for what the metadata is supposed
> - * to do on the display side of things. The display is free to ignore it
> - * and clip the output, use it to help tonemap to the content range,
> - * or do anything they want, really.
> - */
> -static void fill_hdr_output_metadata_st2084(struct hdr_output_metadata *meta)
> -{
> -	memset(meta, 0, sizeof(*meta));
> -
> -	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
> -	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_SMPTE_ST2084;
> -
> -	/* Rec. 2020 */
> -	meta->hdmi_metadata_type1.display_primaries[0].x =
> -		calc_hdr_float(0.708); /* Red */
> -	meta->hdmi_metadata_type1.display_primaries[0].y =
> -		calc_hdr_float(0.292);
> -	meta->hdmi_metadata_type1.display_primaries[1].x =
> -		calc_hdr_float(0.170); /* Green */
> -	meta->hdmi_metadata_type1.display_primaries[1].y =
> -		calc_hdr_float(0.797);
> -	meta->hdmi_metadata_type1.display_primaries[2].x =
> -		calc_hdr_float(0.131); /* Blue */
> -	meta->hdmi_metadata_type1.display_primaries[2].y =
> -		calc_hdr_float(0.046);
> -	meta->hdmi_metadata_type1.white_point.x = calc_hdr_float(0.3127);
> -	meta->hdmi_metadata_type1.white_point.y = calc_hdr_float(0.3290);
> -
> -	meta->hdmi_metadata_type1.max_display_mastering_luminance =
> -		1000; /* 1000 nits */
> -	meta->hdmi_metadata_type1.min_display_mastering_luminance =
> -		500;				   /* 0.05 nits */
> -	meta->hdmi_metadata_type1.max_fall = 1000; /* 1000 nits */
> -	meta->hdmi_metadata_type1.max_cll = 500;   /* 500 nits */
> -}
> -
>  /* Sets the HDR output metadata prop. */
>  static void set_hdr_output_metadata(data_t *data,
>  				    struct hdr_output_metadata const *meta)
> @@ -365,80 +306,6 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
>  	}
>  }
>  
> -static bool cta_block(const char *edid_ext)
> -{
> -	/*
> -	 * Byte 1: 0x07 indicates Extended Tag
> -	 * Byte 2: 0x06 indicates HDMI Static Metadata Block
> -	 * Byte 3: bits 0 to 5 identify EOTF functions supported by sink
> -	 *	       where ET_0: Traditional Gamma - SDR Luminance Range
> -	 *	             ET_1: Traditional Gamma - HDR Luminance Range
> -	 *	             ET_2: SMPTE ST 2084
> -	 *	             ET_3: Hybrid Log-Gamma (HLG)
> -	 *	             ET_4 to ET_5: Reserved for future use
> -	 */
> -
> -	if ((((edid_ext[0] & 0xe0) >> 5 == USE_EXTENDED_TAG) &&
> -	      (edid_ext[1] == HDR_STATIC_METADATA_BLOCK)) &&
> -	     ((edid_ext[2] & HDMI_EOTF_TRADITIONAL_GAMMA_HDR) ||
> -	      (edid_ext[2] & HDMI_EOTF_SMPTE_ST2084)))
> -			return true;
> -
> -	return false;
> -}
> -
> -/* Returns true if panel supports HDR. */
> -static bool is_panel_hdr(data_t *data, igt_output_t *output)
> -{
> -	bool ok;
> -	int i, j, offset;
> -	uint64_t edid_blob_id;
> -	drmModePropertyBlobRes *edid_blob;
> -	const struct edid_ext *edid_ext;
> -	const struct edid *edid;
> -	const struct edid_cea *edid_cea;
> -	const char *cea_data;
> -	bool ret = false;
> -
> -	ok = kmstest_get_property(data->fd, output->id,
> -			DRM_MODE_OBJECT_CONNECTOR, "EDID",
> -			NULL, &edid_blob_id, NULL);
> -
> -	if (!ok || !edid_blob_id)
> -		return ret;
> -
> -	edid_blob = drmModeGetPropertyBlob(data->fd, edid_blob_id);
> -	igt_assert(edid_blob);
> -
> -	edid = (const struct edid *) edid_blob->data;
> -	igt_assert(edid);
> -
> -	drmModeFreePropertyBlob(edid_blob);
> -
> -	for (i = 0; i < edid->extensions_len; i++) {
> -		edid_ext = &edid->extensions[i];
> -		edid_cea = &edid_ext->data.cea;
> -
> -		/* HDR not defined in CTA Extension Version < 3. */
> -		if ((edid_ext->tag != EDID_EXT_CEA) ||
> -		    (edid_cea->revision != CTA_EXTENSION_VERSION))
> -				continue;
> -		else {
> -			offset = edid_cea->dtd_start;
> -			cea_data = edid_cea->data;
> -
> -			for (j = 0; j < offset; j += (cea_data[j] & 0x1f) + 1) {
> -				ret = cta_block(cea_data + j);
> -
> -				if (ret)
> -					break;
> -			}
> -		}
> -	}
> -
> -	return ret;
> -}
> -
>  /* Sets the HDR output metadata prop with invalid size. */
>  static int set_invalid_hdr_output_metadata(data_t *data,
>  					   struct hdr_output_metadata const *meta,
> @@ -490,7 +357,7 @@ static void test_static_toggle(data_t *data, igt_crtc_t *crtc,
>  
>  	draw_hdr_pattern(&afb);
>  
> -	fill_hdr_output_metadata_st2084(&hdr);
> +	igt_hdr_fill_output_metadata_st2084(&hdr);
>  
>  	/* Start with no metadata. */
>  	igt_plane_set_fb(data->primary, &afb);
> @@ -559,36 +426,6 @@ cleanup:
>  	igt_remove_fb(data->fd, &afb);
>  }
>  
> -/* Fills some test values for HDR metadata targeting SDR. */
> -static void fill_hdr_output_metadata_sdr(struct hdr_output_metadata *meta)
> -{
> -	memset(meta, 0, sizeof(*meta));
> -
> -	meta->metadata_type = HDMI_STATIC_METADATA_TYPE1;
> -	meta->hdmi_metadata_type1.eotf = HDMI_EOTF_TRADITIONAL_GAMMA_SDR;
> -
> -	/* Rec. 709 */
> -	meta->hdmi_metadata_type1.display_primaries[0].x =
> -		calc_hdr_float(0.640); /* Red */
> -	meta->hdmi_metadata_type1.display_primaries[0].y =
> -		calc_hdr_float(0.330);
> -	meta->hdmi_metadata_type1.display_primaries[1].x =
> -		calc_hdr_float(0.300); /* Green */
> -	meta->hdmi_metadata_type1.display_primaries[1].y =
> -		calc_hdr_float(0.600);
> -	meta->hdmi_metadata_type1.display_primaries[2].x =
> -		calc_hdr_float(0.150); /* Blue */
> -	meta->hdmi_metadata_type1.display_primaries[2].y =
> -		calc_hdr_float(0.006);
> -	meta->hdmi_metadata_type1.white_point.x = calc_hdr_float(0.3127);
> -	meta->hdmi_metadata_type1.white_point.y = calc_hdr_float(0.3290);
> -
> -	meta->hdmi_metadata_type1.max_display_mastering_luminance = 0;
> -	meta->hdmi_metadata_type1.min_display_mastering_luminance = 0;
> -	meta->hdmi_metadata_type1.max_fall = 0;
> -	meta->hdmi_metadata_type1.max_cll = 0;
> -}
> -
>  static void test_static_swap(data_t *data, igt_crtc_t *crtc,
>  			     igt_output_t *output, uint32_t flags)
>  {
> @@ -625,7 +462,7 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
>  	}
>  
>  	/* Enter HDR, a modeset is allowed here. */
> -	fill_hdr_output_metadata_st2084(&hdr);
> +	igt_hdr_fill_output_metadata_st2084(&hdr);
>  	set_hdr_output_metadata(data, &hdr);
>  	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
>  	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> @@ -654,7 +491,7 @@ static void test_static_swap(data_t *data, igt_crtc_t *crtc,
>  	/* Enter SDR via metadata, no modeset allowed for
>  	 * amd driver, whereas a modeset is required for
>  	 * intel driver. */
> -	fill_hdr_output_metadata_sdr(&hdr);
> +	igt_hdr_fill_output_metadata_sdr(&hdr);
>  	set_hdr_output_metadata(data, &hdr);
>  	if (is_amdgpu_device(data->fd))
>  		igt_display_commit_atomic(display, 0, NULL);
> @@ -687,7 +524,7 @@ static void test_invalid_metadata_sizes(data_t *data, igt_output_t *output)
>  	struct hdr_output_metadata hdr;
>  	size_t metadata_size = sizeof(hdr);
>  
> -	fill_hdr_output_metadata_st2084(&hdr);
> +	igt_hdr_fill_output_metadata_st2084(&hdr);
>  
>  	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, 1), -EINVAL);
>  	igt_assert_eq(set_invalid_hdr_output_metadata(data, &hdr, metadata_size + 1), -EINVAL);
> @@ -725,13 +562,13 @@ static void test_hdr(data_t *data, uint32_t flags)
>  		}
>  
>  		/* For negative test, panel should be non-hdr. */
> -		if ((flags & TEST_INVALID_HDR) && is_panel_hdr(data, output)) {
> +		if ((flags & TEST_INVALID_HDR) && igt_hdr_is_panel_hdr(data->fd, output->id)) {
>  			igt_info("%s: Can't run negative test on HDR panel.\n",
>  				 igt_output_name(output));
>  			continue;
>  		}
>  
> -		if ((flags & ~TEST_INVALID_HDR) && !is_panel_hdr(data, output)) {
> +		if ((flags & ~TEST_INVALID_HDR) && !igt_hdr_is_panel_hdr(data->fd, output->id)) {
>  			igt_info("%s: Can't run HDR tests on non-HDR panel.\n",
>  				 igt_output_name(output));
>  			continue;
> @@ -760,7 +597,7 @@ static void test_hdr(data_t *data, uint32_t flags)
>  				     crtc);
>  
>  			/* Signal HDR requirement via metadata */
> -			fill_hdr_output_metadata_st2084(&hdr);
> +			igt_hdr_fill_output_metadata_st2084(&hdr);
>  			set_hdr_output_metadata(data, &hdr);
>  			if (igt_display_try_commit2(display, display->is_atomic ?
>  						    COMMIT_ATOMIC : COMMIT_LEGACY)) {
> -- 
> 2.43.0
> 
