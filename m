Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 31 May 2021 17:17:33 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YLTv/Z8j9rCf2koN@intel.com>
References: <1622176443-12682-1-git-send-email-vidya.srinivas@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1622176443-12682-1-git-send-email-vidya.srinivas@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] [RFC] tests/kms_prime: Aligned pitch to
 64 byte for Intel platforms
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
To: Vidya Srinivas <vidya.srinivas@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, charlton.lin@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, May 28, 2021 at 10:04:03AM +0530, Vidya Srinivas wrote:
> For Intel platforms, pitch needs to be 64 byte aligned.
> Kernel code vgem_gem_dumb_create which is platform generic code
> doesnt do the alignment. This causes frame buffer creation to fail
> on Intel platforms where the pitch is not 64 byte aligned.
> =

> tests: test run on Intel platforms with panel resolution 1366x768
> =

> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>  tests/kms_prime.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> =

> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
> index 8cb2ca2a9dc3..fdc941fe8100 100644
> --- a/tests/kms_prime.c
> +++ b/tests/kms_prime.c
> @@ -51,6 +51,8 @@ static struct {
>  	{ .r =3D 1.0, .g =3D 0.0, .b =3D 0.0, .color =3D 0xffff0000 },
>  };
>  =

> +bool check_platform;
> +
>  IGT_TEST_DESCRIPTION("Prime tests, focusing on KMS side");
>  =

>  static bool has_prime_import(int fd)
> @@ -101,7 +103,7 @@ static void prepare_scratch(int exporter_fd, struct d=
umb_bo *scratch,
>  	scratch->bpp =3D 32;
>  =

>  	scratch->handle =3D kmstest_dumb_create(exporter_fd,
> -			scratch->width,
> +			check_platform? ALIGN(scratch->width, 64): scratch->width,

The dumb_create ioctl already does this for us.

>  			scratch->height,
>  			scratch->bpp,
>  			&scratch->pitch,
> @@ -262,6 +264,7 @@ igt_main
>  =

>  		/* ANY =3D anything that is not VGEM */
>  		first_fd =3D __drm_open_driver_another(0, DRIVER_ANY | DRIVER_VGEM);
> +		check_platform =3D is_i915_device(first_fd);
>  		igt_require(first_fd >=3D 0);
>  =

>  		second_fd =3D __drm_open_driver_another(1, DRIVER_ANY | DRIVER_VGEM);
> -- =

> 2.7.4
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
