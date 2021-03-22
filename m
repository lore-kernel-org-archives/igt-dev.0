Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F9E86E4F4
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Mar 2021 15:35:07 +0000 (UTC)
Date: Mon, 22 Mar 2021 17:35:03 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YFi5Jxw5+yNvlEZB@intel.com>
References: <20210322152659.2731-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210322152659.2731-1-juhapekka.heikkila@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_addfb_basic: simplify
 addfb25_ytile tests
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Mar 22, 2021 at 05:26:58PM +0200, Juha-Pekka Heikkila wrote:
> use igt_display_has_format_mod(..) to test if tile supported
> or no.
> =

> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/kms_addfb_basic.c | 31 ++++++++++++-------------------
>  1 file changed, 12 insertions(+), 19 deletions(-)
> =

> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> index 1302b1c7b..1fb18d668 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -581,26 +581,20 @@ static void addfb25_tests(int fd)
>  		gem_close(fd, gem_bo);
>  }
>  =

> -static int addfb_expected_ret(int fd, uint64_t modifier)
> +static int addfb_expected_ret(igt_display_t *display, struct local_drm_m=
ode_fb_cmd2 *f)
>  {
> -	int gen;
> -
> -	if (!is_i915_device(fd))
> -		return 0;
> -
> -	gen =3D intel_gen(intel_get_drm_devid(fd));
> -
> -	if (modifier =3D=3D LOCAL_I915_FORMAT_MOD_Yf_TILED)
> -		return gen >=3D 9 && gen < 12 ? 0 : -1;
> -	return gen >=3D 9 ? 0 : -1;
> +	return igt_display_has_format_mod(display, f->pixel_format,
> +					  f->modifier[0]) ? 0 : -1;

lgtm

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

>  }
>  =

>  static void addfb25_ytile(int fd)
>  {
>  	struct local_drm_mode_fb_cmd2 f =3D {};
> -	int gen;
> +	igt_display_t display;
>  =

>  	igt_fixture {
> +		igt_display_require(&display, fd);
> +
>  		gem_bo =3D igt_create_bo_with_dimensions(fd, 1024, 1024,
>  			DRM_FORMAT_XRGB8888, 0, 0, NULL, NULL, NULL);
>  		igt_assert(gem_bo);
> @@ -627,8 +621,8 @@ static void addfb25_ytile(int fd)
>  =

>  		f.modifier[0] =3D LOCAL_I915_FORMAT_MOD_Y_TILED;
>  		igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) =3D=3D
> -			   addfb_expected_ret(fd, f.modifier[0]));
> -		if (!addfb_expected_ret(fd, f.modifier[0]))
> +			   addfb_expected_ret(&display, &f));
> +		if (!addfb_expected_ret(&display, &f))
>  			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) =3D=3D 0);
>  		f.fb_id =3D 0;
>  	}
> @@ -640,8 +634,8 @@ static void addfb25_ytile(int fd)
>  =

>  		f.modifier[0] =3D LOCAL_I915_FORMAT_MOD_Yf_TILED;
>  		igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) =3D=3D
> -			   addfb_expected_ret(fd, f.modifier[0]));
> -		if (!addfb_expected_ret(fd, f.modifier[0]))
> +			   addfb_expected_ret(&display, &f));
> +		if (!addfb_expected_ret(&display, &f))
>  			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) =3D=3D 0);
>  		f.fb_id =3D 0;
>  	}
> @@ -651,12 +645,10 @@ static void addfb25_ytile(int fd)
>  		igt_require_fb_modifiers(fd);
>  		igt_require_intel(fd);
>  =

> -		gen =3D intel_gen(intel_get_drm_devid(fd));
> -		igt_require(gen >=3D 9);
> -
>  		f.modifier[0] =3D LOCAL_I915_FORMAT_MOD_Y_TILED;
>  		f.height =3D 1023;
>  		f.handles[0] =3D gem_bo_small;
> +		igt_require(addfb_expected_ret(&display, &f) =3D=3D 0);
>  		igt_assert(drmIoctl(fd, LOCAL_DRM_IOCTL_MODE_ADDFB2, &f) < 0 && errno =
=3D=3D EINVAL);
>  		f.fb_id =3D 0;
>  	}
> @@ -664,6 +656,7 @@ static void addfb25_ytile(int fd)
>  	igt_fixture {
>  		gem_close(fd, gem_bo);
>  		gem_close(fd, gem_bo_small);
> +		igt_display_fini(&display);
>  	}
>  }
>  =

> -- =

> 2.28.0
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
