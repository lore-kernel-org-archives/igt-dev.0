Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Eric Anholt <eric@anholt.net>
In-Reply-To: <20190116163903.12785-1-daniel.vetter@ffwll.ch>
References: <20190116163903.12785-1-daniel.vetter@ffwll.ch>
Date: Wed, 16 Jan 2019 14:41:21 -0800
Message-ID: <87d0owgr8u.fsf@anholt.net>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] drm/doc: Make igts for cross-driver stuff
 mandatory
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0354616219=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development <dri-devel@lists.freedesktop.org>, IGT development <igt-dev@lists.freedesktop.org>
Cc: Petri Latvala <petri.latvala@intel.com>, Liviu Dudau <liviu.dudau@arm.com>, Daniel Vetter <daniel.vetter@intel.com>, Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0354616219==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Daniel Vetter <daniel.vetter@ffwll.ch> writes:

> Compared to the RFC[1] no changes to the patch itself, but igt moved
> forward a lot:
>
> - gitlab CI builds with: reduced configs/libraries, arm cross build
>   and a sysroot build (should address all the build/cross platform
>   concerns raised in the RFC discussions).
>
> - tests reorganized into subdirectories so that the i915-gem tests
>   don't clog the main/shared tests directory anymore
>
> - quite a few more non-intel people contributing/reviewing/committing
>   igt tests patches.
>
> I think this addresses all the concerns raised in the RFC discussions,
> and assuming there's enough Acks and no new issues that pop up, we can
> go ahead with this.
>
> 1: https://patchwork.kernel.org/patch/10648851/
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

igt is a bit awkward to work in (the mailing list is very noisy with the
Intel CI being email-based instead of gitlab-based and most of the
traffic being Intel), but it's the right place to be putting shared
tests and hopefully that pain point goes away eventually using gitlab
MRs.

I think there are going to be some interesting questions on how to deal
with things like KMS properties that aren't amenable to
chamelium/writeback-based testing.  However, we should default to
requiring tests and only skip that when we agree collectively that
something isn't testable currently.

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlw/sxEACgkQtdYpNtH8
nugZCBAAhv0gmpmh0B1dxx/EnycJqf6t4K5yCUOJb9ok72INtF9og1mzlrpvAoZ/
rItUWVFLYvxGJvME3KtIR410OZtyxcWUTaEFpykXHEI+GOSxFTBxcBe4HpMJs/yD
xYayaYsbulgW9RzkL8jDEmhU9pSnScyDJ6YJoDJPC3nTTgOR7GFQ38bnEPHp7ezz
yD6H0Duw69RGwi3zGXIqfFt6GZMxLuAmygiAvJzhFqONYYGuPYkRa/gGsENGe1CV
2APhtSuu8I+wgt1JAijC9GZGkiNSJUcdAnhheEeWNn+9p3ZaoJDBRBepeelXbaVp
ogxPS/kJBqvauKqztJVp4otortUihD3QzHHehAwN3N2LwixZ82W4kFDvxthP3WsS
zTInIjIeHYArAYUqY8c6IzEJnHiCr7zGR8GOrWHpemNz+Cs9/5DqXo+mORHBDeYL
ZTVpgMbm+4tsWRdD+yM2ffb4RN1I4ji0V3QJjCm7GjhnCscmfizwaivUJ2FDKwfi
6fVXlHOfHX9y0tnPfHvFT70RdKaSKxwhSQXeWtkTkWVAIAuPTOWKgFilcBzcWB+z
eKZp1uGNKjj7nRP1W4YaZRlSUU6PeB/ZVGwXw+lW9Bxkq9OTOFvbZbspDUIdpUJP
SZK/QpA0R/pkyUFkJtxcA+/hLPJr9R0IVgyoTHMn0pZQJxBDuoY=
=XQps
-----END PGP SIGNATURE-----
--=-=-=--

--===============0354616219==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0354616219==--
