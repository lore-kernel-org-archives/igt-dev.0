Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 18 Nov 2021 10:41:24 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
Message-ID: <20211118104124.4835958a@eldfell>
In-Reply-To: <20211115094759.520955-4-bhanuprakash.modem@intel.com>
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
 <20211115094759.520955-4-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BK=ens8gBkt9be3L9+/+ZRE";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Subject: Re: [igt-dev] [i-g-t 03/14] kms_color_helper: Add helper functions
 for plane color mgmt
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--Sig_/BK=ens8gBkt9be3L9+/+ZRE
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Nov 2021 15:17:48 +0530
Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:

> Add helper functions to support Plane color management properties.
>=20
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_color_helper.c | 173 +++++++++++++++++++++++++++++++++++++++
>  tests/kms_color_helper.h |  29 +++++++
>  2 files changed, 202 insertions(+)
>=20
> diff --git a/tests/kms_color_helper.c b/tests/kms_color_helper.c
> index d71e7bb2e6..c65b7a0f50 100644
> --- a/tests/kms_color_helper.c
> +++ b/tests/kms_color_helper.c
> @@ -241,6 +241,150 @@ void disable_prop(igt_pipe_t *pipe, enum igt_atomic=
_crtc_properties prop)
>  		igt_pipe_obj_replace_prop_blob(pipe, prop, NULL, 0);
>  }
> =20
> +drmModePropertyPtr get_plane_gamma_degamma_mode(igt_plane_t *plane,
> +				enum igt_atomic_plane_properties prop)
> +{
> +	igt_display_t *display =3D plane->pipe->display;
> +	uint32_t prop_id =3D plane->props[prop];
> +	drmModePropertyPtr drmProp;
> +
> +	igt_assert(prop_id);
> +
> +	drmProp =3D drmModeGetProperty(display->drm_fd, prop_id);
> +
> +	igt_assert(drmProp);
> +	igt_assert(drmProp->count_enums);
> +
> +	return drmProp;
> +}
> +
> +struct drm_color_lut_ext *create_linear_lut(segment_data_t *info)

Hi,

this actually creates an identity transformation as a LUT, does it not?
If so, it should be named that way. A linear transformation
represented by a LUT may not be identity transformation.

Identity is quite a bad case to test with, because it is a no-op, and
simply accidentally disabling the whole LUT will pass a writeback test.

> +{
> +	uint32_t val, segment, entry, index =3D 0;
> +	uint32_t max_val =3D 0xffffffff;
> +	struct drm_color_lut_ext *lut =3D malloc(sizeof(struct drm_color_lut_ex=
t) * info->entries_count);
> +	igt_assert(lut);
> +
> +	for (segment =3D 0; segment < info->segment_count; segment++) {
> +		uint32_t entry_count =3D info->segment_data[segment].count;
> +		uint32_t start =3D info->segment_data[segment].start;
> +		uint32_t end =3D info->segment_data[segment].end;
> +
> +		for (entry =3D 1; entry <=3D entry_count; entry++) {
> +			val =3D (index =3D=3D 0) ? /* First entry is Zero. */
> +				0 : start + entry * ((end - start) * 1.0 / entry_count);

Having to explicitly special-case index zero feels odd to me. Why does
it need explicit special-casing?

To me it's a hint that the definitions of .start and .end are somehow
inconsistent.

> +
> +			lut[index].red =3D lut[index].green =3D lut[index].blue =3D MIN(val, =
max_val);

There are tests that use different curves for each of red, green and
blue and check that they also work, right?

> +
> +			index++;
> +		}
> +	}
> +
> +	return lut;
> +}
> +
> +struct drm_color_lut_ext *create_max_lut(segment_data_t *info)

What is the point of testing this pathological case?

