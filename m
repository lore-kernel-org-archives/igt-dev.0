Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFD310F607
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Feb 2022 12:51:08 +0000 (UTC)
Date: Thu, 3 Feb 2022 11:50:47 -0100
From: Melissa Wen <mwen@igalia.com>
Message-ID: <20220203125047.6adk6show4wmzbg6@mail.igalia.com>
References: <20220131142818.2686782-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gddlebilfap2qkhg"
Content-Disposition: inline
In-Reply-To: <20220131142818.2686782-1-Rodrigo.Siqueira@amd.com>
Subject: Re: [igt-dev] [RFC i-g-t 0/1] Introduce MAINTAINERS file to IGT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Petri Latvala <petri.latvala@intel.com>, Solomon Chiu <solomon.chiu@amd.com>, Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>, igt-dev@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>, Mark Yacoub <markyacoub@google.com>
List-ID: <igt-dev@lists.freedesktop.org>


--gddlebilfap2qkhg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 01/31, Rodrigo Siqueira wrote:
> Hi,
>=20
> IGT is becoming more generic, and multiple vendors are adopting it. For
> example, AMD fully upstream all of its internal changes last year, and
> now we are relying on IGT from the upstream. Additionally, thanks to the
> ChromeOS project, we have other vendors working on the KMS tests as
> well. At this point, I believe that we need some mechanism to better
> contact developers that care about some specific tests or even provide an
> easy way for other people to find the right stakeholder for dealing with
> some particular issue.
>=20
> Imho Linux Kernel already has a good solution codified in the
> MAINTAINERS and get_maintainers files. One of the best things about this
> approach was adding reviewers and maintainers (and other options) to the
> specific part of the code and using the get_maintainers tool to extract
> the right people to be part of the series. With this idea in mind, I
> created this RFC that introduces the MAINTAINERS file in IGT, and I have
> already added some entries to this file. My approach was:
>=20
> * Petri and Hiler are the maintainers, and for this reason, their
>   contact will be displayed for every patch.
> * I add Mark Yacoub as a reviewer for every KMS test.
> * I added some AMD folks as reviewers in some specific KMS tests that we
>   run in our CI.
> * I added some AMD maintainers to amdgpu tests.
>=20
> If you want to try it in your local repository, you will need the
> get_maintainers script from the Linux kernel, and you can use this
> command:
>=20
>  perl /PATH/TO/get_maintainer.pl --no-tree --separator , --nokeywords --n=
ogit --nogit-fallback --norolestats -f <TARGET_TEST>
>=20
> Anyway, this is just an idea that I want to discuss with the community.
> What do you think about having a MAINTAINERs file? Do you want to add
> your name as a reviewer to some specific test if you like the idea? Any
> other comments or ideas?

I agree with the idea of having a way to find the developers interested
in reviewing changes for a specific test. Also I think it can diversify
feedback for generic tests. That said,
Acked-by: Melissa Wen <mwen@igalia.com>

I'm not clear if the `Reviewer` role is just to point developers that
are willing to review patches to a specific set of tests or developers
that also have commit rights. For example, I don't have commit rights
here, but I'm interested in reviewing patches for v3d and KMS CRC too.

>=20
> Cc: Arkadiusz Hiler <arek@hiler.eu>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Mark Yacoub <markyacoub@google.com>
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Sun Peng Li(Leo) <sunpeng.li@amd.com>
> Cc: Chao-kai Wang (Stylon) <stylon.wang@amd.com>
> Cc: Wayne Lin <wayne.lin@amd.com>
> Cc: Nicholas Choi <nicholas.choi@amd.com>
> Cc: Martin Peres <martin.peres@mupuf.org>
> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Cc: Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>
> Cc: Qingqing Zhuo (Lilian) <qingqing.zhuo@amd.com>
> Cc: Solomon Chiu <solomon.chiu@amd.com>
>=20
> Best Regards,
> Siqueira
>=20
> Rodrigo Siqueira (1):
>   MAINTAINERS: Introduce MAINTAINERS file
>=20
>  MAINTAINERS | 203 +++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 201 insertions(+), 2 deletions(-)
>=20
> --=20
> 2.25.1
>=20

--gddlebilfap2qkhg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmH7z5oACgkQwqF3j0dL
ehyJ1BAAtAy0uvTYp1Wo3Dn4QXZ5day3h0NA/RHTXRDeZLNVZ+wcbpCSNxCkG3Ia
FuMHem7WPq9TOa36xsxNhWkkqFnvyW5Uey2x1ZlTNkdiIiKBPqiB+KDMw3RooJLP
HYcjWpmCxZhl82qjlqbKtt535nDcyOrE3oM2Wg5ewu5KrhG3MmFAlL/n9WysQMk/
8qAnsfiov/vffJbKWpdZKV1rb5bLs1WFGDJCCYkADqOt0s65fxn6y7OovsbqnhPl
FIMYm4yMCIgrajbt+cB8YT8Gi2MdQlsXgQp0ok0OeNmBZr9ycS74HC80VIGcoWtj
4e+eKcLW5lDBXcXRlw9IvlcfhXb+ml7rqdAVrHb3kPl7PhOF1C5Ebv2aMeeKewNX
2GjBNZ8g0ddY9xRMVHFjnYpdhR+kHUgTziTYVwaUoFtm+C5TIx5jMLM+UnnXVloV
Cm66Viq/7+LyGOr1asE9sKFTMZPf9lt6HRnSAcfZaF5Q1jQIUGDYu4nY3Rq9E98H
/a/cM2ef9yrHomBt/rmimcWEW7QGiMhAra5yIBZ1kenUmPvg1tjZ0Ke93pND8Uqh
HRHoVDmNJbVoejL0OdeKJx/OhWk+GDEitvTcRlDhRd2X6QvM6OMs7p83TPERQnUS
uFODhgvBUDneWeNlpTdMsziUA17iCloy8WH+Xajw4/OvNy1auDE=
=w4YZ
-----END PGP SIGNATURE-----

--gddlebilfap2qkhg--
