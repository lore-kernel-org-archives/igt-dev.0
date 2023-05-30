Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424AE10E3DE
 for <igt-dev@lists.freedesktop.org>; Tue, 30 May 2023 15:32:08 +0000 (UTC)
Message-ID: <9ede2654-f6de-4abf-5053-3044788b31a2@amd.com>
Date: Tue, 30 May 2023 11:32:02 -0400
Content-Language: en-US, en-CA
To: Hersen Wu <hersenxs.wu@amd.com>, igt-dev@lists.freedesktop.org,
 rodrigo.siqueira@amd.com, alex.hung@amd.com, stylon.wang@amd.com,
 hamza.mahfooz@amd.com
References: <20230530150519.697148-1-hersenxs.wu@amd.com>
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
In-Reply-To: <20230530150519.697148-1-hersenxs.wu@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH] [i-g-t] tests/amdgpu/amd_vrr_range: add vrr
 range check for edp
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



On 5/30/23 11:05, Hersen Wu wrote:
> run test for display connected instead of hard coded connector type.
> for dp, edp, video timing of hard coded vrr edid need only 2 dp
> lanes. this will let test pass without bandwidth failure on 2 lanes
> dp or edp display.
> add vrr range check for edp
> 
> Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
> ---
>  lib/igt_amd.c                |  31 ++++
>  lib/igt_amd.h                |   2 +
>  tests/amdgpu/amd_vrr_range.c | 297 ++++++++++++++++++++++-------------
>  3 files changed, 222 insertions(+), 108 deletions(-)
> 
> diff --git a/lib/igt_amd.c b/lib/igt_amd.c
> index 09923101f..8837714f7 100644
> --- a/lib/igt_amd.c
> +++ b/lib/igt_amd.c
> @@ -1111,6 +1111,37 @@ int igt_amd_read_psr_state(int drm_fd, char *connector_name)
>  	return strtol(buf, NULL, 10);
>  }
>  
> +/**
> + * igt_amd_allow_edp_hotplug_detect: notify kernel read edp edid all the time
> + * @drm_fd: DRM file descriptor
> + * @connector_name: The connector's name
> + * @enable: allow or disable kernel read eDP EDID for each display detection
> + * example usage: echo 0x1 >
> + * /sys/kernel/debug/dri/0/eDP-1/allow_edp_hotplug_detection
> + */
> +void igt_amd_allow_edp_hotplug_detect(int drm_fd, char *connector_name, bool enable)
> +{
> +	int fd, hpd_fd, wr_len;
> +	const char *allow_hotplug_detect = "1";
> +	const char *dis_allow_hotplug_detect = "0";
> +
> +	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
> +	igt_assert(fd >= 0);
> +	hpd_fd = openat(fd, DEBUGFS_ALLOW_EDP_HOTPLUG_DETECT, O_WRONLY);
> +	close(fd);
> +	igt_assert(hpd_fd >= 0);
> +
> +	if (enable) {
> +		wr_len = write(hpd_fd, allow_hotplug_detect, strlen(allow_hotplug_detect));
> +		igt_assert_eq(wr_len, strlen(allow_hotplug_detect));
> +	} else {
> +		wr_len = write(hpd_fd, dis_allow_hotplug_detect, strlen(dis_allow_hotplug_detect));
> +		igt_assert_eq(wr_len, strlen(dis_allow_hotplug_detect));
> +	}
> +
> +	close(hpd_fd);
> +}
> +
>  /**
>   * @brief check if AMDGPU DM visual confirm debugfs interface entry exist and defined
>   *
> diff --git a/lib/igt_amd.h b/lib/igt_amd.h
> index 428bfe6f7..d57390405 100644
> --- a/lib/igt_amd.h
> +++ b/lib/igt_amd.h
> @@ -48,6 +48,7 @@
>  #define MAX_SUPPORTED_ILR 8
>  #define DEBUGFS_EDP_PSR_CAP	"psr_capability"
>  #define DEBUGFS_EDP_PSR_STATE	"psr_state"
> +#define DEBUGFS_ALLOW_EDP_HOTPLUG_DETECT "allow_edp_hotplug_detection"
>  
>  /* amdgpu DM interface entries */
>  #define DEBUGFS_DM_VISUAL_CONFIRM "amdgpu_dm_visual_confirm"
> @@ -187,6 +188,7 @@ bool igt_amd_psr_support_sink(int drm_fd, char *connector_name, enum psr_mode mo
>  bool igt_amd_psr_support_drv(int drm_fd, char *connector_name, enum psr_mode mode);
>  bool igt_amd_output_has_psr_state(int drm_fd, char *connector_name);
>  int  igt_amd_read_psr_state(int drm_fd, char *connector_name);
> +void igt_amd_allow_edp_hotplug_detect(int drm_fd, char *connector_name, bool enable);
>  
>  /* DM interface helpers */
>  bool igt_amd_has_visual_confirm(int drm_fd);
> diff --git a/tests/amdgpu/amd_vrr_range.c b/tests/amdgpu/amd_vrr_range.c
> index 2f27296dd..c9a7bb973 100644
> --- a/tests/amdgpu/amd_vrr_range.c
> +++ b/tests/amdgpu/amd_vrr_range.c
> @@ -27,11 +27,14 @@
>  
>  IGT_TEST_DESCRIPTION("Test EDID parsing and debugfs reporting on Freesync displays");
>  
> +/* Maximumm pipes on any AMD ASIC. */
> +#define MAX_PIPES 6
> +
>  /* Common test data. */
>  typedef struct data {
>  	igt_display_t display;
>  	igt_plane_t *primary;
> -	igt_output_t *output;
> +	igt_output_t *output[MAX_PIPES];
>  	int fd;
>  } data_t;
>  
> @@ -53,45 +56,46 @@ struct {
>  	const range_t range;
>  } edid_database[] = {
>  	{
> -		/* DP EDID from Benq EL-2870u */
> -		"Benq EL-2870u DP",
> +		/* EDID Version 1.4. Timing requires 2 DP lanes. */
> +		"External DP",
>  		DRM_MODE_CONNECTOR_DisplayPort,
>  		{
>  		0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00,
> -		0x09, 0xd1, 0x49, 0x79, 0x45, 0x54, 0x00, 0x00,
> -		0x0c, 0x1e, 0x01, 0x04, 0xb5, 0x3e, 0x22, 0x78,
> -		0x3f, 0x08, 0xa5, 0xa2, 0x57, 0x4f, 0xa2, 0x28,
> -		0x0f, 0x50, 0x54, 0xa5, 0x6b, 0x80, 0xd1, 0xc0,
> -		0x81, 0xc0, 0x81, 0x00, 0x81, 0x80, 0xa9, 0xc0,
> -		0xb3, 0x00, 0xa9, 0x40, 0x01, 0x01, 0x4d, 0xd0,
> -		0x00, 0xa0, 0xf0, 0x70, 0x3e, 0x80, 0x30, 0x20,
> -		0x35, 0x00, 0x6d, 0x55, 0x21, 0x00, 0x00, 0x1a,
> -		0x00, 0x00, 0x00, 0xff, 0x00, 0x46, 0x33, 0x4c,
> -		0x30, 0x34, 0x33, 0x33, 0x33, 0x53, 0x4c, 0x30,
> -		0x0a, 0x20, 0x00, 0x00, 0x00, 0xfd, 0x00, 0x28,
> -		0x3c, 0x87, 0x87, 0x3c, 0x01, 0x0a, 0x20, 0x20,
> -		0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xfc,
> -		0x00, 0x42, 0x65, 0x6e, 0x51, 0x20, 0x45, 0x4c,
> -		0x32, 0x38, 0x37, 0x30, 0x55, 0x0a, 0x01, 0xa8,
> -		0x02, 0x03, 0x2e, 0xf1, 0x56, 0x61, 0x60, 0x5d,
> -		0x5e, 0x5f, 0x10, 0x05, 0x04, 0x03, 0x02, 0x07,
> -		0x06, 0x0f, 0x1f, 0x20, 0x21, 0x22, 0x14, 0x13,
> -		0x12, 0x16, 0x01, 0x23, 0x09, 0x07, 0x07, 0x83,
> -		0x01, 0x00, 0x00, 0xe3, 0x05, 0xc0, 0x00, 0xe6,
> -		0x06, 0x05, 0x01, 0x5a, 0x53, 0x44, 0x02, 0x3a,
> +		0x06, 0xb3, 0xaf, 0x24, 0x01, 0x01, 0x01, 0x01,
> +		0x00, 0x1d, 0x01, 0x04, 0x80, 0x35, 0x1e, 0x78,
> +		0x2b, 0x51, 0xb5, 0xa4, 0x54, 0x4f, 0xa0, 0x26,
> +		0x0d, 0x50, 0x54, 0xbf, 0xcf, 0x00, 0x81, 0x40,
> +		0x81, 0x80, 0x95, 0x00, 0x71, 0x4f, 0x81, 0xc0,
> +		0xb3, 0x00, 0x01, 0x01, 0x01, 0x01, 0x02, 0x3a,
>  		0x80, 0x18, 0x71, 0x38, 0x2d, 0x40, 0x58, 0x2c,
> -		0x45, 0x00, 0x6d, 0x55, 0x21, 0x00, 0x00, 0x1e,
> -		0x56, 0x5e, 0x00, 0xa0, 0xa0, 0xa0, 0x29, 0x50,
> -		0x30, 0x20, 0x35, 0x00, 0x6d, 0x55, 0x21, 0x00,
> -		0x00, 0x1a, 0x8c, 0x64, 0x00, 0x50, 0xf0, 0x70,
> -		0x1f, 0x80, 0x08, 0x20, 0x18, 0x04, 0x6d, 0x55,
> -		0x21, 0x00, 0x00, 0x1a, 0x00, 0x00, 0x00, 0x00,
> +		0x45, 0x00, 0x0f, 0x28, 0x21, 0x00, 0x00, 0x1e,
> +		0xfc, 0x7e, 0x80, 0x88, 0x70, 0x38, 0x12, 0x40,
> +		0x18, 0x20, 0x35, 0x00, 0x0f, 0x28, 0x21, 0x00,
> +		0x00, 0x1e, 0x00, 0x00, 0x00, 0xfd, 0x00, 0x30,
> +		0x90, 0x1e, 0xb4, 0x22, 0x01, 0x0a, 0x20, 0x20,
> +		0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xfc,
> +		0x00, 0x41, 0x53, 0x55, 0x53, 0x20, 0x56, 0x50,
> +		0x32, 0x34, 0x39, 0x0a, 0x20, 0x20, 0x01, 0x91,
> +		0x02, 0x03, 0x2d, 0xf1, 0x4f, 0x01, 0x03, 0x04,
> +		0x13, 0x1f, 0x12, 0x02, 0x11, 0x90, 0x0e, 0x0f,
> +		0x1d, 0x1e, 0x3f, 0x40, 0x23, 0x09, 0x07, 0x07,
> +		0x83, 0x01, 0x00, 0x00, 0x67, 0x03, 0x0c, 0x00,
> +		0x10, 0x00, 0x00, 0x44, 0x68, 0x1a, 0x00, 0x00,
> +		0x01, 0x01, 0x30, 0x90, 0xe6, 0x00, 0x00, 0x00,
> +		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>  		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
>  		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> -		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x93
> +		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16
>  		},
> -		{40, 60},
> +		{48, 144},
>  	},
> +
>  	{
>  		/* HDMI EDID from ASUS VP249QGR */
>  		"ASUS VP249QGR HDMI",
> @@ -132,26 +136,63 @@ struct {
>  		},
>  		{48, 144},
>  	},
> +
> +	{
> +		/* EDID Version 1.4. Timing requires 2 DP lanes. */
> +		"eDP",
> +		DRM_MODE_CONNECTOR_eDP,
> +		{
> +		0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00,
> +		0x06, 0xb3, 0xaf, 0x24, 0x01, 0x01, 0x01, 0x01,
> +		0x00, 0x1d, 0x01, 0x04, 0x80, 0x35, 0x1e, 0x78,
> +		0x2b, 0x51, 0xb5, 0xa4, 0x54, 0x4f, 0xa0, 0x26,
> +		0x0d, 0x50, 0x54, 0xbf, 0xcf, 0x00, 0x81, 0x40,
> +		0x81, 0x80, 0x95, 0x00, 0x71, 0x4f, 0x81, 0xc0,
> +		0xb3, 0x00, 0x01, 0x01, 0x01, 0x01, 0x02, 0x3a,
> +		0x80, 0x18, 0x71, 0x38, 0x2d, 0x40, 0x58, 0x2c,
> +		0x45, 0x00, 0x0f, 0x28, 0x21, 0x00, 0x00, 0x1e,
> +		0xfc, 0x7e, 0x80, 0x88, 0x70, 0x38, 0x12, 0x40,
> +		0x18, 0x20, 0x35, 0x00, 0x0f, 0x28, 0x21, 0x00,
> +		0x00, 0x1e, 0x00, 0x00, 0x00, 0xfd, 0x00, 0x30,
> +		0x90, 0x1e, 0xb4, 0x22, 0x01, 0x0a, 0x20, 0x20,
> +		0x20, 0x20, 0x20, 0x20, 0x00, 0x00, 0x00, 0xfc,
> +		0x00, 0x41, 0x53, 0x55, 0x53, 0x20, 0x56, 0x50,
> +		0x32, 0x34, 0x39, 0x0a, 0x20, 0x20, 0x01, 0x91,
> +		0x02, 0x03, 0x2d, 0xf1, 0x4f, 0x01, 0x03, 0x04,
> +		0x13, 0x1f, 0x12, 0x02, 0x11, 0x90, 0x0e, 0x0f,
> +		0x1d, 0x1e, 0x3f, 0x40, 0x23, 0x09, 0x07, 0x07,
> +		0x83, 0x01, 0x00, 0x00, 0x67, 0x03, 0x0c, 0x00,
> +		0x10, 0x00, 0x00, 0x44, 0x68, 0x1a, 0x00, 0x00,
> +		0x01, 0x01, 0x30, 0x90, 0xe6, 0x00, 0x00, 0x00,
> +		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +		0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x16
> +		},
> +		{48, 144},
> +	},
>  };
>  
>  /* Common test setup. */
> -static void test_init(data_t *data, uint32_t connector_type)
> +//static void test_init(data_t *data, uint32_t connector_type)

Do we need to keep the comment here ?

> +static void test_init(data_t *data)
>  {
>  	igt_display_t *display = &data->display;
> +	int i;
>  
> -	igt_display_reset(display);
> +	for_each_pipe(display, i) {
> +		igt_output_t *output = &display->outputs[i];
>  
> -	/* find connected outputs */
> -	data->output = NULL;
> -	for (int i=0; i < data->display.n_outputs; ++i) {
> -		drmModeConnector *connector = data->display.outputs[i].config.connector;
> -		if (connector->connection == DRM_MODE_CONNECTED &&
> -			connector->connector_type == connector_type) {
> -			data->output = &data->display.outputs[i];
> -		}
> +		data->output[i] = output;
>  	}
> -	igt_assert_f(data->output, "Requires connected output\n");
>  
> +	igt_display_reset(display);
>  }
>  
>  /* Common test cleanup. */
> @@ -185,6 +226,7 @@ static range_t get_freesync_range(data_t *data, igt_output_t *output)
>  	fd = igt_debugfs_connector_dir(data->fd, output->name, O_RDONLY);
>  	igt_assert(fd >= 0);
>  
> +	/* example usage: cat /sys/kernel/debug/dri/0/DP-1/vrr_range */
>  	res = igt_debugfs_simple_read(fd, "vrr_range", buf, sizeof(buf));
>  	igt_require(res > 0);
>  
> @@ -199,56 +241,86 @@ static range_t get_freesync_range(data_t *data, igt_output_t *output)
>  	return range;
>  }
>  
> -static void trigger_edid_parse(data_t *data, uint32_t test_flags)
> +static void trigger_edid_parse(data_t *data, igt_output_t *output, uint32_t test_flags)
>  {
>  	if (test_flags & TEST_SUSPEND)
>  		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
>  					      SUSPEND_TEST_NONE);
>  	else
> -		igt_amd_trigger_hotplug(data->fd, data->output->name);
> +		igt_amd_trigger_hotplug(data->fd, output->name);
>  
>  	/* more safe margin until resume and hotplug is completed */
>  	usleep(1500000);
>  }
>  
>  /* Check if EDID parsing is correctly reporting Freesync capability
> - * by overriding EDID with ones from golden sample. Display under test
> - * must still support Freesync.
> + * by overriding EDID with ones from golden sample.
>   */
> -static void test_freesync_parsing(data_t *data, uint32_t connector_type,
> -		uint32_t test_flags)
> +static void test_freesync_parsing_base(data_t *data, uint32_t test_flags)
>  {
>  	const struct edid *edid;
>  	range_t range, expected_range;
> -	int i;
> +	igt_output_t *output;
> +	int i, j, test_conn_cnt = 0;
>  
> -	test_init(data, connector_type);
> +	test_init(data);
>  
>  	igt_amd_require_hpd(&data->display, data->fd);
>  
> -	/* find a test EDID */
> -	i = find_test_edid_index(connector_type);
> -	edid = (const struct edid *)edid_database[i].edid;
> -	expected_range = edid_database[i].range;
> +	for_each_pipe(&data->display, i) {
> +		/* setup the output */
> +		output = data->output[i];
> +		if (!output || !igt_output_is_connected(output))
> +			continue;
> +
> +		/* find a test EDID */
> +		j = find_test_edid_index(output->config.connector->connector_type);
> +
> +		edid = (const struct edid *)edid_database[j].edid;
> +		expected_range = edid_database[j].range;
> +
> +		/* eDP allow read edid for each display detection */
> +		if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP)
> +			igt_amd_allow_edp_hotplug_detect(data->fd, output->name, true);
> +
> +		/* force to use hard coded VRR EDID */
> +		kmstest_force_edid(data->fd, output->config.connector, edid);
>  
> -	kmstest_force_edid(data->fd, data->output->config.connector, edid);
> +		trigger_edid_parse(data, output, test_flags);
>  
> -	trigger_edid_parse(data, test_flags);
> +		range = get_freesync_range(data, output);
>  
> -	range = get_freesync_range(data, data->output);
> +		/* undo EDID override. re-parse EDID of display */
> +		kmstest_force_edid(data->fd, output->config.connector, NULL);
>  
> -	/* undo EDID override and trigger a re-parsing of EDID */
> -	kmstest_force_edid(data->fd, data->output->config.connector, NULL);
> -	igt_amd_trigger_hotplug(data->fd, data->output->name);
> +		igt_amd_trigger_hotplug(data->fd, output->name);
> +
> +		/* eDP dis-allow read edid for each display detection */
> +		if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP)
> +			igt_amd_allow_edp_hotplug_detect(data->fd, output->name, false);
> +
> +		test_conn_cnt++;
> +
> +		igt_assert_f(range.min == expected_range.min &&
> +				range.max == expected_range.max,
> +				"Expecting Freesync range %d-%d, got %d-%d\n",
> +				expected_range.min, expected_range.max,
> +				range.min, range.max);
> +		igt_info("%s Freesync range: %d-%d\n", output->name, range.min, range.max);
> +	}
>  
>  	test_fini(data);
> +	igt_skip_on(test_conn_cnt == 0);
> +}
> +
> +static void test_freesync_parsing(data_t *data)

