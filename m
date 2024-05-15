Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F8BC25B75
	for <igt-dev@archiver.kernel.org>; Wed, 15 May 2024 17:16:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975D810E1BE;
	Wed, 15 May 2024 17:16:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SbD7z8Am";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC33310E1BE
 for <igt-dev@lists.freedesktop.org>; Wed, 15 May 2024 17:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715793402; x=1747329402;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WegoNEjqLkQisRymSvy31fLRhOxhRLaBfqHk93xJECM=;
 b=SbD7z8AmbhYuk9+LCa89bZXz7aoCaRjt7M25askflU2g3wrRitrpP3e4
 +NINXxV5ey9GPb01u57A9YdN9wahxqeuwTRDIhQ4VUGlNezxjiHE4StpN
 Du8XQqvL/0VyU6ER6lo43NwXcXLc1cfZgc9sBPDQmgrXDfufegVUYMuDh
 GCDyJJtwDWEV6Oue2ktufni1m3Nl0Tz5iLiSdX619K9WkZlhPQAG61fHc
 YujuD8fIy/j+2lYewedOQI07+uUSJ4fI+cli/FnZ8+dhWQrlCgNmMbHhU
 FplPjSK/HMe0VonXYZHmKjK4CGtZ93SRTZpkMFzJNM2zoGMe/3SixaIhm A==;
X-CSE-ConnectionGUID: d51XQXQKSGeMumfMbWMPXw==
X-CSE-MsgGUID: QrZ12J7nQFScbMpH0W/khw==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11732568"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="11732568"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 10:16:37 -0700
X-CSE-ConnectionGUID: QaZJdnhfRiuGHQ0wfHZGUA==
X-CSE-MsgGUID: TguZyQL4QtC2IzThGu27Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="31196749"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.102.138.187])
 by fmviesa006-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 10:16:36 -0700
Date: Wed, 15 May 2024 19:16:32 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Sathishkumar S <sathishkumar.sundararaju@amd.com>,
 Leo Liu <leo.liu@amd.com>
Subject: Re: [PATCH i-g-t 1/2] tests/amdgpu: support jpeg test on gfx940
Message-ID: <20240515171632.6qavel4ojvvtwcck@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org,
 Sathishkumar S <sathishkumar.sundararaju@amd.com>,
 Leo Liu <leo.liu@amd.com>
References: <20240513135705.2399645-1-sathishkumar.sundararaju@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240513135705.2399645-1-sathishkumar.sundararaju@amd.com>
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

Hi Sathishkumar,
On 2024-05-13 at 19:27:04 +0530, Sathishkumar S wrote:
> update jpeg specific register offsets
--^

Start sentence with uppercase. No need for resend,
this can be corrected at merge.

Regards,
Kamil

