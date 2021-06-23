Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDEFC6E948
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jun 2021 22:56:11 +0000 (UTC)
Date: Wed, 23 Jun 2021 16:05:12 -0700
From: "Navare, Manasi" <manasi.d.navare@intel.com>
Message-ID: <20210623230512.GA30245@labuser-Z97X-UD5H>
References: <20210622102454.8922-1-venkata.sai.patnana@intel.com>
 <20210622102454.8922-4-venkata.sai.patnana@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210622102454.8922-4-venkata.sai.patnana@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/5] tests/kms_invalid_dotclock: Modify
 the test for bigjoiner
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
To: venkata.sai.patnana@intel.com
Cc: igt-dev@lists.freedesktop.org, Juha-Pekka =?iso-8859-1?Q?Heikkil=E4?= <juha-pekka.heikkila@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Please find my comments below

On Tue, Jun 22, 2021 at 03:54:53PM +0530, venkata.sai.patnana@intel.com wro=
te:
> From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> =

> Currently the test assumes that the modes with clock more than the
> maximum dot clock will be rejected. This fails in case of
> platforms that combine multiple pipes and modes higher than the
> maximum dotclock can still be supported.
> =

> This patch modifies the test to bump the clock for the given mode
> by twice if bigjoiner is supported.
> =

> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Juha-Pekka Heikkil=E4 <juha-pekka.heikkila@intel.com>
> Signed-off-by: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
> ---
>  tests/kms_invalid_dotclock.c | 34 ++++++++++++++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
> =

> diff --git a/tests/kms_invalid_dotclock.c b/tests/kms_invalid_dotclock.c
> index 402629ab..bd822fe7 100644
> --- a/tests/kms_invalid_dotclock.c
> +++ b/tests/kms_invalid_dotclock.c
> @@ -43,6 +43,25 @@ static bool has_scaling_mode_prop(data_t *data)
>  				    "scaling mode",
>  				    NULL, NULL, NULL);
>  }
> +static bool
> +can_bigjoiner(data_t *data)
> +{
> +	drmModeConnector *connector =3D data->output->config.connector;
> +	uint32_t devid =3D intel_get_drm_devid(data->drm_fd);
> +
> +	/*
> +	 * GEN11 and GEN12 require DSC to support bigjoiner.
> +	 * XELPD and later GEN support uncompressed bigjoiner.
> +	 */
> +	if (intel_display_ver(devid)) {

Shouldnt this be (intel_display_ver(devid) > 12). Currently the display ver=
 is misisng in the check

Other than this fix everything else looks good.

Manasi


> +		igt_debug("Platform supports uncompressed bigjoiner\n");
> +		return true;
> +	} else if (intel_display_ver(devid) >=3D 11) {
> +		return igt_is_dp_dsc_supported(data->drm_fd, connector);
> +	}
> +
> +	return false;
> +}
>  =

>  static int
>  test_output(data_t *data)
> @@ -70,12 +89,25 @@ test_output(data_t *data)
>  	mode =3D *igt_output_get_mode(output);
>  	mode.clock =3D data->max_dotclock + 1;
>  =

> +	/*
> +	 * Newer platforms can support modes higher than the maximum dot clock
> +	 * by using pipe joiner, so set the mode clock twice that of maximum
> +	 * dot clock;
> +	 */
> +	if (can_bigjoiner(data)) {
> +		igt_info("Platform supports bigjoiner with %s\n",
> +			  output->name);
> +		mode.clock *=3D 2;
> +	}
> +
>  	igt_create_fb(data->drm_fd,
>  		      mode.hdisplay, mode.vdisplay,
>  		      DRM_FORMAT_XRGB8888,
>  		      LOCAL_DRM_FORMAT_MOD_NONE,
>  		      &fb);
>  =

> +	kmstest_unset_all_crtcs(data->drm_fd, data->res);
> +
>  	for (i =3D 0; i < data->res->count_crtcs; i++) {
>  		int ret;
>  =

> @@ -135,8 +167,6 @@ igt_simple_main
>  	data.res =3D drmModeGetResources(data.drm_fd);
>  	igt_assert(data.res);
>  =

> -	kmstest_unset_all_crtcs(data.drm_fd, data.res);
> -
>  	data.max_dotclock =3D i915_max_dotclock(&data);
>  	igt_info("Max dotclock: %d kHz\n", data.max_dotclock);
>  =

> -- =

> 2.32.0
> =

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
