Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73ACD10E1D9
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Dec 2023 19:38:51 +0000 (UTC)
Date: Mon, 18 Dec 2023 12:12:47 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH i-g-t 3/4] tests/kms_atomic: Add solid fill plane subtest
Message-ID: <20231218121247.454bc00a.pekka.paalanen@collabora.com>
In-Reply-To: <20231215-solid-fill-v1-3-12932f9f452d@quicinc.com>
References: <20231215-solid-fill-v1-0-12932f9f452d@quicinc.com>
 <20231215-solid-fill-v1-3-12932f9f452d@quicinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ac9NvaT2FI_1kD4ouN_mH+T";
 protocol="application/pgp-signature"; micalg=pgp-sha256
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Simon Ser <contact@emersion.fr>, igt-dev@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--Sig_/ac9NvaT2FI_1kD4ouN_mH+T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 15 Dec 2023 16:40:23 -0800
Jessica Zhang <quic_jesszhan@quicinc.com> wrote:

> Add a basic test for solid fill planes.
>=20
> This test will first commit a single-color framebuffer plane then
> a solid fill plane with the same contents. It then validates the solid
> fill plane by comparing the resulting CRC with the CRC of the reference
> framebuffer commit.
>=20
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  tests/kms_atomic.c | 94 ++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 94 insertions(+)
>=20
> diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
> old mode 100644
> new mode 100755
> index 2b6e9a8f0383..8f81e65ad84f
> --- a/tests/kms_atomic.c
> +++ b/tests/kms_atomic.c
> @@ -128,6 +128,13 @@ enum kms_atomic_check_relax {
>  	PLANE_RELAX_FB =3D (1 << 1)
>  };
> =20
> +struct solid_fill_blob {
> +	uint32_t r;
> +	uint32_t g;
> +	uint32_t b;
> +	uint32_t pad;
> +};
> +
>  static inline int damage_rect_width(struct drm_mode_rect *r)
>  {
>  	return r->x2 - r->x1;
> @@ -1322,6 +1329,79 @@ static void atomic_plane_damage(data_t *data)
>  	igt_remove_fb(data->drm_fd, &fb_2);
>  }
> =20
> +static void test_solid_fill_plane(data_t *data, igt_output_t *output,  i=
gt_plane_t *plane)
> +{
> +	struct drm_mode_create_blob c;
> +	struct drm_mode_destroy_blob d;
> +	drmModeModeInfo *mode =3D igt_output_get_mode(output);
> +	struct drm_mode_rect rect =3D { 0 };
> +	struct igt_fb ref_fb;
> +	igt_pipe_crc_t *pipe_crc;
> +	igt_crc_t ref_crc, new_crc;
> +	enum pipe pipe =3D data->pipe->pipe;
> +	int height, width;
> +	int ret;
> +
> +	struct solid_fill_blob blob_data =3D {
> +		.r =3D 0x00000000,
> +		.g =3D 0x00000000,
> +		.b =3D 0xff000000,
> +		.pad =3D 0x0,
> +	};

Hi Jessica!

This is the blob sent to KMS as the solid fill color...

...

> +	igt_create_color_fb(data->drm_fd, width, height,
> +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +			    0.0, 0.0, 1.0, &ref_fb);

..and this (0.0, 0.0, 1.0) is the corresponding color in normalized
values, I presume.

So you say that 0xff000000 =3D 1.0.

However, the patch for the kernel UAPI header says this:

+/**
+ * struct drm_mode_solid_fill - User info for solid fill planes
+ *
+ * This is the userspace API solid fill information structure.
+ *
+ * Userspace can enable solid fill planes by assigning the plane "solid_fi=
ll"
+ * property to a blob containing a single drm_mode_solid_fill struct popul=
ated with an RGB323232
+ * color and setting the pixel source to "SOLID_FILL".
+ *
+ * For information on the plane property, see drm_plane_create_solid_fill_=
property()
+ *
+ * @r: Red color value of single pixel
+ * @g: Green color value of single pixel
+ * @b: Blue color value of single pixel
+ * @pad: padding, must be zero
+ */
+struct drm_mode_solid_fill {
+	__u32 r;
+	__u32 g;
+	__u32 b;
+	__u32 pad;
+};

I assume that RGB323232 means unsigned 32-bit UNORM (Vulkan term)
format. That means 1.0 is 0xffffffff, not 0xff000000. This looks like a
bug in the test.

It would be good to test more than one color:
- 0.0, 0.0, 0.0
- 1.0, 0.0, 0.0
- 0.0, 1.0, 0.0
- 0.0, 0.0, 1.0
- 1.0, 1.0, 1.0

for example. That would get at least the so often used black explicitly
tested, and verify each channel gets mapped correctly rather than only
blue.

It would also be really good to test dim and mid grays, but I assume it
might be difficult to get CRC to match over various hardware. You'd
need to use writeback with an error tolerance. (For watching photos for
example, the background is not usually black but dim gray I believe.)


Thanks,
pq

--Sig_/ac9NvaT2FI_1kD4ouN_mH+T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmWAGx8ACgkQI1/ltBGq
qqdNsg/+I5xnmT7lJSDEd6ZFh+7IPQn4HkhBRccyL0xhVaKC2klMih/bVGCKmvpl
w/8XQRcoPc/lrxEIpXt2IButnOx0opcnmrc/3vHGtI5LLGVpgk6hiMZ7CVG5o75V
QosgoL0Hk4Dk2eTw1zfdrmf6vyibFUjj+6Q5Bu4hidT5GGblsSO6IzNqBUCsqXXy
QGyj6tmLtNPptL8gxyNlj7zIke55lfjw0CTkG0lO13ZXhWHBNcikQrLDBdLNWel6
9oTk7o2ouQtsvUVlcZ6Wd59UPFTLJyqboyoHpQCsSrBhm5w+DwHk0TQWpxZs+hdb
oEdcpdw9bwgo7qKqRr53LGLIJbWtd2L7A8udS9tWdH4yme89fg9B6ixsn63iL8hP
IrXvpk1uZDbQ5alKp/YoaPZ7N49lyhoO7sbT54BYjm3oTX6UKJ/N1PUf6QypedNh
5AvecpnjVKvb3Ndpu+lN/FiqbyutBikfTeF2RIhm1/9z55wVq10S2ZbtjNnF2n32
+/DKJKiKcjfpVXFsrr4Rlq1xy0BrhhdUvpsG/OU2UA6XQfBynx4UHjWz4pef0CpV
/P4cEVEnAQSOEOeVtIMIS8r4RuBtqkI75KCB82RZHwpQSMWB1KW6e2BKs1zyIrmp
N27e31q3aZlTt9JbJKGVz3Z/CUBZW2tmryv1dDK+U6J0Ivz4ZBw=
=IbAB
-----END PGP SIGNATURE-----

--Sig_/ac9NvaT2FI_1kD4ouN_mH+T--
