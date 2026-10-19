Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23F6CCF2E3
	for <igt-dev@archiver.kernel.org>; Mon, 19 Oct 2026 11:51:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A54010EC91;
	Mon, 19 Oct 2026 11:51:20 +0000 (UTC)
Received: from coelho.fi (coelho.fi [88.99.146.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711BC10EC84
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Oct 2026 11:50:32 +0000 (UTC)
Received: from 91-152-156-14.elisa-laajakaista.fi ([91.152.156.14]
 helo=[192.168.100.138])
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.98.2) (envelope-from <luca@coelho.fi>)
 id 1xIlsr-00000004VdZ-37n1; Mon, 19 Oct 2026 14:50:31 +0300
Message-ID: <6e6da087e47e1f3182526316e508dd9e72e53bdf.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, 
 igt-dev@lists.freedesktop.org
Date: Mon, 19 Oct 2026 14:50:42 +0300
In-Reply-To: <20261015131616.3172918-6-juhapekka.heikkila@gmail.com>
References: <20261015131616.3172918-1-juhapekka.heikkila@gmail.com>
 <20261015131616.3172918-6-juhapekka.heikkila@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-10+b1 
MIME-Version: 1.0
Subject: Re: [PATCH i-g-t 6/9] tests/kms_plane_scaling: run plane-*-max-crc
 on all pipes
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
> Instead of testing only the pipe driving the highest native resolution,
> run the max scaling crc tests on every pipe that has a scaler, each with
> the valid output that has the largest native mode on that pipe.
>=20
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/kms_plane_scaling.c | 82 +++++++++++++++------------------------
>  1 file changed, 31 insertions(+), 51 deletions(-)
>=20
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 4118f0dd1..14298df3c 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -1127,7 +1127,8 @@ test_scale_max_crc(data_t *d, igt_crtc_t *crtc, igt=
_output_t *output,
>  	uint32_t format;
> =20
>  	plane =3D igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
> -	igt_require(plane);
> +	if (!plane)
> +		return;

Wouldn't it be cleaner to test this earlier and skip it as a dynamic
subtest instead of hiding this skip in here?

--
Cheers,
Luca.


> =20
>  	igt_vec_init(&tested_formats, sizeof(uint32_t));
> =20
> @@ -1768,47 +1769,42 @@ crtc_output_combo_valid(igt_display_t *display, i=
gt_crtc_t *crtc,
>  	return ret;
>  }
> =20
> -static bool
> -find_native_res_crtc_output(data_t *d, igt_crtc_t **found_crtc,
> -			    igt_output_t **found_output)
> +static igt_output_t *
> +scale_output_for_crtc(data_t *d, igt_crtc_t *crtc)
>  {
>  	igt_display_t *display =3D &d->display;
> -	igt_crtc_t *crtc;
> -	igt_output_t *output;
> +	igt_output_t *output, *best =3D NULL;
>  	uint64_t best_area =3D 0;
> =20
> -	*found_crtc =3D NULL;
> -	*found_output =3D NULL;
> -
> -	for_each_crtc_with_valid_output(display, crtc, output) {
> -		drmModeModeInfo *mode;
> -		uint64_t area;
> +	if (igt_crtc_num_scalers(crtc) < 1)
> +		return NULL;
> =20
> -		if (!crtc_output_combo_valid(display, crtc, output))
> -			continue;
> -		if (igt_crtc_num_scalers(crtc) < 1)
> -			continue;
> +	for_each_valid_output_on_crtc(display, crtc, output) {
> +		drmModeModeInfo *mode =3D &output->config.default_mode;
> +		uint64_t area =3D (uint64_t)mode->hdisplay * mode->vdisplay;
> =20
> -		mode =3D &output->config.default_mode;
> -		area =3D (uint64_t)mode->hdisplay * mode->vdisplay;
> -		if (area <=3D best_area)
> +		if (area <=3D best_area ||
> +		    !crtc_output_combo_valid(display, crtc, output))
>  			continue;
> =20
>  		best_area =3D area;
> -		*found_crtc =3D crtc;
> -		*found_output =3D output;
> +		best =3D output;
>  	}
> =20
> -	if (!*found_crtc)
> -		return false;
> +	return best;
> +}
> =20
> -	igt_debug("Selected pipe %s output %s (native mode %dx%d) for "
> -		  "max scaling testing\n",
> -		  igt_crtc_name(*found_crtc), igt_output_name(*found_output),
> -		  (*found_output)->config.default_mode.hdisplay,
> -		  (*found_output)->config.default_mode.vdisplay);
> +static void
> +test_scale_max_crc_pipes(data_t *d, uint64_t modifier, enum scale_dir di=
r)
> +{
> +	igt_crtc_t *crtc;
> =20
> -	return true;
> +	for_each_crtc(&d->display, crtc) {
> +		igt_output_t *output =3D scale_output_for_crtc(d, crtc);
> +
> +		if (output)
> +			test_scale_max_crc(d, crtc, output, modifier, dir);
> +	}
>  }
> =20
>  static int opt_handler(int opt, int opt_index, void *_data)
> @@ -2115,17 +2111,9 @@ int igt_main_args("", long_opts, help_str, opt_han=
dler, &data)
>  				     "output matches an unscaled reference using "
>  				     "CRCs.");
>  			igt_subtest_with_dynamic_f("plane-downscale-max-crc-%s",
> -						   scale_modifiers[m].name) {
> -				igt_crtc_t *sel_crtc;
> -				igt_output_t *sel_output;
> -
> -				igt_require(find_native_res_crtc_output(&data,
> -									&sel_crtc,
> -									&sel_output));
> -
> -				test_scale_max_crc(&data, sel_crtc, sel_output,
> -						   modifier, SCALE_DOWN);
> -			}
> +						   scale_modifiers[m].name)
> +				test_scale_max_crc_pipes(&data, modifier,
> +							 SCALE_DOWN);
> =20
>  			igt_describe("Probe the maximum horizontal and vertical "
>  				     "plane upscaling factor for each supported "
> @@ -2133,17 +2121,9 @@ int igt_main_args("", long_opts, help_str, opt_han=
dler, &data)
>  				     "output matches an unscaled reference using "
>  				     "CRCs.");
>  			igt_subtest_with_dynamic_f("plane-upscale-max-crc-%s",
> -						   scale_modifiers[m].name) {
> -				igt_crtc_t *sel_crtc;
> -				igt_output_t *sel_output;
> -
> -				igt_require(find_native_res_crtc_output(&data,
> -									&sel_crtc,
> -									&sel_output));
> -
> -				test_scale_max_crc(&data, sel_crtc, sel_output,
> -						   modifier, SCALE_UP);
> -			}
> +						   scale_modifiers[m].name)
> +				test_scale_max_crc_pipes(&data, modifier,
> +							 SCALE_UP);
>  		}
>  	}
> =20
