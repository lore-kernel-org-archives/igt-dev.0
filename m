Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC7A6E944
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Jul 2020 16:25:24 +0000 (UTC)
Date: Wed, 1 Jul 2020 12:25:16 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20200701162516.mcgwudjg6ss33wij@outlook.office365.com>
References: <cover.1592991729.git.melissa.srw@gmail.com>
 <3c0e76d37030f0d08fff3d8b424be8b8efa40955.1592991729.git.melissa.srw@gmail.com>
In-Reply-To: <3c0e76d37030f0d08fff3d8b424be8b8efa40955.1592991729.git.melissa.srw@gmail.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/igt_fb: change comments with fd
 description
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0214778246=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Melissa Wen <melissa.srw@gmail.com>
Cc: kernel-usp@googlegroups.com, igt-dev@lists.freedesktop.org, aurabindo.pillai@amd.com, twoerner@gmail.com
List-ID: <igt-dev@lists.freedesktop.org>

--===============0214778246==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eexccthhcxmwiudh"
Content-Disposition: inline

--eexccthhcxmwiudh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

LGTM,

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

On 06/25, Melissa Wen wrote:
> Generalize description of fd so as not restrict it to i915 driver
>=20
> Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> ---
>  lib/igt_fb.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 5ed586e7..5a219c57 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -3548,7 +3548,7 @@ cairo_surface_t *igt_get_cairo_surface(int fd, stru=
ct igt_fb *fb)
> =20
>  /**
>   * igt_get_cairo_ctx:
> - * @fd: open i915 drm file descriptor
> + * @fd: open drm file descriptor
>   * @fb: pointer to an #igt_fb structure
>   *
>   * This initializes a cairo surface for @fb and then allocates a drawing=
 context
> @@ -3578,7 +3578,7 @@ cairo_t *igt_get_cairo_ctx(int fd, struct igt_fb *f=
b)
> =20
>  /**
>   * igt_put_cairo_ctx:
> - * @fd: open i915 drm file descriptor
> + * @fd: open drm file descriptor
>   * @fb: pointer to an #igt_fb structure
>   * @cr: the cairo context returned by igt_get_cairo_ctx.
>   *
> @@ -3596,7 +3596,7 @@ void igt_put_cairo_ctx(int fd, struct igt_fb *fb, c=
airo_t *cr)
> =20
>  /**
>   * igt_remove_fb:
> - * @fd: open i915 drm file descriptor
> + * @fd: open drm file descriptor
>   * @fb: pointer to an #igt_fb structure
>   *
>   * This function releases all resources allocated in igt_create_fb() for=
 @fb.
> --=20
> 2.27.0
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--eexccthhcxmwiudh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl78uOsACgkQWJzP/com
vP9Atw//dlnTSgv6t5dHGJ6HpZWa9zyuhQpz3ewtEiEP1pt6qJ8NC5FyWUajifAf
tgdnzuaYJest6UsqYfqoM1uZjTyossdKUOWqIVY8IWUJVd/sUYObirXUGNloWrtL
+8LTyMzffmPkMM+bRkFy+qSZNUWcAfQItNnqXhiWyF5RGbQPoP3uDs+9/Bc1o7MW
K7u6Wj/C4/hDknQEWUnC/cQe7YSmS+rYK5xEGUHn4p+2JFHlpaLr/8J95LKmVwCX
7pCpnh0I8tuEHg62Hjn2N7AQYar3olBnuNjSjb48owY5dPISnELw2Lz9N7ubS9V3
LvYgIneKo/dDFqkHLQ+pNRgLki682q3ebVQFKj7dkVo/XP8JfjuPV8oBLgtNFDMR
OzaN+s6F0xKBIQYwWX36DDcbT715TRnRJJwJbXHN/JZm021MZ2n7kekAbdvSrGaq
cYyCawseM6H7UZQr+CGymbN/GBf6tcYJllso7Fyi2MeZIRN3aQtRFwj/FW6uzV1i
hjBeA8k1f/jjFZkl/iwiKwgGTQGmZtWywDU5BguzCbnL5OmPqU2RhDJlh3juUgtU
di14Ge/BO+F6t7cDf0+iBjQKUN6dkZ8gA14Pp2Ok5nVpdabsdAYruiaq0HzCD67S
bOyAOsnF38vegu5cOCcGxwlB4ueSsmiXYP6/E+8bQpVG0RhfGLM=
=G2p/
-----END PGP SIGNATURE-----

--eexccthhcxmwiudh--

--===============0214778246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============0214778246==--
