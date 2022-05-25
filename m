Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A4611211A
 for <igt-dev@lists.freedesktop.org>; Wed, 25 May 2022 06:04:37 +0000 (UTC)
Message-ID: <0453fee2-1d41-d0f5-a3de-cb80ca0f8002@intel.com>
Date: Wed, 25 May 2022 11:34:19 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220524164038.15500-1-swati2.sharma@intel.com>
 <20220524164038.15500-2-swati2.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220524164038.15500-2-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] tests/kms: Update tests with lib
 changes
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

On Tue-24-05-2022 10:10 pm, Swati Sharma wrote:
> Made corresponding changes in tests wrt lib changes.

Please fix the commit message with what we are doing in this patch.

With above change, this patch is
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

- Bhanu

> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/i915/kms_dsc.c          | 50 ++++++++++++-----------------------
>   tests/kms_atomic_transition.c | 13 ---------
>   tests/kms_invalid_mode.c      |  3 +--
>   3 files changed, 18 insertions(+), 48 deletions(-)
> 
> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
> index 22d2216e..3b6c31c2 100644
> --- a/tests/i915/kms_dsc.c
> +++ b/tests/i915/kms_dsc.c
> @@ -65,7 +65,6 @@ typedef struct {
>   	int compression_bpp;
>   	int n_pipes;
>   	enum pipe pipe;
> -	char conn_name[128];
>   } data_t;
>   
>   bool force_dsc_en_orig;
> @@ -80,9 +79,9 @@ static void force_dsc_enable(data_t *data)
>   {
>   	int ret;
>   
> -	igt_debug ("Forcing DSC enable on %s\n", data->conn_name);
> +	igt_debug ("Forcing DSC enable on %s\n", data->output->name);
>   	ret = igt_force_dsc_enable(data->drm_fd,
> -				      data->output->config.connector);
> +				   data->output->name);
>   	igt_assert_f(ret > 0, "debugfs_write failed");
>   }
>   
> @@ -91,10 +90,10 @@ static void force_dsc_enable_bpp(data_t *data)
>   	int ret;
>   
>   	igt_debug("Forcing DSC BPP to %d on %s\n",
> -		  data->compression_bpp, data->conn_name);
> +		  data->compression_bpp, data->output->name);
>   	ret = igt_force_dsc_enable_bpp(data->drm_fd,
> -					  data->output->config.connector,
> -					  data->compression_bpp);
> +				       data->output->name,
> +				       data->compression_bpp);
>   	igt_assert_f(ret > 0, "debugfs_write failed");
>   }
>   
> @@ -102,10 +101,10 @@ static void save_force_dsc_en(data_t *data)
>   {
>   	force_dsc_en_orig =
>   		igt_is_force_dsc_enabled(data->drm_fd,
> -					 data->output->config.connector);
> +					 data->output->name);
>   	force_dsc_restore_fd =
>   		igt_get_dsc_debugfs_fd(data->drm_fd,
> -					  data->output->config.connector);
> +				       data->output->name);
>   	igt_assert(force_dsc_restore_fd >= 0);
>   }
>   
> @@ -139,19 +138,6 @@ static void kms_dsc_exit_handler(int sig)
>   	restore_force_dsc_en();
>   }
>   
> -static bool is_external_panel(drmModeConnector *connector)
> -{
> -	switch (connector->connector_type) {
> -		case DRM_MODE_CONNECTOR_LVDS:
> -		case DRM_MODE_CONNECTOR_eDP:
> -		case DRM_MODE_CONNECTOR_DSI:
> -		case DRM_MODE_CONNECTOR_DPI:
> -			return false;
> -		default:
> -			return true;
> -	}
> -}
> -
>   static int sort_drm_modes(const void *a, const void *b)
>   {
>   	const drmModeModeInfo *mode1 = a, *mode2 = b;
> @@ -183,21 +169,19 @@ static bool check_dsc_on_connector(data_t *data, uint32_t drmConnector)
>   	    output->config.connector->modes[0].hdisplay < 5120)
>   		return NULL;
>   
> -	sprintf(data->conn_name, "%s-%d",
> -		kmstest_connector_type_str(connector->connector_type),
> -		connector->connector_type_id);
> -
> -	if (!igt_is_dsc_supported(data->drm_fd, connector)) {
> +	if (!igt_is_dsc_supported(data->drm_fd, data->output->name)) {
>   		igt_debug("DSC not supported on connector %s\n",
> -			  data->conn_name);
> +			  data->output->name);
>   		return false;
>   	}
> -	if (is_external_panel(connector) &&
> -	    !igt_is_fec_supported(data->drm_fd, connector)) {
> +
> +	if (!output_is_internal_panel(output) &&
> +	    !igt_is_fec_supported(data->drm_fd, output->name)) {
>   		igt_debug("DSC cannot be enabled without FEC on %s\n",
> -			  data->conn_name);
> +			  data->output->name);
>   		return false;
>   	}
> +
>   	data->output = output;
>   	return true;
>   }
> @@ -215,7 +199,7 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
>   	igt_output_set_pipe(data->output, PIPE_NONE);
>   	igt_display_commit(&data->display);
>   
> -	igt_debug("DSC is supported on %s\n", data->conn_name);
> +	igt_debug("DSC is supported on %s\n", data->output->name);
>   	save_force_dsc_en(data);
>   	force_dsc_enable(data);
>   	if (test_type == test_dsc_compression_bpp) {
> @@ -243,7 +227,7 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
>   	manual("RGB test pattern without corruption");
>   
>   	enabled = igt_is_dsc_enabled(data->drm_fd,
> -					data->output->config.connector);
> +				     data->output->name);
>   	restore_force_dsc_en();
>   	igt_debug("Reset compression BPP\n");
>   	data->compression_bpp = 0;
> @@ -251,7 +235,7 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
>   
>   	igt_assert_f(enabled,
>   		     "Default DSC enable failed on Connector: %s Pipe: %s\n",
> -		     data->conn_name,
> +		     data->output->name,
>   		     kmstest_pipe_name(data->pipe));
>   }
>   
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index d8462bfc..10b21c92 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -979,19 +979,6 @@ static void run_modeset_transition(data_t *data, int requested_outputs, bool non
>   	run_modeset_tests(data, requested_outputs, nonblocking, fencing);
>   }
>   
> -static bool output_is_internal_panel(igt_output_t *output)
> -{
> -	switch (output->config.connector->connector_type) {
> -	case DRM_MODE_CONNECTOR_LVDS:
> -	case DRM_MODE_CONNECTOR_eDP:
> -	case DRM_MODE_CONNECTOR_DSI:
> -	case DRM_MODE_CONNECTOR_DPI:
> -		return true;
> -	default:
> -		return false;
> -	}
> -}
> -
>   static int opt_handler(int opt, int opt_index, void *_data)
>   {
>   	data_t *data = _data;
> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
> index bb92a94e..630798d8 100644
> --- a/tests/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -50,7 +50,6 @@ static bool has_scaling_mode_prop(data_t *data)
>   static bool
>   can_bigjoiner(data_t *data)
>   {
> -	drmModeConnector *connector = data->output->config.connector;
>   	uint32_t devid = intel_get_drm_devid(data->drm_fd);
>   
>   	/*
> @@ -61,7 +60,7 @@ can_bigjoiner(data_t *data)
>   		igt_debug("Platform supports uncompressed bigjoiner\n");
>   		return true;
>   	} else if (intel_display_ver(devid) >= 11) {
> -		return igt_is_dsc_supported(data->drm_fd, connector);
> +		return igt_is_dsc_supported(data->drm_fd, data->output->name);
>   	}
>   
>   	return false;
