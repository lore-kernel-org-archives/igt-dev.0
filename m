Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C94C10EC29
 for <igt-dev@lists.freedesktop.org>; Fri, 13 May 2022 08:32:59 +0000 (UTC)
Date: Fri, 13 May 2022 11:30:29 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Jeevan B <jeevan.b@intel.com>
Message-ID: <Yn4XJV/Ina0Xcqkk@platvala-desk.ger.corp.intel.com>
References: <20220512110113.31158-1-jeevan.b@intel.com>
 <20220512110113.31158-2-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220512110113.31158-2-jeevan.b@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 1/4] drm/fourcc: Import drm_fourcc
 header from 9035039e1ed69
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, May 12, 2022 at 04:31:10PM +0530, Jeevan B wrote:
> commit 9035039e1ed691cd893777a42e048003a2f349d6
> Author: Mika Kahola <mika.kahola@intel.com>
> Date:   Mon Apr 11 17:34:04 2022 +0300
> 
>     drm/fourcc: Introduce format modifier for DG2 clear color
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>


Matches what it claims,
Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  include/drm-uapi/drm_fourcc.h | 36 +++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc.h
> index d8f7cad9..78bebdea 100644
> --- a/include/drm-uapi/drm_fourcc.h
> +++ b/include/drm-uapi/drm_fourcc.h
> @@ -583,6 +583,42 @@ extern "C" {
>   */
>  #define I915_FORMAT_MOD_4_TILED         fourcc_mod_code(INTEL, 9)
>  
> +/*
> + * Intel color control surfaces (CCS) for DG2 render compression.
> + *
> + * The main surface is Tile 4 and at plane index 0. The CCS data is stored
> + * outside of the GEM object in a reserved memory area dedicated for the
> + * storage of the CCS data for all RC/RC_CC/MC compressible GEM objects. The
> + * main surface pitch is required to be a multiple of four Tile 4 widths.
> + */
> +#define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS fourcc_mod_code(INTEL, 10)
> +
> +/*
> + * Intel color control surfaces (CCS) for DG2 media compression.
> + *
> + * The main surface is Tile 4 and at plane index 0. For semi-planar formats
> + * like NV12, the Y and UV planes are Tile 4 and are located at plane indices
> + * 0 and 1, respectively. The CCS for all planes are stored outside of the
> + * GEM object in a reserved memory area dedicated for the storage of the
> + * CCS data for all RC/RC_CC/MC compressible GEM objects. The main surface
> + * pitch is required to be a multiple of four Tile 4 widths.
> + */
> +#define I915_FORMAT_MOD_4_TILED_DG2_MC_CCS fourcc_mod_code(INTEL, 11)
> +
> +/*
> + * Intel Color Control Surface with Clear Color (CCS) for DG2 render compression.
> + *
> + * The main surface is Tile 4 and at plane index 0. The CCS data is stored
> + * outside of the GEM object in a reserved memory area dedicated for the
> + * storage of the CCS data for all RC/RC_CC/MC compressible GEM objects. The
> + * main surface pitch is required to be a multiple of four Tile 4 widths. The
> + * clear color is stored at plane index 1 and the pitch should be ignored. The
> + * format of the 256 bits of clear color data matches the one used for the
> + * I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC modifier, see its description
> + * for details.
> + */
> +#define I915_FORMAT_MOD_4_TILED_DG2_RC_CCS_CC fourcc_mod_code(INTEL, 12)
> +
>  /*
>   * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
>   *
> -- 
> 2.36.0
> 
