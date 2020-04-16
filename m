Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 16 Apr 2020 08:49:42 -0400
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <20200416124942.6nxyf5m3ogmr4nva@smtp.gmail.com>
References: <20191022005952.tkdtftzbxk4b2lzk@smtp.gmail.com>
 <20200415094203.stjco4xo4uw23vmh@gilmour.lan>
MIME-Version: 1.0
In-Reply-To: <20200415094203.stjco4xo4uw23vmh@gilmour.lan>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH v7 i-g-t 3/4] lib: Add function to
 hash a framebuffer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1190609796=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Petri Latvala <petri.latvala@intel.com>, Simon Ser <contact@emersion.fr>, intel-gfx@lists.freedesktop.org, Liviu Dudau <Liviu.Dudau@arm.com>, igt-dev@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, nd <nd@arm.com>, Brian Starkey <Brian.Starkey@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1190609796==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e2o3v47bdlumwysf"
Content-Disposition: inline


--e2o3v47bdlumwysf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

First of all, thank you a lot for your review and for testing this
patchset. I'm going to prepare a new version trying to address all
issues highlight by you, Petri, and Simon (I'm already working in a new
version).

Just a note, I run this test on top of VKMS in a virtual machine (x86).

Best Regards

On 04/15, Maxime Ripard wrote:
> Hi Rodrigo,
>=20
> I gave your (and Brian's) patches on a RPi, and there's a couple of
> things that need to be fixed.
>=20
> On Mon, Oct 21, 2019 at 10:00:00PM -0300, Brian Starkey wrote:
> > To use writeback buffers as a CRC source, we need to be able to hash
> > them. Implement a simple FVA-1a hashing routine for this purpose.
> >
> > Doing a bytewise hash on the framebuffer directly can be very slow if
> > the memory is noncached. By making a copy of each line in the FB first
> > (which can take advantage of word-access speedup), we can do the hash
> > on a cached copy, which is much faster (10x speedup on my platform).
> >
> > V6: Simon Sir
> >  - Replace #define by plain uint32_t variables
> >  - Return -EINVAL in case fb->num_planes !=3D 1
> >  - Directly assign the mmap result to ptr
> >  - No need to copy the whole stride, just copy fb->width * cpp since
> > we're only going to read that
> >
> > v5: use igt_memcpy_from_wc() instead of plain memcpy, as suggested by
> >     Chris Wilson
> >
> > Signed-off-by: Brian Starkey <brian.starkey@arm.com>
> > [rebased and updated to the most recent API]
> > Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>
> > [rebased and updated the patch to address feedback]
> > Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > Reviewed-by: Simon Ser <simon.ser@intel.com>
> > ---
> >  lib/igt_fb.c | 68 ++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  lib/igt_fb.h |  2 ++
> >  2 files changed, 70 insertions(+)
> >
> > diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> > index 6b674c1b..64d52634 100644
> > --- a/lib/igt_fb.c
> > +++ b/lib/igt_fb.c
> > @@ -3491,6 +3491,74 @@ bool igt_fb_supported_format(uint32_t drm_format)
> >  	return false;
> >  }
> >
> > +/*
> > + * This implements the FNV-1a hashing algorithm instead of CRC, for
> > + * simplicity
> > + * http://www.isthe.com/chongo/tech/comp/fnv/index.html
> > + *
> > + * hash =3D offset_basis
> > + * for each octet_of_data to be hashed
> > + *         hash =3D hash xor octet_of_data
> > + *         hash =3D hash * FNV_prime
> > + * return hash
> > + *
> > + * 32 bit offset_basis =3D 2166136261
> > + * 32 bit FNV_prime =3D 224 + 28 + 0x93 =3D 16777619
> > + */
> > +int igt_fb_get_crc(struct igt_fb *fb, igt_crc_t *crc)
> > +{
> > +	uint32_t FNV1a_OFFSET_BIAS =3D 2166136261;
> > +	uint32_t FNV1a_PRIME =3D 16777619;
> > +	uint32_t hash;
> > +	void *map;
> > +	char *ptr, *line =3D NULL;
> > +	int x, y, cpp =3D igt_drm_format_to_bpp(fb->drm_format) / 8;
> > +	uint32_t stride =3D calc_plane_stride(fb, 0);
> > +
> > +	if (fb->num_planes !=3D 1)
> > +		return -EINVAL;
> > +
> > +	if (fb->is_dumb)
> > +		ptr =3D kmstest_dumb_map_buffer(fb->fd, fb->gem_handle, fb->size,
> > +					      PROT_READ);
> > +	else
> > +		ptr =3D gem_mmap__gtt(fb->fd, fb->gem_handle, fb->size,
> > +				    PROT_READ);
>=20
> You should be using igt_fb_map_buffer here
>=20
> > +	/*
> > +	 * Framebuffers are often uncached, which can make byte-wise accesses
> > +	 * very slow. We copy each line of the FB into a local buffer to speed
> > +	 * up the hashing.
> > +	 */
> > +	line =3D malloc(stride);
> > +	if (!line) {
> > +		munmap(map, fb->size);
> > +		return -ENOMEM;
> > +	}
> > +
> > +	hash =3D FNV1a_OFFSET_BIAS;
> > +
> > +	for (y =3D 0; y < fb->height; y++, ptr +=3D stride) {
> > +
> > +		igt_memcpy_from_wc(line, ptr, fb->width * cpp);
> > +
> > +		for (x =3D 0; x < fb->width * cpp; x++) {
> > +			hash ^=3D line[x];
> > +			hash *=3D FNV1a_PRIME;
> > +		}
> > +	}
> > +
> > +	crc->n_words =3D 1;
> > +	crc->crc[0] =3D hash;
> > +
> > +	free(line);
> > +	munmap(map, fb->size);
>=20
> And this will lead to a segfault here, since map has not been
> initialized. I'm assuming the intention is to have map be the returned
> value of mmap, and ptr to be initialized to that same value, and use
> that as your current line pointer later on (the error path from the
> malloc has the same issue).
>=20
> Maxime



--=20
Rodrigo Siqueira
https://siqueira.tech

--e2o3v47bdlumwysf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl6YVGUACgkQWJzP/com
vP/QSBAAm9MZAvSY8TPWeWoAkb/KZKqDRRhjMJ+YpmP4wX72M1tWuXIIU+pllynV
W2bQktqVTb2x5y+bINSvAoy6OSFxtFzoWAuRiwhG+9tBgbK+xpWCBSqC75PByeUx
3BijZNRmCfaayiL32Ykf8v3SU90TiKY703618fbHvN7eJRppQ+AIlsmgVae2XWTC
4uOSiQ3S6bgRXu9t1XyP50h8Jze6YEcTkp+2tExj3Sb4VJIyyfkBXRC7N74vtouj
nheYvgK45RjQNte676d1yHiYE/o3AfEzdHEtEXyC8tJt6DgVYWkIz0hPkIiAsE66
UPjN9uVB3x+Id/KICJWSnl+yhFUbDyPEURTD4PqHPVHWZyCTiDs9bFMzIjM7mh2m
OeymWFYBU0VV/0sTiYynTS8iGDY267sMl9nwPortwHt2XnM0kfnp7Bel/WS85Fzk
nVTOHnt+D9JK8l2SDW5NEfrmv6Q/iOTIoM9vd02UCtyVdIumws2L0cfFnk4UwclT
B17t09mApKGNEsN237nMiH04ph2gm5Mmsmc+8s4j0Gf3x3aIe3D6fJdm4Vdg85/5
87+8KyKQBk1h6IukXs5DXgTqK+2ZnungAw0y90uFty3MQ8X6giEyqxIx3ocxSEsP
g8bnjjEuiTIBSAkDX/zuq79eBZK/JegkL7QyK1K9YHMc3CtywDg=
=gLIY
-----END PGP SIGNATURE-----

--e2o3v47bdlumwysf--

--===============1190609796==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1190609796==--
