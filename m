Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346316E1D3
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Sep 2021 11:04:43 +0000 (UTC)
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Date: Fri, 24 Sep 2021 11:04:38 +0000
Message-ID: <BY5PR11MB437293DE0C8E6CCA5807386089A49@BY5PR11MB4372.namprd11.prod.outlook.com>
References: <20210916142301.17796-1-vidya.srinivas@intel.com>
 <20210924104545.23996-1-vidya.srinivas@intel.com>
In-Reply-To: <20210924104545.23996-1-vidya.srinivas@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_multiple: Fix
 regression test_plane_position_with_output
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>, "markyacoub@google.com" <markyacoub@google.com>, "victorchengchi.lu@amd.com" <victorchengchi.lu@amd.com>, "Anson.Jacob@amd.com" <Anson.Jacob@amd.com>, "Rodrigo.Siqueira@amd.com" <Rodrigo.Siqueira@amd.com>, "B S, Karthik" <karthik.b.s@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hello Victor, Jacob, Siqueira,

Could you kindly check if this change would cause regression back on AMD?

Regards
Vidya

> -----Original Message-----
> From: Srinivas, Vidya <vidya.srinivas@intel.com>
> Sent: Friday, September 24, 2021 4:16 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>;
> markyacoub@google.com; victorchengchi.lu@amd.com;
> Anson.Jacob@amd.com; Rodrigo.Siqueira@amd.com; B S, Karthik
> <karthik.b.s@intel.com>; Srinivas, Vidya <vidya.srinivas@intel.com>
> Subject: [PATCH i-g-t] tests/kms_plane_multiple: Fix regression
> test_plane_position_with_output
>=20
> Starting commit 4d4a76729b328b65122 "Start continuous CRC capture after
> commit"
> few variants of Intel TGL and JSL devices are failing with CRC mismatch d=
ue to
> time sensitivity. Patch switches to older way of obtaining CRC, but keeps=
 in-
> tact continuous CRC collection within the iteration and includes checking=
 of
> i915 to not cause regression on non-intel devices.
>=20
> v2: Fixed review comments from Karthik.
>=20
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>  tests/kms_plane_multiple.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c inde=
x
> 45cabb500774..c11ff333ab0a 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -79,8 +79,6 @@ static void test_init(data_t *data, enum pipe pipe, int
> n_planes)
>=20
>  static void test_fini(data_t *data, igt_output_t *output, int n_planes) =
 {
> -	igt_pipe_crc_stop(data->pipe_crc);
> -
>  	/* reset the constraint on the pipe */
>  	igt_output_set_pipe(output, PIPE_ANY);
>=20
> @@ -291,7 +289,6 @@ test_plane_position_with_output(data_t *data,
> enum pipe pipe,
>  	igt_plane_t *plane;
>  	int i;
>  	int err, c =3D 0;
> -	int crc_enabled =3D 0;
>  	int iterations =3D opt.iterations < 1 ? 1 : opt.iterations;
>  	bool loop_forever;
>  	char info[256];
> @@ -334,15 +331,20 @@ test_plane_position_with_output(data_t *data,
> enum pipe pipe,
>  	i =3D 0;
>  	while (i < iterations || loop_forever) {
>  		/* randomize planes and set up the holes */
> +
> +		/* Intel devices need it here, timing sensitive on few devices
> */
> +		if (is_i915_device(data->drm_fd))
> +			igt_pipe_crc_start(data->pipe_crc);
> +
>  		prepare_planes(data, pipe, &blue, tiling, c, output);
>=20
>  		igt_display_commit2(&data->display, COMMIT_ATOMIC);
> -		if (!crc_enabled) {
> +		if (!is_i915_device(data->drm_fd))
>  			igt_pipe_crc_start(data->pipe_crc);
> -			crc_enabled =3D 1;
> -		}
>=20
>  		igt_pipe_crc_get_current(data->display.drm_fd, data-
> >pipe_crc, &crc);
> +		igt_assert_crc_equal(&data->ref_crc, &crc);
> +		igt_pipe_crc_stop(data->pipe_crc);
>=20
>  		for_each_plane_on_pipe(&data->display, pipe, plane)
>  			igt_plane_set_fb(plane, NULL);
> @@ -352,8 +354,6 @@ test_plane_position_with_output(data_t *data,
> enum pipe pipe,
>  		for (int x =3D 0; x < c; x++)
>  			igt_remove_fb(data->drm_fd, &data->fb[x]);
>=20
> -		igt_assert_crc_equal(&data->ref_crc, &crc);
> -
>  		i++;
>  	}
>=20
> --
> 2.33.0
