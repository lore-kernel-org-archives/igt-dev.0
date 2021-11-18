Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 18 Nov 2021 11:34:45 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
Message-ID: <20211118113445.01ef2b9e@eldfell>
In-Reply-To: <20211115094759.520955-12-bhanuprakash.modem@intel.com>
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
 <20211115094759.520955-12-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/1/RV9MD+CJj5=9Y4S6eTyuF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Subject: Re: [igt-dev] [i-g-t 11/14] lib/igt_kms: Add pipe color mgmt
 properties
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org, Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>, dri-devel@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--Sig_/1/RV9MD+CJj5=9Y4S6eTyuF
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Nov 2021 15:17:56 +0530
Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:

> From: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>
>=20
> Add support for Pipe color management properties.

The commit summary and message are misleading.

This patch makes igt recognise the CRTC GAMMA_MODE KMS property.


Thanks,
pq

>=20
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Mukunda Pramodh Kumar <mukunda.pramodh.kumar@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  lib/igt_kms.c | 1 +
>  lib/igt_kms.h | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index fdb83e0f91..677d26fedb 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -592,6 +592,7 @@ const char * const igt_crtc_prop_names[IGT_NUM_CRTC_P=
ROPS] =3D {
>  	[IGT_CRTC_CTM] =3D "CTM",
>  	[IGT_CRTC_GAMMA_LUT] =3D "GAMMA_LUT",
>  	[IGT_CRTC_GAMMA_LUT_SIZE] =3D "GAMMA_LUT_SIZE",
> +	[IGT_CRTC_GAMMA_MODE] =3D "GAMMA_MODE",
>  	[IGT_CRTC_DEGAMMA_LUT] =3D "DEGAMMA_LUT",
>  	[IGT_CRTC_DEGAMMA_LUT_SIZE] =3D "DEGAMMA_LUT_SIZE",
>  	[IGT_CRTC_MODE_ID] =3D "MODE_ID",
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 3a1f7243ad..5fac651fa3 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -119,6 +119,7 @@ enum igt_atomic_crtc_properties {
>         IGT_CRTC_CTM =3D 0,
>         IGT_CRTC_GAMMA_LUT,
>         IGT_CRTC_GAMMA_LUT_SIZE,
> +       IGT_CRTC_GAMMA_MODE,
>         IGT_CRTC_DEGAMMA_LUT,
>         IGT_CRTC_DEGAMMA_LUT_SIZE,
>         IGT_CRTC_MODE_ID,


--Sig_/1/RV9MD+CJj5=9Y4S6eTyuF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGWHjUACgkQI1/ltBGq
qqeNDg//SBWGCv6eEhezNgg2Jnio8j7nnT0pZ/jdUq77I2ZRV4eWDxPeBof3u8jl
RsqU1RT5MTmnAyrOn0gw1kjNut3RVF79apEMKwTNGG673KN9ZcwuQ9E3aUsUEfaS
l6SnftZzPrFwzzmAgqf5KAvpwk8UuzhSIdCB+g3cclxQW7qIlwht9X7t2altrLat
99EOTSa2IWeiqvJTv+WZZ/yQ3hyUYnyzIg5cTqcLfSSnBrNpCLMLdY8behF7yqIj
ZpNO6lS89gBk/X8iCnMx78FzYzlZibWhxBv0ADINs/9+owjakf5JbHSbBGbjxwoA
CrpoKESXV8Axw7Wns/wwmDc505OKFafLWovuqxWe3alPF2zwM7J8IoSJ329v5IPf
o5fQyf34C7DGAJsmqLtyGJjCV9gGk6OI3LUdc1vAuUHKcF8d7BIeBs7/v29F4vJT
whuIjcqW2pIOvuJOholNK3LCJYYMjkh0vIwMAJkl+PmZdXQcfx0d3njUF/WLf/AI
q6GdO7o+tb0i0jygUhjKePmrTK6vYsTIcfzfLwi9j1YyCwoCDWiM6dTw6sWgcF6f
Jk002LWBXWnz/R1nyN1iUEuOWXphLeSzOM8ddnq6ODkDygx+ngcqWpv71K9VEGXQ
p85pEgA29IfvD30kJOCGQx/WVaPx0+lO3+2kI/cVNb6mDaSutEA=
=BZCY
-----END PGP SIGNATURE-----

--Sig_/1/RV9MD+CJj5=9Y4S6eTyuF--