nitpick, these could be marked inline.
> +{
> +	test_freesync_parsing_base(data, TEST_NONE);
> +}
>  
> -	igt_assert_f(range.min == expected_range.min &&
> -			range.max == expected_range.max,
> -			"Expecting Freesync range %d-%d, got %d-%d\n",
> -			expected_range.min, expected_range.max,
> -			range.min, range.max);
> -	igt_info("Freesync range: %d-%d\n", range.min, range.max);
> +static void test_freesync_parsing_suspend(data_t *data)
> +{
> +	test_freesync_parsing_base(data, TEST_SUSPEND);
>  }
>  
>  /* Returns true if an output supports VRR. */
> @@ -260,32 +332,57 @@ static bool has_vrr(igt_output_t *output)
>  
>  /* More relaxed checking on Freesync capability.
>   * Only checks if frame rate range is within legal range.
> + * Display under test MUST be VRR capable.
>   */
> -static void test_freesync_range(data_t *data, uint32_t connector_type,
> -		uint32_t test_flags)
> +static void test_freesync_range_base(data_t *data, uint32_t test_flags)
>  {
>  	range_t range;
> +	igt_output_t *output;
> +	int i, test_conn_cnt = 0;
>  
> -	test_init(data, connector_type);
> +	test_init(data);
>  
>  	igt_amd_require_hpd(&data->display, data->fd);
>  
> -	igt_assert_f(has_vrr(data->output),
> -			"connector %s is not VRR capable\n",
> -			data->output->name);
> +	for_each_pipe(&data->display, i) {
> +		/* setup the output */
> +		output = data->output[i];
> +		if (!output || !igt_output_is_connected(output))
> +			continue;
> +
> +		igt_debug_on_f(!has_vrr(output), "Requires output supports VRR\n");
> +
> +		if (!has_vrr(output)) {
> +			igt_info("connector %s is not VRR capable\n", output->name);
> +			continue;
> +		}
> +
> +		trigger_edid_parse(data, output, test_flags);
> +
> +		range = get_freesync_range(data, output);
>  
> -	trigger_edid_parse(data, test_flags);
> +		igt_assert_f(range.min != 0 &&
> +				range.max != 0 &&
> +				range.max - range.min > 10,
> +				"Invalid Freesync range %d-%d\n",
> +				range.min, range.max);
> +		igt_info("%s Freesync range: %d-%d\n", output->name, range.min, range.max);
>  
> -	range = get_freesync_range(data, data->output);
> +		test_conn_cnt++;
> +	}
>  
>  	test_fini(data);
> +	igt_skip_on(test_conn_cnt == 0);
> +}
> +
> +static void test_freesync_range(data_t *data)
> +{
> +	test_freesync_range_base(data, TEST_NONE);
> +}
>  
> -	igt_assert_f(range.min != 0 &&
> -			range.max != 0 &&
> -			range.max - range.min > 10,
> -			"Invalid Freesync range %d-%d\n",
> -			range.min, range.max);
> -	igt_info("Freesync range: %d-%d\n", range.min, range.max);
> +static void test_freesync_range_suspend(data_t *data)
> +{
> +	test_freesync_range_base(data, TEST_SUSPEND);
>  }
>  
>  igt_main
> @@ -307,33 +404,17 @@ igt_main
>  		igt_display_require_output(&data.display);
>  	}
>  
> -	igt_describe("Freesync EDID parsing on HDMI");
> -	igt_subtest("freesync-parsing-hdmi") test_freesync_parsing(&data,
> -			DRM_MODE_CONNECTOR_HDMIA, TEST_NONE);
> -	igt_describe("Freesync EDID parsing on DP");
> -	igt_subtest("freesync-parsing-dp") test_freesync_parsing(&data,
> -			DRM_MODE_CONNECTOR_DisplayPort, TEST_NONE);
> -
> -	igt_describe("Freesync EDID parsing on HDMI after suspend");
> -	igt_subtest("freesync-parsing-hdmi-suspend") test_freesync_parsing(&data,
> -			DRM_MODE_CONNECTOR_HDMIA, TEST_SUSPEND);
> -	igt_describe("Freesync EDID parsing on DP after suspend");
> -	igt_subtest("freesync-parsing-dp-suspend") test_freesync_parsing(&data,
> -			DRM_MODE_CONNECTOR_DisplayPort, TEST_SUSPEND);
> -
> -	igt_describe("Freesync range on HDMI");
> -	igt_subtest("freesync-range-hdmi") test_freesync_range(&data,
> -			DRM_MODE_CONNECTOR_HDMIA, TEST_NONE);
> -	igt_describe("Freesync range on DP");
> -	igt_subtest("freesync-range-dp") test_freesync_range(&data,
> -			DRM_MODE_CONNECTOR_DisplayPort, TEST_NONE);
> -
> -	igt_describe("Freesync range on HDMI after suspend");
> -	igt_subtest("freesync-range-hdmi-suspend") test_freesync_range(&data,
> -			DRM_MODE_CONNECTOR_HDMIA, TEST_SUSPEND);
> -	igt_describe("Freesync range on DP after suspend");
> -	igt_subtest("freesync-range-dp-suspend") test_freesync_range(&data,
> -			DRM_MODE_CONNECTOR_DisplayPort, TEST_SUSPEND);
> +	igt_describe("Hard coded Freesync EDID parsing");
> +	igt_subtest("freesync-parsing") test_freesync_parsing(&data);
> +
> +	igt_describe("Hard coded Freesync EDID parsing after suspend");
> +	igt_subtest("freesync-parsing-suspend") test_freesync_parsing_suspend(&data);
> +
> +	igt_describe("Freesync range from display");
> +	igt_subtest("freesync-range") test_freesync_range(&data);
> +
> +	igt_describe("Freesync range from display after suspend");
> +	igt_subtest("freesync-range-suspend") test_freesync_range_suspend(&data);
>  
>  	igt_fixture
>  	{
