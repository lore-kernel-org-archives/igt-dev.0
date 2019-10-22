Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Brian Starkey <rodrigosiqueiramelo@gmail.com>
Date: Mon, 21 Oct 2019 22:00:00 -0300
Message-ID: <20191022005952.tkdtftzbxk4b2lzk@smtp.gmail.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH v7 i-g-t 3/4] lib: Add function to hash a
 framebuffer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1438215969=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Simon Ser <contact@emersion.fr>, Brian Starkey <Brian.Starkey@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>, Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, nd <nd@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============1438215969==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="infmbgnf3bp4flp2"
Content-Disposition: inline


--infmbgnf3bp4flp2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

To use writeback buffers as a CRC source, we need to be able to hash
them. Implement a simple FVA-1a hashing routine for this purpose.

Doing a bytewise hash on the framebuffer directly can be very slow if
the memory is noncached. By making a copy of each line in the FB first
(which can take advantage of word-access speedup), we can do the hash
on a cached copy, which is much faster (10x speedup on my platform).

V6: Simon Sir
 - Replace #define by plain uint32_t variables
 - Return -EINVAL in case fb->num_planes !=3D 1
 - Directly assign the mmap result to ptr
 - No need to copy the whole stride, just copy fb->width * cpp since
we're only going to read that

v5: use igt_memcpy_from_wc() instead of plain memcpy, as suggested by
    Chris Wilson

Signed-off-by: Brian Starkey <brian.starkey@arm.com>
[rebased and updated to the most recent API]
Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>
[rebased and updated the patch to address feedback]
Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Reviewed-by: Simon Ser <simon.ser@intel.com>
---
 lib/igt_fb.c | 68 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_fb.h |  2 ++
 2 files changed, 70 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 6b674c1b..64d52634 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -3491,6 +3491,74 @@ bool igt_fb_supported_format(uint32_t drm_format)
 	return false;
 }
=20
+/*
+ * This implements the FNV-1a hashing algorithm instead of CRC, for
+ * simplicity
+ * http://www.isthe.com/chongo/tech/comp/fnv/index.html
+ *
+ * hash =3D offset_basis
+ * for each octet_of_data to be hashed
+ *         hash =3D hash xor octet_of_data
+ *         hash =3D hash * FNV_prime
+ * return hash
+ *
+ * 32 bit offset_basis =3D 2166136261
+ * 32 bit FNV_prime =3D 224 + 28 + 0x93 =3D 16777619
+ */
+int igt_fb_get_crc(struct igt_fb *fb, igt_crc_t *crc)
+{
+	uint32_t FNV1a_OFFSET_BIAS =3D 2166136261;
+	uint32_t FNV1a_PRIME =3D 16777619;
+	uint32_t hash;
+	void *map;
+	char *ptr, *line =3D NULL;
+	int x, y, cpp =3D igt_drm_format_to_bpp(fb->drm_format) / 8;
+	uint32_t stride =3D calc_plane_stride(fb, 0);
+
+	if (fb->num_planes !=3D 1)
+		return -EINVAL;
+
+	if (fb->is_dumb)
+		ptr =3D kmstest_dumb_map_buffer(fb->fd, fb->gem_handle, fb->size,
+					      PROT_READ);
+	else
+		ptr =3D gem_mmap__gtt(fb->fd, fb->gem_handle, fb->size,
+				    PROT_READ);
+
+	/*
+	 * Framebuffers are often uncached, which can make byte-wise accesses
+	 * very slow. We copy each line of the FB into a local buffer to speed
+	 * up the hashing.
+	 */
+	line =3D malloc(stride);
+	if (!line) {
+		munmap(map, fb->size);
+		return -ENOMEM;
+	}
+
+	hash =3D FNV1a_OFFSET_BIAS;
+
+	for (y =3D 0; y < fb->height; y++, ptr +=3D stride) {
+
+		igt_memcpy_from_wc(line, ptr, fb->width * cpp);
+
+		for (x =3D 0; x < fb->width * cpp; x++) {
+			hash ^=3D line[x];
+			hash *=3D FNV1a_PRIME;
+		}
+	}
+
+	crc->n_words =3D 1;
+	crc->crc[0] =3D hash;
+
+	free(line);
+	munmap(map, fb->size);
+
+	return 0;
+#undef FNV1a_OFFSET_BIAS
+#undef FNV1a_PRIME
+}
+
 /**
  * igt_format_is_yuv:
  * @drm_format: drm fourcc
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index 69132b41..d2394638 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -202,5 +202,7 @@ int igt_format_plane_bpp(uint32_t drm_format, int plane=
);
 void igt_format_array_fill(uint32_t **formats_array, unsigned int *count,
 			   bool allow_yuv);
=20
+int igt_fb_get_crc(struct igt_fb *fb, igt_crc_t *crc);
+
 #endif /* __IGT_FB_H__ */
=20
--=20
2.23.0

--infmbgnf3bp4flp2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl2uVIgACgkQWJzP/com
vP8Ndg/+Iji6v4V95be61Zzjbmq3e3Yh8nqrfSgsoV0XehcijyCO+o0pnyOevnSZ
oVJonm5K4rFWu3Huw3078Dx3WAClnPNPTEyfk/iuwAOZHBLYLC2OnUoCBZvjWHPA
wT0ousGGwJxYIwaJyuBxCwYEq7leKbJ2ZSFxuUVQUkap8MR2KA74Nc8IuBlHsDCi
egkCNPjWAptpmZTXDX9/j7NEiqlABLpKAtf2wkhf6IsnrLbfikRSfIjK7fvfJq5K
KddwLzoDYuQ0UCHlN9drgzfOzOuYp4+PNPxyEd/zelECZJ7mSkn46XqxB3pf/98q
eu/3TeiAuYElLRqrS8jAqCQ2mwJfeW0zOKatxQojuwAO7jF+ZcHgFklf33Pnmdfm
h5fpChE+i/2Fy7pPG/UtYIP/Jrz4jFlqFBv+NSCE6z81TSnkuWayH+9DU1gmkdWt
gdt+A+exRMb8d1w3KLnLdF3r1aEpQ2mzzHK0alnopSb1wHCeYRYfY1tPGODYYhzX
eBbzUyw714/Dq0uG412/SEwgrUGgqztAqj28yYoIX2QQDATHwBDzcWZ17OgMsHEI
oMA10fC2ut6bknSNXZhEKf/CFK9GhV5v5J1URPudonX9q9IfRC1inpmaCWxgLVxa
5KVpJGPw7uvPeK5ExF9ty0NVGGBdeybQY4sHzkIz35QxzMdB9yk=
=HUfn
-----END PGP SIGNATURE-----

--infmbgnf3bp4flp2--

--===============1438215969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4

--===============1438215969==--
