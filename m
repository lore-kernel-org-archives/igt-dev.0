Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250A410E7D8
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Nov 2022 14:24:51 +0000 (UTC)
Date: Fri, 25 Nov 2022 13:24:33 -0100
From: Melissa Wen <mwen@igalia.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Message-ID: <20221125142433.5bwuwj3g4ocicdfw@mail.igalia.com>
References: <20221115202101.278995-1-mcanal@igalia.com>
 <20221115202101.278995-6-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="wf5nzc5svny6dnhc"
Content-Disposition: inline
In-Reply-To: <20221115202101.278995-6-mcanal@igalia.com>
Subject: Re: [igt-dev] [PATCH i-g-t 5/5] tests/vc4: Skip VC4 tests if they
 are running on BCM2711/RaspberryPi4
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, Emma Anholt <emma@anholt.net>,
 igt-dev@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


--wf5nzc5svny6dnhc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

O 11/15, Ma=EDra Canal wrote:
> Currently, if the VC4 tests are run on BCM2711/Raspberry Pi 4, they will
> fail with no warning. So, add igt_require to the VC4 tests to check if
> VC4 has rendering capabilities before running the tests.
>=20
> In order to check if VC4 is running on BCM2711/Raspberry Pi 4, create a
> function that checks the return of DRM_VC4_GET_PARAM IOCTL when the
> parameter DRM_VC4_PARAM_V3D_IDENT0 is asked. If the IOCTL fails with
> errno EINVAL, it means that the tests are being run on
> BCM2711/Raspberry Pi 4.
>=20

Should we include somehow a feature-unsupported subtest before
skipping them? I think it's good to check the driver is able to refuse
those ioctls correctly in case the RENDER feature is not supported.
And after this validation we can skip the subtests related to this
feature. Sounds clearer to me, what you think?