> +{
> +	int i;
> +	struct drm_color_lut_ext *lut;
> +	uint32_t max_val =3D 0xffffffff;
> +
> +	lut =3D malloc(sizeof(struct drm_color_lut_ext) * info->entries_count);
> +	igt_assert(lut);
> +
> +	lut[0].red =3D lut[0].green =3D lut[0].blue =3D 0; /* First entry is Ze=
ro. */

It's not a max LUT, if the first entry is zero.

> +
> +	for (i =3D 1; i < info->entries_count; i++)
> +		lut[i].red =3D lut[i].green =3D lut[i].blue =3D max_val;
> +
> +	return lut;
> +}
> +
> +void clear_segment_data(segment_data_t *info)
> +{
> +	if (!info)
> +		return;
> +
> +	free(info->segment_data);
> +	free(info);
> +}
> +
> +segment_data_t *get_segment_data(data_t *data,
> +				uint64_t blob_id, char *mode)
> +{
> +	drmModePropertyBlobPtr blob;
> +	struct drm_color_lut_range *lut_range =3D NULL;
> +	segment_data_t *info =3D NULL;
> +	uint32_t i;
> +
> +	blob =3D drmModeGetPropertyBlob(data->drm_fd, blob_id);
> +	igt_assert(blob);
> +	igt_assert(blob->length);
> +
> +	info =3D malloc(sizeof(segment_data_t));
> +	igt_assert(info);
> +
> +	lut_range =3D (struct drm_color_lut_range *) blob->data;
> +	info->segment_count =3D blob->length / sizeof(lut_range[0]);
> +	igt_assert(info->segment_count);
> +
> +	info->segment_data =3D malloc(sizeof(struct drm_color_lut_range) * info=
->segment_count);
> +	igt_assert(info->segment_data);
> +
> +	for (i =3D 0; i < info->segment_count; i++) {
> +		info->entries_count +=3D lut_range[i].count;
> +		info->segment_data[i] =3D lut_range[i];
> +	}
> +
> +	drmModeFreePropertyBlob(blob);
> +
> +	return info;
> +}
> +
> +void set_plane_gamma(igt_plane_t *plane,
> +		char *mode,
> +		struct drm_color_lut_ext *lut,
> +		uint32_t size)
> +{
> +	igt_plane_set_prop_enum(plane, IGT_PLANE_GAMMA_MODE, mode);
> +	igt_plane_replace_prop_blob(plane, IGT_PLANE_GAMMA_LUT, lut, size);
> +}
> +
> +void set_plane_degamma(igt_plane_t *plane,
> +		char *mode,
> +		struct drm_color_lut_ext *lut,
> +		uint32_t size)
> +{
> +	igt_plane_set_prop_enum(plane, IGT_PLANE_DEGAMMA_MODE, mode);
> +	igt_plane_replace_prop_blob(plane, IGT_PLANE_DEGAMMA_LUT, lut, size);
> +}
> +
> +void set_plane_ctm(igt_plane_t *plane, const double *coefficients)
> +{
> +	struct drm_color_ctm ctm;
> +	int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(ctm.matrix); i++) {
> +		if (coefficients[i] < 0) {
> +			ctm.matrix[i] =3D
> +				(int64_t) (-coefficients[i] *
> +				((int64_t) 1L << 32));
> +			ctm.matrix[i] |=3D 1ULL << 63;
> +		} else
> +			ctm.matrix[i] =3D
> +				(int64_t) (coefficients[i] *
> +				((int64_t) 1L << 32));
> +	}

Is this literally the only function that converts double to the KMS
matrix element type? If not, I think the value conversion should be a
separate function that just converts a single value, and be called from
all sites that need the same conversion.

> +
> +	igt_plane_replace_prop_blob(plane, IGT_PLANE_CTM, &ctm, sizeof(ctm));
> +}
> +
> +void disable_plane_prop(igt_plane_t *plane, enum igt_atomic_plane_proper=
ties prop)
> +{
> +	if (igt_plane_has_prop(plane, prop))
> +		igt_plane_replace_prop_blob(plane, prop, NULL, 0);
> +}
> +
>  drmModePropertyBlobPtr
>  get_blob(data_t *data, igt_pipe_t *pipe, enum igt_atomic_crtc_properties=
 prop)
