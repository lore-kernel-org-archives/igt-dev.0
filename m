Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04F486E0BF
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Feb 2021 21:12:50 +0000 (UTC)
Date: Fri, 26 Feb 2021 13:18:23 -0800
From: "Navare, Manasi" <manasi.d.navare@intel.com>
Message-ID: <20210226211823.GA27300@labuser-Z97X-UD5H>
References: <20210222133629.6218-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210222133629.6218-1-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_vrr: Extend to cover full VRR
 range
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
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Feb 22, 2021 at 07:06:29PM +0530, Bhanuprakash Modem wrote:
> As we are restricting the vrr max to current mode vrefresh,
> we are not covering the full vrr range with default mode.
> =

> So, instead of running tests on default mode, loop through the
> all connector modes and find the mode with max refresh rate to
> exercise full vrr range.
> =

> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> Suggested-by: Manasi Navare <manasi.d.navare@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/kms_vrr.c | 48 ++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 42 insertions(+), 6 deletions(-)
> =

> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index e4ea74c17..e9071c220 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -33,6 +33,13 @@
>   */
>  #define TEST_DURATION_NS (5000000000ull)
>  =

> +#define DRM_MODE_FMT    "\"%s\": %d %d %d %d %d %d %d %d %d %d 0x%x 0x%x"
> +#define DRM_MODE_ARG(m) \
> +	(m)->name, (m)->vrefresh, (m)->clock, \
> +	(m)->hdisplay, (m)->hsync_start, (m)->hsync_end, (m)->htotal, \
> +	(m)->vdisplay, (m)->vsync_start, (m)->vsync_end, (m)->vtotal, \
> +	(m)->type, (m)->flags
> +
>  enum {
>  	TEST_NONE =3D 0,
>  	TEST_DPMS =3D 1 << 0,
> @@ -111,6 +118,26 @@ static uint64_t rate_from_refresh(uint64_t refresh)
>  	return NSECS_PER_SEC / refresh;
>  }
>  =

> +/* Instead of running on default mode, loop through the connector modes
> + * and find the mode with max refresh rate to exercise full vrr range.
> + */
> +static drmModeModeInfo output_mode_with_maxrate(igt_output_t *output)
> +{
> +	int i;
> +	drmModeConnectorPtr connector =3D output->config.connector;
> +	drmModeModeInfo mode =3D *igt_output_get_mode(output);
> +
> +	igt_debug("Default Mode " DRM_MODE_FMT "\n", DRM_MODE_ARG(&mode));
> +
> +	for (i =3D 0; i < connector->count_modes; i++)
> +		if (connector->modes[i].vrefresh > mode.vrefresh)

We should also make sure we only use the mode whose refresh rate lies betwe=
en vrr min and max
so check if vrr vmax >=3D connector->modes[i].vrefresh and only then use it=
 to override

I have seen some panels have modes with 75Hz but max vrr refresh is only 60=
Hz.

Makes sense?

Manasi

> +			mode =3D connector->modes[i];
> +
> +	igt_debug("Override Mode " DRM_MODE_FMT "\n", DRM_MODE_ARG(&mode));
> +
> +	return mode;
> +}
> +
>  /* Read min and max vrr range from the connector debugfs.
>   *  - min range should be less than the current mode vfreq
>   *  - if max range is grater than the current mode vfreq, consider
> @@ -176,7 +203,7 @@ static void set_vrr_on_pipe(data_t *data, enum pipe p=
ipe, bool enabled)
>  /* Prepare the display for testing on the given pipe. */
>  static void prepare_test(data_t *data, igt_output_t *output, enum pipe p=
ipe)
>  {
> -	drmModeModeInfo mode =3D *igt_output_get_mode(output);
> +	drmModeModeInfo mode =3D output_mode_with_maxrate(output);
>  	cairo_t *cr;
>  =

>  	/* Reset output */
> @@ -202,6 +229,7 @@ static void prepare_test(data_t *data, igt_output_t *=
output, enum pipe pipe)
>  	/* Take care of any required modesetting before the test begins. */
>  	data->primary =3D igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIM=
ARY);
>  	igt_plane_set_fb(data->primary, &data->fb0);
> +	igt_output_override_mode(output, &mode);
>  =

>  	/* Clear vrr_enabled state before enabling it, because
>  	 * it might be left enabled if the previous test fails.
> @@ -269,6 +297,9 @@ flip_and_measure(data_t *data, igt_output_t *output, =
enum pipe pipe,
>  		 */
>  		event_ns =3D get_kernel_event_ns(data, DRM_EVENT_FLIP_COMPLETE);
>  =

> +		igt_debug("event_ns - last_event_ns: %"PRIu64"\n",
> +						(event_ns - last_event_ns));
> +
>  		/*
>  		 * Check if the difference between the two flip timestamps
>  		 * was within the required threshold from the expected rate.
> @@ -316,15 +347,19 @@ static void
>  test_basic(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t =
flags)
>  {
>  	uint32_t result;
> -	vtest_ns_t vtest_ns =3D get_test_rate_ns(data, output);
> -	range_t range =3D get_vrr_range(data, output);
> -	uint64_t rate =3D vtest_ns.mid;
> +	vtest_ns_t vtest_ns;
> +	range_t range;
> +	uint64_t rate;
> +
> +	prepare_test(data, output, pipe);
> +
> +	vtest_ns =3D get_test_rate_ns(data, output);
> +	range =3D get_vrr_range(data, output);
> +	rate =3D vtest_ns.mid;
>  =

>  	igt_info("VRR Test execution on %s, PIPE_%s with VRR range: (%u-%u) Hz\=
n",
>  		 output->name, kmstest_pipe_name(pipe), range.min, range.max);
>  =

> -	prepare_test(data, output, pipe);
> -
>  	set_vrr_on_pipe(data, pipe, 1);
>  =

>  	/*
> @@ -394,6 +429,7 @@ test_basic(data_t *data, enum pipe pipe, igt_output_t=
 *output, uint32_t flags)
>  	/* Clean-up */
>  	igt_plane_set_fb(data->primary, NULL);
>  	igt_output_set_pipe(output, PIPE_NONE);
> +	igt_output_override_mode(output, NULL);
>  	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>  =

>  	igt_remove_fb(data->drm_fd, &data->fb1);
> -- =

> 2.20.1
> =

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
