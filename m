Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E263C10E2A5
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Apr 2022 12:46:49 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id x33so13887944lfu.1
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Apr 2022 05:46:49 -0700 (PDT)
Date: Fri, 29 Apr 2022 15:46:45 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Message-ID: <20220429154645.1680bad2@eldfell>
In-Reply-To: <20220328145509.2331195-5-maxime@cerno.tech>
References: <20220328145509.2331195-1-maxime@cerno.tech>
 <20220328145509.2331195-5-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/z4ruLsuL1alXn=CpX+nGHI1";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Subject: Re: [igt-dev] [PATCH i-g-t v2 4/8] lib/igt_frame: Add function to
 dump frames in RGB and raw
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--Sig_/z4ruLsuL1alXn=CpX+nGHI1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 28 Mar 2022 16:55:05 +0200
Maxime Ripard <maxime@cerno.tech> wrote:

> The igt_write_frame_to_png() already allows to dump the content of a
> cairo surface into a PNG image. However, it can be useful to have the
> raw content of the buffer as well, so let's create a function that will
> dump both a PNG image and its raw buffer.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Hi,

when exactly is the raw dump useful? Do you need it for checking alpha?
Or for YUV formats? Or for multi-planar formats? Or for greater than 8
bpc or floating point formats?

How do you make use of the raw dump?

PNG can store alpha channel as well, and if that's not convenient
alongsize RGB, you could save another image where alpha has been
converted to gray scale.

PNG can also go up to 16 bpc I think?

PAM file format (netpbm type P7) might also be an option, looks like it
can do up to RGBA 16 bpc, and is trivial to generate.
http://netpbm.sourceforge.net/doc/pam.html

It's not much different from a raw dump, but contains enough metadata
for tools to understand the image.


Thanks,
pq

