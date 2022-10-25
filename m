Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 940FB10E098
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Oct 2022 21:34:15 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id
 az32-20020a05620a172000b006ee8ae138a7so12565513qkb.4
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Oct 2022 14:34:11 -0700 (PDT)
Message-ID: <e5db6c52bc77fe37b93d121bd518a21818e11c3c.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Mark Yacoub <markyacoub@chromium.org>, igt-dev@lists.freedesktop.org
Date: Tue, 25 Oct 2022 17:34:07 -0400
In-Reply-To: <20221018145926.4014906-1-markyacoub@chromium.org>
References: <20221018145926.4014906-1-markyacoub@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH] Refactor Display Outputs to handle MST
 Connectors.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, petri.latvala@intel.com, ihf@google.com,
 amstan@chromium.org, seanpaul@chromium.org, matthewtlam@google.com,
 khaled.almahallawy@intel.com, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

LGTM!

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Tue, 2022-10-18 at 10:59 -0400, Mark Yacoub wrote:
> [Why]
> Chamelium can be connected to the DUT through MST.
> MST connectors can appear to the kernel only after it's been plugged in
> through Chamelium.
> The older implementation gets the output at display init and doesn't
> handle any new connectors being added.
> 
> [How]
> Save the connector path for each display output to check for MSTs (used
> for comparison and retrieval as connector ID can change but Path would
> not.)
> Refresh display outputs at chamelium init. This retrieves all newly
> plugged connectors.
> 
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> ---
>  lib/igt_chamelium.c                   |  36 +++--
>  lib/igt_chamelium.h                   |   2 +-
>  lib/igt_kms.c                         | 223 +++++++++++++++++---------
>  lib/igt_kms.h                         |   2 +
>  tests/chamelium/kms_chamelium.c       |   7 +-
>  tests/chamelium/kms_color_chamelium.c |   2 +-
>  tests/feature_discovery.c             |   3 +-
>  tests/kms_dp_tiled_display.c          |  18 ++-
>  8 files changed, 185 insertions(+), 108 deletions(-)
> 
> diff --git a/lib/igt_chamelium.c b/lib/igt_chamelium.c
> index 26244bd5..d998a1f1 100644
> --- a/lib/igt_chamelium.c
> +++ b/lib/igt_chamelium.c
> @@ -233,15 +233,18 @@ drmModeConnector *chamelium_port_get_connector(struct chamelium *chamelium,
>  	/* In case the connector ID is still valid, do a quick check if we're have the connector we expect. 
>  	 * Otherwise, read the new resources and find the new connector we're looking for. */
>  	if (connector) {
> -		drmModePropertyBlobPtr path_blob =
> -			kmstest_get_path_blob(drm_fd, connector->connector_id);
> -		if (path_blob) {
> -			bool is_correct_connector =
> -				strcmp(port->connector_path, path_blob->data) ==
> -				0;
> -			drmModeFreePropertyBlob(path_blob);
> -			if (is_correct_connector)
> -				return connector;
> +		if (connector->connection == DRM_MODE_CONNECTED) {
> +			drmModePropertyBlobPtr path_blob =
> +				kmstest_get_path_blob(drm_fd,
> +						      connector->connector_id);
> +			if (path_blob) {
> +				bool is_correct_connector =
> +					strcmp(port->connector_path,
> +					       path_blob->data) == 0;
> +				drmModeFreePropertyBlob(path_blob);
> +				if (is_correct_connector)
> +					return connector;
> +			}
>  		}
>  
>  		drmModeFreeConnector(connector);
> @@ -413,11 +416,8 @@ chamelium_reprobe_connector(igt_display_t *display,
>  	/* If we still have a connector, let's make sure that igt_display and
>  	   the port are up to date too */
>  	output = igt_output_from_connector(display, connector);
> -	if (output)
> -	{
> -		output->force_reprobe = true;
> -		igt_output_refresh(output);
> -	}
> +	output->force_reprobe = true;
> +	igt_output_refresh(output);
>  
>  	drmModeFreeConnector(connector);
>  	return connection_status;
> @@ -2886,7 +2886,7 @@ error:
>   *
>   * Returns: A newly initialized chamelium struct, or NULL on error
>   */
> -struct chamelium *chamelium_init(int drm_fd)
> +struct chamelium *chamelium_init(int drm_fd, igt_display_t *display)
>  {
>  	struct chamelium *chamelium = chamelium_init_rpc_only();
>  	bool mismatching_ports_found = false;
> @@ -2952,6 +2952,12 @@ struct chamelium *chamelium_init(int drm_fd)
>  		       "port mapping manually in .igtrc with AdapterAllowed=1. See "
>  		       "docs/chamelium.txt for more information.\n");
>  
> +	/* After a Chamelium init, all ports are now connected, and MST
> +	 * connectors are now known to the kernel. MST connectors would spawn
> +	 * new connectors that were previously unknown to the kernel. Refresh
> +	 * the outputs to grab all supported connectors.*/
> +	igt_display_reset_outputs(display);
> +
>  	return chamelium;
>  error:
>  	close(chamelium->drm_fd);
> diff --git a/lib/igt_chamelium.h b/lib/igt_chamelium.h
> index f40e848e..e1ee2b59 100644
> --- a/lib/igt_chamelium.h
> +++ b/lib/igt_chamelium.h
> @@ -107,7 +107,7 @@ extern bool igt_chamelium_allow_fsm_handling;
>  
>  void chamelium_deinit_rpc_only(struct chamelium *chamelium);
>  struct chamelium *chamelium_init_rpc_only(void);
> -struct chamelium *chamelium_init(int drm_fd);
> +struct chamelium *chamelium_init(int drm_fd, igt_display_t *display);
>  void chamelium_deinit(struct chamelium *chamelium);
>  void chamelium_reset(struct chamelium *chamelium);
>  
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 55fcd811..921a623d 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -1698,6 +1698,7 @@ static bool _kmstest_connector_config(int drm_fd, uint32_t connector_id,
>  {
>  	drmModeRes *resources;
>  	drmModeConnector *connector;
> +	drmModePropertyBlobPtr path_blob;
>  
>  	config->pipe = PIPE_NONE;
>  
> @@ -1722,6 +1723,13 @@ static bool _kmstest_connector_config(int drm_fd, uint32_t connector_id,
>  		goto err3;
>  	}
>  
> +	/* Set connector path for MST connectors. */
> +	path_blob = kmstest_get_path_blob(drm_fd, connector_id);
> +	if (path_blob) {
> +		config->connector_path = strdup(path_blob->data);
> +		drmModeFreePropertyBlob(path_blob);
> +	}
> +
>  	/*
>  	 * Find given CRTC if crtc_id != 0 or else the first CRTC not in use.
>  	 * In both cases find the first compatible encoder and skip the CRTC
> @@ -2347,16 +2355,119 @@ static bool igt_pipe_has_valid_output(igt_display_t *display, enum pipe pipe)
>  	return false;
>  }
>  
> +/**
> + * igt_display_require:
> + * @display: a pointer to an initialized #igt_display_t structure
> + *
> + * Initialize @display outputs with their connectors and pipes.
> + * This function clears any previously allocated outputs.
> + */
> +void igt_display_reset_outputs(igt_display_t *display)
> +{
> +	int i;
> +	drmModeRes *resources;
> +
> +	/* Clear any existing outputs*/
> +	if (display->n_outputs) {
> +		for (i = 0; i < display->n_outputs; i++) {
> +			struct kmstest_connector_config *config =
> +				&display->outputs[i].config;
> +			drmModeFreeConnector(config->connector);
> +			drmModeFreeEncoder(config->encoder);
> +			drmModeFreeCrtc(config->crtc);
> +			free(config->connector_path);
> +		}
> +		free(display->outputs);
> +	}
> +
> +	resources = drmModeGetResources(display->drm_fd);
> +	if (!resources)
> +		return;
> +
> +	display->n_outputs = resources->count_connectors;
> +	display->outputs = calloc(display->n_outputs, sizeof(igt_output_t));
> +	igt_assert_f(display->outputs,
> +		     "Failed to allocate memory for %d outputs\n",
> +		     display->n_outputs);
> +
> +	for (i = 0; i < display->n_outputs; i++) {
> +		igt_output_t *output = &display->outputs[i];
> +		drmModeConnector *connector;
> +
> +		/*
> +		 * We don't assign each output a pipe unless
> +		 * a pipe is set with igt_output_set_pipe().
> +		 */
> +		output->pending_pipe = PIPE_NONE;
> +		output->id = resources->connectors[i];
> +		output->display = display;
> +
> +		igt_output_refresh(output);
> +
> +		connector = output->config.connector;
> +		if (connector &&
> +		    (!connector->count_modes ||
> +		     connector->connection == DRM_MODE_UNKNOWNCONNECTION)) {
> +			output->force_reprobe = true;
> +			igt_output_refresh(output);
> +		}
> +	}
> +
> +	/* Set reasonable default values for every object in the
> +	 * display. */
> +	igt_display_reset(display);
> +
> +	for_each_pipe(display, i) {
> +		igt_pipe_t *pipe = &display->pipes[i];
> +		igt_output_t *output;
> +
> +		if (!igt_pipe_has_valid_output(display, i))
> +			continue;
> +
> +		output = igt_get_single_output_for_pipe(display, i);
> +
> +		if (pipe->num_primary_planes > 1) {
> +			igt_plane_t *primary =
> +				&pipe->planes[pipe->plane_primary];
> +			igt_plane_t *assigned_primary =
> +				igt_get_assigned_primary(output, pipe);
> +			int assigned_primary_index = assigned_primary->index;
> +
> +			/*
> +			 * If the driver-assigned primary plane isn't at
> +			 * the pipe->plane_primary index, swap it with
> +			 * the plane that's currently at the
> +			 * plane_primary index and update plane->index
> +			 * accordingly.
> +			 *
> +			 * This way, we can preserve pipe->plane_primary
> +			 * as 0 so that tests that assume
> +			 * pipe->plane_primary is always 0 won't break.
> +			 */
> +			if (assigned_primary_index != pipe->plane_primary) {
> +				assigned_primary->index = pipe->plane_primary;
> +				primary->index = assigned_primary_index;
> +
> +				igt_swap(pipe->planes[assigned_primary_index],
> +					 pipe->planes[pipe->plane_primary]);
> +			}
> +		}
> +	}
> +
> +	drmModeFreeResources(resources);
> +}
> +
>  /**
>   * igt_display_require:
>   * @display: a pointer to an #igt_display_t structure
>   * @drm_fd: a drm file descriptor
>   *
>   * Initialize @display and allocate the various resources required. Use
> - * #igt_display_fini to release the resources when they are no longer required.
> + * #igt_display_fini to release the resources when they are no longer
> + * required.
>   *
> - * This function automatically skips if the kernel driver doesn't support any
> - * CRTC or outputs.
> + * This function automatically skips if the kernel driver doesn't
> + * support any CRTC or outputs.
>   */
>  void igt_display_require(igt_display_t *display, int drm_fd)
>  {
> @@ -2458,6 +2569,8 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  		 */
>  	}
>  
> +	drmModeFreePlaneResources(plane_resources);
> +
>  	for_each_pipe(display, i) {
>  		igt_pipe_t *pipe = &display->pipes[i];
>  		igt_plane_t *plane;
> @@ -2556,78 +2669,11 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  		pipe->n_planes = n_planes;
>  	}
>  
> -	igt_fill_display_format_mod(display);
> -
> -	/*
> -	 * The number of connectors is set, so we just initialize the outputs
> -	 * array in _init(). This may change when we need dynamic connectors
> -	 * (say DisplayPort MST).
> -	 */
> -	display->n_outputs = resources->count_connectors;
> -	display->outputs = calloc(display->n_outputs, sizeof(igt_output_t));
> -	igt_assert_f(display->outputs, "Failed to allocate memory for %d outputs\n", display->n_outputs);
> -
> -	for (i = 0; i < display->n_outputs; i++) {
> -		igt_output_t *output = &display->outputs[i];
> -		drmModeConnector *connector;
> -
> -		/*
> -		 * We don't assign each output a pipe unless
> -		 * a pipe is set with igt_output_set_pipe().
> -		 */
> -		output->pending_pipe = PIPE_NONE;
> -		output->id = resources->connectors[i];
> -		output->display = display;
> -
> -		igt_output_refresh(output);
> -
> -		connector = output->config.connector;
> -		if (connector && (!connector->count_modes ||
> -		    connector->connection == DRM_MODE_UNKNOWNCONNECTION)) {
> -			output->force_reprobe = true;
> -			igt_output_refresh(output);
> -		}
> -	}
> -
> -	drmModeFreePlaneResources(plane_resources);
>  	drmModeFreeResources(resources);
>  
> -	/* Set reasonable default values for every object in the display. */
> -	igt_display_reset(display);
> -
> -	for_each_pipe(display, i) {
> -		igt_pipe_t *pipe = &display->pipes[i];
> -		igt_output_t *output;
> -
> -		if (!igt_pipe_has_valid_output(display, i))
> -			continue;
> -
> -		output = igt_get_single_output_for_pipe(display, i);
> -
> -		if (pipe->num_primary_planes > 1) {
> -			igt_plane_t *primary = &pipe->planes[pipe->plane_primary];
> -			igt_plane_t *assigned_primary = igt_get_assigned_primary(output, pipe);
> -			int assigned_primary_index = assigned_primary->index;
> -
> -			/*
> -			 * If the driver-assigned primary plane isn't at the
> -			 * pipe->plane_primary index, swap it with the plane
> -			 * that's currently at the plane_primary index and
> -			 * update plane->index accordingly.
> -			 *
> -			 * This way, we can preserve pipe->plane_primary as 0
> -			 * so that tests that assume pipe->plane_primary is always 0
> -			 * won't break.
> -			 */
> -			if (assigned_primary_index != pipe->plane_primary) {
> -				assigned_primary->index = pipe->plane_primary;
> -				primary->index = assigned_primary_index;
> +	igt_fill_display_format_mod(display);
>  
> -				igt_swap(pipe->planes[assigned_primary_index],
> -						pipe->planes[pipe->plane_primary]);
> -			}
> -		}
> -	}
> +	igt_display_reset_outputs(display);
>  
>  out:
>  	LOG_UNINDENT(display);
> @@ -2695,17 +2741,36 @@ void igt_display_require_output_on_pipe(igt_display_t *display, enum pipe pipe)
>  igt_output_t *igt_output_from_connector(igt_display_t *display,
>  					drmModeConnector *connector)
>  {
> -	igt_output_t *output, *found = NULL;
>  	int i;
> +	igt_output_t *found = NULL;
>  
>  	for (i = 0; i < display->n_outputs; i++) {
> -		output = &display->outputs[i];
> +		igt_output_t *output = &display->outputs[i];
> +		bool is_mst = !!output->config.connector_path;
> +
> +		if (is_mst) {
> +			drmModePropertyBlobPtr path_blob =
> +				kmstest_get_path_blob(display->drm_fd,
> +						      connector->connector_id);
> +			if (path_blob) {
> +				bool is_same_connector =
> +					strcmp(output->config.connector_path,
> +					       path_blob->data) == 0;
> +				drmModeFreePropertyBlob(path_blob);
> +				if (is_same_connector) {
> +					output->id = connector->connector_id;
> +					found = output;
> +					break;
> +				}
> +			}
>  
> -		if (output->config.connector &&
> -		    output->config.connector->connector_id ==
> -		    connector->connector_id) {
> -			found = output;
> -			break;
> +		} else {
> +			if (output->config.connector &&
> +			    output->config.connector->connector_id ==
> +				    connector->connector_id) {
> +				found = output;
> +				break;
> +			}
>  		}
>  	}
>  
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index eddfb6fc..221bcb55 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -173,6 +173,7 @@ struct kmstest_connector_config {
>  
>  	int pipe;
>  	unsigned valid_crtc_idx_mask;
> +	char *connector_path;
>  };
>  
>  struct kmstest_plane {
> @@ -451,6 +452,7 @@ typedef struct {
>  	uint16_t tile_h_size, tile_v_size;
>  } igt_tile_info_t;
>  
> +void igt_display_reset_outputs(igt_display_t *display);
>  void igt_display_require(igt_display_t *display, int drm_fd);
>  void igt_display_fini(igt_display_t *display);
>  void igt_display_reset(igt_display_t *display);
> diff --git a/tests/chamelium/kms_chamelium.c b/tests/chamelium/kms_chamelium.c
> index d97b439a..0b541d34 100644
> --- a/tests/chamelium/kms_chamelium.c
> +++ b/tests/chamelium/kms_chamelium.c
> @@ -315,8 +315,8 @@ static drmModeModeInfo get_mode_for_port(struct chamelium *chamelium,
>  static igt_output_t *get_output_for_port(data_t *data,
>  					 struct chamelium_port *port)
>  {
> -	drmModeConnector *connector = chamelium_port_get_connector(data->chamelium,
> -								   port, false);
> +	drmModeConnector *connector =
> +		chamelium_port_get_connector(data->chamelium, port, true);
>  	igt_output_t *output = igt_output_from_connector(&data->display,
>  							 connector);
>  	drmModeFreeConnector(connector);
> @@ -406,6 +406,7 @@ test_hotplug(data_t *data, struct chamelium_port *port, int toggle_count,
>  		    (modeset_mode == TEST_MODESET_ON && i == 0 )) {
>  			if (i == 0) {
>  				/* We can only get mode and pipe once we are connected */
> +				output = get_output_for_port(data, port);
>  				pipe = get_pipe_for_output(&data->display, output);
>  				mode = get_mode_for_port(data->chamelium, port);
>  				create_fb_for_mode(data, &fb, &mode);
> @@ -2582,7 +2583,7 @@ igt_main
>  		igt_display_commit2(&data.display, COMMIT_ATOMIC);
>  
>  		/* we need to initalize chamelium after igt_display_require */
> -		data.chamelium = chamelium_init(data.drm_fd);
> +		data.chamelium = chamelium_init(data.drm_fd, &data.display);
>  		igt_require(data.chamelium);
>  
>  		data.ports = chamelium_get_ports(data.chamelium,
> diff --git a/tests/chamelium/kms_color_chamelium.c b/tests/chamelium/kms_color_chamelium.c
> index 678931aa..9d7765cd 100644
> --- a/tests/chamelium/kms_color_chamelium.c
> +++ b/tests/chamelium/kms_color_chamelium.c
> @@ -680,7 +680,7 @@ igt_main
>  		igt_chamelium_allow_fsm_handling = false;
>  
>  		/* we need to initalize chamelium after igt_display_require */
> -		data.chamelium = chamelium_init(data.drm_fd);
> +		data.chamelium = chamelium_init(data.drm_fd, &data.display);
>  		igt_require(data.chamelium);
>  
>  		data.ports = chamelium_get_ports(data.chamelium,
> diff --git a/tests/feature_discovery.c b/tests/feature_discovery.c
> index 1978ce89..c13ccc7b 100644
> --- a/tests/feature_discovery.c
> +++ b/tests/feature_discovery.c
> @@ -96,7 +96,8 @@ igt_main {
>  #ifdef HAVE_CHAMELIUM
>  		igt_describe("Make sure that Chamelium is configured and reachable.");
>  		igt_subtest("chamelium") {
> -			struct chamelium *chamelium = chamelium_init(fd);
> +			struct chamelium *chamelium =
> +				chamelium_init(fd, &display);
>  			igt_require(chamelium);
>  			chamelium_deinit(chamelium);
>  		}
> diff --git a/tests/kms_dp_tiled_display.c b/tests/kms_dp_tiled_display.c
> index 8f503e40..bb638050 100644
> --- a/tests/kms_dp_tiled_display.c
> +++ b/tests/kms_dp_tiled_display.c
> @@ -70,10 +70,11 @@ typedef struct {
>  
>  } data_t;
>  
> -void basic_test(data_t *data, drmEventContext *drm_event, struct pollfd *pfd);
> +void basic_test(data_t *data, drmEventContext *drm_event, struct pollfd *pfd,
> +		igt_display_t *display);
>  
>  #ifdef HAVE_CHAMELIUM
> -static void test_with_chamelium(data_t *data);
> +static void test_with_chamelium(data_t *data, igt_display_t *display);
>  #endif
>  
>  static int drm_property_is_tile(drmModePropertyPtr prop)
> @@ -388,13 +389,13 @@ static bool got_all_page_flips(data_t *data)
>  }
>  
>  #ifdef HAVE_CHAMELIUM
> -static void test_with_chamelium(data_t *data)
> +static void test_with_chamelium(data_t *data, igt_display_t *display)
>  {
>  	int i, count = 0;
>  	uint8_t htile = 2, vtile = 1;
>  	struct edid **edid;
>  
> -	data->chamelium = chamelium_init(data->drm_fd);
> +	data->chamelium = chamelium_init(data->drm_fd, display);
>  	igt_require(data->chamelium);
>  	data->ports = chamelium_get_ports
>  		(data->chamelium, &data->port_count);
> @@ -427,7 +428,8 @@ static void test_with_chamelium(data_t *data)
>  }
>  #endif
>  
> -void basic_test(data_t *data, drmEventContext *drm_event, struct pollfd *pfd)
> +void basic_test(data_t *data, drmEventContext *drm_event, struct pollfd *pfd,
> +		igt_display_t *display)
>  {
>  		int ret;
>  
> @@ -476,7 +478,7 @@ igt_main
>  	igt_describe("Make sure the Tiled CRTCs are synchronized and we get "
>  		     "page flips for all tiled CRTCs in one vblank.");
>  	igt_subtest("basic-test-pattern") {
> -		basic_test(&data, &drm_event, &pfd);
> +		basic_test(&data, &drm_event, &pfd, &display);
>  		test_cleanup(&data);
>  	}
>  
> @@ -486,8 +488,8 @@ igt_main
>  	igt_subtest_f("basic-test-pattern-with-chamelium") {
>  		int i;
>  
> -		test_with_chamelium(&data);
> -		basic_test(&data, &drm_event, &pfd);
> +		test_with_chamelium(&data, &display);
> +		basic_test(&data, &drm_event, &pfd, &display);
>  		test_cleanup(&data);
>  		for (i = 0; i < data.port_count; i++)
>  			chamelium_reset_state(data.display, data.chamelium,

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat
