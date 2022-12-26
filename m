Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FB3610E00B
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Dec 2022 07:00:16 +0000 (UTC)
Message-ID: <1cfacfe2-f873-9f18-c694-4a350d3dd9de@intel.com>
Date: Mon, 26 Dec 2022 12:30:00 +0530
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20221125115808.13394-1-swati2.sharma@intel.com>
 <20221125115808.13394-6-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20221125115808.13394-6-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 5/6] tests/i915/kms_dsc: Enable
 validation for VDSC Fractional BPP
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


On 11/25/2022 5:28 PM, Swati Sharma wrote:
> Fractional BPP support comes from DSC1.2. To test Fractional BPP, debugfs entry
> (force_dsc_fractional_bpp) is introduced. From the IGT; we are setting this
> debugfs entry. However, before setting this debugfs entry, we are checking
> capability i.e. Fractional BPP is supported by platform and sink both. In driver,
> if force_dsc_fractional_bpp is set then while iterating over output bpp with
> fractional step size we will continue if output_bpp is computed as integer and
> allow DSC iff compressed bpp is fractional.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/i915/kms_dsc.c | 91 ++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 87 insertions(+), 4 deletions(-)
>
> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
> index 6a3eecdb4..a85066bb9 100644
> --- a/tests/i915/kms_dsc.c
> +++ b/tests/i915/kms_dsc.c
> @@ -50,7 +50,8 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
>   
>   enum dsc_test_type {
>   	TEST_DSC_BASIC,
> -	TEST_DSC_BPC
> +	TEST_DSC_BPC,
> +	TEST_DSC_FRACTIONAL_BPP
>   };
>   
>   enum dsc_output_format {
> @@ -72,8 +73,10 @@ typedef struct {
>   
>   bool force_dsc_en_orig;
>   bool force_dsc_ycbcr420_en_orig;
> +bool force_dsc_fractional_bpp_en_orig;
>   int force_dsc_restore_fd = -1;
>   int force_dsc_ycbcr420_restore_fd = -1;
> +int force_dsc_fractional_bpp_restore_fd = -1;
>   static int count = 0;
>   
>   const struct {
> @@ -125,6 +128,16 @@ static void force_dsc_ycbcr420_enable(data_t *data)
>   	igt_assert_f(ret > 0, "forcing dsc ycbcr420 debugfs_write failed\n");
>   }
>   
> +static void force_dsc_fractional_bpp_enable(data_t *data)
> +{
> +	int ret;
> +
> +	igt_debug("Forcing DSC Fractional BPP on %s\n", data->output->name);
> +	ret = igt_force_dsc_fractional_bpp_enable(data->drm_fd,
> +						  data->output->name);
> +	igt_assert_f(ret > 0, "forcing dsc fractional bpp debugfs_write failed\n");
> +}
> +
>   static void save_force_dsc_en(data_t *data)
>   {
>   	force_dsc_en_orig =
> @@ -171,11 +184,34 @@ static void restore_force_dsc_ycbcr420_en(void)
>   	force_dsc_ycbcr420_restore_fd = -1;
>   }
>   
> +static void save_force_dsc_fractional_bpp_en(data_t *data)
> +{
> +	force_dsc_fractional_bpp_en_orig =
> +		igt_is_force_dsc_fractional_bpp_enabled(data->drm_fd,
> +							data->output->name);
> +	force_dsc_fractional_bpp_restore_fd =
> +		igt_get_dsc_fractional_bpp_debugfs_fd(data->drm_fd,
> +						      data->output->name);
> +	igt_assert(force_dsc_fractional_bpp_restore_fd >= 0);
> +}
> +
> +static void restore_force_dsc_fractional_bpp_en(void)
> +{
> +	if (force_dsc_fractional_bpp_restore_fd < 0)
> +		return;
> +
> +	igt_debug("Restoring DSC Fractional BPP enable\n");
> +	igt_assert(write(force_dsc_fractional_bpp_restore_fd, force_dsc_fractional_bpp_en_orig ? "1" : "0", 1) == 1);
> +
> +	close(force_dsc_fractional_bpp_restore_fd);
> +	force_dsc_fractional_bpp_restore_fd = -1;
> +}
>   
>   static void kms_dsc_exit_handler(int sig)
>   {
>   	restore_force_dsc_en();
>   	restore_force_dsc_ycbcr420_en();
> +	restore_force_dsc_fractional_bpp_en();
>   }
>   
>   static drmModeModeInfo *get_highres_mode(igt_output_t *output)
> @@ -224,6 +260,34 @@ static bool check_dsc_on_connector(data_t *data)
>   	return true;
>   }
>   
> +static bool is_dsc_fractional_bpp_supported(int drmfd, char *connector_name)
> +{
> +	int bpp_prec;
> +
> +	bpp_prec = igt_get_dsc_fractional_bpp_supported(drmfd, connector_name);
> +
> +	if (bpp_prec == 1)
> +		return false;
> +
> +	return true;
> +}
> +
> +static bool check_dsc_fractional_bpp_on_connector(data_t *data)
> +{
> +	igt_output_t *output = data->output;
> +
> +	if (data->disp_ver >= 14) {
> +		if (!is_dsc_fractional_bpp_supported(data->drm_fd, output->name)) {
> +			igt_debug("DSC fractional bpp not supported on connector %s\n",
> +				   output->name);
> +			return false;
> +		} else
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
>   static bool is_dsc_ycbcr420_supported(data_t *data)
>   {
>   	igt_output_t *output = data->output;
> @@ -323,6 +387,10 @@ static void update_display(data_t *data, enum dsc_test_type test_type,
>   		if (test_type == TEST_DSC_BPC) {
>   			igt_debug("Trying to set input BPC to %d\n", data->input_bpc);
>   			force_dsc_enable_bpc(data);
> +		} else if (test_type == TEST_DSC_FRACTIONAL_BPP) {
> +			igt_debug("DSC fractional bpp is supported on %s\n", data->output->name);
> +			save_force_dsc_fractional_bpp_en(data);
> +			force_dsc_fractional_bpp_enable(data);
>   		}
>   
>   		igt_output_set_pipe(output, data->pipe);
> @@ -371,11 +439,16 @@ static void update_display(data_t *data, enum dsc_test_type test_type,
>   					enabled ? "ON" : "OFF");
>   
>   		restore_force_dsc_en();
> +
>   		if (output_format == DSC_FORMAT_YCBCR420)
>   			restore_force_dsc_ycbcr420_en();
> -		igt_debug("Reset compression BPC\n");
> -		data->input_bpc = 0;
> -		force_dsc_enable_bpc(data);
> +
> +		if (test_type == TEST_DSC_BPC) {
> +			igt_debug("Reset compression BPC\n");
> +			data->input_bpc = 0;
> +			force_dsc_enable_bpc(data);
> +		} else if (test_type == TEST_DSC_FRACTIONAL_BPP)
> +			restore_force_dsc_fractional_bpp_en();
>   
>   		igt_assert_f(enabled,
>   			    "Default DSC enable failed on connector: %s pipe: %s\n",
> @@ -411,6 +484,9 @@ static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpc,
>   		if (!check_big_joiner_pipe_constraint(data))
>   			continue;
>   
> +		if ((test_type == TEST_DSC_FRACTIONAL_BPP) && !(check_dsc_fractional_bpp_on_connector(data)))
> +			continue;
> +
>   		if (test_type == TEST_DSC_BPC)
>   			snprintf(name, sizeof(name), "-%dbpc-%s", data->input_bpc, igt_format_str(plane_format));
>   		else
> @@ -483,6 +559,13 @@ igt_main
>   		}
>   	}
>   
> +	igt_describe("Tests fractional compressed bpp functionality if supported "
> +		     "by a connector by forcing fractional_bpp on all connectors that support it "
> +		     "with default parameter. Driver will continue if output_bpp "
> +		     "is computed as integer and allow DSC iff compressed bpp is fractional");

Perhaps can be rephrased as:

While finding the optimum compressed bpp, driver will skip over the 
compressed bpps with integer values.

It will go ahead with DSC, iff compressed bpp is fractional, failing in 
which, it will fail the commit.


Overall patch looks good to me:

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


Regards,

Ankit

> +	igt_subtest_with_dynamic("dsc-fractional-bpp")
> +			run_test(&data, TEST_DSC_FRACTIONAL_BPP, 0, DRM_FORMAT_XRGB8888);
> +
>   	igt_fixture {
>   		igt_display_fini(&data.display);
>   		close(data.drm_fd);
