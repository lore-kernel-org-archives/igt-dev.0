Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A472310E092
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Dec 2022 05:44:57 +0000 (UTC)
From: "Shankar, Uma" <uma.shankar@intel.com>
To: Rob Clark <robdclark@gmail.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Mon, 12 Dec 2022 05:44:47 +0000
Message-ID: <DM4PR11MB63606BBA1637051037C5C2AEF4E29@DM4PR11MB6360.namprd11.prod.outlook.com>
References: <20221211195213.120336-1-robdclark@gmail.com>
In-Reply-To: <20221211195213.120336-1-robdclark@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH igt] tests/kms_color: Gamma tests should
 require hw support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Rob Cl=
ark
> Sent: Monday, December 12, 2022 1:22 AM
> To: igt-dev@lists.freedesktop.org
> Cc: Rob Clark <robdclark@chromium.org>
> Subject: [igt-dev] [PATCH igt] tests/kms_color: Gamma tests should requir=
e hw
> support
>=20
> From: Rob Clark <robdclark@chromium.org>
>=20
> Some qcom devices support CTM but not gamma/degamma LUT.
>=20
> Note, the remaining failures on msm are due to CTM being supported on one=
 CRTC
> but not the other.  But the property is exposed on both.

Looks good to me.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  tests/kms_color.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/tests/kms_color.c b/tests/kms_color.c index d016cefb..cf9c27=
fe 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -230,6 +230,8 @@ static bool test_pipe_legacy_gamma(data_t *data,
>  	legacy_lut_size =3D kms_crtc->gamma_size;
>  	drmModeFreeCrtc(kms_crtc);
>=20
> +	igt_require(legacy_lut_size > 0);
> +
>  	red_lut =3D malloc(sizeof(uint16_t) * legacy_lut_size);
>  	green_lut =3D malloc(sizeof(uint16_t) * legacy_lut_size);
>  	blue_lut =3D malloc(sizeof(uint16_t) * legacy_lut_size);
> --
> 2.38.1
