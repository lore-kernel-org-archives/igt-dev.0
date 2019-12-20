Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBFDA6E0F0
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2019 17:12:06 +0000 (UTC)
Date: Fri, 20 Dec 2019 19:12:02 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20191220171202.GT1208@intel.com>
References: <20191220144852.14098-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191220144852.14098-1-imre.deak@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane: Disable GEN12 media
 compression YUV tests
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
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Dec 20, 2019 at 04:48:52PM +0200, Imre Deak wrote:
> The Vebox backend needed for this is not ready yet for YUV formats,
> since that needs a separate AUX pagetable setup for the Y and UV planes
> and also setting up the matching format in the Vebox tiling convert
> command surface state.
> =

> It makes sense to test the MC kernel patchset for regressions though, so
> let's disable the MC YUV tests until Vebox is able to handle those
> formats (and revert this patch when that happens and before the kernel
> patches enabling MC YUV formats get merged).
> =

> Cc: Mika Kahola <mika.kahola@intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  tests/kms_plane.c | 2 ++
>  1 file changed, 2 insertions(+)
> =

> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 9ef3a7f3..1474e265 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -595,6 +595,8 @@ static bool test_format_plane_yuv(data_t *data, enum =
pipe pipe,
>  		return true;
>  	if (!igt_plane_has_prop(plane, IGT_PLANE_COLOR_RANGE))
>  		return true;

Could use a comment perhaps so we don't forget why it's here.

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> +	if (modifier =3D=3D LOCAL_I915_FORMAT_MOD_Y_TILED_GEN12_MC_CCS)
> +		return true;
>  =

>  	for (enum igt_color_encoding e =3D 0; e < IGT_NUM_COLOR_ENCODINGS; e++)=
 {
>  		if (!igt_plane_try_prop_enum(plane,
> -- =

> 2.22.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
