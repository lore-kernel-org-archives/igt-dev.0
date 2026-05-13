Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F346DCD4851
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 16:03:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0A0E10EF34;
	Wed, 13 May 2026 16:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="El/k2NL8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4974510E32E
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 16:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778688172; x=1810224172;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=k8RfEoUm59KGuxUNbPkVGi6lHlxPsfrnl8zsKKYrt6E=;
 b=El/k2NL8VD7+VOrg9jz/KW1uQY7joluR178TE0a/pKc1PQZprF63a4i3
 FBDnDU87MEOsnJZh0k0m4t6HLur6uYlB2xxVU1Ua3wUfKDrx9w6cjeSn4
 FsaRMA3ljF7TEfMoeaX6wLOGOJSNmq5TPjrWVm6iwgqVURpgpm/+YOKwm
 dbX4i8iQDribOZf+y9BDD7+kGoHFD4qiw13obSEuwwJ3K/i5hY1tOyZ9d
 3C52sIdD7clCeVkVSs5Auwwm+HW4U9/jcIQICT+SVTwHrIh1N1dixujAm
 PsucEijSPI+Ghj0pSKtcNTmTyQ2OMhz07EyC6Y2jD2vaF9y+pYgNq/ZHo g==;
X-CSE-ConnectionGUID: JNenn1ZcQIWBXMYVpUXPPw==
X-CSE-MsgGUID: rg3t1ZIaTvafQ9tQOEfq9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79515968"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="79515968"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2026 09:02:52 -0700
X-CSE-ConnectionGUID: YNq3vx3wR3iMH6rKdyutFg==
X-CSE-MsgGUID: GBRVEJdoTyaDZfpkIjB5dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; d="scan'208";a="261627502"
Received: from kamilkon-desk.igk.intel.com (HELO localhost) ([10.211.136.201])
 by fmviesa002-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 09:02:49 -0700
Date: Wed, 13 May 2026 18:02:47 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
Cc: igt-dev@lists.freedesktop.org,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>, Swati Sharma <swati2.sharma@intel.com>
Subject: Re: [PATCH i-g-t 3/4] drm-uapi: Update drm_mode.h to latest linux
 upstream.
Message-ID: <20260513160247.4umfbqrmyfpfsqwq@kamilkon-DESK.igk.intel.com>
Mail-Followup-To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>, igt-dev@lists.freedesktop.org,
 =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Juha-Pekka Heikkila <juha-pekka.heikkila@intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
References: <20260505194419.500600-5-dev@lankhorst.se>
 <20260505194419.500600-7-dev@lankhorst.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260505194419.500600-7-dev@lankhorst.se>
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

Hi Maarten,
On 2026-05-05 at 21:44:22 +0200, Maarten Lankhorst wrote:

Please remove dot from subject, also add a commit hash
with which you are syncing, something like:

[PATCH i-g-t 3/4] drm-uapi/drm_mode: sync with drm-next commit a1b6cf8e5e7e


> Take the drm_mode.h from v7.1-rc2 to get all the
> background property macros.

Add in description list with which commits from drm-next you
are syncing, for example see https://patchwork.freedesktop.org/patch/723725/?series=166234&rev=1
drm-uapi/panthor: sync with kernel 5731bca6a656

so here write something like:

Sync drm_mode.h uapi with drm-next up to commit a1b6cf8e5e7e,
this will bring following changes:

a1b6cf8e5e7e ("drm: uapi: Use SPDX in DRM core uAPI headers")
4c684596cde4 ("drm: Add CRTC background color property")
...
follow like above up to last new commit.


If you are syncing with drm-tip (becuase some changes still
do not landed in drm-next), I suggest make two commits, or one
in which you write in description which one is from which tree:

Sync with drm-tip commit HASH, which brings:
...commits

and with changes from drm-next:
...commits

+cc Adrián Larumbe <adrian.larumbe@collabora.com>
+cc other maintainers

Regards,
Kamil

> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> ---
>  include/drm-uapi/drm_mode.h | 193 ++++++++++++++++++++++++++++++++++--
>  include/linux_scaffold.h    |   2 +
>  2 files changed, 188 insertions(+), 7 deletions(-)
> 
> diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
> index de10ce859f..8513ce24f3 100644
> --- a/include/drm-uapi/drm_mode.h
> +++ b/include/drm-uapi/drm_mode.h
> @@ -166,6 +166,10 @@ extern "C" {
>  #define DRM_MODE_LINK_STATUS_GOOD	0
>  #define DRM_MODE_LINK_STATUS_BAD	1
>  
> +/* Panel type property */
> +#define DRM_MODE_PANEL_TYPE_UNKNOWN	0
> +#define DRM_MODE_PANEL_TYPE_OLED	1
> +
>  /*
>   * DRM_MODE_ROTATE_<degrees>
>   *
> @@ -895,31 +899,48 @@ enum drm_colorop_type {
>  	/**
>  	 * @DRM_COLOROP_1D_CURVE:
>  	 *
> +	 * enum string "1D Curve"
> +	 *
>  	 * A 1D curve that is being applied to all color channels. The
> -	 * curve is specified via tha CURVE_1D_TYPE colorop property.
> +	 * curve is specified via the CURVE_1D_TYPE colorop property.
>  	 */
>  	DRM_COLOROP_1D_CURVE,
>  
>  	/**
>  	 * @DRM_COLOROP_1D_LUT:
>  	 *
> +	 * enum string "1D LUT"
> +	 *
>  	 * A simple 1D LUT of uniformly spaced &drm_color_lut32 entries,
> -	 * packed into a blob via the DATA property. The driver's expected
> -	 * LUT size is advertised via the SIZE property.
> +	 * packed into a blob via the DATA property. The driver's
> +	 * expected LUT size is advertised via the SIZE property.
> +	 *
> +	 * The DATA blob is an array of struct drm_color_lut32 with size
> +	 * of "size".
>  	 */
>  	DRM_COLOROP_1D_LUT,
>  
>  	/**
>  	 * @DRM_COLOROP_CTM_3X4:
>  	 *
> +	 * enum string "3x4 Matrix"
> +	 *
>  	 * A 3x4 matrix. Its values are specified via the
>  	 * &drm_color_ctm_3x4 struct provided via the DATA property.
> +	 *
> +	 * The DATA blob is a float[12]:
> +	 * out   matrix          in
> +	 * | R |   | 0  1  2  3  |   | R |
> +	 * | G | = | 4  5  6  7  | x | G |
> +	 * | B |   | 8  9  10 12 |   | B |
>  	 */
>  	DRM_COLOROP_CTM_3X4,
>  
>  	/**
>  	 * @DRM_COLOROP_MULTIPLIER:
>  	 *
> +	 * enum string "Multiplier"
> +	 *
>  	 * A simple multiplier, applied to all color values. The
>  	 * multiplier is specified as a S31.32 via the MULTIPLIER
>  	 * property.
> @@ -929,16 +950,28 @@ enum drm_colorop_type {
>  	/**
>  	 * @DRM_COLOROP_3D_LUT:
>  	 *
> -	 * A 3D LUT of &drm_color_lut entries,
> +	 * enum string "3D LUT"
> +	 *
> +	 * A 3D LUT of &drm_color_lut32 entries,
>  	 * packed into a blob via the DATA property. The driver's expected
> -	 * LUT size is advertised via the SIZE property.
> +	 * LUT size is advertised via the SIZE property, i.e., a 3D LUT with
> +	 * 17x17x17 entries will have SIZE set to 17.
> +	 *
> +	 * The DATA blob is a 3D array of struct drm_color_lut32 with dimension
> +	 * length of "size".
> +	 * The LUT elements are traversed like so:
> +	 *
> +	 *   for B in range 0..n
> +	 *     for G in range 0..n
> +	 *       for R in range 0..n
> +	 *        index = R + n * (G + n * B)
> +	 *         color = lut3d[index]
>  	 */
>  	DRM_COLOROP_3D_LUT,
>  };
>  
>  /**
>   * enum drm_colorop_lut3d_interpolation_type - type of 3DLUT interpolation
> - *
>   */
>  enum drm_colorop_lut3d_interpolation_type {
>  	/**
> @@ -949,6 +982,19 @@ enum drm_colorop_lut3d_interpolation_type {
>  	DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
>  };
>  
> +/**
> + * enum drm_colorop_lut1d_interpolation_type - type of interpolation for 1D LUTs
> + */
> +enum drm_colorop_lut1d_interpolation_type {
> +	/**
> +	 * @DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR:
> +	 *
> +	 * Linear interpolation. Values between points of the LUT will be
> +	 * linearly interpolated.
> +	 */
> +	DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
> +};
> +
>  /**
>   * struct drm_plane_size_hint - Plane size hints
>   * @width: The width of the plane in pixel
> @@ -1054,6 +1100,14 @@ struct hdr_output_metadata {
>   * Request that the kernel sends back a vblank event (see
>   * struct drm_event_vblank) with the &DRM_EVENT_FLIP_COMPLETE type when the
>   * page-flip is done.
> + *
> + * When used with atomic uAPI, one event will be delivered per CRTC included in
> + * the atomic commit. A CRTC is included in an atomic commit if one of its
> + * properties is set, or if a property is set on a connector or plane linked
> + * via the CRTC_ID property to the CRTC. At least one CRTC must be included,
> + * and all pulled in CRTCs must be either previously or newly powered on (in
> + * other words, a powered off CRTC which stays off cannot be included in the
> + * atomic commit).
>   */
>  #define DRM_MODE_PAGE_FLIP_EVENT 0x01
>  /**
> @@ -1150,7 +1204,7 @@ struct drm_mode_crtc_page_flip_target {
>   * struct drm_mode_create_dumb - Create a KMS dumb buffer for scanout.
>   * @height: buffer height in pixels
>   * @width: buffer width in pixels
> - * @bpp: bits per pixel
> + * @bpp: color mode
>   * @flags: must be zero
>   * @handle: buffer object handle
>   * @pitch: number of bytes between two consecutive lines
> @@ -1158,6 +1212,54 @@ struct drm_mode_crtc_page_flip_target {
>   *
>   * User-space fills @height, @width, @bpp and @flags. If the IOCTL succeeds,
>   * the kernel fills @handle, @pitch and @size.
> + *
> + * The value of @bpp is a color-mode number describing a specific format
> + * or a variant thereof. The value often corresponds to the number of bits
> + * per pixel for most modes, although there are exceptions. Each color mode
> + * maps to a DRM format plus a number of modes with similar pixel layout.
> + * Framebuffer layout is always linear.
> + *
> + * Support for all modes and formats is optional. Even if dumb-buffer
> + * creation with a certain color mode succeeds, it is not guaranteed that
> + * the DRM driver supports any of the related formats. Most drivers support
> + * a color mode of 32 with a format of DRM_FORMAT_XRGB8888 on their primary
> + * plane.
> + *
> + * +------------+------------------------+------------------------+
> + * | Color mode | Framebuffer format     | Compatible formats     |
> + * +============+========================+========================+
> + * |     32     |  * DRM_FORMAT_XRGB8888 |  * DRM_FORMAT_BGRX8888 |
> + * |            |                        |  * DRM_FORMAT_RGBX8888 |
> + * |            |                        |  * DRM_FORMAT_XBGR8888 |
> + * +------------+------------------------+------------------------+
> + * |     24     |  * DRM_FORMAT_RGB888   |  * DRM_FORMAT_BGR888   |
> + * +------------+------------------------+------------------------+
> + * |     16     |  * DRM_FORMAT_RGB565   |  * DRM_FORMAT_BGR565   |
> + * +------------+------------------------+------------------------+
> + * |     15     |  * DRM_FORMAT_XRGB1555 |  * DRM_FORMAT_BGRX1555 |
> + * |            |                        |  * DRM_FORMAT_RGBX1555 |
> + * |            |                        |  * DRM_FORMAT_XBGR1555 |
> + * +------------+------------------------+------------------------+
> + * |      8     |  * DRM_FORMAT_C8       |  * DRM_FORMAT_D8       |
> + * |            |                        |  * DRM_FORMAT_R8       |
> + * +------------+------------------------+------------------------+
> + * |      4     |  * DRM_FORMAT_C4       |  * DRM_FORMAT_D4       |
> + * |            |                        |  * DRM_FORMAT_R4       |
> + * +------------+------------------------+------------------------+
> + * |      2     |  * DRM_FORMAT_C2       |  * DRM_FORMAT_D2       |
> + * |            |                        |  * DRM_FORMAT_R2       |
> + * +------------+------------------------+------------------------+
> + * |      1     |  * DRM_FORMAT_C1       |  * DRM_FORMAT_D1       |
> + * |            |                        |  * DRM_FORMAT_R1       |
> + * +------------+------------------------+------------------------+
> + *
> + * Color modes of 10, 12, 15, 30 and 64 are only supported for use by
> + * legacy user space. Please don't use them in new code. Other modes
> + * are not support.
> + *
> + * Do not attempt to allocate anything but linear framebuffer memory
> + * with single-plane RGB data. Allocation of other framebuffer
> + * layouts requires dedicated ioctls in the respective DRM driver.
>   */
>  struct drm_mode_create_dumb {
>  	__u32 height;
> @@ -1447,6 +1549,83 @@ struct drm_mode_closefb {
>  	__u32 pad;
>  };
>  
> +/*
> + * Put 16-bit ARGB values into a standard 64-bit representation that can be
> + * used for ioctl parameters, inter-driver communication, etc.
> + *
> + * If the component values being provided contain less than 16 bits of
> + * precision, use a conversion ratio to get a better color approximation.
> + * The ratio is computed as (2^16 - 1) / (2^bpc - 1), where bpc and 16 are
> + * the input and output precision, respectively.
> + * Also note bpc must be greater than 0.
> + */
> +#define __DRM_ARGB64_PREP(c, shift)					\
> +	(((__u64)(c) & __GENMASK(15, 0)) << (shift))
> +
> +#define __DRM_ARGB64_PREP_BPC(c, shift, bpc)				\
> +({									\
> +	__u16 mask = __GENMASK((bpc) - 1, 0);				\
> +	__u16 conv = __KERNEL_DIV_ROUND_CLOSEST((mask & (c)) *		\
> +						__GENMASK(15, 0), mask);\
> +	__DRM_ARGB64_PREP(conv, shift);					\
> +})
> +
> +#define DRM_ARGB64_PREP(alpha, red, green, blue)			\
> +(									\
> +	__DRM_ARGB64_PREP(alpha, 48) |					\
> +	__DRM_ARGB64_PREP(red,   32) |					\
> +	__DRM_ARGB64_PREP(green, 16) |					\
> +	__DRM_ARGB64_PREP(blue,   0)					\
> +)
> +
> +#define DRM_ARGB64_PREP_BPC(alpha, red, green, blue, bpc)		\
> +({									\
> +	__typeof__(bpc) __bpc = bpc;					\
> +	__DRM_ARGB64_PREP_BPC(alpha, 48, __bpc) |			\
> +	__DRM_ARGB64_PREP_BPC(red,   32, __bpc) |			\
> +	__DRM_ARGB64_PREP_BPC(green, 16, __bpc) |			\
> +	__DRM_ARGB64_PREP_BPC(blue,   0, __bpc);			\
> +})
> +
> +/*
> + * Extract the specified color component from a standard 64-bit ARGB value.
> + *
> + * If the requested precision is less than 16 bits, make use of a conversion
> + * ratio calculated as (2^bpc - 1) / (2^16 - 1), where bpc and 16 are the
> + * output and input precision, respectively.
> + *
> + * If speed is more important than accuracy, use DRM_ARGB64_GET*_BPCS()
> + * instead of DRM_ARGB64_GET*_BPC() in order to replace the expensive
> + * division with a simple bit right-shift operation.
> + */
> +#define __DRM_ARGB64_GET(c, shift)					\
> +	((__u16)(((__u64)(c) >> (shift)) & __GENMASK(15, 0)))
> +
> +#define __DRM_ARGB64_GET_BPC(c, shift, bpc)				\
> +({									\
> +	__u16 comp = __DRM_ARGB64_GET(c, shift);			\
> +	__KERNEL_DIV_ROUND_CLOSEST(comp * __GENMASK((bpc) - 1, 0),	\
> +				   __GENMASK(15, 0));			\
> +})
> +
> +#define __DRM_ARGB64_GET_BPCS(c, shift, bpc)				\
> +	(__DRM_ARGB64_GET(c, shift) >> (16 - (bpc)))
> +
> +#define DRM_ARGB64_GETA(c)		__DRM_ARGB64_GET(c, 48)
> +#define DRM_ARGB64_GETR(c)		__DRM_ARGB64_GET(c, 32)
> +#define DRM_ARGB64_GETG(c)		__DRM_ARGB64_GET(c, 16)
> +#define DRM_ARGB64_GETB(c)		__DRM_ARGB64_GET(c, 0)
> +
> +#define DRM_ARGB64_GETA_BPC(c, bpc)	__DRM_ARGB64_GET_BPC(c, 48, bpc)
> +#define DRM_ARGB64_GETR_BPC(c, bpc)	__DRM_ARGB64_GET_BPC(c, 32, bpc)
> +#define DRM_ARGB64_GETG_BPC(c, bpc)	__DRM_ARGB64_GET_BPC(c, 16, bpc)
> +#define DRM_ARGB64_GETB_BPC(c, bpc)	__DRM_ARGB64_GET_BPC(c, 0, bpc)
> +
> +#define DRM_ARGB64_GETA_BPCS(c, bpc)	__DRM_ARGB64_GET_BPCS(c, 48, bpc)
> +#define DRM_ARGB64_GETR_BPCS(c, bpc)	__DRM_ARGB64_GET_BPCS(c, 32, bpc)
> +#define DRM_ARGB64_GETG_BPCS(c, bpc)	__DRM_ARGB64_GET_BPCS(c, 16, bpc)
> +#define DRM_ARGB64_GETB_BPCS(c, bpc)	__DRM_ARGB64_GET_BPCS(c, 0, bpc)
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> diff --git a/include/linux_scaffold.h b/include/linux_scaffold.h
> index 0c970c8607..d5dba8e63e 100644
> --- a/include/linux_scaffold.h
> +++ b/include/linux_scaffold.h
> @@ -47,6 +47,8 @@ static inline s64 sign_extend64(u64 value, int index)
>  	(((~_ULL(0)) - (_ULL(1) << (l)) + 1) & \
>  	(~_ULL(0) >> (BITS_PER_LONG_LONG - 1 - (h))))
>  
> +#define __GENMASK GENMASK
> +
>  #define BITS_PER_BYTE 8
>  #define BITS_PER_TYPE(t) (sizeof(t) * BITS_PER_BYTE)
>  #define BITS_PER_LONG BITS_PER_TYPE(long)
> -- 
> 2.53.0
> 
