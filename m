Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5AD110E0BE
 for <igt-dev@lists.freedesktop.org>; Wed, 31 May 2023 11:43:21 +0000 (UTC)
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>
Date: Wed, 31 May 2023 11:43:09 +0000
Message-ID: <MWHPR11MB1935A709363C4E64BDE129B4B2489@MWHPR11MB1935.namprd11.prod.outlook.com>
References: <20230530172402.19999-1-nidhi1.gupta@intel.com>
In-Reply-To: <20230530172402.19999-1-nidhi1.gupta@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [RFC,
 i-g-t] tests/kms_vrr: Add a new subtest to validate different VRR
 modes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Nidhi,

> -----Original Message-----
> From: Gupta, Nidhi1 <nidhi1.gupta@intel.com>
> Sent: 30 May 2023 22:54
> To: igt-dev@lists.freedesktop.org
> Cc: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> Gupta, Nidhi1 <nidhi1.gupta@intel.com>
> Subject: [RFC, i-g-t] tests/kms_vrr: Add a new subtest to validate differ=
ent
> VRR modes
>=20
> Test switch from base VRR mode to various VRR supported modes without
> triggering modeset.
>=20
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>  tests/kms_vrr.c | 142 +++++++++++++++++++++++++++++++++++++++++++----
> -
>  1 file changed, 127 insertions(+), 15 deletions(-)
>=20
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c index d2d79c4e..173d7010
> 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -46,6 +46,7 @@ enum {
>  	TEST_SUSPEND =3D 1 << 2,
>  	TEST_FLIPLINE =3D 1 << 3,
>  	TEST_NEGATIVE =3D 1 << 4,
> +	TEST_BASE_MODE_TO_VARIOUS_VRR_MODE =3D 1 << 5,
>  };
>=20
>  typedef struct range {
> @@ -56,10 +57,17 @@ typedef struct range {  typedef struct data {
>  	igt_display_t display;
>  	int drm_fd;
> +	int count_modes;
> +	uint32_t hdisplay;
> +	uint32_t vdisplay;
>  	igt_plane_t *primary;
>  	igt_fb_t fb0;
>  	igt_fb_t fb1;
>  	range_t range;
> +	drmModeConnector *connector;
> +	drmModeModeInfo *modes;
> +	uint32_t base_mode_index;
> +	uint32_t preferred_mode_index;
>  } data_t;
>=20
>  typedef struct vtest_ns {
> @@ -168,6 +176,77 @@ get_vrr_range(data_t *data, igt_output_t *output)
>  	return range;
>  }
>=20
> +static bool is_variable_video_mode(data_t *data, drmModeModeInfo
> *mode)
> +{
> +	drmModeModeInfo *base_mode =3D &data->modes[data-
> >base_mode_index];
> +	uint32_t bm_clock =3D base_mode->clock;
> +
> +	if (mode->hdisplay =3D=3D data->hdisplay &&
> +	    mode->vdisplay =3D=3D data->vdisplay &&
> +	    mode->clock =3D=3D bm_clock &&
> +	    mode->type & DRM_MODE_TYPE_DRIVER) {
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +static void init_data(data_t *data, igt_output_t *output) {
> +	int i;
> +	uint32_t pm_hdisplay, pm_vdisplay, max_clk =3D 0;
> +	drmModeModeInfo *preferred_mode;
> +	drmModeConnector *connector;
> +
> +	connector =3D data->connector =3D output->config.connector;
> +	data->count_modes =3D connector->count_modes;
> +	data->modes =3D (drmModeModeInfo
> *)malloc(sizeof(drmModeModeInfo) *
> +data->count_modes);
> +
> +	for (i =3D 0; i < data->count_modes; i++) {
> +		data->modes[i] =3D connector->modes[i]; #ifdef FSV_DEBUG
> +		igt_info("mode %d:", i);
> +		kmstest_dump_mode(&data->modes[i]);
> +#endif
> +	}
> +
> +	/* searching the preferred mode */
> +	for (i =3D 0; i < connector->count_modes; i++) {
> +		drmModeModeInfo *mode =3D &connector->modes[i];
> +
> +		if (mode->type & DRM_MODE_TYPE_PREFERRED) {
> +			data->preferred_mode_index =3D i;
> +			data->hdisplay =3D mode->hdisplay;
> +			data->vdisplay =3D mode->vdisplay;
> +			pm_hdisplay =3D preferred_mode->hdisplay;
> +			pm_vdisplay =3D preferred_mode->vdisplay;
> +			break;
> +		}
> +	}
> +
> +	/* searching the base mode; */
> +	for (i =3D 0; i < connector->count_modes; i++) {
> +		drmModeModeInfo *mode =3D &connector->modes[i];
> +
> +		if (mode->hdisplay =3D=3D pm_hdisplay && mode->vdisplay =3D=3D
> pm_vdisplay) {
> +			if (mode->clock > max_clk) {
> +				max_clk =3D mode->clock;
> +				data->base_mode_index =3D i;
> +			}
> +		}
> +	}
> +	igt_info("preferred=3D%d, base=3D%d\n", data->preferred_mode_index,
> +data->base_mode_index);
> +
> +	for (i =3D 0; i < connector->count_modes; i++) {
> +		drmModeModeInfo *mode =3D &connector->modes[i];
> +
> +		if (is_variable_video_mode(data, mode))
> +			igt_debug("mode[%d] is variable video mode.\n", i);
> +	}
> +
> +	data->range =3D get_vrr_range(data, output); }
> +
>  /* Returns vrr test frequency for min, mid & max range. */  static vtest=
_ns_t
> get_test_rate_ns(range_t range)  { @@ -201,39 +280,42 @@ static void
> set_vrr_on_pipe(data_t *data, enum pipe pipe, bool enabled)  }
>=20
>  /* Prepare the display for testing on the given pipe. */ -static void
> prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
> +static void prepare_test(data_t *data, igt_output_t *output, enum pipe
> +pipe, drmModeModeInfo *mode)
>  {
> -	drmModeModeInfo mode;
>  	cairo_t *cr;
>=20
>  	/* Reset output */
>  	igt_display_reset(&data->display);
>  	igt_output_set_pipe(output, pipe);
>=20
> +	igt_output_override_mode(output, mode);
> +
>  	/* Capture VRR range */
>  	data->range =3D get_vrr_range(data, output);
>=20
> -	/* Override mode with max vrefresh.
> -	 *   - vrr_min range should be less than the override mode vrefresh.
> -	 *   - Limit the vrr_max range with the override mode vrefresh.
> -	 */
> -	mode =3D output_mode_with_maxrate(output, data->range.max);
> -	igt_require(mode.vrefresh > data->range.min);
> -	data->range.max =3D mode.vrefresh;
> -	igt_output_override_mode(output, &mode);
> +	if (mode =3D=3D NULL) {
> +		/* Override mode with max vrefresh.
> +		 *   - vrr_min range should be less than the override mode
> vrefresh.
> +		 *   - Limit the vrr_max range with the override mode
> vrefresh.
> +		 */
> +		*mode =3D output_mode_with_maxrate(output, data-
> >range.max);
> +		igt_require(mode->vrefresh > data->range.min);
> +		data->range.max =3D mode->vrefresh;
> +		igt_output_override_mode(output, mode);
> +	}
>=20
>  	/* Prepare resources */
> -	igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
> +	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
>  			    DRM_FORMAT_XRGB8888,
> DRM_FORMAT_MOD_LINEAR,
>  			    0.50, 0.50, 0.50, &data->fb0);
>=20
> -	igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
> +	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
>  			    DRM_FORMAT_XRGB8888,
> DRM_FORMAT_MOD_LINEAR,
>  			    0.50, 0.50, 0.50, &data->fb1);
>=20
>  	cr =3D igt_get_cairo_ctx(data->drm_fd, &data->fb0);
>=20
> -	igt_paint_color(cr, 0, 0, mode.hdisplay / 10, mode.vdisplay / 10,
> +	igt_paint_color(cr, 0, 0, mode->hdisplay / 10, mode->vdisplay / 10,
>  			1.00, 0.00, 0.00);
>=20
>  	igt_put_cairo_ctx(cr);
> @@ -353,19 +435,27 @@ flip_and_measure(data_t *data, igt_output_t
> *output, enum pipe pipe,
>  	return total_flip ? ((total_pass * 100) / total_flip) : 0;  }
>=20
> +/* Returns the rate duration in nanoseconds for the given refresh rate.
> +*/ static uint64_t nsec_per_frame(uint64_t refresh) {
> +	return NSECS_PER_SEC / refresh;
> +}
> +
>  /* Basic VRR flip functionality test - enable, measure, disable, measure=
 */
> static void  test_basic(data_t *data, enum pipe pipe, igt_output_t *outpu=
t,
> uint32_t flags)  {
>  	uint32_t result;
> +	int index;
>  	vtest_ns_t vtest_ns;
>  	range_t range;
>  	uint64_t rate;
> +	drmModeModeInfo *mode;
>=20
> -	prepare_test(data, output, pipe);
>  	range =3D data->range;
>  	vtest_ns =3D get_test_rate_ns(range);
>  	rate =3D vtest_ns.mid;
> +	mode =3D NULL;
>=20
>  	igt_info("VRR Test execution on %s, PIPE_%s with VRR range: (%u-
> %u) Hz\n",
>  		 output->name, kmstest_pipe_name(pipe), range.min,
> range.max); @@ -380,6 +470,7 @@ test_basic(data_t *data, enum pipe
> pipe, igt_output_t *output, uint32_t flags)
>  	flip_and_measure(data, output, pipe, rate, 250000000ull);
>=20
>  	if (flags & TEST_DPMS) {
> +		prepare_test(data, output, pipe, mode);

I think we can drop this change to add mode explicitly as we are intended t=
o initialise to max rate which we are doing in prepare_test function itself=
.=20
As in this current change also passing NULL only, in-turn initializing mode=
 in prepare_test only.

>  		kmstest_set_connector_dpms(output->display->drm_fd,
>  					   output->config.connector,
>  					   DRM_MODE_DPMS_OFF);
> @@ -388,9 +479,11 @@ test_basic(data_t *data, enum pipe pipe,
> igt_output_t *output, uint32_t flags)
>  					   DRM_MODE_DPMS_ON);
>  	}
>=20
> -	if (flags & TEST_SUSPEND)
> +	if (flags & TEST_SUSPEND) {
> +		prepare_test(data, output, pipe, mode);

Also, may not be required to this redundant prepare_test calls, rather if w=
e can initialize during test_basic start is also sufficient.

Thanks,
Mitul
