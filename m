Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF1C10E5F8
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Dec 2022 08:23:18 +0000 (UTC)
From: "B, Jeevan" <jeevan.b@intel.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Fri, 23 Dec 2022 08:23:15 +0000
Message-ID: <DM4PR11MB63125C9D17741A0DE40D06C690E99@DM4PR11MB6312.namprd11.prod.outlook.com>
References: <20221115170855.196572-1-bhanuprakash.modem@intel.com>
 <20221115170855.196572-32-bhanuprakash.modem@intel.com>
In-Reply-To: <20221115170855.196572-32-bhanuprakash.modem@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t v5 31/52] tests/kms_rotation_crc: Add support
 for Bigjoiner
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

LGTM

Reviewed-by: Jeevan B <jeevan.b@intel.com>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> Bhanuprakash Modem
> Sent: Tuesday, November 15, 2022 10:39 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [i-g-t v5 31/52] tests/kms_rotation_crc: Add support f=
or
> Bigjoiner
>=20
> This patch will add a check to Skip the subtest if a selected pipe/output
> combo won't support Bigjoiner or 8K mode.
>=20
> Example:
> * Pipe-D wont support a mode > 5K
> * To use 8K mode on a pipe then consecutive pipe must be available & free=
.
>=20
> V2: - Use updated helper name
>=20
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_rotation_crc.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c index
> 72c20d5a..295aed76 100644
> --- a/tests/kms_rotation_crc.c
> +++ b/tests/kms_rotation_crc.c
> @@ -215,6 +215,8 @@ static void prepare_crtc(data_t *data, igt_output_t
> *output, enum pipe pipe,
>  	cleanup_crtc(data);
>=20
>  	igt_output_set_pipe(output, pipe);
> +	igt_require(i915_pipe_output_combo_valid(display));
> +
>  	igt_plane_set_rotation(plane, IGT_ROTATION_0);
>=20
>  	/* create the pipe_crc object for this pipe */ @@ -479,6 +481,7 @@
> static void test_plane_rotation(data_t *data, int plane_type, bool
> test_bad_form
>  	igt_output_t *output;
>  	enum pipe pipe;
>  	int pipe_count =3D 0, connected_outputs =3D 0;
> +	bool found =3D false;
>=20
>  	if (is_amdgpu_device(data->gfx_fd))
>  		igt_require(plane_type !=3D DRM_PLANE_TYPE_OVERLAY &&
> @@ -496,6 +499,13 @@ static void test_plane_rotation(data_t *data, int
> plane_type, bool test_bad_form
>  		igt_plane_t *plane;
>  		int i, j, c;
>=20
> +		igt_display_reset(display);
> +
> +		igt_output_set_pipe(output, pipe);
> +		if (!i915_pipe_output_combo_valid(display))
> +			continue;
> +
> +		found =3D true;
>  		mode =3D igt_output_get_mode(output);
>=20
>  		/*
> @@ -586,6 +596,7 @@ static void test_plane_rotation(data_t *data, int
> plane_type, bool test_bad_form
>  			igt_pipe_crc_stop(data->pipe_crc);
>  		}
>  	}
> +	igt_require_f(found, "No valid pipe/output combo found.\n");
>  }
>=20
>  typedef struct {
> @@ -804,12 +815,22 @@ static void test_multi_plane_rotation(data_t
> *data, enum pipe pipe)
>  		{IGT_ROTATION_270, .2f, .4f, I915_FORMAT_MOD_Y_TILED },
>  		{IGT_ROTATION_270, .2f, .4f, I915_FORMAT_MOD_Yf_TILED },
>  	};
> +	bool found =3D false;
> +
> +	igt_display_require_output(display);
>=20
>  	for_each_valid_output_on_pipe(display, pipe, output) {
>  		int i, j, k, l, flipsw, fliphw;
> +
> +		igt_display_reset(display);
> +
>  		igt_output_set_pipe(output, pipe);
> +		if (!i915_pipe_output_combo_valid(display))
> +			continue;
> +
> +		found =3D true;
> +
>  		mode =3D igt_output_get_mode(output);
> -		igt_display_require_output(display);
>  		igt_display_commit2(display, COMMIT_ATOMIC);
>=20
>  		p[0].plane =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY); @@ -952,6 +973,8 @@ static void
> test_multi_plane_rotation(data_t *data, enum pipe pipe)
>  			igt_remove_fb(data->gfx_fd,
> &planeconfigs[c].fbs[d][MULTIPLANE_ROTATED]);
>  		}
>  	}
> +
> +	igt_require_f(found, "No valid pipe/output combo found.\n");
>  }
>=20
>  static void test_plane_rotation_exhaust_fences(data_t *data,
> --
> 2.38.0
