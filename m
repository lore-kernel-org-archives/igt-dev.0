Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D88C16E156
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jul 2021 03:21:31 +0000 (UTC)
References: <20210719131439.27284-1-bhanuprakash.modem@intel.com>
 <20210719131439.27284-3-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
Message-ID: <a5285beb-e1df-a9a4-517b-0fcdcb848b39@intel.com>
Date: Tue, 20 Jul 2021 08:51:17 +0530
In-Reply-To: <20210719131439.27284-3-bhanuprakash.modem@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V2 2/3] tests/kms_dsc: Extend support to HDMI
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 7/19/2021 6:44 PM, Bhanuprakash Modem wrote:
> As HDMI also supports DSC, we need to extend the test coverage.
> This patch will remove the connector type check to support HDMI.
>
> V2: Rebase
>
> Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Vandita Kulkarni <vandita.kulkarni@intel.com>
> Cc: Patnana Venkata Sai <venkata.sai.patnana@intel.com>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Navare Manasi D <manasi.d.navare@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/{kms_dp_dsc.c => kms_dsc.c} | 45 +++++++++++++++++++------------
>   tests/meson.build                 |  2 +-
>   2 files changed, 29 insertions(+), 18 deletions(-)
>   rename tests/{kms_dp_dsc.c => kms_dsc.c} (89%)
>
> diff --git a/tests/kms_dp_dsc.c b/tests/kms_dsc.c
> similarity index 89%
> rename from tests/kms_dp_dsc.c
> rename to tests/kms_dsc.c
> index 6e8dda77..b56e0183 100644
> --- a/tests/kms_dp_dsc.c
> +++ b/tests/kms_dsc.c
> @@ -75,23 +75,23 @@ static inline void manual(const char *expected)
>   	igt_debug_manual_check("all", expected);
>   }
>   
> -static void force_dp_dsc_enable(data_t *data)
> +static void force_dsc_enable(data_t *data)
>   {
>   	int ret;
>   
>   	igt_debug ("Forcing DSC enable on %s\n", data->conn_name);
> -	ret = igt_force_dp_dsc_enable(data->drm_fd,
> +	ret = igt_force_dsc_enable(data->drm_fd,
>   				      data->output->config.connector);
>   	igt_assert_f(ret > 0, "debugfs_write failed");
>   }
>   
> -static void force_dp_dsc_set_bpp(data_t *data)
> +static void force_dsc_enable_bpp(data_t *data)
>   {
>   	int ret;
>   
>   	igt_debug("Forcing DSC BPP to %d on %s\n",
>   		  data->compression_bpp, data->conn_name);
> -	ret = igt_force_dp_dsc_enable_bpp(data->drm_fd,
> +	ret = igt_force_dsc_enable_bpp(data->drm_fd,
>   					  data->output->config.connector,
>   					  data->compression_bpp);
>   	igt_assert_f(ret > 0, "debugfs_write failed");
> @@ -103,7 +103,7 @@ static void save_force_dsc_en(data_t *data)
>   		igt_is_force_dsc_enabled(data->drm_fd,
>   					 data->output->config.connector);
>   	force_dsc_restore_fd =
> -		igt_get_dp_dsc_debugfs_fd(data->drm_fd,
> +		igt_get_dsc_debugfs_fd(data->drm_fd,
>   					  data->output->config.connector);
>   	igt_assert(force_dsc_restore_fd >= 0);
>   }
> @@ -133,11 +133,24 @@ static void test_cleanup(data_t *data)
>   	}
>   }
>   
> -static void kms_dp_dsc_exit_handler(int sig)
> +static void kms_dsc_exit_handler(int sig)
>   {
>   	restore_force_dsc_en();
>   }
>   
> +static bool is_external_panel(drmModeConnector *connector)
> +{
> +	switch (connector->connector_type) {
> +		case DRM_MODE_CONNECTOR_LVDS:
> +		case DRM_MODE_CONNECTOR_eDP:
> +		case DRM_MODE_CONNECTOR_DSI:
> +		case DRM_MODE_CONNECTOR_DPI:
> +			return false;
> +		default:
> +			return true;
> +	}
> +}
> +
>   static bool check_dsc_on_connector(data_t *data, uint32_t drmConnector)
>   {
>   	drmModeConnector *connector;
> @@ -145,9 +158,7 @@ static bool check_dsc_on_connector(data_t *data, uint32_t drmConnector)
>   
>   	connector = drmModeGetConnectorCurrent(data->drm_fd,
>   					       drmConnector);
> -	if (connector->connection != DRM_MODE_CONNECTED ||
> -	    ((connector->connector_type != DRM_MODE_CONNECTOR_eDP) &&
> -	    (connector->connector_type != DRM_MODE_CONNECTOR_DisplayPort)))
> +	if (connector->connection != DRM_MODE_CONNECTED)
>   		return false;
>   
>   	output = igt_output_from_connector(&data->display, connector);
> @@ -155,13 +166,13 @@ static bool check_dsc_on_connector(data_t *data, uint32_t drmConnector)
>   		kmstest_connector_type_str(connector->connector_type),
>   		connector->connector_type_id);
>   
> -	if (!igt_is_dp_dsc_supported(data->drm_fd, connector)) {
> +	if (!igt_is_dsc_supported(data->drm_fd, connector)) {
>   		igt_debug("DSC not supported on connector %s\n",
>   			  data->conn_name);
>   		return false;
>   	}
> -	if (connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
> -	    !igt_is_dp_fec_supported(data->drm_fd, connector)) {
> +	if (is_external_panel(connector) &&
> +	    !igt_is_fec_supported(data->drm_fd, connector)) {
>   		igt_debug("DSC cannot be enabled without FEC on %s\n",
>   			  data->conn_name);
>   		return false;
> @@ -185,10 +196,10 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
>   
>   	igt_debug("DSC is supported on %s\n", data->conn_name);
>   	save_force_dsc_en(data);
> -	force_dp_dsc_enable(data);
> +	force_dsc_enable(data);
>   	if (test_type == test_dsc_compression_bpp) {
>   		igt_debug("Trying to set BPP to %d\n", data->compression_bpp);
> -		force_dp_dsc_set_bpp(data);
> +		force_dsc_enable_bpp(data);
>   	}
>   
>   	igt_output_set_pipe(data->output, data->pipe);
> @@ -205,13 +216,13 @@ static void update_display(data_t *data, enum dsc_test_type test_type)
>   	 */
>   	manual("RGB test pattern without corruption");
>   
> -	enabled = igt_is_dp_dsc_enabled(data->drm_fd,
> +	enabled = igt_is_dsc_enabled(data->drm_fd,
>   					data->output->config.connector);
>   	restore_force_dsc_en();
>   	if (test_type == test_dsc_compression_bpp) {
>   		igt_debug("Rest compression BPP \n");
>   		data->compression_bpp = 0;
> -		force_dp_dsc_set_bpp(data);
> +		force_dsc_enable_bpp(data);
>   	}
>   
>   	igt_assert_f(enabled,
> @@ -272,7 +283,7 @@ igt_main
>   		igt_require_intel(data.drm_fd);
>   		data.devid = intel_get_drm_devid(data.drm_fd);
>   		kmstest_set_vt_graphics_mode();
> -		igt_install_exit_handler(kms_dp_dsc_exit_handler);
> +		igt_install_exit_handler(kms_dsc_exit_handler);
>   		igt_display_require(&data.display, data.drm_fd);
>   		igt_require(res = drmModeGetResources(data.drm_fd));
>   	}
> diff --git a/tests/meson.build b/tests/meson.build
> index d3de40be..1bdfddbb 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -31,9 +31,9 @@ test_progs = [
>   	'kms_cursor_legacy',
>   	'kms_dither',
>   	'kms_dp_aux_dev',
> -	'kms_dp_dsc',
>   	'kms_dp_tiled_display',
>   	'kms_draw_crc',
> +	'kms_dsc',
>   	'kms_fbcon_fbt',
>   	'kms_fence_pin_leak',
>   	'kms_flip',


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
