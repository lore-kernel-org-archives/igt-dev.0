Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Wed, 15 Apr 2020 11:42:03 +0200
From: Maxime Ripard <maxime@cerno.tech>
Message-ID: <20200415094203.stjco4xo4uw23vmh@gilmour.lan>
References: <20191022005952.tkdtftzbxk4b2lzk@smtp.gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191022005952.tkdtftzbxk4b2lzk@smtp.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v7 i-g-t 3/4] lib: Add function to hash a
 framebuffer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0371747235=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Simon Ser <contact@emersion.fr>, intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org, nd <nd@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0371747235==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zi63wbjyfazzdjj3"
Content-Disposition: inline


--zi63wbjyfazzdjj3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rodrigo,

I gave your (and Brian's) patches on a RPi, and there's a couple of
things that need to be fixed.

On Mon, Oct 21, 2019 at 10:00:00PM -0300, Brian Starkey wrote:
> To use writeback buffers as a CRC source, we need to be able to hash
> them. Implement a simple FVA-1a hashing routine for this purpose.
>
> Doing a bytewise hash on the framebuffer directly can be very slow if
> the memory is noncached. By making a copy of each line in the FB first
> (which can take advantage of word-access speedup), we can do the hash
> on a cached copy, which is much faster (10x speedup on my platform).
>
> V6: Simon Sir
>  - Replace #define by plain uint32_t variables
>  - Return -EINVAL in case fb->num_planes != 1
>  - Directly assign the mmap result to ptr
>  - No need to copy the whole stride, just copy fb->width * cpp since
> we're only going to read that
>
> v5: use igt_memcpy_from_wc() instead of plain memcpy, as suggested by
>     Chris Wilson
>
> Signed-off-by: Brian Starkey <brian.starkey@arm.com>
> [rebased and updated to the most recent API]
> Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>
> [rebased and updated the patch to address feedback]
> Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Reviewed-by: Simon Ser <simon.ser@intel.com>
> ---
>  lib/igt_fb.c | 68 ++++++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_fb.h |  2 ++
>  2 files changed, 70 insertions(+)
>
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 6b674c1b..64d52634 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -3491,6 +3491,74 @@ bool igt_fb_supported_format(uint32_t drm_format)
>  	return false;
>  }
>
> +/*
> + * This implements the FNV-1a hashing algorithm instead of CRC, for
> + * simplicity
> + * http://www.isthe.com/chongo/tech/comp/fnv/index.html
> + *
> + * hash = offset_basis
> + * for each octet_of_data to be hashed
> + *         hash = hash xor octet_of_data
> + *         hash = hash * FNV_prime
> + * return hash
> + *
> + * 32 bit offset_basis = 2166136261
> + * 32 bit FNV_prime = 224 + 28 + 0x93 = 16777619
> + */
> +int igt_fb_get_crc(struct igt_fb *fb, igt_crc_t *crc)
> +{
> +	uint32_t FNV1a_OFFSET_BIAS = 2166136261;
> +	uint32_t FNV1a_PRIME = 16777619;
> +	uint32_t hash;
> +	void *map;
> +	char *ptr, *line = NULL;
> +	int x, y, cpp = igt_drm_format_to_bpp(fb->drm_format) / 8;
> +	uint32_t stride = calc_plane_stride(fb, 0);
> +
> +	if (fb->num_planes != 1)
> +		return -EINVAL;
> +
> +	if (fb->is_dumb)
> +		ptr = kmstest_dumb_map_buffer(fb->fd, fb->gem_handle, fb->size,
> +					      PROT_READ);
> +	else
> +		ptr = gem_mmap__gtt(fb->fd, fb->gem_handle, fb->size,
> +				    PROT_READ);

You should be using igt_fb_map_buffer here

> +	/*
> +	 * Framebuffers are often uncached, which can make byte-wise accesses
> +	 * very slow. We copy each line of the FB into a local buffer to speed
> +	 * up the hashing.
> +	 */
> +	line = malloc(stride);
> +	if (!line) {
> +		munmap(map, fb->size);
> +		return -ENOMEM;
> +	}
> +
> +	hash = FNV1a_OFFSET_BIAS;
> +
> +	for (y = 0; y < fb->height; y++, ptr += stride) {
> +
> +		igt_memcpy_from_wc(line, ptr, fb->width * cpp);
> +
> +		for (x = 0; x < fb->width * cpp; x++) {
> +			hash ^= line[x];
> +			hash *= FNV1a_PRIME;
> +		}
> +	}
> +
> +	crc->n_words = 1;
> +	crc->crc[0] = hash;
> +
> +	free(line);
> +	munmap(map, fb->size);

And this will lead to a segfault here, since map has not been
initialized. I'm assuming the intention is to have map be the returned
value of mmap, and ptr to be initialized to that same value, and use
that as your current line pointer later on (the error path from the
malloc has the same issue).

Maxime

--zi63wbjyfazzdjj3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXpbW6wAKCRDj7w1vZxhR
xQSbAP4r9akJqPhLGb+Hhjbhg3KOSFkG1W4yNCy+kPL9mgffngD/bkW2RdQhZfFV
f2tU1p/woukPDwcgKVSMNPrQwGOoHQQ=
=xROn
-----END PGP SIGNATURE-----

--zi63wbjyfazzdjj3--

--===============0371747235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============0371747235==--
