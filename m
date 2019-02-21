Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from elaine.keithp.com (home.keithp.com [63.227.221.253])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D98892ED
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Feb 2019 03:08:32 +0000 (UTC)
From: "Keith Packard" <keithp@keithp.com>
In-Reply-To: <20190220162530.31643-3-daniel.vetter@ffwll.ch>
References: <20190220162530.31643-1-daniel.vetter@ffwll.ch>
 <20190220162530.31643-3-daniel.vetter@ffwll.ch>
Date: Wed, 20 Feb 2019 19:08:30 -0800
Message-ID: <87imxdltxt.fsf@keithp.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/9] tests/kms_lease: invalid
 corner-cases for create-lease ioctl
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1790227469=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, IGT development <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============1790227469==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Daniel Vetter <daniel.vetter@ffwll.ch> writes:

> Found a few things in the kernel that looks suspicious, separate
> patches on their way.

Thanks for adding more tests!

> +	/* empty lease */
> +	mcl.object_ids =3D 0;
> +	mcl.object_count =3D 0;
> +	mcl.flags =3D 0;
> +	igt_assert_eq(create_lease(data->master.fd, &mcl), -EINVAL);

Not sure why this should be invalid? It's not useful, but then neither
are 0x0 windows and look at all the pain not allowing them has caused
over the years...

> +
> +	/* NULL array pointer */
> +	mcl.object_count =3D 1;
> +	igt_assert_eq(create_lease(data->master.fd, &mcl), -EFAULT);

Should probably explicitly initialize the array pointer here, avoids any
dependency on the previous test.

> +	/* no crtc, non-universal_plane */
> +	drmSetClientCap(data->master.fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 0);
> +	object_ids[0] =3D data->master.display.outputs[0].id;
> +	igt_assert_eq(create_lease(data->master.fd, &mcl), -EINVAL);

Similarly, initialize the object count and pointers explicitly.

> +	/* no subleasing */
> +	mcl.object_count =3D 3;
> +	mcl.flags =3D 0;
> +	igt_assert_eq(create_lease(data->master.fd, &mcl), 0);
> +	tmp_fd =3D mcl.fd;
> +	igt_assert_eq(create_lease(tmp_fd, &mcl), -EINVAL);
> +	close(tmp_fd);

Just reminds me that we should probably enable sub-leasing -- useful in
a multi-head environment where you also want to run leased applications
under one of the heads.

All of these tests look OK to me; as usual, the precise errno values are
subject to interpretation, but it looks like you've made reasonable
choices here making me wonder how reasonable the kernel is :-)

Reviewed-by: Keith Packard <keithp@keithp.com>

=2D-=20
=2Dkeith

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEw4O3eCVWE9/bQJ2R2yIaaQAAABEFAlxuFi4ACgkQ2yIaaQAA
ABFCuhAAlxTRbS/UQNhees1EGeNC9nMltBBoomPMVF8CeeabKx+5WQo8zf+jsxDx
cm30fDJAmrjtNyJz34wLitp1+FgFiH3Hegq6OU3tSg2C/NcqpiJjRyNGLc0qLHu8
MEQb/WvTTr4lcF+sK/LFjG0olOrcGOCLoNAkp6Cov3qIhOiA8mCYlwB6J5DXkF2e
5irLu5vLqkFNc3uxB9ruzQxDITboBT+5OqmoLa9bOcMSMwp1bOVXclDG5+5aEYT5
+wskFdzcCh+XTMYWFL3/QVWCnRsFsE9kWnBtMEC9DzFkubKvB5lLp87L3heX8hGl
NIE1IKKGtQoAv7o5i2p1Xn56UbzkN3xLOYyhWR87fD8lxaRk+wxDHdv9g0AY8t8W
DWAbYzmaDP23/UKL0USObzuD1iAFvSKOoUERFy2mD/oMMFAoULSWd3nZ070ucGJ0
egQb4uJi6+gF+kI90RkQxC/aKy7mxMrgPeGZXtnWVJ0m1X93GQ7DnjkHgcnZLlF4
+XAI/DjIKVWN+kE4Y0K2uhzFENKZ9TCz4OQp+cJsG6Ojpc+SfAwCDq2nANNXIE7t
NcKBqPYSAhTrtWDyc1kJwleo3zbEImymn9RLKBcSWdZgWSxloyNWsqPCEs7Oj/GE
DaOKf3SWX5kREJadWg1IEi1SzENaXxoGgplh6EUTpHKH6HvPppg=
=zgMa
-----END PGP SIGNATURE-----
--=-=-=--

--===============1790227469==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1790227469==--
