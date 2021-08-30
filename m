Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5246C89CDE
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Aug 2021 06:29:16 +0000 (UTC)
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Mon, 30 Aug 2021 06:29:12 +0000
Message-ID: <DM8PR11MB57198583300CFA8A9BFBB1398DCB9@DM8PR11MB5719.namprd11.prod.outlook.com>
References: <20210827052349.1171468-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
In-Reply-To: <20210827052349.1171468-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V2] tests/kms_setmode: Handle unsupported
 modes for invalid crtc test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Surendrakumar Upadhyay, TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Tejas
> Upadhyay
> Sent: Friday, August 27, 2021 10:54 AM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [i-g-t V2] tests/kms_setmode: Handle unsupported modes=
 for
> invalid crtc test
>=20
> Unsupported modes in crtc need to return proper error in order
> to report back that applied config was failed or not. Thus
> previously added ENOENT error but later decided to remove
> crtc_supports_mode check which is also possible solution.
>=20
> Test affected (fail -> pass after change) :
> igt@kms_setmode@invalid-clone-single-[crtc|crtc-stealing]
>=20
> invalid-clone-single-crtc-stealing still fails which is not
> related and will be handled with different follow up patch.
>=20
> Changes since V1:
> 	- Replaced previous logic with crtc_supports_mode check removal
>=20
> Signed-off-by: Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.c=
om>
> ---
>  tests/kms_setmode.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 89220b83..80665204 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -569,9 +569,6 @@ int __test_crtc_config(struct crtc_config *crtcs, int
> crtc_count,
>  	for (int i =3D 0; i < crtc->cconfs->connector->count_modes; i++) {
>  		uint32_t *ids;
>=20
> -		if (!crtc_supports_mode(crtc, &crtc->cconfs->connector->modes[i]))
> -			continue;
=20
LGTM=20
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> -
>  		crtc->mode =3D crtc->cconfs->connector->modes[i];
>=20
>  		get_crtc_config_str(crtc, str_buf[base], sizeof(str_buf[base]));
> --
> 2.31.1
