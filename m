Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3E610E71E
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Feb 2023 06:29:55 +0000 (UTC)
Message-ID: <1e9d4cdd-1f76-08ee-45cc-6a80e6ae3abd@intel.com>
Date: Fri, 3 Feb 2023 11:59:50 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20221220135734.6354-1-mohammed.thasleem@intel.com>
 <20230127143848.11884-1-mohammed.thasleem@intel.com>
From: Swati Sharma <swati2.sharma@intel.com>
In-Reply-To: <20230127143848.11884-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/i915_pm_dc : Check DC5 state
 with externel active panel
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

Thanks for the patch and review. Pushed.

On 27-Jan-23 8:08 PM, Mohammed Thasleem wrote:
> This test validates negative scenario of DC5 state by keeping
> all connectors's DPMS property set to ON.
> 
> v2: Added function to check externel panel and skip test if not found.
> 
> v3: Moved check_external_panel inside igt_require_f and removed
>      igt_skip_on_f. (Swati)
> 
> v4: Renamed function name check_external_panel with
>      has_panels_without_dc_support.
>      Removed both DRM_MODE_CONNECTED check and init for output. (Imre)
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> Reviewed-by: Imre Deak <imre.deak@intel.com>
> ---
>   tests/i915/i915_pm_dc.c | 43 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 43 insertions(+)
> 
> diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
> index 36c50667..bf6a0df5 100644
> --- a/tests/i915/i915_pm_dc.c
> +++ b/tests/i915/i915_pm_dc.c
> @@ -246,6 +246,13 @@ static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count)
>   		     data->debugfs_dump = igt_sysfs_get(data->debugfs_fd, PWR_DOMAIN_INFO));
>   }
>   
> +static void check_dc_counter_negative(data_t *data, int dc_flag, uint32_t prev_dc_count)
> +{
> +	igt_assert_f(!dc_state_wait_entry(data->debugfs_fd, dc_flag, prev_dc_count),
> +			"%s state is achieved\n%s:\n%s\n", dc_state_name(dc_flag), PWR_DOMAIN_INFO,
> +			data->debugfs_dump = igt_sysfs_get(data->debugfs_fd, PWR_DOMAIN_INFO));
> +}
> +
>   static void setup_videoplayback(data_t *data)
>   {
>   	color_t red_green_blue[] = {
> @@ -411,6 +418,18 @@ static void test_dc_state_dpms(data_t *data, int dc_flag)
>   	cleanup_dc_dpms(data);
>   }
>   
> +static void test_dc_state_dpms_negative(data_t *data, int dc_flag)
> +{
> +	uint32_t dc_counter;
> +
> +	require_dc_counter(data->debugfs_fd, dc_flag);
> +	setup_dc_dpms(data);
> +	dc_counter = read_dc_counter(data->debugfs_fd, dc_flag);
> +	dpms_on(data);
> +	check_dc_counter_negative(data, dc_flag, dc_counter);
> +	cleanup_dc_dpms(data);
> +}
> +
>   static bool support_dc6(int debugfs_fd)
>   {
>   	char buf[4096];
> @@ -485,6 +504,21 @@ static void test_dc9_dpms(data_t *data)
>   	setup_dc9_dpms(data, dc_target);
>   }
>   
> +static int has_panels_without_dc_support(igt_display_t *display)
> +{
> +	igt_output_t *output;
> +	int external_panel = 0;
> +
> +	for_each_connected_output(display, output) {
> +		drmModeConnectorPtr c = output->config.connector;
> +
> +		if (c->connector_type != DRM_MODE_CONNECTOR_eDP)
> +			external_panel++;
> +	}
> +
> +	return external_panel;
> +}
> +
>   static void kms_poll_state_restore(int sig)
>   {
>   	int sysfs_fd;
> @@ -552,6 +586,15 @@ igt_main
>   		test_dc_state_dpms(&data, CHECK_DC5);
>   	}
>   
> +	igt_describe("This test validates negative scenario of DC5 display "
> +		     "engine entry to DC5 state while all connectors's DPMS "
> +		     "property set to ON");
> +	igt_subtest("dc5-dpms-negative") {
> +		igt_require_f(has_panels_without_dc_support(&data.display),
> +			      "External panel not detected, skip execution\n");
> +		test_dc_state_dpms_negative(&data, CHECK_DC5);
> +	}
> +
>   	igt_describe("This test validates display engine entry to DC6 state "
>   		     "while all connectors's DPMS property set to OFF");
>   	igt_subtest("dc6-dpms") {

-- 
~Swati Sharma