> ---
>  lib/igt_frame.c | 82 +++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_frame.h |  4 +++
>  2 files changed, 86 insertions(+)
>=20
> diff --git a/lib/igt_frame.c b/lib/igt_frame.c
> index ba29ac028e1b..f53ba3a381ef 100644
> --- a/lib/igt_frame.c
> +++ b/lib/igt_frame.c
> @@ -112,6 +112,40 @@ static void igt_write_frame_to_png(cairo_surface_t *=
surface, int summary_fd,
>  	free(path);
>  }
> =20
> +static void igt_write_frame_to_raw(cairo_surface_t *surface, int summary=
_fd,
> +				   const char *qualifier, const char *suffix)
> +{
> +	int height, stride, size;
> +	char *path;
> +	void *ptr;
> +	int out_fd =3D -1;
> +
> +	path =3D igt_get_frame_path(qualifier, suffix, "raw");
> +	igt_assert(path);
> +
> +	igt_debug("Dumping %s frame to %s...\n", qualifier, path);
> +
> +	out_fd =3D open(path, O_WRONLY | O_CREAT | O_TRUNC, 0644);
> +	igt_assert(out_fd >=3D 0);
> +
> +	ptr =3D cairo_image_surface_get_data(surface);
> +	igt_assert(ptr);
> +
> +	stride =3D cairo_image_surface_get_stride(surface);
> +	igt_assert(stride > 0);
> +
> +	height =3D cairo_image_surface_get_height(surface);
> +	igt_assert(height > 0);
> +
> +	size =3D stride * height;
> +	write(out_fd, ptr, size);
> +
> +	close(out_fd);
> +
> +	igt_log_frame_path(summary_fd, path);
> +	free(path);
> +}
> +
>  /**
>   * igt_write_compared_frames_to_png:
>   * @reference: The reference cairo surface
> @@ -158,6 +192,54 @@ void igt_write_compared_frames_to_png(cairo_surface_=
t *reference,
>  	close(fd);
>  }
> =20
> +/**
> + * igt_write_compared_frames:
> + * @reference: The reference cairo surface
> + * @capture: The captured cairo surface
> + * @reference_suffix: The suffix to give to the reference png file
> + * @capture_suffix: The suffix to give to the capture png file
> + *
> + * Dump previously compared frames to png and raw files.
> + */
> +void igt_write_compared_frames(cairo_surface_t *reference,
> +			       cairo_surface_t *capture,
> +			       const char *reference_suffix,
> +			       const char *capture_suffix)
> +{
> +	char *id;
> +	const char *test_name;
> +	const char *subtest_name;
> +	char path[PATH_MAX];
> +	int fd =3D -1;
> +
> +	if (!igt_frame_dump_is_enabled())
> +		return;
> +
> +	id =3D getenv("IGT_FRAME_DUMP_ID");
> +
> +	test_name =3D igt_test_name();
> +	subtest_name =3D igt_subtest_name();
> +
> +	if (id)
> +		snprintf(path, PATH_MAX, "%s/frame-%s-%s-%s.txt",
> +			 igt_frame_dump_path, test_name, subtest_name, id);
> +	else
> +		snprintf(path, PATH_MAX, "%s/frame-%s-%s.txt",
> +			 igt_frame_dump_path, test_name, subtest_name);
> +
> +	fd =3D open(path, O_WRONLY | O_CREAT | O_TRUNC, 0644);
> +	igt_assert(fd >=3D 0);
> +
> +	igt_debug("Writing dump report to %s...\n", path);
> +
> +	igt_write_frame_to_raw(reference, fd, "reference", reference_suffix);
> +	igt_write_frame_to_png(reference, fd, "reference", reference_suffix);
> +	igt_write_frame_to_raw(capture, fd, "capture", capture_suffix);
> +	igt_write_frame_to_png(capture, fd, "capture", capture_suffix);
> +
> +	close(fd);
> +}
> +
>  /**
>   * igt_check_analog_frame_match:
>   * @reference: The reference cairo surface
> diff --git a/lib/igt_frame.h b/lib/igt_frame.h
> index f44f57d7ce73..51cbc2bd68b4 100644
> --- a/lib/igt_frame.h
> +++ b/lib/igt_frame.h
> @@ -36,6 +36,10 @@ void igt_write_compared_frames_to_png(cairo_surface_t =
*reference,
>  				      cairo_surface_t *capture,
>  				      const char *reference_suffix,
>  				      const char *capture_suffix);
> +void igt_write_compared_frames(cairo_surface_t *reference,
> +			       cairo_surface_t *capture,
> +			       const char *reference_suffix,
> +			       const char *capture_suffix);
>  bool igt_check_analog_frame_match(cairo_surface_t *reference,
>  				  cairo_surface_t *capture);
>  bool igt_check_checkerboard_frame_match(cairo_surface_t *reference,


--Sig_/z4ruLsuL1alXn=CpX+nGHI1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmJr3jUACgkQI1/ltBGq
qqeoDw//Z0AQKdhZavzih9aJ+5R4Mw6Qe6Rm7uzNyZNgJ2+AWVPgyKa6gCdjDfqM
0H0HSZwxBEXUrwmHHaCdnPJMO3eJI0MVcfJb9ZSmaQoasWo0S9Fz09EHOSfY4AJ3
I83dIuY4oukqlLvBVUP4ZCMEfXVN72LQGLS01iVgrVIvH/RxDi2f+PHfA9LSHv6N
0v5cnknTgKpKMu8H4sLOqQbz+Vx2svou8PadHr/5gIu5D4LPDzr8G0B5VUjKLVSs
BW+K39eawOBEkL3UCSoOjWG9a/BAvK7f6cONFhut+5oO0qtfDqBgadxj42s12zS2
yn/G/ujLGDYLy/YEFtwrHcvghjjD6uQp7X/yUf1Dsu7nK6LGJMEfy1B/XXUtVPJr
0ajacgDEz3vK+lXsJM7WIY9aBcG2uFTqTClOMpUd7o9zDd7yGsohGJy5v+26reTI
COGRZJYGZ1B7a+TWHHfTSjX2viBrpeSm1fQoSV+qh2rwG9yXUY2j4hKFc0HJWikv
HKgdeiZ3bxOMy4ra7XfoD0fgpg7IRITBGPYhnNDb/x4muMlFU+ofkIPso2txaDSL
1Z3d2HoooJX60MdpD/imJKAOL/kE2vUDwVMaY6KxeYuqsEIIh9DsQpHk9ZnejrRW
LcekA+gcqbu9pqDlNt5uxzHs2AztpOKNpf/kfUTPinwa2Hv8Ak0=
=6vt3
-----END PGP SIGNATURE-----

--Sig_/z4ruLsuL1alXn=CpX+nGHI1--
