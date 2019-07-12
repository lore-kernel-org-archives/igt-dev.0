Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 11 Jul 2019 23:49:41 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <20190712024941.4asntpe6s23x66q4@smtp.gmail.com>
References: <cover.1560374714.git.rodrigosiqueiramelo@gmail.com>
 <539f9b55a8269d3eb20d7d211f701d1a301d5b9d.1560374714.git.rodrigosiqueiramelo@gmail.com>
 <cb41813cb605db17faee193acfa3f1bbd5b2a039.camel@intel.com>
 <e54ac9aed7325a0b7735251199dcb3dba8cbdcec.camel@intel.com>
MIME-Version: 1.0
In-Reply-To: <e54ac9aed7325a0b7735251199dcb3dba8cbdcec.camel@intel.com>
Subject: Re: [igt-dev] [PATCH V6 i-g-t 3/6] lib: Add function to hash a
 framebuffer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0458600598=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Ser, Simon" <simon.ser@intel.com>
Cc: "Latvala, Petri" <petri.latvala@intel.com>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Liviu.Dudau@arm.com" <Liviu.Dudau@arm.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "daniel@ffwll.ch" <daniel@ffwll.ch>, "nd@arm.com" <nd@arm.com>, "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0458600598==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="luphgcobsed4vcju"
Content-Disposition: inline


--luphgcobsed4vcju
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 07/10, Ser, Simon wrote:
> On Wed, 2019-07-10 at 15:30 +0000, Ser, Simon wrote:
> > Mostly LGTM, here are a few nits.
> >=20
> > On Wed, 2019-06-12 at 23:17 -0300, Brian Starkey wrote:
> > > To use writeback buffers as a CRC source, we need to be able to hash
> > > them. Implement a simple FVA-1a hashing routine for this purpose.
> > >=20
> > > Doing a bytewise hash on the framebuffer directly can be very slow if
> > > the memory is noncached. By making a copy of each line in the FB first
> > > (which can take advantage of word-access speedup), we can do the hash
> > > on a cached copy, which is much faster (10x speedup on my platform).
> > >=20
> > > v6: use igt_memcpy_from_wc() instead of plain memcpy, as suggested by
> > >     Chris Wilson
> > >=20
> > > Signed-off-by: Brian Starkey <brian.starkey@arm.com>
> > > [rebased and updated to the most recent API]
> > > Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>
> > > ---
> > >  lib/igt_fb.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++++++=
++
> > >  lib/igt_fb.h |  3 +++
> > >  2 files changed, 69 insertions(+)
> > >=20
> > > diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> > > index 9d4f905e..d07dae39 100644
> > > --- a/lib/igt_fb.c
> > > +++ b/lib/igt_fb.c
> > > @@ -3256,6 +3256,72 @@ bool igt_fb_supported_format(uint32_t drm_form=
at)
> > >  	return false;
> > >  }
> > > =20
> > > +/*
> > > + * This implements the FNV-1a hashing algorithm instead of CRC, for
> > > + * simplicity
> > > + * http://www.isthe.com/chongo/tech/comp/fnv/index.html
> > > + *
> > > + * hash =3D offset_basis
> > > + * for each octet_of_data to be hashed
> > > + *         hash =3D hash xor octet_of_data
> > > + *         hash =3D hash * FNV_prime
> > > + * return hash
> > > + *
> > > + * 32 bit offset_basis =3D 2166136261
> > > + * 32 bit FNV_prime =3D 224 + 28 + 0x93 =3D 16777619
> > > + */
> > > +int igt_fb_get_crc(struct igt_fb *fb, igt_crc_t *crc)
> > > +{
> > > +#define FNV1a_OFFSET_BIAS 2166136261
> > > +#define FNV1a_PRIME 16777619
> >=20
> > I'd just use plain uint32_t variables for those, but no big deal.
> >=20
> > > +	uint32_t hash;
> > > +	void *map;
> > > +	char *ptr, *line =3D NULL;
> > > +	int x, y, cpp =3D igt_drm_format_to_bpp(fb->drm_format) / 8;
> > > +	uint32_t stride =3D calc_plane_stride(fb, 0);
> >=20
> > We could return -EINVAL in case fb->num_planes !=3D 1.
>=20
> Let's not waste cycles. With this ^ fixed, this patch is:
>=20
> Reviewed-by: Simon Ser <simon.ser@intel.com>
>=20
> Other nits are optional.

I agreed with all your suggestions, and I already applied all of them.
Should I wait for the other patches review, or should I resend the new
version?

Thanks for all the feedback
Best Regards
=20
> > > +	if (fb->is_dumb)
> > > +		map =3D kmstest_dumb_map_buffer(fb->fd, fb->gem_handle, fb->size,
> > > +					      PROT_READ);
> > > +	else
> > > +		map =3D gem_mmap__gtt(fb->fd, fb->gem_handle, fb->size,
> > > +				    PROT_READ);
> > > +	ptr =3D map;
> >=20
> > Nit: no need for this, can assign the result of mmap directly to ptr.
> >=20
> > > +
> > > +	/*
> > > +	 * Framebuffers are often uncached, which can make byte-wise access=
es
> > > +	 * very slow. We copy each line of the FB into a local buffer to sp=
eed
> > > +	 * up the hashing.
> > > +	 */
> > > +	line =3D malloc(stride);
> > > +	if (!line) {
> > > +		munmap(map, fb->size);
> > > +		return -ENOMEM;
> > > +	}
> > > +
> > > +	hash =3D FNV1a_OFFSET_BIAS;
> > > +
> > > +	for (y =3D 0; y < fb->height; y++, ptr +=3D stride) {
> > > +
> > > +		igt_memcpy_from_wc(line, ptr, stride);
> >=20
> > Nit: no need to copy the whole stride actually, we can just copy
> > fb->width * cpp since we're only going to read that.
> >=20
> > > +
> > > +		for (x =3D 0; x < fb->width * cpp; x++) {
> > > +			hash ^=3D line[x];
> > > +			hash *=3D FNV1a_PRIME;
> > > +		}
> > > +	}
> > > +
> > > +	crc->n_words =3D 1;
> > > +	crc->crc[0] =3D hash;
> > > +
> > > +	free(line);
> > > +	munmap(map, fb->size);
> > > +
> > > +	return 0;
> > > +#undef FNV1a_OFFSET_BIAS
> > > +#undef FNV1a_PRIME
> > > +}
> > > +
> > >  /**
> > >   * igt_format_is_yuv:
> > >   * @drm_format: drm fourcc
> > > diff --git a/lib/igt_fb.h b/lib/igt_fb.h
> > > index adefebe1..a2741c05 100644
> > > --- a/lib/igt_fb.h
> > > +++ b/lib/igt_fb.h
> > > @@ -37,6 +37,7 @@
> > >  #include <i915_drm.h>
> > > =20
> > >  #include "igt_color_encoding.h"
> > > +#include "igt_debugfs.h"
> > > =20
> > >  /*
> > >   * Internal format to denote a buffer compatible with pixman's
> > > @@ -194,5 +195,7 @@ int igt_format_plane_bpp(uint32_t drm_format, int=
 plane);
> > >  void igt_format_array_fill(uint32_t **formats_array, unsigned int *c=
ount,
> > >  			   bool allow_yuv);
> > > =20
> > > +int igt_fb_get_crc(struct igt_fb *fb, igt_crc_t *crc);
> > > +
> > >  #endif /* __IGT_FB_H__ */
> > > =20
> > > _______________________________________________
> > > igt-dev mailing list
> > > igt-dev@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/igt-dev
> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/igt-dev