> 
> Signed-off-by: Sathishkumar S <sathishkumar.sundararaju@amd.com>
> Acked-by: Leo Liu <leo.liu@amd.com>
> ---
>  tests/amdgpu/amd_jpeg_dec.c | 167 +++++++++++++++++++++++++++---------
>  1 file changed, 127 insertions(+), 40 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_jpeg_dec.c b/tests/amdgpu/amd_jpeg_dec.c
> index bb2a8e97e530..12f5bfcff556 100644
> --- a/tests/amdgpu/amd_jpeg_dec.c
> +++ b/tests/amdgpu/amd_jpeg_dec.c
> @@ -53,6 +53,47 @@
>  #define vcnipUVD_JPEG_RB_RPTR			0x4003
>  #define vcnipUVD_JPEG_OUTBUF_WPTR		0x401d
>  
> +#define vcnipUVD_JPEG_DEC_SOFT_RST_1             0x4051
> +#define vcnipUVD_JPEG_PITCH_1                    0x4043
> +#define vcnipUVD_JPEG_UV_PITCH_1                 0x4044
> +#define vcnipJPEG_DEC_ADDR_MODE_1                0x404B
> +#define vcnipUVD_JPEG_TIER_CNTL2_1               0x400E
> +#define vcnipUVD_JPEG_OUTBUF_CNTL_1              0x4040
> +#define vcnipUVD_JPEG_OUTBUF_WPTR_1              0x4041
> +#define vcnipUVD_JPEG_OUTBUF_RPTR_1              0x4042
> +#define vcnipUVD_JPEG_LUMA_BASE0_0               0x41C0
> +#define vcnipUVD_JPEG_CHROMA_BASE0_0             0x41C1
> +#define vcnipJPEG_DEC_Y_GFX10_TILING_SURFACE_1   0x4048
> +#define vcnipJPEG_DEC_UV_GFX10_TILING_SURFACE_1  0x4049
> +#define vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_HIGH_1 0x40B5
> +#define vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_LOW_1  0x40B4
> +#define vcnipUVD_LMI_JPEG_READ_64BIT_BAR_HIGH_1  0x40B3
> +#define vcnipUVD_LMI_JPEG_READ_64BIT_BAR_LOW_1   0x40B2
> +
> +static uint32_t jpeg_dec_soft_rst;
> +static uint32_t jrbc_ib_cond_rd_timer;
> +static uint32_t jrbc_ib_ref_data;
> +static uint32_t lmi_jpeg_read_64bit_bar_high;
> +static uint32_t lmi_jpeg_read_64bit_bar_low;
> +static uint32_t jpeg_rb_base;
> +static uint32_t jpeg_rb_size;
> +static uint32_t jpeg_rb_wptr;
> +static uint32_t jpeg_pitch;
> +static uint32_t jpeg_uv_pitch;
> +static uint32_t dec_addr_mode;
> +static uint32_t dec_y_gfx10_tiling_surface;
> +static uint32_t dec_uv_gfx10_tiling_surface;
> +static uint32_t lmi_jpeg_write_64bit_bar_high;
> +static uint32_t lmi_jpeg_write_64bit_bar_low;
> +static uint32_t jpeg_tier_cntl2;
> +static uint32_t jpeg_outbuf_rptr;
> +static uint32_t jpeg_outbuf_cntl;
> +static uint32_t jpeg_int_en;
> +static uint32_t jpeg_cntl;
> +static uint32_t jpeg_rb_rptr;
> +static uint32_t jpeg_outbuf_wptr;
> +static uint32_t jpeg_luma_base0_0;
> +static uint32_t jpeg_chroma_base0_0;
>  
>  #define RDECODE_PKT_REG_J(x)		((unsigned int)(x)&0x3FFFF)
>  #define RDECODE_PKT_RES_J(x)		(((unsigned int)(x)&0x3F) << 18)
> @@ -104,6 +145,50 @@ is_jpeg_tests_enable(amdgpu_device_handle device_handle,
>  	else
>  		return false;
>  
> +	jrbc_ib_cond_rd_timer = vcnipUVD_JRBC_IB_COND_RD_TIMER;
> +	jrbc_ib_ref_data = vcnipUVD_JRBC_IB_REF_DATA;
> +	jpeg_rb_base = vcnipUVD_JPEG_RB_BASE;
> +	jpeg_rb_size = vcnipUVD_JPEG_RB_SIZE;
> +	jpeg_rb_wptr = vcnipUVD_JPEG_RB_WPTR;
> +	jpeg_int_en = vcnipUVD_JPEG_INT_EN;
> +	jpeg_cntl = vcnipUVD_JPEG_CNTL;
> +	jpeg_rb_rptr = vcnipUVD_JPEG_RB_RPTR;
> +
> +	if (context->family_id == AMDGPU_FAMILY_AI &&
> +		(context->chip_id - context->chip_rev) > 0x3c) { /* gfx940 */
> +		jpeg_dec_soft_rst = vcnipUVD_JPEG_DEC_SOFT_RST_1;
> +		lmi_jpeg_read_64bit_bar_high = vcnipUVD_LMI_JPEG_READ_64BIT_BAR_HIGH_1;
> +		lmi_jpeg_read_64bit_bar_low = vcnipUVD_LMI_JPEG_READ_64BIT_BAR_LOW_1;
> +		jpeg_pitch = vcnipUVD_JPEG_PITCH_1;
> +		jpeg_uv_pitch = vcnipUVD_JPEG_UV_PITCH_1;
> +		dec_addr_mode = vcnipJPEG_DEC_ADDR_MODE_1;
> +		dec_y_gfx10_tiling_surface = vcnipJPEG_DEC_Y_GFX10_TILING_SURFACE_1;
> +		dec_uv_gfx10_tiling_surface = vcnipJPEG_DEC_UV_GFX10_TILING_SURFACE_1;
> +		lmi_jpeg_write_64bit_bar_high = vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_HIGH_1;
> +		lmi_jpeg_write_64bit_bar_low = vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_LOW_1;
> +		jpeg_tier_cntl2 = vcnipUVD_JPEG_TIER_CNTL2_1;
> +		jpeg_outbuf_cntl = vcnipUVD_JPEG_OUTBUF_CNTL_1;
> +		jpeg_outbuf_rptr = vcnipUVD_JPEG_OUTBUF_RPTR_1;
> +		jpeg_outbuf_wptr = vcnipUVD_JPEG_OUTBUF_WPTR_1;
> +		jpeg_luma_base0_0 = vcnipUVD_JPEG_LUMA_BASE0_0;
> +		jpeg_chroma_base0_0 = vcnipUVD_JPEG_CHROMA_BASE0_0;
> +	} else {
> +		jpeg_dec_soft_rst = vcnipUVD_JPEG_DEC_SOFT_RST;
> +		lmi_jpeg_read_64bit_bar_high = vcnipUVD_LMI_JPEG_READ_64BIT_BAR_HIGH;
> +		lmi_jpeg_read_64bit_bar_low = vcnipUVD_LMI_JPEG_READ_64BIT_BAR_LOW;
> +		jpeg_pitch = vcnipUVD_JPEG_PITCH;
> +		jpeg_uv_pitch = vcnipUVD_JPEG_UV_PITCH;
> +		dec_addr_mode = vcnipJPEG_DEC_ADDR_MODE;
> +		dec_y_gfx10_tiling_surface = vcnipJPEG_DEC_Y_GFX10_TILING_SURFACE;
> +		dec_uv_gfx10_tiling_surface = vcnipJPEG_DEC_UV_GFX10_TILING_SURFACE;
> +		lmi_jpeg_write_64bit_bar_high = vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_HIGH;
> +		lmi_jpeg_write_64bit_bar_low = vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_LOW;
> +		jpeg_tier_cntl2 = vcnipUVD_JPEG_TIER_CNTL2;
> +		jpeg_outbuf_cntl = vcnipUVD_JPEG_OUTBUF_CNTL;
> +		jpeg_outbuf_rptr = vcnipUVD_JPEG_OUTBUF_RPTR;
> +		jpeg_outbuf_wptr = vcnipUVD_JPEG_OUTBUF_WPTR;
> +	}
> +
>  	return true;
>  }
>  
> @@ -277,39 +362,34 @@ send_cmd_bitstream_direct(struct mmd_context *context, uint64_t addr,
>  {
>  
>  	/* jpeg soft reset */
> -	set_reg_jpeg(context, vcnipUVD_JPEG_DEC_SOFT_RST, COND0, TYPE0, 1, idx);
> +	set_reg_jpeg(context, jpeg_dec_soft_rst, COND0, TYPE0, 1, idx);
>  
>  	/* ensuring the Reset is asserted in SCLK domain */
> -	set_reg_jpeg(context, vcnipUVD_JRBC_IB_COND_RD_TIMER, COND0, TYPE0,
> -			0x01400200, idx);
> -	set_reg_jpeg(context, vcnipUVD_JRBC_IB_REF_DATA, COND0, TYPE0,
> -			(0x1 << 0x10), idx);
> -	set_reg_jpeg(context, vcnipUVD_JPEG_DEC_SOFT_RST, COND3, TYPE3,
> -			(0x1 << 0x10), idx);
> +	set_reg_jpeg(context, jrbc_ib_cond_rd_timer, COND0, TYPE0, 0x01400200, idx);
> +	set_reg_jpeg(context, jrbc_ib_ref_data, COND0, TYPE0, (0x1 << 0x10), idx);
> +	set_reg_jpeg(context, jpeg_dec_soft_rst, COND3, TYPE3, (0x1 << 0x10), idx);
>  
>  	/* wait mem */
> -	set_reg_jpeg(context, vcnipUVD_JPEG_DEC_SOFT_RST, COND0, TYPE0, 0, idx);
> +	set_reg_jpeg(context, jpeg_dec_soft_rst, COND0, TYPE0, 0, idx);
>  
>  	/* ensuring the Reset is de-asserted in SCLK domain */
> -	set_reg_jpeg(context, vcnipUVD_JRBC_IB_REF_DATA, COND0, TYPE0, (0 << 0x10),
> -			idx);
> -	set_reg_jpeg(context, vcnipUVD_JPEG_DEC_SOFT_RST, COND3, TYPE3,
> -			(0x1 << 0x10), idx);
> +	set_reg_jpeg(context, jrbc_ib_ref_data, COND0, TYPE0, (0 << 0x10), idx);
> +	set_reg_jpeg(context, jpeg_dec_soft_rst, COND3, TYPE3, (0x1 << 0x10), idx);
>  
>  	/* set UVD_LMI_JPEG_READ_64BIT_BAR_LOW/HIGH based on bitstream buffer address */
> -	set_reg_jpeg(context, vcnipUVD_LMI_JPEG_READ_64BIT_BAR_HIGH, COND0, TYPE0,
> +	set_reg_jpeg(context, lmi_jpeg_read_64bit_bar_high, COND0, TYPE0,
>  			(addr >> 32), idx);
> -	set_reg_jpeg(context, vcnipUVD_LMI_JPEG_READ_64BIT_BAR_LOW, COND0, TYPE0,
> +	set_reg_jpeg(context, lmi_jpeg_read_64bit_bar_low, COND0, TYPE0,
>  			addr, idx);
>  
>  	/* set jpeg_rb_base */
> -	set_reg_jpeg(context, vcnipUVD_JPEG_RB_BASE, COND0, TYPE0, 0, idx);
> +	set_reg_jpeg(context, jpeg_rb_base, COND0, TYPE0, 0, idx);
>  
>  	/* set jpeg_rb_base */
> -	set_reg_jpeg(context, vcnipUVD_JPEG_RB_SIZE, COND0, TYPE0, 0xFFFFFFF0, idx);
> +	set_reg_jpeg(context, jpeg_rb_size, COND0, TYPE0, 0xFFFFFFF0, idx);
>  
>  	/* set jpeg_rb_wptr */
> -	set_reg_jpeg(context, vcnipUVD_JPEG_RB_WPTR, COND0, TYPE0,
> +	set_reg_jpeg(context, jpeg_rb_wptr, COND0, TYPE0,
>  			(JPEG_DEC_BSD_SIZE >> 2), idx);
>  }
>  
> @@ -319,59 +399,66 @@ send_cmd_target_direct(struct mmd_context *context, uint64_t addr,
>  		uint32_t *idx)
>  {
>  
> -	set_reg_jpeg(context, vcnipUVD_JPEG_PITCH, COND0, TYPE0,
> +	set_reg_jpeg(context, jpeg_pitch, COND0, TYPE0,
>  			(JPEG_DEC_DT_PITCH >> 4), idx);
> -	set_reg_jpeg(context, vcnipUVD_JPEG_UV_PITCH, COND0, TYPE0,
> +	set_reg_jpeg(context, jpeg_uv_pitch, COND0, TYPE0,
>  			(JPEG_DEC_DT_PITCH >> 4), idx);
>  
> -	set_reg_jpeg(context, vcnipJPEG_DEC_ADDR_MODE, COND0, TYPE0, 0, idx);
> -	set_reg_jpeg(context, vcnipJPEG_DEC_Y_GFX10_TILING_SURFACE, COND0, TYPE0,
> +	set_reg_jpeg(context, dec_addr_mode, COND0, TYPE0, 0, idx);
> +	set_reg_jpeg(context, dec_y_gfx10_tiling_surface, COND0, TYPE0,
>  			0, idx);
> -	set_reg_jpeg(context, vcnipJPEG_DEC_UV_GFX10_TILING_SURFACE, COND0, TYPE0,
> +	set_reg_jpeg(context, dec_uv_gfx10_tiling_surface, COND0, TYPE0,
>  			0, idx);
>  
>  	/* set UVD_LMI_JPEG_WRITE_64BIT_BAR_LOW/HIGH based on target buffer address */
> -	set_reg_jpeg(context, vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_HIGH, COND0, TYPE0,
> +	set_reg_jpeg(context, lmi_jpeg_write_64bit_bar_high, COND0, TYPE0,
>  			(addr >> 32), idx);
> -	set_reg_jpeg(context, vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_LOW, COND0, TYPE0,
> +	set_reg_jpeg(context, lmi_jpeg_write_64bit_bar_low, COND0, TYPE0,
>  			addr, idx);
>  
>  	/* set output buffer data address */
> -	set_reg_jpeg(context, vcnipUVD_JPEG_INDEX, COND0, TYPE0, 0, idx);
> -	set_reg_jpeg(context, vcnipUVD_JPEG_DATA, COND0, TYPE0, JPEG_DEC_LUMA_OFFSET,
> -			idx);
> -	set_reg_jpeg(context, vcnipUVD_JPEG_INDEX, COND0, TYPE0, 1, idx);
> -	set_reg_jpeg(context, vcnipUVD_JPEG_DATA, COND0, TYPE0,
> +	if (jpeg_luma_base0_0) {
> +		set_reg_jpeg(context, jpeg_luma_base0_0, COND0, TYPE0,
> +			JPEG_DEC_LUMA_OFFSET, idx);
> +		set_reg_jpeg(context, jpeg_chroma_base0_0, COND0, TYPE0,
>  			JPEG_DEC_CHROMA_OFFSET, idx);
> -	set_reg_jpeg(context, vcnipUVD_JPEG_TIER_CNTL2, COND0, 0, 0, idx);
> +	} else {
> +		set_reg_jpeg(context, vcnipUVD_JPEG_INDEX, COND0, TYPE0, 0, idx);
> +		set_reg_jpeg(context, vcnipUVD_JPEG_DATA, COND0, TYPE0,
> +			JPEG_DEC_LUMA_OFFSET, idx);
> +		set_reg_jpeg(context, vcnipUVD_JPEG_INDEX, COND0, TYPE0, 1, idx);
> +		set_reg_jpeg(context, vcnipUVD_JPEG_DATA, COND0, TYPE0,
> +			JPEG_DEC_CHROMA_OFFSET, idx);
> +	}
> +	set_reg_jpeg(context, jpeg_tier_cntl2, COND0, 0, 0, idx);
>  
>  	/* set output buffer read pointer */
> -	set_reg_jpeg(context, vcnipUVD_JPEG_OUTBUF_RPTR, COND0, TYPE0, 0, idx);
> -	set_reg_jpeg(context, vcnipUVD_JPEG_OUTBUF_CNTL, COND0, TYPE0,
> +	set_reg_jpeg(context, jpeg_outbuf_rptr, COND0, TYPE0, 0, idx);
> +	set_reg_jpeg(context, jpeg_outbuf_cntl, COND0, TYPE0,
>  				((0x00001587 & (~0x00000180L)) | (0x1 << 0x7) | (0x1 << 0x6)),
>  				 idx);
>  
>  	/* enable error interrupts */
> -	set_reg_jpeg(context, vcnipUVD_JPEG_INT_EN, COND0, TYPE0, 0xFFFFFFFE, idx);
> +	set_reg_jpeg(context, jpeg_int_en, COND0, TYPE0, 0xFFFFFFFE, idx);
>  
>  	/* start engine command */
> -	set_reg_jpeg(context, vcnipUVD_JPEG_CNTL, COND0, TYPE0, 0xE, idx);
> +	set_reg_jpeg(context, jpeg_cntl, COND0, TYPE0, 0xE, idx);
>  
>  	/* wait for job completion, wait for job JBSI fetch done */
> -	set_reg_jpeg(context, vcnipUVD_JRBC_IB_REF_DATA, COND0, TYPE0,
> +	set_reg_jpeg(context, jrbc_ib_ref_data, COND0, TYPE0,
>  			(JPEG_DEC_BSD_SIZE >> 2), idx);
> -	set_reg_jpeg(context, vcnipUVD_JRBC_IB_COND_RD_TIMER, COND0, TYPE0,
> +	set_reg_jpeg(context, jrbc_ib_cond_rd_timer, COND0, TYPE0,
>  			0x01400200, idx);
> -	set_reg_jpeg(context, vcnipUVD_JPEG_RB_RPTR, COND3, TYPE3, 0xFFFFFFFF, idx);
> +	set_reg_jpeg(context, jpeg_rb_rptr, COND3, TYPE3, 0xFFFFFFFF, idx);
>  
>  	/* wait for job jpeg outbuf idle */
> -	set_reg_jpeg(context, vcnipUVD_JRBC_IB_REF_DATA, COND0, TYPE0, 0xFFFFFFFF,
> +	set_reg_jpeg(context, jrbc_ib_ref_data, COND0, TYPE0, 0xFFFFFFFF,
>  			idx);
> -	set_reg_jpeg(context, vcnipUVD_JPEG_OUTBUF_WPTR, COND3, TYPE3, 0x00000001,
> +	set_reg_jpeg(context, jpeg_outbuf_wptr, COND3, TYPE3, 0x00000001,
>  			idx);
>  
>  	/* stop engine */
> -	set_reg_jpeg(context, vcnipUVD_JPEG_CNTL, COND0, TYPE0, 0x4, idx);
> +	set_reg_jpeg(context, jpeg_cntl, COND0, TYPE0, 0x4, idx);
>  }
>  
>  static void
> -- 
> 2.25.1
> 