>  {
> @@ -274,6 +418,19 @@ pipe_set_property_blob_id(igt_pipe_t *pipe,
>  	return ret;
>  }
> =20
> +static int
> +plane_set_property_blob(igt_display_t *display,
> +			igt_plane_t *plane,
> +			enum igt_atomic_plane_properties prop,
> +			void *ptr, size_t length)
> +{
> +	igt_plane_replace_prop_blob(plane, prop, ptr, length);
> +
> +	return igt_display_try_commit2(display,
> +				       display->is_atomic ?
> +				       COMMIT_ATOMIC : COMMIT_LEGACY);
> +}
> +
>  int
>  pipe_set_property_blob(igt_pipe_t *pipe,
>  		       enum igt_atomic_crtc_properties prop,
> @@ -319,6 +476,22 @@ invalid_lut_sizes(data_t *data, enum pipe p,
>  	free(lut);
>  }
> =20
> +void
> +invalid_plane_lut_sizes(igt_display_t *display,
> +			igt_plane_t *plane,
> +			enum igt_atomic_plane_properties prop,
> +			size_t lut_size)
> +{
> +	void *lut =3D malloc(lut_size * 2);

Feeding garbage data does not seem like a good idea. Maybe it can lead
to EINVAL even when the driver misses the size check because the values
are illegal?

I think this needs to craft a real and good lut data blob, with the
only problem that it is of the wrong size.

> +	igt_assert(lut);
> +
> +	igt_assert_eq(plane_set_property_blob(display, plane, prop, lut, 1), -E=
INVAL);
> +	igt_assert_eq(plane_set_property_blob(display, plane, prop, lut, lut_si=
ze + 1), -EINVAL);
> +	igt_assert_eq(plane_set_property_blob(display, plane, prop, lut, lut_si=
ze - 1), -EINVAL);
> +
> +	free(lut);
> +}

Thanks,
pq


> +
>  void
>  invalid_gamma_lut_sizes(data_t *data, enum pipe p)
>  {
> diff --git a/tests/kms_color_helper.h b/tests/kms_color_helper.h
> index bb6f0054f3..5a35dcaac1 100644
> --- a/tests/kms_color_helper.h
> +++ b/tests/kms_color_helper.h
> @@ -64,6 +64,14 @@ typedef struct {
>  	color_t coeffs[];
>  } gamma_lut_t;
> =20
> +typedef struct {
> +	uint32_t segment_count;
> +	struct drm_color_lut_range *segment_data;
> +	uint32_t entries_count;
> +} segment_data_t;
> +
> +#define MIN(a, b) ((a) < (b) ? (a) : (b))
> +
>  void paint_gradient_rectangles(data_t *data,
>  			       drmModeModeInfo *mode,
>  			       color_t *colors,
> @@ -90,10 +98,31 @@ void set_gamma(data_t *data,
>  void set_ctm(igt_pipe_t *pipe, const double *coefficients);
>  void disable_prop(igt_pipe_t *pipe, enum igt_atomic_crtc_properties prop=
);
> =20
> +drmModePropertyPtr get_plane_gamma_degamma_mode(igt_plane_t *plane,
> +	enum igt_atomic_plane_properties prop);
> +void clear_segment_data(segment_data_t *info);
> +struct drm_color_lut_ext *create_linear_lut(segment_data_t *info);
> +struct drm_color_lut_ext *create_max_lut(segment_data_t *info);
> +segment_data_t *get_segment_data(data_t *data, uint64_t blob_id, char *m=
ode);
> +void set_plane_gamma(igt_plane_t *plane,
> +	char *mode, struct drm_color_lut_ext *lut, uint32_t size);
> +void set_plane_degamma(igt_plane_t *plane,
> +	char *mode, struct drm_color_lut_ext *lut, uint32_t size);
> +void set_plane_ctm(igt_plane_t *plane, const double *coefficients);
> +void disable_plane_prop(igt_plane_t *plane, enum igt_atomic_plane_proper=
ties prop);
> +void invalid_plane_lut_sizes(igt_display_t *display,
> +			   igt_plane_t *plane,
> +			   enum igt_atomic_plane_properties prop,
> +			   size_t lut_size);
> +
>  #define disable_degamma(pipe) disable_prop(pipe, IGT_CRTC_DEGAMMA_LUT)
>  #define disable_gamma(pipe) disable_prop(pipe, IGT_CRTC_GAMMA_LUT)
>  #define disable_ctm(pipe) disable_prop(pipe, IGT_CRTC_CTM)
> =20
> +#define disable_plane_degamma(plane) disable_plane_prop(plane, IGT_PLANE=
_DEGAMMA_LUT)
> +#define disable_plane_gamma(plane) disable_plane_prop(plane, IGT_PLANE_G=
AMMA_LUT)
> +#define disable_plane_ctm(plane) disable_plane_prop(plane, IGT_PLANE_CTM)
> +
>  drmModePropertyBlobPtr get_blob(data_t *data, igt_pipe_t *pipe,
>  				enum igt_atomic_crtc_properties prop);
>  bool crc_equal(igt_crc_t *a, igt_crc_t *b);


--Sig_/BK=ens8gBkt9be3L9+/+ZRE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGWEbQACgkQI1/ltBGq
qqe9ihAApkQsUKUNqcP1R8Cy+D/fVWk9TqQmCpboyASuAIdWz2ZXIkv2CO+j8cpo
6BSpZ6zcDhgugtQenV4uuuLeWQR9he2Lh5ZaT9U9Y5Aaivrw8LfdfDORB3ddQe6c
Mh3Zy0NxTXhKXxF47Wp8IWBXDWYhwVUjXcdgDYJdiz8kT94Pm9nfJm0qqYinHLVA
cWeNadobvBk0jsPJMAf/J/grBHbmAsxPakdHD2XdAP74CLG8Xts8LigXJnPjcoNA
kjLWppBViFZB3CK/+0H3euMRFa1WvWoQI1O+15EoScxAUzvW0zg9yROntvl4Au0H
r1zCLjDsra1bBzNem03mJoz1cWSHH5yni5ewrQMoy0cTSj7U//+9rmGWCeI1hUwf
buWWFay77KVoHUeIYmCGDqe87uFNdWKGnEt+TcR7T7tK/yQDE62XTCqlBySuajd1
RdqlKmHFVBWge8VXhDMtz3g+TJE49FTzp2ARIUq+Ia5c+Q8Aj4NbEGwsXOHCwpwM
+QKD4N93MSa4fDTewC9Blrwk1wk4Dg45rUCvpuXBfWm6X5C3q0HAYEliLKmuSIb8
lHAIYXPt0ZDen6j2p/L/RQY4AwMf2bUAn4+gGMdk4La5cUr1XgMcTmMo24HS+Fdc
5RIw+1IVIu/hRbJrkcDClkfuFn80zvTZhtF22O9USaIw3uPoiw0=
=R0ty
-----END PGP SIGNATURE-----

--Sig_/BK=ens8gBkt9be3L9+/+ZRE--
