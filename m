Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB9006E824
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jun 2021 17:11:04 +0000 (UTC)
Date: Thu, 3 Jun 2021 20:06:25 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YLkMEYkpZl5/HOWq@intel.com>
References: <20210601162827.16058-1-ville.syrjala@linux.intel.com>
 <d1b6126e-79d9-4e2e-f1cc-2c36af337a03@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d1b6126e-79d9-4e2e-f1cc-2c36af337a03@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane: Use solid colors for
 the cropping tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jun 02, 2021 at 02:18:32PM +0300, Juha-Pekka Heikkila wrote:
> On 1.6.2021 19.28, Ville Syrjala wrote:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > Something is wrong with the way we render stuff in the crop tests.
> > The renreded image can be different for different pixel formats,
> > at least when using fullscreen planes (maybe resolution dependent).
> > Go back to using just solid colors until someone figures out what's
> > wrong with the rendering.
> =

> Is there some ci report where this could be seen? I guess it will fail =

> incorrectly?

Just saw it on some local ctg. I think that one has a 1400x900 (or
thereabouts) panel.

> =

> /Juha-Pekka
> =

> > =

> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> >   tests/kms_plane.c | 61 ++++++++++++++++++++++++++---------------------
> >   1 file changed, 34 insertions(+), 27 deletions(-)
> > =

> > diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> > index d7cbe8925cd9..ea1118c23769 100644
> > --- a/tests/kms_plane.c
> > +++ b/tests/kms_plane.c
> > @@ -567,7 +567,7 @@ static void capture_crc(data_t *data, unsigned int =
vblank, igt_crc_t *crc)
> >   		      crc->frame, vblank);
> >   }
> >   =

