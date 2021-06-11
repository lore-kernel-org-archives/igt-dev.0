Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 646996E509
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jun 2021 05:53:02 +0000 (UTC)
Date: Fri, 11 Jun 2021 08:54:52 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YML6rBH/KY5bj9F8@platvala-desk.ger.corp.intel.com>
References: <20210611042123.25282-1-mario.kleiner.de@gmail.com>
 <20210611042123.25282-2-mario.kleiner.de@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210611042123.25282-2-mario.kleiner.de@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] drm-uapi: Re-synchronize
 drm_fourcc.h with kernel.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mario Kleiner <mario.kleiner.de@gmail.com>
Cc: igt-dev@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Jun 11, 2021 at 06:21:22AM +0200, Mario Kleiner wrote:
> This aligns IGT's drm_fourcc.h to the latest kernel commit ff92ecf575a9
> ("drm/fourcc: Add 16 bpc fixed point framebuffer formats.")
> in drm-next for upcoming Linux 5.14.
> =

> Needed for lib/igt_fb support for testing of 16 bpc fixed point formats.
> =

> Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>


Acked-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  include/drm-uapi/drm_fourcc.h | 72 +++++++++++++++++++++++++++++++++--
>  1 file changed, 68 insertions(+), 4 deletions(-)
> =

> diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc.h
> index a7bc058c..f7156322 100644
> --- a/include/drm-uapi/drm_fourcc.h
> +++ b/include/drm-uapi/drm_fourcc.h
> @@ -58,6 +58,30 @@ extern "C" {
>   * may preserve meaning - such as number of planes - from the fourcc cod=
e,
>   * whereas others may not.
>   *
> + * Modifiers must uniquely encode buffer layout. In other words, a buffe=
r must
> + * match only a single modifier. A modifier must not be a subset of layo=
uts of
> + * another modifier. For instance, it's incorrect to encode pitch alignm=
ent in
> + * a modifier: a buffer may match a 64-pixel aligned modifier and a 32-p=
ixel
> + * aligned modifier. That said, modifiers can have implicit minimal
> + * requirements.
> + *
> + * For modifiers where the combination of fourcc code and modifier can a=
lias,
> + * a canonical pair needs to be defined and used by all drivers. Preferr=
ed
> + * combinations are also encouraged where all combinations might lead to
> + * confusion and unnecessarily reduced interoperability. An example for =
the
> + * latter is AFBC, where the ABGR layouts are preferred over ARGB layout=
s.
> + *
> + * There are two kinds of modifier users:
> + *
> + * - Kernel and user-space drivers: for drivers it's important that modi=
fiers
> + *   don't alias, otherwise two drivers might support the same format bu=
t use
> + *   different aliases, preventing them from sharing buffers in an effic=
ient
> + *   format.
> + * - Higher-level programs interfacing with KMS/GBM/EGL/Vulkan/etc: thes=
e users
> + *   see modifiers as opaque tokens they can check for equality and inte=
rsect.
> + *   These users musn't need to know to reason about the modifier value
> + *   (i.e. they are not expected to extract information out of the modif=
ier).
> + *
>   * Vendors should document their modifier usage in as much detail as
>   * possible, to ensure maximum compatibility across devices, drivers and
>   * applications.
> @@ -144,6 +168,13 @@ extern "C" {
>  #define DRM_FORMAT_RGBA1010102	fourcc_code('R', 'A', '3', '0') /* [31:0]=
 R:G:B:A 10:10:10:2 little endian */
>  #define DRM_FORMAT_BGRA1010102	fourcc_code('B', 'A', '3', '0') /* [31:0]=
 B:G:R:A 10:10:10:2 little endian */
>  =

> +/* 64 bpp RGB */
> +#define DRM_FORMAT_XRGB16161616	fourcc_code('X', 'R', '4', '8') /* [63:0=
] x:R:G:B 16:16:16:16 little endian */
> +#define DRM_FORMAT_XBGR16161616	fourcc_code('X', 'B', '4', '8') /* [63:0=
] x:B:G:R 16:16:16:16 little endian */
> +
> +#define DRM_FORMAT_ARGB16161616	fourcc_code('A', 'R', '4', '8') /* [63:0=
] A:R:G:B 16:16:16:16 little endian */
> +#define DRM_FORMAT_ABGR16161616	fourcc_code('A', 'B', '4', '8') /* [63:0=
] A:B:G:R 16:16:16:16 little endian */
> +
>  /*
>   * Floating point 64bpp RGB
>   * IEEE 754-2008 binary16 half-precision float
> @@ -155,6 +186,12 @@ extern "C" {
>  #define DRM_FORMAT_ARGB16161616F fourcc_code('A', 'R', '4', 'H') /* [63:=
0] A:R:G:B 16:16:16:16 little endian */
>  #define DRM_FORMAT_ABGR16161616F fourcc_code('A', 'B', '4', 'H') /* [63:=
0] A:B:G:R 16:16:16:16 little endian */
>  =

