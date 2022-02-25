Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C86610E4CA
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Feb 2022 06:17:45 +0000 (UTC)
Date: Fri, 25 Feb 2022 07:17:39 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Jeevan B <jeevan.b@intel.com>
Message-ID: <Yhh0gzIeFgoQV6s/@zkempczy-mobl2>
References: <20220225050853.8349-1-jeevan.b@intel.com>
 <20220225050853.8349-3-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220225050853.8349-3-jeevan.b@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 02/10] include/drm-uapi: Introduce new
 Tile 4 format
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, juha-pekka.heikkila@intel.com,
 petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Feb 25, 2022 at 10:38:45AM +0530, Jeevan B wrote:
> This tiling layout uses 4KB tiles in a row-major layout. It has the same
> shape as Tile Y at two granularities: 4KB (128B x 32) and 64B (16B x 4). It
> only differs from Tile Y at the 256B granularity in between. At this
> granularity, Tile Y has a shape of 16B x 32 rows, but this tiling has a shape
> of 64B x 8 rows.
> 
> Reference:
> https://cgit.freedesktop.org/drm/drm-tip/commit/?id=c6e7deb0f092616bd8cb19e8c436b212c64daaab
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>  include/drm-uapi/drm_fourcc.h | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc.h
> index 91b6a0fd..318b50fa 100644
> --- a/include/drm-uapi/drm_fourcc.h
> +++ b/include/drm-uapi/drm_fourcc.h
> @@ -559,6 +559,17 @@ extern "C" {
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
> -- 
> 2.17.1
> 

I think you should sync this file, not only apply this change.

--
Zbigniew
