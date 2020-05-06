Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0BC38984E
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2020 22:56:52 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id f13so4076821qkh.2
 for <igt-dev@lists.freedesktop.org>; Wed, 06 May 2020 15:56:52 -0700 (PDT)
Date: Wed, 6 May 2020 18:56:48 -0400
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <20200506225648.caze2q3brlmkmknx@smtp.gmail.com>
References: <20200424012605.2279679-1-rodrigosiqueiramelo@gmail.com>
 <158769307213.10802.8234685696201811102@emeril.freedesktop.org>
 <20200504115659.bdp7faed46cfalux@ahiler-desk1.fi.intel.com>
MIME-Version: 1.0
In-Reply-To: <20200504115659.bdp7faed46cfalux@ahiler-desk1.fi.intel.com>
Subject: Re: [igt-dev]
 =?utf-8?q?=E2=9C=97_GitLab=2EPipeline=3A_failure_for_A?=
 =?utf-8?q?dd_support_for_testing_writeback_connectors_=28rev2=29?=
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0010406443=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============0010406443==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aay67kvb7jm6kcpg"
Content-Disposition: inline


--aay67kvb7jm6kcpg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 05/04, Arkadiusz Hiler wrote:
> On Fri, Apr 24, 2020 at 01:51:12AM +0000, Patchwork wrote:
> > =3D=3D Series Details =3D=3D
> >=20
> > Series: Add support for testing writeback connectors (rev2)
> > URL   : https://patchwork.freedesktop.org/series/68352/
> > State : failure
> >=20
> > =3D=3D Summary =3D=3D
> >=20
> > ERROR! This series introduces new undocumented tests:
> >=20
> > kms_writeback
> >=20
> > Can you document them as per the requirement in the [CONTRIBUTING.md]?
> >=20
> > [Documentation] has more details on how to do this.
> >=20
> > Here are few examples:
> > https://gitlab.freedesktop.org/drm/igt-gpu-tools/commit/0316695d03aa461=
08296b27f3982ec93200c7a6e
> > https://gitlab.freedesktop.org/drm/igt-gpu-tools/commit/443cc658e1e6b49=
2ee17bf4f4d891029eb7a205d
> >=20
> > Thanks in advance!
> >=20
> > [CONTRIBUTING.md]: https://gitlab.freedesktop.org/drm/igt-gpu-tools/blo=
b/master/CONTRIBUTING.md#L19
> > [Documentation]: https://drm.pages.freedesktop.org/igt-gpu-tools/igt-gp=
u-tools-Core.html#igt-describe
>=20
> Hey Rodrigo,
>=20
> Can you add short test descriptions as explained above?

Hi Arek,

I'm going to add a brief description in the next version. Now, I'm
trying to understand why this series breaks read_all_entries_display_off
and read_all_entries_display_on on i915.

Best Regards

> --=20
> Cheers,
> Arek

--=20
Rodrigo Siqueira
https://siqueira.tech

--aay67kvb7jm6kcpg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl6zQKsACgkQWJzP/com
vP+n7xAAv/01Kl2YtUNy2PHNCucGbUZIhPDwXL6/XyUAHZF4Rf2Lycei3W4hXlzv
+ioWdMMurKUgZEI0+ySMJ+gQ9NcyrwEc4I+ZYXEvweYwBQKrLdUyniM1KrVPRnxz
EWbI73pjPldxMHB41a9VqYkv77kzo+O3v/+rZ3fgpOiTsgjt1338ISErXrucH1Ce
Q2+n/qPHluPia1xXaYtJSaLLHKgqjtO12Jd9MpDoCVvmeNpk+Mih+ZERVenJxEM5
cdfjffUqKNIb3uN9Vr4cVDnDzEOa+w2qS0YNnX9142t5K+tO8URmtT01hcGea/33
14jMSDMr7i4xuv9XL8wmdnAggdqN6WX+SWOHGFXeJ2+71v9oqZsWBYnjqcpsalwf
u8ZaJ7y2l7ySHphs8acdzxJorqM7BL/MKdR2JGyCGsO1c/bo/w5Y2dl4WgLtTCbF
nYGNOTdNzFvKVdef1cLSU99T68z06ZCtn8JHXdtCcTJbdJ5x5L5q42lC4q7oD4oI
e3dV8/hCdb8RC6PGX8k7a7+IOgpSmVa4EFL+K+9qsuYX12AaKKy2Op0aAUuYGYEQ
7z/XneKnxoSuJycU2w2ErqPPMJ7iXWYCXoREGwQhO+j9aXQivfnnXor3pnuvf6LC
jcEJRXURLubmxvf/lIRFJJSWk+yvfF7iTxF1n/Xu3uJyGnCkcGs=
=PM2r
-----END PGP SIGNATURE-----

--aay67kvb7jm6kcpg--

--===============0010406443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0010406443==--
