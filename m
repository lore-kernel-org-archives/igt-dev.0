Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id 552346E0D8
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Jun 2018 16:43:27 +0000 (UTC)
From: Eric Anholt <eric@anholt.net>
In-Reply-To: <20180618154945.GH22478@phenom.ffwll.local>
References: <20180306142112.29890-1-daniel.vetter@ffwll.ch>
 <871sfuzuif.fsf@anholt.net>
 <CAKMK7uGDAj+mPskmTOynfbweY9+fGjAGeP2N_hFSm=oHfWibmA@mail.gmail.com>
 <87po161cs6.fsf@anholt.net> <20180618154945.GH22478@phenom.ffwll.local>
Date: Mon, 18 Jun 2018 09:43:24 -0700
Message-ID: <871sd43v0z.fsf@anholt.net>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] gtkdoc: Remove the build_by_default hack
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1411142608=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: IGT development <igt-dev@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1411142608==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Daniel Vetter <daniel@ffwll.ch> writes:

> On Mon, Jun 04, 2018 at 02:07:21PM -0700, Eric Anholt wrote:
>> Daniel Vetter <daniel.vetter@ffwll.ch> writes:
>>=20
>> > On Wed, Apr 4, 2018 at 8:39 PM, Eric Anholt <eric@anholt.net> wrote:
>> >> Daniel Vetter <daniel.vetter@ffwll.ch> writes:
>> >>> meson 0.45 properly supports generated content_files. Except for the
>> >>> minor issue that we're hitting an internal bug in meson. I've made a
>> >>> pull request for that, but this needs more work:
>> >>>
>> >>> https://github.com/mesonbuild/meson/pull/3189
>> >>>
>> >>> Downside of this all is that we'd need to up the meson requirements =
to
>> >>> something like 0.46, at least if you want to build the docs.
>> >>
>> >> What's the status of this?  I just pulled this to my vc5 dev branch so
>> >> that builds don't take ages, and it seems to have fixed it for me.
>> >
>> > I need to revise the meson pull to include a proper regression test.
>> > Which I didn't find time for yet. Then we need to wait until that
>> > meson is released and in enough distros, and then we can merge this
>> > patch. As-is, with unpatched meson, this patch breaks the docs build.
>>=20
>> Ping - the upstream PR is closed, but I can't tell if 0.46 is usable
>> yet.  I'm still carrying this patch in my trees so I can cross compile.
>
> Sry I dropped the ball on this completely, and somehow also didn't see the
> update that my github pull request got closed.
>
> The fix indeed works, but it's not even yet in a released version of
> meson, only in 0.47-dev. Bit aggressive to require that from developers
> and CI ...
>
> I'll resend the patch meanwhile with those bits updated.

Thanks, I guess I can put up with a bit more out of tree.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlsn4SwACgkQtdYpNtH8
nuhlShAAjVbs1Qt9BkebEyW4r8Hic3/5j/eQa8bTjocKOCu7K4q6JBv/46bAw8nh
SXSrdthgxQc0tTfAqb7Q6zsgpflDbtzPPU7NEYCwsfM7BDRaAlV0VtzjUyGBw0/r
UQ0lpxBgkEtaBWhoM8HjwxG3kH7/q72WhA0gkk/X2UIevaOY28Zp3cHPuArdKPZa
iqB6Gv7nI4a7F9GnDjY9tLfa+Tv5d6WAotHTQvkIhA8vHbdoUKfGbEFuzs5UDfIa
jdC6graNmuvjpd9w6z+bNacVAxZrUo5JJ3Z10dK47hWshfA0n4xg+RaBgV6XE8xm
l9JXQYfEc2MZ2zMYViRtm1zj43xjwXp52tMsmM852GFuRHutn0mfw+9jgTlrLvBR
pkZPmYIWabKi0uXiK56KTY6fqVBYeepFAzL75RRVil0pL82Gpt8mLhWqoGYERbN0
IECTMyDnC1atf9ZARzVu8Txt5mtnavFOjs/Ol8PA+Y8r6d3M5XCyEXSbJzpObKuC
U7GdTOzwfgrLui7mU/lN0YDFPosr4SOm/PR2wSYr18eUZt6Z9iRHO/Sfp6Fnb7X/
NTJr9T3albT0jyF/h/5xiC78tBv3xID7nNP1DnmuSlMnYhcSGRtXmT999BkyMBNP
WYLW64qOkkF4xpPREOV8sxi3k4wtTXPvQaf8bJeBOvkJTZcz7Sk=
=HvLs
-----END PGP SIGNATURE-----
--=-=-=--

--===============1411142608==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1411142608==--
