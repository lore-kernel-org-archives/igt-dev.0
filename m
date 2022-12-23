Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 745F910E187
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Dec 2022 11:39:52 +0000 (UTC)
Message-ID: <2d79c3d0-a812-d603-38a0-a662990795f7@intel.com>
Date: Fri, 23 Dec 2022 17:09:34 +0530
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20221125115808.13394-1-swati2.sharma@intel.com>
 <20221125115808.13394-4-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20221125115808.13394-4-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/6] tests/i915/kms_dsc: Enable
 validation for VDSC YCbCr420
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

Hi Swati,

This looks better now. Few suggestions/comments inline:

On 11/25/2022 5:28 PM, Swati Sharma wrote:
> Existing i-g-t is extended to enable validation for VDSC YCbCr420.
> If a mode is supported in both RGB and YCbCr420 output formats by the
> sink, i915 driver policy is to try RGB first and fall back to YCbCr420, if
> mode cannot be shown using RGB. To test YCbCr420, we need a debugfs
> entry (force_dsc_ycbcr420) to force this output format; so that YCbCr420 code
> gets executed.
>  From i-g-t, we have set this debugfs entry. However, before setting
> debugfs entry, we have checked capability i.e. YCbCr420 is supported by
> both platform (D14+) and sink.
> Also, all the modes doesn't support both YCbCr420 and RGB formats; so if
> sink and platform supports YCbCr420 we will do try commit with each mode
> till we get a successful commit.
>
> v2: -used is_dsc_ycbcr420_supported() (Ankit)
>      -handled try-commit correctly (Ankit)
>      -instead of flag use enum for output formats (Ankit)
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/i915/kms_dsc.c | 195 ++++++++++++++++++++++++++++++++-----------
>   1 file changed, 147 insertions(+), 48 deletions(-)
>
> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
> index 6fef764de..6a3eecdb4 100644
> --- a/tests/i915/kms_dsc.c
> +++ b/tests/i915/kms_dsc.c
> @@ -53,6 +53,11 @@ enum dsc_test_type {
>   	TEST_DSC_BPC
>   };
>   
> +enum dsc_output_format {
> +	DSC_FORMAT_RGB444,
> +	DSC_FORMAT_YCBCR420
> +};
> +
>   typedef struct {
>   	int drm_fd;
>   	uint32_t devid;
> @@ -66,7 +71,10 @@ typedef struct {
>   } data_t;
>   
>   bool force_dsc_en_orig;
> +bool force_dsc_ycbcr420_en_orig;
>   int force_dsc_restore_fd = -1;
> +int force_dsc_ycbcr420_restore_fd = -1;
> +static int count = 0;
>   
>   const struct {
>   	const int format;
> @@ -107,6 +115,16 @@ static void force_dsc_enable_bpc(data_t *data)
>   	igt_assert_f(ret > 0, "forcing input dsc bpc debugfs_write failed\n");
>   }
>   
> +static void force_dsc_ycbcr420_enable(data_t *data)
> +{
> +	int ret;
> +
> +	igt_debug("Forcing DSC YCbCr420 on %s\n", data->output->name);
> +	ret = igt_force_dsc_ycbcr420_enable(data->drm_fd,
> +					    data->output->name);
> +	igt_assert_f(ret > 0, "forcing dsc ycbcr420 debugfs_write failed\n");
> +}
> +
>   static void save_force_dsc_en(data_t *data)
>   {
>   	force_dsc_en_orig =
> @@ -130,9 +148,34 @@ static void restore_force_dsc_en(void)
>   	force_dsc_restore_fd = -1;
>   }
>   
> +static void save_force_dsc_ycbcr420_en(data_t *data)
> +{
> +	force_dsc_ycbcr420_en_orig =
> +		igt_is_force_dsc_ycbcr420_enabled(data->drm_fd,
> +						  data->output->name);
> +	force_dsc_ycbcr420_restore_fd =
> +		igt_get_dsc_ycbcr420_debugfs_fd(data->drm_fd,
> +						data->output->name);
> +	igt_assert(force_dsc_ycbcr420_restore_fd >= 0);
> +}
> +
> +static void restore_force_dsc_ycbcr420_en(void)
> +{
> +	if (force_dsc_ycbcr420_restore_fd < 0)
> +		return;
> +
> +	igt_debug("Restoring DSC YCbCr420 enable\n");
> +	igt_assert(write(force_dsc_ycbcr420_restore_fd, force_dsc_ycbcr420_en_orig ? "1" : "0", 1) == 1);
> +
> +	close(force_dsc_ycbcr420_restore_fd);
> +	force_dsc_ycbcr420_restore_fd = -1;
> +}
> +
> +
>   static void kms_dsc_exit_handler(int sig)
>   {
>   	restore_force_dsc_en();
> +	restore_force_dsc_ycbcr420_en();
>   }
>   
>   static drmModeModeInfo *get_highres_mode(igt_output_t *output)
> @@ -147,6 +190,20 @@ static drmModeModeInfo *get_highres_mode(igt_output_t *output)
>   	return highest_mode;
>   }
>   
> +static drmModeModeInfo *get_next_mode(igt_output_t *output)
> +{
> +	drmModeConnector *connector = output->config.connector;
> +	drmModeModeInfo *next_mode = NULL;
> +
> +	for (int i = count; i < connector->count_modes; i++) {
> +		next_mode = &connector->modes[i];
> +		count ++;

No space before the unary increment operator.


> +		break;
> +	}
> +
> +	return next_mode;
> +}
> +
>   static bool check_dsc_on_connector(data_t *data)
>   {
>   	igt_output_t *output = data->output;
> @@ -167,6 +224,19 @@ static bool check_dsc_on_connector(data_t *data)
>   	return true;
>   }
>   
> +static bool is_dsc_ycbcr420_supported(data_t *data)
> +{
> +	igt_output_t *output = data->output;
> +
> +	if (!igt_is_dsc_ycbcr420_supported(data->drm_fd, output->name)) {
> +		igt_debug("DSC YCbCr420 not supported on connector %s\n",
> +			  output->name);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>   static bool check_big_joiner_pipe_constraint(data_t *data)
>   {
>   	igt_output_t *output = data->output;
> @@ -224,75 +294,100 @@ static void test_cleanup(data_t *data)
>   
>   /* re-probe connectors and do a modeset with DSC */
>   static void update_display(data_t *data, enum dsc_test_type test_type,
> -			   unsigned int plane_format)
> +			   unsigned int plane_format, enum dsc_output_format output_format)
>   {
> +	int ret;
>   	bool enabled;
>   	igt_plane_t *primary;
>   	drmModeModeInfo *mode;
> +	bool test_complete = false;
>   	igt_output_t *output = data->output;
>   	igt_display_t *display = &data->display;
>   
> -	/* sanitize the state before starting the subtest */
> -	igt_display_reset(display);
> -	igt_display_commit(display);
> +	count = 0;
> +	while (!test_complete) {
> +		/* sanitize the state before starting the subtest */
> +		igt_display_reset(display);
> +		igt_display_commit(display);
>   
> -	igt_debug("DSC is supported on %s\n", data->output->name);
> -	save_force_dsc_en(data);
> -	force_dsc_enable(data);
> +		igt_debug("DSC is supported on %s\n", data->output->name);
> +		save_force_dsc_en(data);
> +		force_dsc_enable(data);
>   
> -	if (test_type == TEST_DSC_BPC) {
> -		igt_debug("Trying to set input BPC to %d\n", data->input_bpc);
> -		force_dsc_enable_bpc(data);
> -	}
> +		if (output_format == DSC_FORMAT_YCBCR420) {
> +			igt_debug("DSC YCbCr420 is supported on %s\n", data->output->name);
> +			save_force_dsc_ycbcr420_en(data);
> +			force_dsc_ycbcr420_enable(data);
> +		}
>   
> -	igt_output_set_pipe(output, data->pipe);
> +		if (test_type == TEST_DSC_BPC) {
> +			igt_debug("Trying to set input BPC to %d\n", data->input_bpc);
> +			force_dsc_enable_bpc(data);
> +		}
>   
> -	mode = get_highres_mode(output);
> -	igt_require(mode != NULL);
> -	igt_output_override_mode(output, mode);
> +		igt_output_set_pipe(output, data->pipe);
>   
> -	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +		if (output_format == DSC_FORMAT_YCBCR420)
> +			mode = get_next_mode(output);

If we pass the count, or to be precise the current mode index, we can 
avoid having a global count.


> +		else
> +			mode = get_highres_mode(output);
>   
> -	igt_skip_on(!igt_plane_has_format_mod(primary, plane_format,
> -		    DRM_FORMAT_MOD_LINEAR));
> +		igt_require(mode != NULL);
> +		igt_output_override_mode(output, mode);
>   
> -	igt_create_pattern_fb(data->drm_fd,
> -			      mode->hdisplay,
> -			      mode->vdisplay,
> -			      plane_format,
> -			      DRM_FORMAT_MOD_LINEAR,
> -			      &data->fb_test_pattern);
> +		primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>   
> -	igt_plane_set_fb(primary, &data->fb_test_pattern);
> -	igt_display_commit(display);
> +		igt_skip_on(!igt_plane_has_format_mod(primary, plane_format,
> +			    DRM_FORMAT_MOD_LINEAR));
>   
> -	/* until we have CRC check support, manually check if RGB test
> -	 * pattern has no corruption.
> -	 */
> -	manual("RGB test pattern without corruption");
> +		igt_create_pattern_fb(data->drm_fd,
> +				      mode->hdisplay,
> +				      mode->vdisplay,
> +				      plane_format,
> +				      DRM_FORMAT_MOD_LINEAR,
> +				      &data->fb_test_pattern);
>   
> -	enabled = igt_is_dsc_enabled(data->drm_fd, output->name);
> -	igt_info("Current mode is: %dx%d @%dHz -- DSC is: %s\n",
> -				mode->hdisplay,
> -				mode->vdisplay,
> -				mode->vrefresh,
> -				enabled ? "ON" : "OFF");
> +		igt_plane_set_fb(primary, &data->fb_test_pattern);
> +		ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +		if (ret == 0) {
> +			igt_display_commit(display);
> +			test_complete = true;
> +		} else if (output_format == DSC_FORMAT_YCBCR420) {
> +			continue;
> +		}
>   
> -	restore_force_dsc_en();
> -	igt_debug("Reset compression BPC\n");
> -	data->input_bpc = 0;
> -	force_dsc_enable_bpc(data);
> +		igt_assert_eq(ret, 0);
> +
> +		/* until we have CRC check support, manually check if RGB test
> +		 * pattern has no corruption.
> +		 */
> +		manual("RGB test pattern without corruption");
> +
> +		enabled = igt_is_dsc_enabled(data->drm_fd, output->name);
> +		igt_info("Current mode is: %dx%d @%dHz -- DSC is: %s\n",
> +					mode->hdisplay,
> +					mode->vdisplay,
> +					mode->vrefresh,
> +					enabled ? "ON" : "OFF");

I think we can print the output_format with which DSC was used here

Thanks & Regards,

Ankit

> +
> +		restore_force_dsc_en();
> +		if (output_format == DSC_FORMAT_YCBCR420)
> +			restore_force_dsc_ycbcr420_en();
> +		igt_debug("Reset compression BPC\n");
> +		data->input_bpc = 0;
> +		force_dsc_enable_bpc(data);
>   
> -	igt_assert_f(enabled,
> -		     "Default DSC enable failed on connector: %s pipe: %s\n",
> -		     output->name,
> -		     kmstest_pipe_name(data->pipe));
> +		igt_assert_f(enabled,
> +			    "Default DSC enable failed on connector: %s pipe: %s\n",
> +			    output->name,
> +			    kmstest_pipe_name(data->pipe));
>   
> -	test_cleanup(data);
> +		test_cleanup(data);
> +	}
>   }
>   
>   static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpc,
> -		     unsigned int plane_format)
> +		     unsigned int plane_format, enum dsc_output_format output_format)
>   {
>   	igt_display_t *display = &data->display;
>   	igt_output_t *output;
> @@ -322,14 +417,18 @@ static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpc,
>   			snprintf(name, sizeof(name), "-%s", igt_format_str(plane_format));
>   
>   		igt_dynamic_f("pipe-%s-%s%s",  kmstest_pipe_name(data->pipe), data->output->name, name)
> -			update_display(data, test_type, plane_format);
> +			update_display(data, test_type, plane_format, output_format);
>   	}
>   }
>   
>   static void run_test(data_t *data, enum dsc_test_type test_type, int bpc,
>   		     unsigned int plane_format)
>   {
> -	test_dsc(data, test_type, bpc, plane_format);
> +	test_dsc(data, test_type, bpc, plane_format, DSC_FORMAT_RGB444);
> +
> +	/* YCbCr420 DSC is supported on display version 14+ */
> +	if ((data->disp_ver >= 14) && (is_dsc_ycbcr420_supported(data)))
> +		test_dsc(data, test_type, bpc, plane_format, DSC_FORMAT_YCBCR420);
>   }
>   
>   igt_main
