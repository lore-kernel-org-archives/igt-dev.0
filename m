Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B35D910EC4F
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jun 2022 11:06:56 +0000 (UTC)
From: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>
To: "Latvala, Petri" <petri.latvala@intel.com>
Date: Wed, 22 Jun 2022 11:06:54 +0000
Message-ID: <PH7PR11MB6006FDE4EFB19FCA6C68F478C5B29@PH7PR11MB6006.namprd11.prod.outlook.com>
References: <20220620091052.16625-1-nidhi1.gupta@intel.com>
 <20220620091052.16625-2-nidhi1.gupta@intel.com>
 <YrLjkQkSIDP2oT92@platvala-desk.ger.corp.intel.com>
In-Reply-To: <YrLjkQkSIDP2oT92@platvala-desk.ger.corp.intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] tests/kms_invalid_mode.c: Convert
 tests to dynamic
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Petri,

Thanks for the review,=20

-----Original Message-----
From: Latvala, Petri <petri.latvala@intel.com>=20
Sent: Wednesday, June 22, 2022 3:11 PM
To: Gupta, Nidhi1 <nidhi1.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org; Modem, Bhanuprakash <bhanuprakash.modem@=
intel.com>
Subject: Re: [PATCH i-g-t 1/2] tests/kms_invalid_mode.c: Convert tests to d=
ynamic

On Mon, Jun 20, 2022 at 02:40:50PM +0530, Nidhi Gupta wrote:
> Convert the existing subtests to dynamic subtests at pipe level.
>=20
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>  tests/kms_invalid_mode.c | 53=20
> +++++++++++++++++-----------------------
>  1 file changed, 23 insertions(+), 30 deletions(-)
>=20
> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c index=20
> 630798d8..3d583202 100644
> --- a/tests/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -32,6 +32,7 @@ typedef struct _data data_t;
> =20
>  struct _data {
>  	int drm_fd;
> +	enum pipe pipe;
>  	igt_display_t display;
>  	igt_output_t *output;
>  	drmModeResPtr res;
> @@ -177,21 +178,21 @@ adjust_mode_bad_vtotal(data_t *data, drmModeModeInf=
oPtr mode)
>  	return true;
>  }
> =20
> -static int
> +static void
>  test_output(data_t *data)
>  {
>  	igt_output_t *output =3D data->output;
>  	drmModeModeInfo mode;
>  	struct igt_fb fb;
> -	int i;
> +	int ret;
> +	uint32_t crtc_id;
> =20
>  	/*
>  	 * FIXME test every mode we have to be more
>  	 * sure everything is really getting rejected?
>  	 */
>  	mode =3D *igt_output_get_mode(output);
> -	if (!data->adjust_mode(data, &mode))
> -		return 0;
> +	igt_skip_on(!data->adjust_mode(data, &mode));

This may be a nitpick but prefer fail/skip constructs that don't need negat=
ion. Here that would be

igt_require(data->adjust_mode(data, &mode));


> =20
>  	igt_create_fb(data->drm_fd,
>  		      max_t(uint16_t, mode.hdisplay, 64),

Previously this fb allocation was done once for all pipes, now it's done on=
ce per pipe. What's the effect on total runtime?

Without this patch time taken was 0.001s and with this patch time taken is =
0.009s.
Full subtest execution will take 0.009s.
Overall it's a very small test.



> @@ -202,32 +203,14 @@ test_output(data_t *data)
> =20
>  	kmstest_unset_all_crtcs(data->drm_fd, data->res);
> =20
> -	for (i =3D 0; i < data->res->count_crtcs; i++) {
> -		int ret;
> -
> -		igt_info("Checking pipe %c connector %s with mode %s\n",
> -			 'A'+i, output->name, mode.name);
> +	crtc_id =3D data->display.pipes[data->pipe].crtc_id;
> =20
> -		ret =3D drmModeSetCrtc(data->drm_fd, data->res->crtcs[i],
> -				     fb.fb_id, 0, 0,
> -				     &output->id, 1, &mode);
> -		igt_assert_lt(ret, 0);
> -	}
> +	ret =3D drmModeSetCrtc(data->drm_fd, crtc_id,
> +			     fb.fb_id, 0, 0,
> +			     &output->id, 1, &mode);
> +	igt_assert_lt(ret, 0);
> =20
>  	igt_remove_fb(data->drm_fd, &fb);
> -
> -	return 1;
> -}
> -
> -static void test(data_t *data)
> -{
> -	int valid_connectors =3D 0;
> -
> -	for_each_connected_output(&data->display, data->output) {
> -		valid_connectors +=3D test_output(data);
> -	}
> -
> -	igt_require_f(valid_connectors, "No suitable connectors found\n");
>  }
> =20
>  static int i915_max_dotclock(data_t *data) @@ -297,6 +280,10 @@=20
> static data_t data;
> =20
>  igt_main
>  {
> +
> +	enum pipe pipe;
> +        igt_output_t *output;
> +

Something's off with this indentation.


--
Petri Latvala


>  	igt_fixture {
>  		data.drm_fd =3D drm_open_driver_master(DRIVER_ANY);
> =20
> @@ -311,9 +298,15 @@ igt_main
>  	}
> =20
>  	for (int i =3D 0; i < ARRAY_SIZE(subtests); i++) {
> -		igt_subtest(subtests[i].name) {
> -			data.adjust_mode =3D subtests[i].adjust_mode;
> -			test(&data);
> +		igt_subtest_with_dynamic(subtests[i].name) {
> +			for_each_pipe_with_valid_output(&data.display, pipe, output) {
> +				igt_dynamic_f("%s-pipe-%s", igt_output_name(output), kmstest_pipe_na=
me(pipe)) {
> +					data.output =3D output;
> +					data.pipe =3D pipe;
> +					data.adjust_mode =3D subtests[i].adjust_mode;
> +					test_output(&data);
> +				}
> +			}
>  		}
>  	}
> =20
> --=20
> 2.26.2
>=20
