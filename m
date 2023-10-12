Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CF410E03A
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Oct 2023 12:22:02 +0000 (UTC)
Date: Thu, 12 Oct 2023 14:21:27 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231012122127.cbtpozrqz4alrlkn@kamilkon-desk.igk.intel.com>
References: <20231010134540.28485-1-melanie.lobo@intel.com>
 <20231012082535.8001-1-melanie.lobo@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231012082535.8001-1-melanie.lobo@intel.com>
Subject: Re: [igt-dev] [PATCH] intel/kms_flip_scaled_crc.c: Add support for
 FP16 compressed formats in MTL.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Melanie,
On 2023-10-12 at 13:55:35 +0530, Melanie Lobo wrote:

please correct subject:

intel/kms_flip_scaled_crc.c: Add support for FP16 compressed formats in MTL.
^^^^^--------------------^^ --------------------------------------- ^^^^^^^^
Start with test/, no ".c" in filename, no dot "." at end of subject.
imho here we may also drop "in MTL." part, so it will be:

tests/intel/kms_flip_scaled_crc: Add support for FP16 compressed formats

For kms correctness, please add some KMS devs, I am adding now
Juha-Pekka, Swati and Bhanu.

> MTL supports FP16 format which is a binary floating-point computer
> number format that occupies 16 bits in computer memory.In this test
-------------------------------------------------------- ^
Put space after dot: "memory. In"

> platform shall render compression in display engine to receive
> FP16 compressed formats.
> 
> Signed-off-by: Melanie Lobo <melanie.lobo@intel.com>
> ---
>  lib/intel_aux_pgtable.c           |  5 +++++
>  tests/intel/kms_flip_scaled_crc.c | 16 ++++++++++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/lib/intel_aux_pgtable.c b/lib/intel_aux_pgtable.c
> index 7c79521344de..a612df407692 100644
> --- a/lib/intel_aux_pgtable.c
> +++ b/lib/intel_aux_pgtable.c
> @@ -21,6 +21,7 @@
>  #define AUX_FORMAT_AYUV		0x09
>  #define AUX_FORMAT_ARGB_8B	0x0A
>  #define AUX_FORMAT_NV12_21	0x0F
> +#define AUX_FORMAT_XRGB16161616_64B 0x10
>  
>  struct pgtable_level_desc {
>  	int idx_shift;
> @@ -305,6 +306,10 @@ static uint64_t pgt_get_l1_flags(const struct intel_buf *buf, int surface_idx)
>  			entry.e.format = AUX_FORMAT_ARGB_8B;
>  			entry.e.depth = bpp_to_depth_val(32);
>  			break;
> +		case 64:
> +			entry.e.format = AUX_FORMAT_XRGB16161616_64B;
> +			entry.e.depth = bpp_to_depth_val(64);
> +			break;
>  		default:
>  			igt_assert(0);
>  		}
> diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
> index 2997b63fac40..0d5e994af2b7 100644
> --- a/tests/intel/kms_flip_scaled_crc.c
> +++ b/tests/intel/kms_flip_scaled_crc.c
> @@ -590,6 +590,22 @@ const struct {
>  		0.5,
>  		1.0,
>  	},
> +	{
> +		"flip-64bpp-4tile-to-32bpp-4tilemtlrcccs-upscaling",
> +		"Flip from 64bpp non scaled fb to 32bpp upscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
> +		I915_FORMAT_MOD_4_TILED_MTL_RC_CCS, DRM_FORMAT_XRGB16161616F,
> +		0.5,
> +		1.0,
> +	},
> +	{
> +		"flip-64bpp-4tile-to-32bpp-4tilemtlrcccs-downscaling",
> +		"Flip from 64bpp non scaled fb to 32bpp downscaled fb to stress CD clock programming",
> +		I915_FORMAT_MOD_4_TILED, DRM_FORMAT_XRGB16161616F,
> +		I915_FORMAT_MOD_4_TILED_MTL_RC_CCS, DRM_FORMAT_XRGB16161616F,
> +		1.0,
> +		2.0,
> +	},

Please add these at respective sections, it looks like there is
downscaling first, after that follows upscaling.

Add also SUBTEST: descriptions and check before resend with:

meson -Dtestplan=enabled build
ninja -C build

See also build failure/warning on gitlab.

Regards,
Kamil

>  };
>  
>  static void setup_fb(data_t *data, struct igt_fb *newfb, uint32_t width,
> -- 
> 2.17.1
> 
