Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id DF7CE6E4AA
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Aug 2018 21:31:52 +0000 (UTC)
From: Eric Anholt <eric@anholt.net>
In-Reply-To: <2758e622f4a05d69f984bb3439af49823f43d4fc.1532596850.git-series.maxime.ripard@bootlin.com>
References: <cover.85e5bbe6ef5f0fd420e1fc21fc248471b98481e5.1532596850.git-series.maxime.ripard@bootlin.com>
 <2758e622f4a05d69f984bb3439af49823f43d4fc.1532596850.git-series.maxime.ripard@bootlin.com>
Date: Thu, 09 Aug 2018 14:31:50 -0700
Message-ID: <87r2j7rzuh.fsf@anholt.net>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v4 10/13] chamelium: Change our pattern for a
 custom one
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1487139413=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime.ripard@bootlin.com>, igt-dev@lists.freedesktop.org
Cc: eben@raspberrypi.org, Maxime Ripard <maxime.ripard@bootlin.com>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1487139413==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Maxime Ripard <maxime.ripard@bootlin.com> writes:

> The current pattern being used is the one generated through the
> igt_create_color_pattern_fb.
>
> However, in order to deal with multiple formats and the upsampling /
> downsampling issues that might arise from converting back and forth between
> formats, we will need to have a pattern with quite precise color values,
> and without any shades or gradient of colors.

64x64 blocks of color seem pretty limited, and might miss tiling issues
for people -- would the previous pattern be worth using for 1:1,
possibly non-format-converted cases?

> The easiest way to do that will be to only use values that would have the
> same part on the common most significant bits (5, to deal with the most
> formats) and have the same bit repeated on the least significant bits that
> are going to be dropped and / or padded when converting between formats.
>
> Pixman will fill the lowest bits with 1, and our hardware is able to

Let's specify which hardware here :)

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAltsssYACgkQtdYpNtH8
nuhg5w//ffUTzmKEqlsDlsSsNs8eeh6mohs8DnBISECVPDCLq5F7m9vUUnkY9OVd
wIsj4+IiVliWDtSMt1QPHyPMVBm2QUUM6f+Apx1nRJEhf34grQtTdf1wMWftod8L
Y/U3JERw+M6OKB9GcVRcRh+bbnPXR74c/1+o9TKWlYFVOpgXOBr172jh+7Czp4bk
1pO6iJBMgraZF+1SfV3NYQASo+gkLTf+epic02/N/IzpMoq8FD9IjvcHyyYFwXLO
M6XDzw0JZtym9B+IbXQojka9/T7oA55MtzMcEOYVmmBtcRxXWmpHBGMjz6/Wuwb3
RZ9gAY5T8ecIpFyS9cb1Bl4Kf6KTuqy9PH10QPXEI1+2XeXGXZlfmrp2Ox0uVWl3
fqxYVi5T1BFrY7pXmL5aidr2aHdft+1x/iPuncp4RRqGCSNpC1zhFNNt1lMFY+EK
bPXC4Hzu+tkBWlTPuD3KpThOjE179uE7f6KyLorZCiVP8MDec9moM5UiZdvnxUEp
6yQd1xMZ1LdnUJGDAFw6QAdslndIDXEt3am7cEHEmeFX7Iy9+WCSD1LFN6Z3IYSA
I8IZDZ8AWFPp6hC2WIpqV+wLHO+TjMxBG/sHEhOuwhjM0K+UB707V3HWGZ2JUY6u
nzugIAJ/kRefpyfDJEmxsGXlp7+/LP7gnZwg1h36tcaTC+1KwEg=
=6L5m
-----END PGP SIGNATURE-----
--=-=-=--

--===============1487139413==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1487139413==--
