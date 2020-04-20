Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 449DA6E45C
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2020 07:55:21 +0000 (UTC)
Date: Mon, 20 Apr 2020 10:55:12 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20200420075512.ehv5w2yiikymql5h@ahiler-desk1.fi.intel.com>
References: <20200419212613.11505-1-kunal1.joshi@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200419212613.11505-1-kunal1.joshi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_chamelium: Capture on
 type-c
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Kunal Joshi <kunal1.joshi@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Apr 20, 2020 at 02:56:13AM +0530, Kunal Joshi wrote:
> Refreshing the connector everytime and also resetting the
> state to get HPD reliably.

Code looks good, but please consider adding a bit more of explanation
here, something like:

Chamelium uses HPD pulses to singal the need for a receiver reset using
DPMS cycle. Some connectors (e.g. DP over TypeC) have limitations and
will receive just a single such pulse and discard the rest. This lasts
until we disable the mode completetly and only then reenable it.

Receiver reset is always required after we set a new mode, so let's
disable the mode (reset_state() does that) before we switch to a new
mode. With this we will get the HPD pulses reliably for each iteration
over all the supoprted modes.

There are alse targeted test for HPD pulse handling - dp-hpd-*.

Anyway,
Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>

> v2: Correction in code flow (Arek)
> 
> Cc: Hiler Arkadiusz <arkadiusz.hiler@intel.com>
> Cc: Imre Deak <imre.deak@intel.com>
> Issue: https://gitlab.freedesktop.org/drm/intel/issues/262
> Suggested-by: Hiler Arkadiusz <arkadiusz.hiler@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> ---
>  tests/kms_chamelium.c | 110 +++++++++++++++++++++++++++++++++-----------------
>  1 file changed, 74 insertions(+), 36 deletions(-)
> 
> diff --git a/tests/kms_chamelium.c b/tests/kms_chamelium.c
> index 8b20bbb..421a900 100644
> --- a/tests/kms_chamelium.c
> +++ b/tests/kms_chamelium.c
> @@ -823,34 +823,53 @@ static void test_display_all_modes(data_t *data, struct chamelium_port *port,
>  				   uint32_t fourcc, enum chamelium_check check,
>  				   int count)
>  {
> -	igt_output_t *output;
> -	igt_plane_t *primary;
> -	drmModeConnector *connector;
>  	bool bridge;
> -	int i;
> -
> -	reset_state(data, port);
> -
> -	output = prepare_output(data, port, TEST_EDID_BASE);
> -	connector = chamelium_port_get_connector(data->chamelium, port, false);
> -	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -	igt_assert(primary);
> -	igt_require(igt_plane_has_format_mod(primary, fourcc, LOCAL_DRM_FORMAT_MOD_NONE));
> +	int i, count_modes;
>  
>  	if (check == CHAMELIUM_CHECK_ANALOG)
>  		bridge = check_analog_bridge(data, port);
>  
> -	for (i = 0; i < connector->count_modes; i++) {
> -		drmModeModeInfo *mode = &connector->modes[i];
> +	i = 0;
> +	do {
> +		igt_output_t *output;
> +		igt_plane_t *primary;
> +		drmModeConnector *connector;
> +		drmModeModeInfo *mode;
> +
> +		/*
> +		 * let's reset state each mode so we will get the
> +		 * HPD pulses realibably
> +		 */
> +		reset_state(data, port);
> +
> +		/*
> +		 * modes may change due to mode pruining and link issues, so we
> +		 * need to refresh the connector
> +		 */
> +		output = prepare_output(data, port, TEST_EDID_BASE);
> +		connector = chamelium_port_get_connector(data->chamelium, port,
> +							 false);
> +		primary = igt_output_get_plane_type(output,
> +						    DRM_PLANE_TYPE_PRIMARY);
> +		igt_assert(primary);
> +		igt_require(igt_plane_has_format_mod(primary, fourcc,
> +			    LOCAL_DRM_FORMAT_MOD_NONE));
> +
> +		/* we may skip some modes due to above but that's ok */
> +		count_modes = connector->count_modes;
> +		if (i >= count_modes)
> +			break;
> +
> +		mode = &connector->modes[i];
>  
>  		if (check == CHAMELIUM_CHECK_ANALOG && bridge &&
>  		    prune_vga_mode(data, mode))
>  			continue;
>  
> -		do_test_display(data, port, output, mode, fourcc, check, count);
> -	}
> -
> -	drmModeFreeConnector(connector);
> +		do_test_display(data, port, output, mode, fourcc, check,
> +				count);
> +		drmModeFreeConnector(connector);
> +	} while (++i < count_modes);
>  }
>  
>  static const char test_display_frame_dump_desc[] =
> @@ -860,23 +879,43 @@ static const char test_display_frame_dump_desc[] =
>  static void
>  test_display_frame_dump(data_t *data, struct chamelium_port *port)
>  {
> -	igt_output_t *output;
> -	igt_plane_t *primary;
> -	struct igt_fb fb;
> -	struct chamelium_frame_dump *frame;
> -	drmModeModeInfo *mode;
> -	drmModeConnector *connector;
> -	int fb_id, i, j;
>  
> -	reset_state(data, port);
> +	int i, count_modes;
>  
> -	output = prepare_output(data, port, TEST_EDID_BASE);
> -	connector = chamelium_port_get_connector(data->chamelium, port, false);
> -	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -	igt_assert(primary);
> +	i = 0;
> +	do {
> +		igt_output_t *output;
> +		igt_plane_t *primary;
> +		struct igt_fb fb;
> +		struct chamelium_frame_dump *frame;
> +		drmModeModeInfo *mode;
> +		drmModeConnector *connector;
> +		int fb_id, j;
> +
> +		/*
> +		 * let's reset state each mode so we will get the
> +		 * HPD pulses realibably
> +		 */
> +		reset_state(data, port);
> +
> +		/*
> +		 * modes may change due to mode pruining and link issues, so we
> +		 * need to refresh the connector
> +		 */
> +		output = prepare_output(data, port, TEST_EDID_BASE);
> +		connector = chamelium_port_get_connector(data->chamelium, port,
> +							 false);
> +		primary = igt_output_get_plane_type(output,
> +						    DRM_PLANE_TYPE_PRIMARY);
> +		igt_assert(primary);
> +
> +		/* we may skip some modes due to above but that's ok */
> +		count_modes = connector->count_modes;
> +		if (i >= count_modes)
> +			break;
>  
> -	for (i = 0; i < connector->count_modes; i++) {
>  		mode = &connector->modes[i];
> +
>  		fb_id = igt_create_color_pattern_fb(data->drm_fd,
>  						    mode->hdisplay, mode->vdisplay,
>  						    DRM_FORMAT_XRGB8888,
> @@ -889,16 +928,15 @@ test_display_frame_dump(data_t *data, struct chamelium_port *port)
>  		igt_debug("Reading frame dumps from Chamelium...\n");
>  		chamelium_capture(data->chamelium, port, 0, 0, 0, 0, 5);
>  		for (j = 0; j < 5; j++) {
> -			frame = chamelium_read_captured_frame(
> -			    data->chamelium, j);
> +			frame = chamelium_read_captured_frame(data->chamelium,
> +							      j);
>  			chamelium_assert_frame_eq(data->chamelium, frame, &fb);
>  			chamelium_destroy_frame_dump(frame);
>  		}
>  
>  		igt_remove_fb(data->drm_fd, &fb);
> -	}
> -
> -	drmModeFreeConnector(connector);
> +		drmModeFreeConnector(connector);
> +	} while (++i < count_modes);
>  }
>  
>  #define MODE_CLOCK_ACCURACY 0.05 /* 5% */
> -- 
> 2.7.4
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
