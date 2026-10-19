Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43EF4CCF2D3
	for <igt-dev@archiver.kernel.org>; Mon, 19 Oct 2026 11:33:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB1D710EAFE;
	Mon, 19 Oct 2026 11:33:32 +0000 (UTC)
X-Greylist: delayed 493 seconds by postgrey-1.36 at gabe;
 Mon, 19 Oct 2026 11:32:44 UTC
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13AD10EAE2
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Oct 2026 11:32:44 +0000 (UTC)
Received: from 91-152-156-14.elisa-laajakaista.fi ([91.152.156.14]
 helo=[192.168.100.138])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1xIlbV-00000004VYg-3Fj5; Mon, 19 Oct 2026 14:32:43 +0300
Message-ID: <4f2439075ba43ec2e1062f8342f61cd9e3235266.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 igt-dev@lists.freedesktop.org
Date: Mon, 19 Oct 2026 14:32:46 +0300
In-Reply-To: <20261015131616.3172918-2-juhapekka.heikkila@gmail.com>
References: <20261015131616.3172918-1-juhapekka.heikkila@gmail.com>
 <20261015131616.3172918-2-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t 2/9] tests/kms_plane_scaling: add search for
 scaling limit
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
> add find_max_downscale_src_size() function to do search
> for largest accepted scaled size for given plane size
>=20
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/kms_plane_scaling.c | 81 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
>=20
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 091b8114e..41f56a5ed 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -709,6 +709,87 @@ static const uint64_t modifiers[] =3D {
>  	I915_FORMAT_MOD_4_TILED
>  };
> =20
> +static int
> +find_max_downscale_src_size(data_t *d, igt_plane_t *plane,
> +			    uint32_t format, uint64_t modifier,
> +			    bool scale_width, int dst_w, int dst_h,
> +			    int align)
> +{
> +	igt_display_t *display =3D &d->display;
> +	struct igt_fb probe_fb =3D {};
> +	drmModeRes *res;
> +	int fixed =3D scale_width ? dst_h : dst_w;
> +	int dst =3D scale_width ? dst_w : dst_h;
> +	int fb_cap;
> +	int lo, hi, best;
> +	int ret;
> +
> +	igt_assert(align >=3D 1);
> +
> +	res =3D drmModeGetResources(display->drm_fd);
> +	igt_assert(res);
> +	fb_cap =3D ALIGN_DOWN(scale_width ? res->max_width : res->max_height, a=
lign);
> +	drmModeFreeResources(res);
> +
> +	igt_create_fb(display->drm_fd,
> +		      scale_width ? fb_cap : fixed,
> +		      scale_width ? fixed : fb_cap,
> +		      format, modifier, &probe_fb);
> +
> +	igt_plane_set_fb(plane, &probe_fb);
> +	igt_plane_set_position(plane, 0, 0);
> +	igt_plane_set_size(plane, dst_w, dst_h);
> +
> +	/* Baseline: the unscaled 1:1 source must be accepted. */
> +	best =3D ALIGN(dst, align);
> +	igt_fb_set_position(&probe_fb, plane, 0, 0);
> +	igt_fb_set_size(&probe_fb, plane,
> +			scale_width ? best : fixed,
> +			scale_width ? fixed : best);
> +	ret =3D igt_display_try_commit_atomic(display,
> +					    DRM_MODE_ATOMIC_TEST_ONLY |
> +					    DRM_MODE_ATOMIC_ALLOW_MODESET,
> +					    NULL);
> +	if (ret) {
> +		igt_debug("Unscaled %dx%d source rejected (ret=3D%d)\n",
> +			  scale_width ? best : fixed,
> +			  scale_width ? fixed : best, ret);
> +		igt_plane_set_fb(plane, NULL);
> +		igt_remove_fb(display->drm_fd, &probe_fb);
> +		return ret;
> +	}
> +
> +	lo =3D best + align;
> +	hi =3D fb_cap;
> +	while (lo <=3D hi) {
> +		int mid =3D ALIGN_DOWN(lo + (hi - lo) / 2, align);
> +
> +		igt_fb_set_position(&probe_fb, plane, 0, 0);
> +		igt_fb_set_size(&probe_fb, plane,
> +				scale_width ? mid : fixed,
> +				scale_width ? fixed : mid);
> +
> +		ret =3D igt_display_try_commit_atomic(display,
> +						    DRM_MODE_ATOMIC_TEST_ONLY |
> +						    DRM_MODE_ATOMIC_ALLOW_MODESET,
> +						    NULL);
> +		if (ret =3D=3D 0) {
> +			best =3D mid;
> +			lo =3D mid + align;
> +		} else {
> +			hi =3D mid - align;
> +		}
> +	}
> +
> +	igt_debug("Max downscale source %s for dst %dx%d: %d (fixed axis %d)\n"=
,
> +		  scale_width ? "width" : "height", dst_w, dst_h, best, fixed);
> +
> +	igt_plane_set_fb(plane, NULL);
> +	igt_remove_fb(display->drm_fd, &probe_fb);
> +
> +	return best;
> +}
> +
>  static uint32_t
>  test_scaler_with_modifier_crtc(data_t *d,
>  			       double sf_plane,

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
