Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD9D10E1B4
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Sep 2022 08:56:42 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Tue, 27 Sep 2022 08:56:38 +0000
Message-ID: <DM4PR11MB63126058DEAAF699C1907D0E90559@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20220926185321.2897136-1-kunal1.joshi@intel.com>
 <20220926185321.2897136-4-kunal1.joshi@intel.com>
In-Reply-To: <20220926185321.2897136-4-kunal1.joshi@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v1 3/5] tests/i915/kms_pwrite_crc.c:
 cleanup
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>, "Joshi,
 Kunal1" <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This test is failing please check.=20

Possible regressions
igt@kms_pwrite_crc:

shard-apl: PASS -> FAIL

shard-snb: PASS -> FAIL

shard-tglb: PASS -> FAIL

shard-glk: PASS -> FAIL

shard-iclb: PASS -> FAIL

Thanks=20
Jeevan B

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Kunal
> Joshi
> Sent: Tuesday, September 27, 2022 12:23 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Gupta, Nidhi1 <nidhi1.gupta@intel.com>; Joshi, Kunal1
> <kunal1.joshi@intel.com>
> Subject: [igt-dev] [PATCH i-g-t v1 3/5] tests/i915/kms_pwrite_crc.c: clea=
nup
>=20
> -> Sanitize the state before starting the subtest Kept all the test
> -> requirements in igt_fixture clean state with igt_display_fini before
> -> exit close drm_fd
>=20
> Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/i915/kms_pwrite_crc.c | 28 ++++++++++++++++++----------
>  1 file changed, 18 insertions(+), 10 deletions(-)
>=20
> diff --git a/tests/i915/kms_pwrite_crc.c b/tests/i915/kms_pwrite_crc.c in=
dex
> 584e6a19..b116bd62 100644
> --- a/tests/i915/kms_pwrite_crc.c
> +++ b/tests/i915/kms_pwrite_crc.c
> @@ -160,6 +160,13 @@ static void run_test(data_t *data)
>  	enum pipe pipe;
>=20
>  	for_each_pipe_with_valid_output(display, pipe, output) {
> +
> +		/*
> +		 * Reset basic pipes, connectors and planes on
> +		 * @display back to default values.
> +		 */
> +		igt_display_reset(&data->display);
> +
>  		data->output =3D output;
>  		data->pipe =3D pipe;
>=20
> @@ -178,17 +185,18 @@ static data_t data;
>=20
>  igt_simple_main
>  {
> -	data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL);
> -
> -	data.devid =3D intel_get_drm_devid(data.drm_fd);
> -
> -	kmstest_set_vt_graphics_mode();
> -
> -	igt_require_pipe_crc(data.drm_fd);
> -
> -	igt_display_require(&data.display, data.drm_fd);
> +	igt_fixture {
> +		data.drm_fd =3D drm_open_driver_master(DRIVER_INTEL);
> +		data.devid =3D intel_get_drm_devid(data.drm_fd);
> +		kmstest_set_vt_graphics_mode();
> +		igt_require_pipe_crc(data.drm_fd);
> +		igt_display_require(&data.display, data.drm_fd);
> +	}
>=20
>  	run_test(&data);
>=20
> -	igt_display_fini(&data.display);
> +	igt_fixture {
> +		igt_display_fini(&data.display);
> +		close(data.drm_fd);
> +	}
>  }
> --
> 2.25.1
