Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E33C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu, 22 Aug 2024 11:28:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5108010E861;
	Thu, 22 Aug 2024 11:28:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="clE2ebSo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311D210E861
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Aug 2024 11:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724326136; x=1755862136;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Icczn+AdP8xANLGAEGsRXc3vRxNc0fg+gNNKHmuW8No=;
 b=clE2ebSoLhzfGlcuEanwpTD36wY3UI2/O/DTUmcWwu9ltxVmjxu8qT9a
 tW8rZuFkCmENqJ1HMDAE1LpYNCqqKhu4fCdGnptY82I+uWiFDWeLt8SJw
 LG+80u4l7QnYCvx/03RBpNYr1+4+rPxWorCeJFdlPmoUEuMtifwnlf2mV
 BdYWmwRn4cPE79MMuAwuksCgFVVl98KXugg7f6txbKwMkG5NI77vA5gbQ
 hgd3tvWw2ey1xZgpHVQCPLfpF9W+DjsejAa7flNU6zk0dtJrOwNnejvlk
 7PqYYOQ/HN35qtZrjHhv49gAwXE8VytV16X3YnV6pFpl2j6i3LytygIGD Q==;
X-CSE-ConnectionGUID: u8pW9mVZSZ2Pgql4S55A4Q==
X-CSE-MsgGUID: s/C1J/1rRDOgUpjjtjhnNg==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="22546791"
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="22546791"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 04:28:55 -0700
X-CSE-ConnectionGUID: DG2II+gjTe6r6kOhMuS83g==
X-CSE-MsgGUID: SbcCeG/eSAOhtYoV+ggOow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,166,1719903600"; d="scan'208";a="61565297"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.83])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2024 04:28:55 -0700
Date: Thu, 22 Aug 2024 13:28:52 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t 1/3] drm/fourcc: Import drm_fourcc header from
 commit 5151fa3 ("drm/fourcc: define Intel Xe2 related tile4 ccs modifiers")
Message-ID: <20240822112852.vjjnbeiilwpob3hi@zkempczy-mobl2>
References: <20240822112252.4148114-1-juhapekka.heikkila@gmail.com>
 <20240822112252.4148114-2-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240822112252.4148114-2-juhapekka.heikkila@gmail.com>
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

On Thu, Aug 22, 2024 at 02:22:50PM +0300, Juha-Pekka Heikkila wrote:
> commit 5151fa35ae5979821d091b80096b4c790b187bac
> Author: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Date:   Fri Aug 16 14:52:28 2024 +0300
> 
>     drm/fourcc: define Intel Xe2 related tile4 ccs modifiers
> 
>     Add Tile4 type ccs modifiers to indicate presence of compression on Xe2.
>     Here is defined I915_FORMAT_MOD_4_TILED_LNL_CCS which is meant for
>     integrated graphics with igpu related limitations
>     Here is also defined I915_FORMAT_MOD_4_TILED_BMG_CCS which is meant
>     for discrete graphics with dgpu related limitations
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

