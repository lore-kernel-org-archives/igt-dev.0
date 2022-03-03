Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE52B10EBD2
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Mar 2022 07:33:35 +0000 (UTC)
Date: Thu, 3 Mar 2022 09:33:56 +0200
From: "Lisovskiy, Stanislav" <stanislav.lisovskiy@intel.com>
To: Jeevan B <jeevan.b@intel.com>
Message-ID: <20220303073356.GA26711@intel.com>
References: <20220302143923.26498-1-jeevan.b@intel.com>
 <20220302143923.26498-3-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220302143923.26498-3-jeevan.b@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2 02/10] include/drm-uapi: Import
 drm_fourcc header from c6e7deb0f092
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, juha-pekka.heikkila@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Mar 02, 2022 at 08:09:15PM +0530, Jeevan B wrote:
> Generated with make headers_install:
> 	commit c6e7deb0f092616bd8cb19e8c436b212c64daaab
> 	Author: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
> 	Date:   Tue Jan 18 13:55:43 2022 +0200
> 
> 	drm/i915: Introduce new Tile 4 format
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>

Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

> ---
>  include/drm-uapi/drm_fourcc.h | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc.h
> index 91b6a0fd..d8f7cad9 100644
> --- a/include/drm-uapi/drm_fourcc.h
> +++ b/include/drm-uapi/drm_fourcc.h
> @@ -104,6 +104,12 @@ extern "C" {
>  /* 8 bpp Red */
>  #define DRM_FORMAT_R8		fourcc_code('R', '8', ' ', ' ') /* [7:0] R */
>  
> +/* 10 bpp Red */
> +#define DRM_FORMAT_R10		fourcc_code('R', '1', '0', ' ') /* [15:0] x:R 6:10 little endian */
> +
> +/* 12 bpp Red */
> +#define DRM_FORMAT_R12		fourcc_code('R', '1', '2', ' ') /* [15:0] x:R 4:12 little endian */
> +
>  /* 16 bpp Red */
>  #define DRM_FORMAT_R16		fourcc_code('R', '1', '6', ' ') /* [15:0] R little endian */
>  
> @@ -308,6 +314,13 @@ extern "C" {
>   */
>  #define DRM_FORMAT_P016		fourcc_code('P', '0', '1', '6') /* 2x2 subsampled Cr:Cb plane 16 bits per channel */
>  
> +/* 2 plane YCbCr420.
> + * 3 10 bit components and 2 padding bits packed into 4 bytes.
> + * index 0 = Y plane, [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian
> + * index 1 = Cr:Cb plane, [63:0] x:Cr2:Cb2:Cr1:x:Cb1:Cr0:Cb0 [2:10:10:10:2:10:10:10] little endian
> + */
> +#define DRM_FORMAT_P030		fourcc_code('P', '0', '3', '0') /* 2x2 subsampled Cr:Cb plane 10 bits per channel packed */
> +
>  /* 3 plane non-subsampled (444) YCbCr
>   * 16 bits per component, but only 10 bits are used and 6 bits are padded
>   * index 0: Y plane, [15:0] Y:x [10:6] little endian
> @@ -559,6 +572,17 @@ extern "C" {
>   */
>  #define I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC fourcc_mod_code(INTEL, 8)
>  
> +/*
> + * Intel Tile 4 layout
> + *
> + * This is a tiled layout using 4KB tiles in a row-major layout. It has the same
> + * shape as Tile Y at two granularities: 4KB (128B x 32) and 64B (16B x 4). It
> + * only differs from Tile Y at the 256B granularity in between. At this
> + * granularity, Tile Y has a shape of 16B x 32 rows, but this tiling has a shape
> + * of 64B x 8 rows.
> + */
> +#define I915_FORMAT_MOD_4_TILED         fourcc_mod_code(INTEL, 9)
> +
>  /*
>   * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
>   *
> @@ -848,6 +872,10 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
>   * and UV.  Some SAND-using hardware stores UV in a separate tiled
>   * image from Y to reduce the column height, which is not supported
>   * with these modifiers.
> + *
> + * The DRM_FORMAT_MOD_BROADCOM_SAND128_COL_HEIGHT modifier is also
> + * supported for DRM_FORMAT_P030 where the columns remain as 128 bytes
> + * wide, but as this is a 10 bpp format that translates to 96 pixels.
>   */
>  
>  #define DRM_FORMAT_MOD_BROADCOM_SAND32_COL_HEIGHT(v) \
> -- 
> 2.17.1
> 