--=20
Rodrigo Siqueira
https://siqueira.tech

--luphgcobsed4vcju
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl0n9UUACgkQWJzP/com
vP9PUhAAjjWtMsEX1Nay370ECcyoHci7dDPVkT5XJWGBlxVABp7tJl+p4Z/G/uuh
OBJtUhz81I+SrCcviBnlmDFcLihSSHWOTZsoTu5gbuXI0OCBBKU4VYbTvifi/6PC
sA7dZlzKfEGjnancuiM+ZqWRiQtOw6cuK2O/BhmxCEH3GmwSLezG+oaRzmCMlp41
y/t7+Dp4fANTFpAqhO1P93YdDs39XSoP+RVl4/N0nHLB7NxN43zdYnP9OC8vmPx5
f/3CpT1XQFQ6YydpVMluEdmcSoZzDAzc8Nt6ORHTuUbFp5JRFWjSysJDWmPbiXrD
g4DcRLxp+E8e8uzLWuIKP5BXzve+V53FPZB8vRJtzUl3g2aTFDj95rwYxjh7VEEG
73BBhaV8AG6NQvUOcsozxSOSnk4BMkObRnwJtHzjDxERFxGkBmRM9HRoJhifdv6O
3580Qt3NfDWwfGRUxECmzuDMcldRw2HbZTsKY2SC5a1NfYYgiWvI4g9+aUU+1+Cp
iuPGmRBjoGNCZBUaWLZD33d6W++dHA3ntoIQqODxrm88eLE5N8SLpQSRytXXDB0I
Ala/gyWsHKLzZQ4/cDGlX8dUBdHW7TcKJjn4d0Vf9J/29kHh46sgOgbZ+hIEEdeb
zomID0925dxi/zcL78N4yyU0u+azNpyaJnqP+l36Ri7UPWZcVzg=
=tgtQ
-----END PGP SIGNATURE-----

--luphgcobsed4vcju--

--===============0458600598==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0458600598==--