> > -static void capture_format_crcs_packed(data_t *data, enum pipe pipe,
> > +static void capture_format_crcs_single(data_t *data, enum pipe pipe,
> >   				       igt_plane_t *plane,
> >   				       uint32_t format, uint64_t modifier,
> >   				       int width, int height,
> > @@ -589,13 +589,13 @@ static void capture_format_crcs_packed(data_t *da=
ta, enum pipe pipe,
> >   	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &crc[0]);
> >   }
> >   =

> > -static void capture_format_crcs_planar(data_t *data, enum pipe pipe,
> > -				       igt_plane_t *plane,
> > -				       uint32_t format, uint64_t modifier,
> > -				       int width, int height,
> > -				       enum igt_color_encoding encoding,
> > -				       enum igt_color_range range,
> > -				       igt_crc_t crc[], struct igt_fb *fb)
> > +static void capture_format_crcs_multiple(data_t *data, enum pipe pipe,
> > +					 igt_plane_t *plane,
> > +					 uint32_t format, uint64_t modifier,
> > +					 int width, int height,
> > +					 enum igt_color_encoding encoding,
> > +					 enum igt_color_range range,
> > +					 igt_crc_t crc[], struct igt_fb *fb)
> >   {
> >   	unsigned int vblank[ARRAY_SIZE(colors_extended)];
> >   	struct drm_event_vblank ev;
> > @@ -712,6 +712,11 @@ restart_round:
> >   	capture_crc(data, vblank[i - 1], &crc[i - 1]);
> >   }
> >   =

> > +static bool use_multiple_colors(data_t *data, uint32_t format)
> > +{
> > +	return data->crop !=3D 0 || igt_format_is_yuv_semiplanar(format);
> > +}
> > +
> >   static bool test_format_plane_colors(data_t *data, enum pipe pipe,
> >   				     igt_plane_t *plane,
> >   				     uint32_t format, uint64_t modifier,
> > @@ -726,17 +731,17 @@ static bool test_format_plane_colors(data_t *data=
, enum pipe pipe,
> >   	int crc_mismatch_count =3D 0;
> >   	bool result =3D true;
> >   	int i, total_crcs =3D 1;
> > -	bool planar =3D igt_format_is_yuv_semiplanar(format);
> >   =

> > -	if (planar) {
> > -		capture_format_crcs_planar(data, pipe, plane, format, modifier,
> > -					   width, height, encoding, range, crc,
> > -					   fb);
> > +	if (use_multiple_colors(data, format)) {
> > +		capture_format_crcs_multiple(data, pipe, plane, format, modifier,
> > +					     width, height, encoding, range, crc,
> > +					     fb);
> >   		total_crcs =3D data->num_colors;
> > -	} else
> > -		capture_format_crcs_packed(data, pipe, plane, format, modifier,
> > +	} else {
> > +		capture_format_crcs_single(data, pipe, plane, format, modifier,
> >   					   width, height, encoding, range, crc,
> >   					   fb);
> > +	}
> >   =

> >   	for (i =3D 0; i < total_crcs; i++) {
> >   		if (!igt_check_crc_equal(&crc[i], &ref_crc[i])) {
> > @@ -826,9 +831,11 @@ static bool test_format_plane_yuv(data_t *data, en=
um pipe pipe,
> >   	return result;
> >   }
> >   =

> > -enum crc_set { PACKED_CRC_SET,
> > -	       PLANAR_CRC_SET,
> > -	       MAX_CRC_SET };
> > +enum crc_set {
> > +	SINGLE_CRC_SET,
> > +	MULTIPLE_CRC_SET,
> > +	MAX_CRC_SET,
> > +};
> >   =

> >   struct format_mod {
> >   	uint64_t modifier;
> > @@ -906,22 +913,22 @@ static bool test_format_plane(data_t *data, enum =
pipe pipe,
> >   		igt_remove_fb(data->drm_fd, &test_fb);
> >   	}
> >   =

> > -	capture_format_crcs_packed(data, pipe, plane, ref.format, ref.modifie=
r,
> > +	capture_format_crcs_single(data, pipe, plane, ref.format, ref.modifie=
r,
> >   				   width, height, IGT_COLOR_YCBCR_BT709,
> >   				   IGT_COLOR_YCBCR_LIMITED_RANGE,
> > -				   ref_crc[PACKED_CRC_SET], &fb);
> > +				   ref_crc[SINGLE_CRC_SET], &fb);
> >   =

> > -	capture_format_crcs_planar(data, pipe, plane, ref.format, ref.modifie=
r,
> > -				   width, height, IGT_COLOR_YCBCR_BT709,
> > -				   IGT_COLOR_YCBCR_LIMITED_RANGE,
> > -				   ref_crc[PLANAR_CRC_SET], &fb);
> > +	capture_format_crcs_multiple(data, pipe, plane, ref.format, ref.modif=
ier,
> > +				     width, height, IGT_COLOR_YCBCR_BT709,
> > +				     IGT_COLOR_YCBCR_LIMITED_RANGE,
> > +				     ref_crc[MULTIPLE_CRC_SET], &fb);
> >   =

> >   	/*
> >   	 * Make sure we have some difference between the colors. This
> >   	 * at least avoids claiming success when everything is just
> >   	 * black all the time (eg. if the plane is never even on).
> >   	 */
> > -	igt_require(num_unique_crcs(ref_crc[PLANAR_CRC_SET], data->num_colors=
) > 1);
> > +	igt_require(num_unique_crcs(ref_crc[MULTIPLE_CRC_SET], data->num_colo=
rs) > 1);
> >   =

> >   	for (int i =3D 0; i < plane->format_mod_count; i++) {
> >   		struct format_mod f =3D {
> > @@ -958,8 +965,8 @@ static bool test_format_plane(data_t *data, enum pi=
pe pipe,
> >   				continue;
> >   		}
> >   =

> > -		crcset =3D ref_crc[(igt_format_is_yuv_semiplanar(f.format)
> > -				 ? PLANAR_CRC_SET : PACKED_CRC_SET)];
> > +		crcset =3D ref_crc[use_multiple_colors(data, f.format) ?
> > +				 MULTIPLE_CRC_SET : SINGLE_CRC_SET];
> >   =

> >   		if (igt_format_is_yuv(f.format))
> >   			result &=3D test_format_plane_yuv(data, pipe, plane,
> > =


-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