> ---
>  include/drm-uapi/drm_fourcc.h | 57 +++++++++++++++++++++++++++++++----
>  1 file changed, 51 insertions(+), 6 deletions(-)
> 
> diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc.h
> index 6b6235f7a..78abd819f 100644
> --- a/include/drm-uapi/drm_fourcc.h
> +++ b/include/drm-uapi/drm_fourcc.h
> @@ -54,7 +54,7 @@ extern "C" {
>   * Format modifiers may change any property of the buffer, including the number
>   * of planes and/or the required allocation size. Format modifiers are
>   * vendor-namespaced, and as such the relationship between a fourcc code and a
> - * modifier is specific to the modifer being used. For example, some modifiers
> + * modifier is specific to the modifier being used. For example, some modifiers
>   * may preserve meaning - such as number of planes - from the fourcc code,
>   * whereas others may not.
>   *
> @@ -79,7 +79,7 @@ extern "C" {
>   *   format.
>   * - Higher-level programs interfacing with KMS/GBM/EGL/Vulkan/etc: these users
>   *   see modifiers as opaque tokens they can check for equality and intersect.
> - *   These users musn't need to know to reason about the modifier value
> + *   These users mustn't need to know to reason about the modifier value
>   *   (i.e. they are not expected to extract information out of the modifier).
>   *
>   * Vendors should document their modifier usage in as much detail as
> @@ -323,6 +323,8 @@ extern "C" {
>   * index 1 = Cr:Cb plane, [39:0] Cr1:Cb1:Cr0:Cb0 little endian
>   */
>  #define DRM_FORMAT_NV15		fourcc_code('N', 'V', '1', '5') /* 2x2 subsampled Cr:Cb plane */
> +#define DRM_FORMAT_NV20		fourcc_code('N', 'V', '2', '0') /* 2x1 subsampled Cr:Cb plane */
> +#define DRM_FORMAT_NV30		fourcc_code('N', 'V', '3', '0') /* non-subsampled Cr:Cb plane */
>  
>  /*
>   * 2 plane YCbCr MSB aligned
> @@ -538,7 +540,7 @@ extern "C" {
>   * This is a tiled layout using 4Kb tiles in row-major layout.
>   * Within the tile pixels are laid out in 16 256 byte units / sub-tiles which
>   * are arranged in four groups (two wide, two high) with column-major layout.
> - * Each group therefore consits out of four 256 byte units, which are also laid
> + * Each group therefore consists out of four 256 byte units, which are also laid
>   * out as 2x2 column-major.
>   * 256 byte units are made out of four 64 byte blocks of pixels, producing
>   * either a square block or a 2:1 unit.
> @@ -700,6 +702,31 @@ extern "C" {
>   */
>  #define I915_FORMAT_MOD_4_TILED_MTL_RC_CCS_CC fourcc_mod_code(INTEL, 15)
>  
> +/*
> + * Intel Color Control Surfaces (CCS) for graphics ver. 20 unified compression
> + * on integrated graphics
> + *
> + * The main surface is Tile 4 and at plane index 0. For semi-planar formats
> + * like NV12, the Y and UV planes are Tile 4 and are located at plane indices
> + * 0 and 1, respectively. The CCS for all planes are stored outside of the
> + * GEM object in a reserved memory area dedicated for the storage of the
> + * CCS data for all compressible GEM objects.
> + */
> +#define I915_FORMAT_MOD_4_TILED_LNL_CCS fourcc_mod_code(INTEL, 16)
> +
> +/*
> + * Intel Color Control Surfaces (CCS) for graphics ver. 20 unified compression
> + * on discrete graphics
> + *
> + * The main surface is Tile 4 and at plane index 0. For semi-planar formats
> + * like NV12, the Y and UV planes are Tile 4 and are located at plane indices
> + * 0 and 1, respectively. The CCS for all planes are stored outside of the
> + * GEM object in a reserved memory area dedicated for the storage of the
> + * CCS data for all compressible GEM objects. The GEM object must be stored in
> + * contiguous memory with a size aligned to 64KB
> + */
> +#define I915_FORMAT_MOD_4_TILED_BMG_CCS fourcc_mod_code(INTEL, 17)
> +
>  /*
>   * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
>   *
> @@ -934,7 +961,7 @@ extern "C" {
>   * which corresponds to the "generic" kind used for simple single-sample
>   * uncompressed color formats on Fermi - Volta GPUs.
>   */
> -static __inline__ __u64
> +static inline __u64
>  drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>  {
>  	if (!(modifier & 0x10) || (modifier & (0xff << 12)))
> @@ -1101,7 +1128,7 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>   */
>  
>  /*
> - * The top 4 bits (out of the 56 bits alloted for specifying vendor specific
> + * The top 4 bits (out of the 56 bits allotted for specifying vendor specific
>   * modifiers) denote the category for modifiers. Currently we have three
>   * categories of modifiers ie AFBC, MISC and AFRC. We can have a maximum of
>   * sixteen different categories.
> @@ -1417,7 +1444,7 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>   * Amlogic FBC Memory Saving mode
>   *
>   * Indicates the storage is packed when pixel size is multiple of word
> - * boudaries, i.e. 8bit should be stored in this mode to save allocation
> + * boundaries, i.e. 8bit should be stored in this mode to save allocation
>   * memory.
>   *
>   * This mode reduces body layout to 3072 bytes per 64x32 superblock with
> @@ -1474,6 +1501,7 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>  #define AMD_FMT_MOD_TILE_VER_GFX10 2
>  #define AMD_FMT_MOD_TILE_VER_GFX10_RBPLUS 3
>  #define AMD_FMT_MOD_TILE_VER_GFX11 4
> +#define AMD_FMT_MOD_TILE_VER_GFX12 5
>  
>  /*
>   * 64K_S is the same for GFX9/GFX10/GFX10_RBPLUS and hence has GFX9 as canonical
> @@ -1484,6 +1512,8 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>  /*
>   * 64K_D for non-32 bpp is the same for GFX9/GFX10/GFX10_RBPLUS and hence has
>   * GFX9 as canonical version.
> + *
> + * 64K_D_2D on GFX12 is identical to 64K_D on GFX11.
>   */
>  #define AMD_FMT_MOD_TILE_GFX9_64K_D 10
>  #define AMD_FMT_MOD_TILE_GFX9_64K_S_X 25
> @@ -1491,6 +1521,21 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>  #define AMD_FMT_MOD_TILE_GFX9_64K_R_X 27
>  #define AMD_FMT_MOD_TILE_GFX11_256K_R_X 31
>  
> +/* Gfx12 swizzle modes:
> + *    0 - LINEAR
> + *    1 - 256B_2D  - 2D block dimensions
> + *    2 - 4KB_2D
> + *    3 - 64KB_2D
> + *    4 - 256KB_2D
> + *    5 - 4KB_3D   - 3D block dimensions
> + *    6 - 64KB_3D
> + *    7 - 256KB_3D
> + */
> +#define AMD_FMT_MOD_TILE_GFX12_256B_2D 1
> +#define AMD_FMT_MOD_TILE_GFX12_4K_2D 2
> +#define AMD_FMT_MOD_TILE_GFX12_64K_2D 3
> +#define AMD_FMT_MOD_TILE_GFX12_256K_2D 4
> +
>  #define AMD_FMT_MOD_DCC_BLOCK_64B 0
>  #define AMD_FMT_MOD_DCC_BLOCK_128B 1
>  #define AMD_FMT_MOD_DCC_BLOCK_256B 2
> -- 
> 2.45.2
> 
