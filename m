Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4986C6E8BB
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Mar 2021 05:06:49 +0000 (UTC)
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Tue, 2 Mar 2021 05:06:15 +0000
Message-ID: <SN6PR11MB33278F84B5826A1A2E9EEFD68D999@SN6PR11MB3327.namprd11.prod.outlook.com>
References: <20210301170957.23216-1-bhanuprakash.modem@intel.com>
 <20210301170957.23216-2-bhanuprakash.modem@intel.com>
 <20210301234025.GB7960@labuser-Z97X-UD5H>
In-Reply-To: <20210301234025.GB7960@labuser-Z97X-UD5H>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/kms_vrr: Extend to cover full
 VRR range
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
To: "Navare, Manasi D" <manasi.d.navare@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Latvala,
 Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

> -----Original Message-----
> From: Navare, Manasi <manasi.d.navare@intel.com>
> Sent: Tuesday, March 2, 2021 5:10 AM
> To: Modem, Bhanuprakash <bhanuprakash.modem@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Ville Syrj=E4l=E4
> <ville.syrjala@linux.intel.com>; Nicholas Kazlauskas
> <nicholas.kazlauskas@amd.com>; Latvala, Petri <petri.latvala@intel.com>
> Subject: Re: [PATCH i-g-t 2/2] tests/kms_vrr: Extend to cover full VRR
> range
> =

> Looks good to me.
> While at it, lets also remove the test for refresh rates less than vmin
> since
> in that case the frame repetition is expected and we wont get the expected
> target rate
To validate the flipline mode:
* Generate the Push before the decision boundary (vmin by default), means we
  need to request flips with the refresh rate < vmin. Expected refresh rate
  would be vmin because vblank termination starts at decision boundary.
* Generate the Push before the decision boundary, means we need to request
  flips with any refresh rate b/w vmin & vmax. Expected refresh rate should
  match with the requested rate because vblank termination starts immediate=
ly

If we remove the test for refresh rates less than vmin, subtest "flipline"
is not required anymore. Subtest "flip-basic" is already covering the vrr
range (running test with midpoint of vrr range)

Please suggest to proceed further.
> =

> With that change
> =

> Reviewed-by: Manasi Navare <manasi.d.navare@intel.com>
> =

> Manasi
> =

