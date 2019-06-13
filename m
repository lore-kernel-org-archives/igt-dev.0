Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Brian Starkey <rodrigosiqueiramelo@gmail.com>
Date: Wed, 12 Jun 2019 23:17:08 -0300
Message-ID: <539f9b55a8269d3eb20d7d211f701d1a301d5b9d.1560374714.git.rodrigosiqueiramelo@gmail.com>
References: <cover.1560374714.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1560374714.git.rodrigosiqueiramelo@gmail.com>
Subject: [Intel-gfx] [PATCH V6 i-g-t 3/6] lib: Add function to hash a
 framebuffer
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0664932331=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Brian Starkey <Brian.Starkey@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>, Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, nd <nd@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0664932331==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tdahoyubazwj3454"
Content-Disposition: inline


--tdahoyubazwj3454
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

To use writeback buffers as a CRC source, we need to be able to hash
them. Implement a simple FVA-1a hashing routine for this purpose.

Doing a bytewise hash on the framebuffer directly can be very slow if
the memory is noncached. By making a copy of each line in the FB first
(which can take advantage of word-access speedup), we can do the hash
on a cached copy, which is much faster (10x speedup on my platform).

v6: use igt_memcpy_from_wc() instead of plain memcpy, as suggested by
    Chris Wilson

Signed-off-by: Brian Starkey <brian.starkey@arm.com>
[rebased and updated to the most recent API]
Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>
---
 lib/igt_fb.c | 66 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_fb.h |  3 +++
 2 files changed, 69 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 9d4f905e..d07dae39 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -3256,6 +3256,72 @@ bool igt_fb_supported_format(uint32_t drm_format)
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
+#define FNV1a_OFFSET_BIAS 2166136261
+#define FNV1a_PRIME 16777619
+	uint32_t hash;
+	void *map;
+	char *ptr, *line =3D NULL;
+	int x, y, cpp =3D igt_drm_format_to_bpp(fb->drm_format) / 8;
+	uint32_t stride =3D calc_plane_stride(fb, 0);
+
+	if (fb->is_dumb)
+		map =3D kmstest_dumb_map_buffer(fb->fd, fb->gem_handle, fb->size,
+					      PROT_READ);
+	else
+		map =3D gem_mmap__gtt(fb->fd, fb->gem_handle, fb->size,
+				    PROT_READ);
+	ptr =3D map;
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
+		igt_memcpy_from_wc(line, ptr, stride);
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
index adefebe1..a2741c05 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -37,6 +37,7 @@
 #include <i915_drm.h>
=20
 #include "igt_color_encoding.h"
+#include "igt_debugfs.h"
=20
 /*
  * Internal format to denote a buffer compatible with pixman's
@@ -194,5 +195,7 @@ int igt_format_plane_bpp(uint32_t drm_format, int plane=
);
 void igt_format_array_fill(uint32_t **formats_array, unsigned int *count,
 			   bool allow_yuv);
=20
+int igt_fb_get_crc(struct igt_fb *fb, igt_crc_t *crc);
+
 #endif /* __IGT_FB_H__ */
=20
--=20
2.21.0

--tdahoyubazwj3454
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl0BsiMACgkQWJzP/com
vP+GjQ/9FTB01yIYqaQa4kpjgpSA7pSMRjuLvheq5gwyaw9aoLdGN3b+D5ElC53g
o51JWiCy++kqyY+m3pvAwmcLF28t7vUvZOwJitwGYCpOpL6DBZ79w8xOgkQgO5Po
a81Q3LSXS4FKDP5XuU2kNg2mmlToD5U8URozP8aDdsOmCp2hKodohe1kSmifivUT
s0NdikH5OrAJPDO2FCjw2TCdZd4tn7iCd55QDij1Zjm2FlZJKjyHBFCru3d30WO4
2jOpD0SESAU8aoMZ8Fx4cT131lV8OCRbCcxeC/XL24jcBYGzWwLu6Av+nTwYFvx5
lOeDH9pPbHWVcsw85IO4pAHzAsM6/Iu86bRdo/B0pI1IJdf27Aq1nNEIt8i9rbn/
lCwjIBPDkz/NxUZETBRMQ2U2HSdlZQQfn0elBZUilWEDt+ZW+j4Sclx385Hi4eqA
hAPlPT96Ou39QGguqMA+9Y3zAZ8Ma6b2+pjR0zNx1YOa23lSxRQ/yx3Jk7bJFQRS
ZQ7oXQ9nf1cPT/02cKtBm/noetr2h/AGKoE+ofIjd9qM5euQAIXSH6y804p2epTn
eKzBJq1MTkt764DIm+c63usRFYpAJwoQKaqHEvhZAZWrBheZDJ9IG9PkLD0lzImH
NAOURFCJxDgxRxPge+y/TJM/jCYPLBcQAIXkH7cyTIc9WLBpRMU=
=O3gx
-----END PGP SIGNATURE-----

--tdahoyubazwj3454--

--===============0664932331==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4

--===============0664932331==--
