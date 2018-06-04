Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id 214436EC16
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Jun 2018 21:07:24 +0000 (UTC)
From: Eric Anholt <eric@anholt.net>
In-Reply-To: <CAKMK7uGDAj+mPskmTOynfbweY9+fGjAGeP2N_hFSm=oHfWibmA@mail.gmail.com>
References: <20180306142112.29890-1-daniel.vetter@ffwll.ch>
 <871sfuzuif.fsf@anholt.net>
 <CAKMK7uGDAj+mPskmTOynfbweY9+fGjAGeP2N_hFSm=oHfWibmA@mail.gmail.com>
Date: Mon, 04 Jun 2018 14:07:21 -0700
Message-ID: <87po161cs6.fsf@anholt.net>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] gtkdoc: Remove the build_by_default hack
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1148296694=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: IGT development <igt-dev@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1148296694==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Daniel Vetter <daniel.vetter@ffwll.ch> writes:

> On Wed, Apr 4, 2018 at 8:39 PM, Eric Anholt <eric@anholt.net> wrote:
>> Daniel Vetter <daniel.vetter@ffwll.ch> writes:
>>> meson 0.45 properly supports generated content_files. Except for the
>>> minor issue that we're hitting an internal bug in meson. I've made a
>>> pull request for that, but this needs more work:
>>>
>>> https://github.com/mesonbuild/meson/pull/3189
>>>
>>> Downside of this all is that we'd need to up the meson requirements to
>>> something like 0.46, at least if you want to build the docs.
>>
>> What's the status of this?  I just pulled this to my vc5 dev branch so
>> that builds don't take ages, and it seems to have fixed it for me.
>
> I need to revise the meson pull to include a proper regression test.
> Which I didn't find time for yet. Then we need to wait until that
> meson is released and in enough distros, and then we can merge this
> patch. As-is, with unpatched meson, this patch breaks the docs build.

Ping - the upstream PR is closed, but I can't tell if 0.46 is usable
yet.  I'm still carrying this patch in my trees so I can cross compile.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlsVqgkACgkQtdYpNtH8
nuhAwhAAjsvmWRKE7ZR1EAI7thQItzrjbnDS+Hcerkh8u5GjfOPsAKME6G7jl1/c
plSNdlzAIe/t8XiRnL+9rEo10zBYZt30JlgQ5ocOoPELNzHqOz/8o20G255z1U75
7qOK5km73p0B5nYhdATXBJ51Xrl1sFh/orQn/NX3dU9zIyxGi6/QJzOcQyR7u0w5
AvGXHltu3QYUIC8B+iFTM+sY1wVAQ+TuRbosd5RZnY6Avnoc1yQHCtzlDbMaPdVz
CLuNxjX5oCujVcxMJlp3+RiVoMidTtajuhQpejMi/QZTl89Ow5OBFZWmuHGMbWUI
kiNCooE/mURshumMwFWsT9bHxSYBbulDliTVgxFYr3eK5L9H8PuamEpguZq/8NqT
HISUj+bss4RjIObZKpYasPUnokl8msmU+FpWPLPMqAKL1tDy8TGt8/3bubfZz4Kr
IA4ndtELztwmzLamnJU3Y2HLRQc5addD942LizS2atJgVBOds8lka51umG2q5NSs
qU4gqwBNmBbom9TfAe8cnDHk0usW5clYcz80hE3n0ZPneojLezlfdY/IThP3RhH8
fprOKU84kNVq7TG0fzMSDeZ3uXAAe5ilkcWMrI1c8cq0BwCxFroK731ebuulqNUx
Dj4CGszYllVdZv0ECIZ53EwTaWKdCTLrRsGTuCX2V0Uv9dGftAQ=
=wZVJ
-----END PGP SIGNATURE-----
--=-=-=--

--===============1148296694==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1148296694==--