> On Mon, Mar 01, 2021 at 10:39:57PM +0530, Bhanuprakash Modem wrote:
> > As we are restricting the vrr max to current mode vrefresh,
> > we are not covering the full vrr range with default mode.
> >
> > So, instead of running tests on default mode, loop through the
> > all connector modes and find the mode with max refresh rate to
> > exercise full vrr range.
> >
> > V2:
> > * Add a check if vrr vmax >=3D connector mode vrefresh (Manasi)
> >
> > Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> > Cc: Latvala Petri <petri.latvala@intel.com>
> > Suggested-by: Manasi Navare <manasi.d.navare@intel.com>
> > Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > ---
> >  tests/kms_vrr.c | 73 +++++++++++++++++++++++++++++++++----------------
> >  1 file changed, 49 insertions(+), 24 deletions(-)
> >
> > diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> > index bc4201615..5b8541009 100644
> > --- a/tests/kms_vrr.c
> > +++ b/tests/kms_vrr.c
> > @@ -33,6 +33,13 @@
> >   */
> >  #define TEST_DURATION_NS (5000000000ull)
> >
> > +#define DRM_MODE_FMT    "\"%s\": %d %d %d %d %d %d %d %d %d %d 0x%x
> 0x%x"
> > +#define DRM_MODE_ARG(m) \
> > +	(m)->name, (m)->vrefresh, (m)->clock, \
> > +	(m)->hdisplay, (m)->hsync_start, (m)->hsync_end, (m)->htotal, \
> > +	(m)->vdisplay, (m)->vsync_start, (m)->vsync_end, (m)->vtotal, \
> > +	(m)->type, (m)->flags
> > +
> >  enum {
> >  	TEST_NONE =3D 0,
> >  	TEST_DPMS =3D 1 << 0,
> > @@ -112,13 +119,31 @@ static uint64_t rate_from_refresh(uint64_t
> refresh)
> >  	return NSECS_PER_SEC / refresh;
> >  }
> >
> > -/* Read min and max vrr range from the connector debugfs.
> > - *  - min range should be less than the current mode vfreq
> > - *  - if max range is grater than the current mode vfreq, consider
> > - *       current mode vfreq as the max range.
> > +/* Instead of running on default mode, loop through the connector modes
> > + * and find the mode with max refresh rate to exercise full vrr range.
> >   */
> > +static drmModeModeInfo
> > +output_mode_with_maxrate(igt_output_t *output, unsigned int vrr_max)
> > +{
> > +	int i;
> > +	drmModeConnectorPtr connector =3D output->config.connector;
> > +	drmModeModeInfo mode =3D *igt_output_get_mode(output);
> > +
> > +	igt_debug("Default Mode " DRM_MODE_FMT "\n", DRM_MODE_ARG(&mode));
> > +
> > +	for (i =3D 0; i < connector->count_modes; i++)
> > +		if (connector->modes[i].vrefresh > mode.vrefresh &&
> > +		    connector->modes[i].vrefresh <=3D vrr_max)
> > +			mode =3D connector->modes[i];
> > +
> > +	igt_debug("Override Mode " DRM_MODE_FMT "\n", DRM_MODE_ARG(&mode));
> > +
> > +	return mode;
> > +}
> > +
> > +/* Read min and max vrr range from the connector debugfs. */
> >  static range_t
> > -get_vrr_range(data_t *data, igt_output_t *output, uint32_t
> curr_vrefresh)
> > +get_vrr_range(data_t *data, igt_output_t *output)
> >  {
> >  	char buf[256];
> >  	char *start_loc;
> > @@ -135,13 +160,10 @@ get_vrr_range(data_t *data, igt_output_t *output,
> uint32_t curr_vrefresh)
> >
> >  	igt_assert(start_loc =3D strstr(buf, "Min: "));
> >  	igt_assert_eq(sscanf(start_loc, "Min: %u", &range.min), 1);
> > -	igt_require(curr_vrefresh > range.min);
> >
> >  	igt_assert(start_loc =3D strstr(buf, "Max: "));
> >  	igt_assert_eq(sscanf(start_loc, "Max: %u", &range.max), 1);
> >
> > -	range.max =3D (curr_vrefresh < range.max) ? curr_vrefresh : range.max;
> > -
> >  	return range;
> >  }
> >
> > @@ -175,13 +197,25 @@ static void set_vrr_on_pipe(data_t *data, enum
> pipe pipe, bool enabled)
> >  /* Prepare the display for testing on the given pipe. */
> >  static void prepare_test(data_t *data, igt_output_t *output, enum pipe
> pipe)
> >  {
> > -	drmModeModeInfo mode =3D *igt_output_get_mode(output);
> > +	drmModeModeInfo mode;
> >  	cairo_t *cr;
> >
> >  	/* Reset output */
> >  	igt_display_reset(&data->display);
> >  	igt_output_set_pipe(output, pipe);
> >
> > +	/* Capture VRR range */
> > +	data->range =3D get_vrr_range(data, output);
> > +
> > +	/* Override mode with max vrefresh.
> > +	 *   - vrr_min range should be less than the override mode vrefresh.
> > +	 *   - Limit the vrr_max range with the override mode vrefresh.
> > +	 */
> > +	mode =3D output_mode_with_maxrate(output, data->range.max);
> > +	igt_require(mode.vrefresh > data->range.min);
> > +	data->range.max =3D mode.vrefresh;
> > +	igt_output_override_mode(output, &mode);
> > +
> >  	/* Prepare resources */
> >  	igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
> >  			    DRM_FORMAT_XRGB8888, LOCAL_DRM_FORMAT_MOD_NONE,
> > @@ -198,9 +232,6 @@ static void prepare_test(data_t *data, igt_output_t
> *output, enum pipe pipe)
> >
> >  	igt_put_cairo_ctx(cr);
> >
> > -	/* Capture VRR range */
> > -	data->range =3D get_vrr_range(data, output, mode.vrefresh);
> > -
> >  	/* Take care of any required modesetting before the test begins. */
> >  	data->primary =3D igt_output_get_plane_type(output,
> DRM_PLANE_TYPE_PRIMARY);
> >  	igt_plane_set_fb(data->primary, &data->fb0);
> > @@ -271,6 +302,9 @@ flip_and_measure(data_t *data, igt_output_t *output,
> enum pipe pipe,
> >  		 */
> >  		event_ns =3D get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
> >
> > +		igt_debug("event_ns - last_event_ns: %"PRIu64"\n",
> > +						(event_ns - last_event_ns));
> > +
> >  		/*
> >  		 * Check if the difference between the two flip timestamps
> >  		 * was within the required threshold from the expected rate.
> > @@ -363,12 +397,8 @@ test_basic(data_t *data, enum pipe pipe,
> igt_output_t *output, uint32_t flags)
> >  	 * if refresh_rate is 50Hz:
> >  	 *      Flip will happen right away so returned refresh rate is
> 50Hz.
> >  	 * if refresh_rate < 40Hz:
> > -	 *      As the driver will terminate the vblank at Vmax, the
> expected
> > -	 *      refresh rate could be:
> > -	 *      	(Vmax + time left for the next flip + Vmin)
> > -	 *
> > -	 *      And it is very difficult to generalize, at least 1/3 rd of
> the
> > -	 *      flips should be at Vmin (60 Hz) is expected.
> > +	 *      h/w will terminate the vblank at Vmax which is obvious.
> > +	 *      So, for now we can safely ignore the lower refresh rates
> >  	 */
> >  	if (flags & TEST_FLIPLINE) {
> >  		rate =3D rate_from_refresh(range.max + 5);
> > @@ -376,12 +406,6 @@ test_basic(data_t *data, enum pipe pipe,
> igt_output_t *output, uint32_t flags)
> >  		igt_assert_f(result > 75,
> >  			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on
> threshold not reached, result was %u%%\n",
> >  			     (range.max + 5), rate, result);
> > -
> > -		rate =3D rate_from_refresh(range.min - 5);
> > -		result =3D flip_and_measure(data, output, pipe, rate,
> TEST_DURATION_NS);
> > -		igt_assert_f(result > 35,
> > -			     "Refresh rate (%u Hz) %"PRIu64"ns: Target VRR on
> threshold not reached, result was %u%%\n",
> > -			     (range.min - 5), rate, result);
> >  	}
> >
> >  	rate =3D vtest_ns.mid;
> > @@ -399,6 +423,7 @@ test_basic(data_t *data, enum pipe pipe,
> igt_output_t *output, uint32_t flags)
> >  	/* Clean-up */
> >  	igt_plane_set_fb(data->primary, NULL);
> >  	igt_output_set_pipe(output, PIPE_NONE);
> > +	igt_output_override_mode(output, NULL);
> >  	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> >
> >  	igt_remove_fb(data->drm_fd, &data->fb1);
> > --
> > 2.20.1
> >
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