> +/*
> + * RGBA format with 10-bit components packed in 64-bit per pixel, with 6=
 bits
> + * of unused padding per component:
> + */
> +#define DRM_FORMAT_AXBXGXRX106106106106 fourcc_code('A', 'B', '1', '0') =
/* [63:0] A:x:B:x:G:x:R:x 10:6:10:6:10:6:10:6 little endian */
> +
>  /* packed YCbCr */
>  #define DRM_FORMAT_YUYV		fourcc_code('Y', 'U', 'Y', 'V') /* [31:0] Cr0:Y=
1:Cb0:Y0 8:8:8:8 little endian */
>  #define DRM_FORMAT_YVYU		fourcc_code('Y', 'V', 'Y', 'U') /* [31:0] Cb0:Y=
1:Cr0:Y0 8:8:8:8 little endian */
> @@ -320,7 +357,6 @@ extern "C" {
>   */
>  =

>  /* Vendor Ids: */
> -#define DRM_FORMAT_MOD_NONE           0
>  #define DRM_FORMAT_MOD_VENDOR_NONE    0
>  #define DRM_FORMAT_MOD_VENDOR_INTEL   0x01
>  #define DRM_FORMAT_MOD_VENDOR_AMD     0x02
> @@ -392,6 +428,16 @@ extern "C" {
>   */
>  #define DRM_FORMAT_MOD_LINEAR	fourcc_mod_code(NONE, 0)
>  =

> +/*
> + * Deprecated: use DRM_FORMAT_MOD_LINEAR instead
> + *
> + * The "none" format modifier doesn't actually mean that the modifier is
> + * implicit, instead it means that the layout is linear. Whether modifie=
rs are
> + * used is out-of-band information carried in an API-specific way (e.g. =
in a
> + * flag for drm_mode_fb_cmd2).
> + */
> +#define DRM_FORMAT_MOD_NONE	0
> +
>  /* Intel framebuffer modifiers */
>  =

>  /*
> @@ -488,6 +534,25 @@ extern "C" {
>   */
>  #define I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS fourcc_mod_code(INTEL, 7)
>  =

> +/*
> + * Intel Color Control Surface with Clear Color (CCS) for Gen-12 render
> + * compression.
> + *
> + * The main surface is Y-tiled and is at plane index 0 whereas CCS is li=
near
> + * and at index 1. The clear color is stored at index 2, and the pitch s=
hould
> + * be ignored. The clear color structure is 256 bits. The first 128 bits
> + * represents Raw Clear Color Red, Green, Blue and Alpha color each repr=
esented
> + * by 32 bits. The raw clear color is consumed by the 3d engine and gene=
rates
> + * the converted clear color of size 64 bits. The first 32 bits store th=
e Lower
> + * Converted Clear Color value and the next 32 bits store the Higher Con=
verted
> + * Clear Color value when applicable. The Converted Clear Color values a=
re
> + * consumed by the DE. The last 64 bits are used to store Color Discard =
Enable
> + * and Depth Clear Value Valid which are ignored by the DE. A CCS cache =
line
> + * corresponds to an area of 4x1 tiles in the main surface. The main sur=
face
> + * pitch is required to be a multiple of 4 tile widths.
> + */
> +#define I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS_CC fourcc_mod_code(INTEL, 8)
> +
>  /*
>   * Tiled, NV12MT, grouped in 64 (pixels) x 32 (lines) -sized macroblocks
>   *
> @@ -997,9 +1062,9 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modi=
fier)
>   * Not all combinations are valid, and different SoCs may support differ=
ent
>   * combinations of layout and options.
>   */
> -#define __fourcc_mod_amlogic_layout_mask 0xf
> +#define __fourcc_mod_amlogic_layout_mask 0xff
>  #define __fourcc_mod_amlogic_options_shift 8
> -#define __fourcc_mod_amlogic_options_mask 0xf
> +#define __fourcc_mod_amlogic_options_mask 0xff
>  =

>  #define DRM_FORMAT_MOD_AMLOGIC_FBC(__layout, __options) \
>  	fourcc_mod_code(AMLOGIC, \
> @@ -1195,4 +1260,3 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 mod=
ifier)
>  #endif
>  =

>  #endif /* DRM_FOURCC_H */
> -
> -- =

> 2.25.1
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
