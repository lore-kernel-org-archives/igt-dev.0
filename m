Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4557C6E8D4
 for <igt-dev@lists.freedesktop.org>; Mon,  3 May 2021 18:59:13 +0000 (UTC)
Date: Mon, 3 May 2021 21:59:09 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YJBH/TH1KshWZsqu@intel.com>
References: <20210503182555.12284-1-mario.kleiner.de@gmail.com>
 <20210503182555.12284-2-mario.kleiner.de@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210503182555.12284-2-mario.kleiner.de@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] drm-uapi: Add fourcc's for 16 bpc
 fixed point framebuffer formats.
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

On Mon, May 03, 2021 at 08:25:54PM +0200, Mario Kleiner wrote:
> These are 16 bits per color channel unsigned normalized formats.
> They are supported by at least AMD display hw, and suitable for
> direct scanout of Vulkan swapchain images in the format
> VK_FORMAT_R16G16B16A16_UNORM.

I think we've been trying to just copy the whole thing from the kernel
and include a reference to the relevant kernel commit. So need to land
the kernel drm_fourcc.h bits first before we land these.

> =

> Signed-off-by: Mario Kleiner <mario.kleiner.de@gmail.com>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> ---
>  include/drm-uapi/drm_fourcc.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> =

> diff --git a/include/drm-uapi/drm_fourcc.h b/include/drm-uapi/drm_fourcc.h
> index a7bc058c..5db4f55a 100644
> --- a/include/drm-uapi/drm_fourcc.h
> +++ b/include/drm-uapi/drm_fourcc.h
> @@ -144,6 +144,13 @@ extern "C" {
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
> -- =

> 2.25.1

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
