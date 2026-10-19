Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4040CCCF2D6
	for <igt-dev@archiver.kernel.org>; Mon, 19 Oct 2026 11:52:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E035D10E5E4;
	Mon, 19 Oct 2026 11:52:09 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3B2F10EC83
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Oct 2026 11:50:58 +0000 (UTC)
Received: from 91-152-156-14.elisa-laajakaista.fi ([91.152.156.14]
 helo=[192.168.100.138])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1xIlTU-00000004VY9-0EPw; Mon, 19 Oct 2026 14:24:28 +0300
Message-ID: <7610cab7027015a52485901ef4cbbcc8d69aeb0d.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 igt-dev@lists.freedesktop.org
Date: Mon, 19 Oct 2026 14:24:28 +0300
In-Reply-To: <20261015131616.3172918-1-juhapekka.heikkila@gmail.com>
References: <20261015131616.3172918-1-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t 1/9] lib/igt_fb: add igt_format_get_subsampling()
 function
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

On Thu, 2026-10-15 at 16:16 +0300, Juha-Pekka Heikkila wrote:
> add function to query given pixel format hsub and vsub
> parameters.
>=20
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  lib/igt_fb.c | 22 ++++++++++++++++++++++
>  lib/igt_fb.h |  1 +
>  2 files changed, 23 insertions(+)
>=20
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 6c3b9b0b9..3d15f0595 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -5300,6 +5300,28 @@ int igt_format_plane_bpp(uint32_t drm_format, int =
plane)
>  	return format->plane_bpp[plane];
>  }
> =20
> +/**
> + * igt_format_get_subsampling:
> + * @drm_format: drm fourcc
> + * @hsub: chroma subsampling factor in the horizontal direction (out)
> + * @vsub: chroma subsampling factor in the vertical direction (out)
> + *
> + * This function returns the chroma subsampling factors of the @drm_form=
at.
> + * For non-subsampled (e.g. RGB or 4:4:4 YUV) formats both factors are 1=
.
> + */
> +void igt_format_get_subsampling(uint32_t drm_format, int *hsub, int *vsu=
b)
> +{
> +	const struct format_desc_struct *format =3D
> +		lookup_drm_format(drm_format);
> +
> +	igt_assert(format);
> +
> +	if (hsub)
> +		*hsub =3D format->hsub;
> +	if (vsub)
> +		*vsub =3D format->vsub;
> +}
> +
>  /**
>   * igt_format_array_fill:
>   * @formats_array: a pointer to the formats array pointer to be allocate=
d
> diff --git a/lib/igt_fb.h b/lib/igt_fb.h
> index 213e2d777..4562164df 100644
> --- a/lib/igt_fb.h
> +++ b/lib/igt_fb.h
> @@ -237,6 +237,7 @@ uint32_t igt_drm_format_str_to_format(const char *drm=
_format);
> =20
>  bool igt_format_is_fp16(uint32_t drm_format);
>  int igt_format_plane_bpp(uint32_t drm_format, int plane);
> +void igt_format_get_subsampling(uint32_t drm_format, int *hsub, int *vsu=
b);
>  void igt_format_array_fill(uint32_t **formats_array, unsigned int *count=
,
>  			   bool allow_yuv);
>  int igt_fill_cts_color_ramp_framebuffer(uint32_t *pixmap, uint32_t video=
_width,

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
