Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02EF6E955
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jul 2021 19:09:07 +0000 (UTC)
Date: Thu, 8 Jul 2021 22:09:00 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YOdNTDxptcNCTVDg@intel.com>
References: <20210707200346.1731702-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210707200346.1731702-1-markyacoub@chromium.org>
Subject: Re: [igt-dev] [PATCH] tests/kms_addfb_basic: Test addfb2 with
 DRM_FORMAT_C8 only if supported.
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
To: Mark Yacoub <markyacoub@chromium.org>
Cc: igt-dev@lists.freedesktop.org, seanpaul@chromium.org, petri.latvala@intel.com, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jul 07, 2021 at 04:03:46PM -0400, Mark Yacoub wrote:
> From: Mark Yacoub <markyacoub@google.com>
> =

> [Why]
> Some devices such as Trogdor do not support DRM_FORMAT_C8 pixel format.
> Skip any addfb2 test on such devices that is expected to succeed such as
> subtest size-max.
> =

> [How]
> Only run the check on devices with DRM_FORMAT_C8 support
> =

> Tested on Trogdor.
> =

> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  tests/kms_addfb_basic.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> =

> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> index 91fb6ac9..20597b69 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -411,6 +411,7 @@ static void size_tests(int fd)
>  	struct drm_mode_fb_cmd2 f_8 =3D {};
>  	struct drm_mode_fb_cmd2 *framebuffers[] =3D {&f, &f_16, &f_8};
>  	int i;
> +	bool is_c8_format_supported =3D !is_msm_device(fd);

There is a igt_display_has_format_mod()

>  =

>  	f.width =3D 1024;
>  	f.height =3D 1024;
> @@ -440,17 +441,19 @@ static void size_tests(int fd)
>  	f_16.handles[0] =3D gem_bo;
>  	f_8.handles[0] =3D gem_bo;
>  =

> -	igt_describe("Check if addfb2 call works with max size of  buffer objec=
t");
> +	igt_describe("Check if addfb2 call works with max size of buffer object=
");
>  	igt_subtest("size-max") {
>  		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f) =3D=3D 0);
>  		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f.fb_id) =3D=3D 0);
>  		f.fb_id =3D 0;
>  		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f_16) =3D=3D 0);
>  		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f_16.fb_id) =3D=3D 0);
> -		f.fb_id =3D 0;
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f_8) =3D=3D 0);
> -		igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f_8.fb_id) =3D=3D 0);
> -		f.fb_id =3D 0;
> +		f_16.fb_id =3D 0;
> +		if (is_c8_format_supported) {
> +			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_ADDFB2, &f_8) =3D=3D 0);
> +			igt_assert(drmIoctl(fd, DRM_IOCTL_MODE_RMFB, &f_8.fb_id) =3D=3D 0);
> +			f_8.fb_id =3D 0;
> +		}
>  	}
>  =

>  	f.width++;
> -- =

> 2.32.0.93.g670b81a890-goog
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