> Signed-off-by: Ma=EDra Canal <mcanal@igalia.com>
> ---
>  lib/igt_vc4.c               | 8 ++++++++
>  lib/igt_vc4.h               | 1 +
>  tests/vc4/vc4_create_bo.c   | 1 +
>  tests/vc4/vc4_dmabuf_poll.c | 4 +++-
>  tests/vc4/vc4_label_bo.c    | 4 +++-
>  tests/vc4/vc4_perfmon.c     | 4 +++-
>  tests/vc4/vc4_tiling.c      | 4 +++-
>  tests/vc4/vc4_wait_bo.c     | 1 +
>  tests/vc4/vc4_wait_seqno.c  | 4 +++-
>  9 files changed, 26 insertions(+), 5 deletions(-)
>=20
> diff --git a/lib/igt_vc4.c b/lib/igt_vc4.c
> index f73f8a86..2df58e4f 100644
> --- a/lib/igt_vc4.c
> +++ b/lib/igt_vc4.c
> @@ -59,6 +59,14 @@ bool igt_vc4_is_tiled(uint64_t modifier)
>  	}
>  }
> =20
> +bool igt_vc4_is_v3d(int fd)
> +{
> +	struct drm_vc4_get_param arg =3D {
> +		.param =3D DRM_VC4_PARAM_V3D_IDENT0,
> +	};
> +	return !(igt_ioctl(fd, DRM_IOCTL_VC4_GET_PARAM, &arg) =3D=3D -1 && errn=
o =3D=3D EINVAL);

Looking the current code, I was expecting a ENODEV is returned before
the driver returns a EINVAL. Is it not the way that the driver handles
it in previous kernel version?
> +}
> +
>  /**
>   * igt_vc4_get_cleared_bo:
>   * @fd: device file descriptor
> diff --git a/lib/igt_vc4.h b/lib/igt_vc4.h
> index 71f213e6..384d7d6e 100644
> --- a/lib/igt_vc4.h
> +++ b/lib/igt_vc4.h
> @@ -34,6 +34,7 @@ void *igt_vc4_mmap_bo(int fd, uint32_t handle, uint32_t=
 size, unsigned prot);
>  int igt_vc4_get_param(int fd, uint32_t param, uint64_t *val);
>  bool igt_vc4_purgeable_bo(int fd, int handle, bool purgeable);
>  bool igt_vc4_is_tiled(uint64_t modifier);
> +bool igt_vc4_is_v3d(int fd);
> =20
>  uint32_t igt_vc4_perfmon_create(int fd, uint32_t ncounters, uint8_t *eve=
nts);
>  void igt_vc4_perfmon_get_values(int fd, uint32_t id);
> diff --git a/tests/vc4/vc4_create_bo.c b/tests/vc4/vc4_create_bo.c
> index c4909b49..c17f25b0 100644
> --- a/tests/vc4/vc4_create_bo.c
> +++ b/tests/vc4/vc4_create_bo.c
> @@ -30,6 +30,7 @@ igt_main
> =20
>  	igt_fixture {
>  		fd =3D drm_open_driver(DRIVER_VC4);
> +		igt_require(igt_vc4_is_v3d(fd));
>  	}
> =20
>  	igt_subtest("create-bo-4096") {
> diff --git a/tests/vc4/vc4_dmabuf_poll.c b/tests/vc4/vc4_dmabuf_poll.c
> index da99964b..c76d4950 100644
> --- a/tests/vc4/vc4_dmabuf_poll.c
> +++ b/tests/vc4/vc4_dmabuf_poll.c
> @@ -59,8 +59,10 @@ igt_main
>  {
>  	int fd;
> =20
> -	igt_fixture
> +	igt_fixture {
>  		fd =3D drm_open_driver(DRIVER_VC4);
> +		igt_require(igt_vc4_is_v3d(fd));
> +	}
> =20
>  	igt_subtest("poll-write-waits-until-write-done") {
>  		poll_write_bo_test(fd, POLLOUT);
> diff --git a/tests/vc4/vc4_label_bo.c b/tests/vc4/vc4_label_bo.c
> index dd8b5f9a..252bd1ed 100644
> --- a/tests/vc4/vc4_label_bo.c
> +++ b/tests/vc4/vc4_label_bo.c
> @@ -43,8 +43,10 @@ igt_main
>  {
>  	int fd;
> =20
> -	igt_fixture
> +	igt_fixture {
>  		fd =3D drm_open_driver(DRIVER_VC4);
> +		igt_require(igt_vc4_is_v3d(fd));
> +	}
> =20
>  	igt_subtest("set-label") {
>  		int handle =3D igt_vc4_create_bo(fd, PAGE_SIZE);
> diff --git a/tests/vc4/vc4_perfmon.c b/tests/vc4/vc4_perfmon.c
> index ca7567fd..30186519 100644
> --- a/tests/vc4/vc4_perfmon.c
> +++ b/tests/vc4/vc4_perfmon.c
> @@ -12,8 +12,10 @@ igt_main
>  {
>  	int fd;
> =20
> -	igt_fixture
> +	igt_fixture {
>  		fd =3D drm_open_driver(DRIVER_VC4);
> +		igt_require(igt_vc4_is_v3d(fd));
> +	}
> =20
>  	igt_describe("Make sure a perfmon cannot be created with zero counters.=
");
>  	igt_subtest("create-perfmon-0") {
> diff --git a/tests/vc4/vc4_tiling.c b/tests/vc4/vc4_tiling.c
> index 372b1fed..f5bf31f5 100644
> --- a/tests/vc4/vc4_tiling.c
> +++ b/tests/vc4/vc4_tiling.c
> @@ -28,8 +28,10 @@ igt_main
>  {
>  	int fd;
> =20
> -	igt_fixture
> +	igt_fixture {
>  		fd =3D drm_open_driver(DRIVER_VC4);
> +		igt_require(igt_vc4_is_v3d(fd));
> +	}
> =20
>  	igt_subtest("get-bad-handle") {
>  		struct drm_vc4_get_tiling get =3D {
> diff --git a/tests/vc4/vc4_wait_bo.c b/tests/vc4/vc4_wait_bo.c
> index 386642b9..c88a4ac4 100644
> --- a/tests/vc4/vc4_wait_bo.c
> +++ b/tests/vc4/vc4_wait_bo.c
> @@ -64,6 +64,7 @@ igt_main
> =20
>  	igt_fixture {
>  		fd =3D drm_open_driver(DRIVER_VC4);
> +		igt_require(igt_vc4_is_v3d(fd));
>  		bo_handle =3D igt_vc4_create_bo(fd, PAGE_SIZE);
>  	}
> =20
> diff --git a/tests/vc4/vc4_wait_seqno.c b/tests/vc4/vc4_wait_seqno.c
> index 61485bbf..78984fa3 100644
> --- a/tests/vc4/vc4_wait_seqno.c
> +++ b/tests/vc4/vc4_wait_seqno.c
> @@ -28,8 +28,10 @@ igt_main
>  {
>  	int fd;
> =20
> -	igt_fixture
> +	igt_fixture {
>  		fd =3D drm_open_driver(DRIVER_VC4);
> +		igt_require(igt_vc4_is_v3d(fd));
> +	}
> =20
>  	/* A 64-bit seqno should never hit the maximum value over the
>  	 * lifetime of the system.  (A submit per 1000 cycles at 1Ghz
> --=20
> 2.38.1
>=20

--wf5nzc5svny6dnhc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmOA0BsACgkQwqF3j0dL
ehzK/g//aZPAElfAZF4G8pdsXW/tvUx6LJxqKqDkvodrQuQEImp+G3MpsBo/a8Ks
jdNF2zQXTnhvT6hl8R1EuV0g42YFUOett3Pg8WMWguG9fuMTND+etG2GYiPvf04f
mwnKUczKsM/05xFg/aAmHnGKxDOj25suqAWIxsBYlYoyq8zYsZMuBJ086w07XvQX
tJIZj1Ol97krGmnR4b6r8f699iygTosDxihbHKnIpHVXzKvRcKHHJ4H8xXjpEHKa
jyRZGP3Y07ITngDk1xqczygzVdEqgI6L5Kln2x+iwSOUjeNIKsnWZ6PlFn+UUpEk
pC7RE0OgwqxWcI7MKXhxj0GtEDAVDqcksPgu9LrGGktLiCoFHveUVLpVUecoqXHm
KcXKhEKGEYhBioylmPEM/w7O/Bxma8Dsagop0BylRkoBuy66e7spS1GRRG/gz+Zy
Kuq3676TD01o+2bwWBVkSNvkdiAswvu1EDiUYy8h++faYZxeQBL/hOyWLAmgLBVc
9iK23UZsb6+p8f/DXjiuSzFNia9P2juD497Af5aa/fXfBcUdiYvDQGK9guNB/zCv
uTITrOxZiUIo9dx3RZMsk+sw+AtNKJ89PvGNC4osTSvwsTx85WG9W+NZmzv/c030
Z9jf+/YUJddgKie7rxArKXewlA8OjXZAe08ektzVTfnHRbnHjdI=
=9Zmg
-----END PGP SIGNATURE-----

--wf5nzc5svny6dnhc--
