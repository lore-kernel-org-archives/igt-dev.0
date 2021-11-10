Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34EFA6F87A
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Nov 2021 08:25:22 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id bu18so4258896lfb.0
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Nov 2021 00:25:22 -0800 (PST)
Date: Wed, 10 Nov 2021 10:25:09 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
Message-ID: <20211110102509.15fc49d2@eldfell>
In-Reply-To: <j9ATssWsNa_3rHgW5tZwsfuBva61xhhN3WdTP5hdEhzJQb6CU0MAm534ns0P7Gvi-099Q37QPyNlDUtihQmGsjEhB-UHty1d4IWpSGJCpoo=@emersion.fr>
References: <20211104162742.174363-1-contact@emersion.fr>
 <5abc06ee-c974-d924-3687-59a02427b77f@amd.com>
 <j9ATssWsNa_3rHgW5tZwsfuBva61xhhN3WdTP5hdEhzJQb6CU0MAm534ns0P7Gvi-099Q37QPyNlDUtihQmGsjEhB-UHty1d4IWpSGJCpoo=@emersion.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/or_xA.LTunnGxU7ihqhl+n9";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Subject: Re: [igt-dev] [PATCH] tests/kms_plane_alpha_blend: skip coverage
 tests on missing enum
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Simon Ser <contact@emersion.fr>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--Sig_/or_xA.LTunnGxU7ihqhl+n9
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 09 Nov 2021 22:16:25 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Tuesday, November 9th, 2021 at 19:14, Harry Wentland <harry.wentland@a=
md.com> wrote:
>=20
> > On 2021-11-04 12:27, Simon Ser wrote: =20
> > > Some KMS drivers support the KMS "pixel blend mode" plane property,
> > > but don't support the "Coverage" mode. This enum entry is missing
> > > to indicate lack of support as seen in this drm_info exerpt:
> > >
> > >     "pixel blend mode": enum {None, Pre-multiplied} =3D Pre-multiplied
> > >
> > > Skip the coverage tests in this case. =20
> >
> > Is "coverage" interesting for compositors? We have the ability to do
> > pre-multiplied or coverage in HW but it's not hooked up currently. =20
>=20
> I _think_ it'll be useful with the WIP color management Wayland protocol,
> because clients will be able to submit straight (non-premult) buffers?
>=20
> CC Pekka
>=20
> (In any case, it's good to have the skip since it's not AMD-specific.)

Thanks for the cc, Simon!

Yes, Coverage is the only usable blending mode in KMS when you have
an alpha channel and you don't want to mess up the colors.
Unfortunately, one would also need plane-DEGAMMA to not mess up colors
in blending, since blending with physical coverage semantics[1] only
works with linear color values.

This is regardless of color management or not, it's just one necessary
step towards better color. If one wanted to use pre-multiplied blending
mode, the pre-multiplication would need to happen after plane-DEGAMMA
(and plane-CTM if you use that). Then it's not really
pre-multiplication, it's just the Coverage mode.

And yes, Wayland with color management extensions will encourage
applications to use straight alpha instead of pre-multiplied, because
plane-DEGAMMA on pre-multiplied values makes no sense. A compositor
will need to undo pre-multiplication before it can do anything.

[1] http://ssp.impulsetrain.com/translucency.html


Thanks,
pq

--Sig_/or_xA.LTunnGxU7ihqhl+n9
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGLgeUACgkQI1/ltBGq
qqcWyw/+JAQAdknie11qirsb6gbGcq7/vqJ35EL2X+Pj3WwYsWc4Jq06nm6IOAAj
j4PGnNwXHiGkHeZl9hBAW2uUUI2qgdvSOPnStlAW+p63CEpLaf9zaCgUTElnRHCF
CDnFsFXDs0ppje1SUXRK9Zt4o43oyedOvnFb5SWRxnY4DHRMS9DYIlMe9eXtyX5m
H2uBGH0w+dB7wKV4/tYS7jtVXD0vOtAkzvLjEI3uo+0CZuHKb6/TpzQQCcbKrlrV
Ukhnm5tUeUTkzSu0XKCavJ5Apr4NWol4VWxgAx+aPBn/uo0eT+xyMFYLe8EniT5z
lHhmWcXl857awMgRfK/m/PA+2syDFvq+XXiNOPNPYo9+v083+zAfSn+mB0Ikk9mc
vpLrh8TikKFjtJUs4MIrvhyj9djSCI1Mc4BtZI1t3oaNqoxsclel4ry/csN2NYsr
FmWFREvqIWnVyU4Fu5x0TK4M4Q0pkQmna7+INjA3RIgy1fqYoa66fsGofCPbzTbO
ko6wE+/myKp2R1opswaVLhyDgiDCODsDyeIdlIfIeClNR3HKPJ/nlk8h+Hgaysz9
gURDxof+te5jN+uvTRj/gKHUz0wz0fnTZlvXO2GqBtTEiu1QkizzXCsI9AAKRq1v
jwUbsWMrw+0Wy93JBsV3CPyrc137/e+4YLXgQTSoY8oSkwSNga4=
=wZTf
-----END PGP SIGNATURE-----

--Sig_/or_xA.LTunnGxU7ihqhl+n9--
