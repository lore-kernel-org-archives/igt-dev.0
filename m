Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE68310E455
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Dec 2022 14:17:10 +0000 (UTC)
Date: Wed, 21 Dec 2022 09:17:02 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Mohammed Thasleem <mohammed.thasleem@intel.com>
Message-ID: <Y6MVXsw5XF6K/uxn@intel.com>
References: <20221216191124.27930-1-mohammed.thasleem@intel.com>
 <20221220135734.6354-1-mohammed.thasleem@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221220135734.6354-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2] tests/i915/i915_pm_dc : Check DC5 state
 with externel active panel
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Dec 20, 2022 at 07:27:34PM +0530, Mohammed Thasleem wrote:
> This test validates negative scenario of DC5 state by keeping
> all connectors's DPMS property set to ON.
> 
> v2: Added function to check externel panel and skip test if not found.
> 
> Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
> ---
>  tests/i915/i915_pm_dc.c | 44 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
> index ba49d014..5a987728 100644
> --- a/tests/i915/i915_pm_dc.c
> +++ b/tests/i915/i915_pm_dc.c
> @@ -246,6 +246,13 @@ static void check_dc_counter(data_t *data, int dc_flag, uint32_t prev_dc_count)
>  		     data->debugfs_dump = igt_sysfs_get(data->debugfs_fd, PWR_DOMAIN_INFO));
>  }
>  
> +static void check_dc_counter_negative(data_t *data, int dc_flag, uint32_t prev_dc_count)
> +{
> +	igt_assert_f(!dc_state_wait_entry(data->debugfs_fd, dc_flag, prev_dc_count),
> +			"%s state is achieved\n%s:\n%s\n", dc_state_name(dc_flag), PWR_DOMAIN_INFO,
> +			data->debugfs_dump = igt_sysfs_get(data->debugfs_fd, PWR_DOMAIN_INFO));
> +}
> +
>  static void setup_videoplayback(data_t *data)
>  {
>  	color_t red_green_blue[] = {
> @@ -411,6 +418,18 @@ static void test_dc_state_dpms(data_t *data, int dc_flag)
>  	cleanup_dc_dpms(data);
>  }
>  
> +static void test_dc_state_dpms_negative(data_t *data, int dc_flag)
> +{
> +	uint32_t dc_counter;
> +
> +	require_dc_counter(data->debugfs_fd, dc_flag);
> +	setup_dc_dpms(data);
> +	dc_counter = read_dc_counter(data->debugfs_fd, dc_flag);
> +	dpms_on(data);

I would say that probably the most effective negative test and
with a bigger coverage is to add a simple assert for dc0 inside
the dpms_on function along with the runtime_pm_active assert.

> +	check_dc_counter_negative(data, dc_flag, dc_counter);
> +	cleanup_dc_dpms(data);
> +}
> +
>  static bool support_dc6(int debugfs_fd)
>  {
>  	char buf[4096];
> @@ -485,6 +504,23 @@ static void test_dc9_dpms(data_t *data)
>  	setup_dc9_dpms(data, dc_target);
>  }
>  
> +static void check_external_panel(igt_display_t *display)
> +{
> +	igt_output_t *output = NULL;
> +	int external_panel = 0;
> +
> +	for_each_connected_output(display, output) {
> +		drmModeConnectorPtr c = output->config.connector;
> +
> +		if (c->connector_type != DRM_MODE_CONNECTOR_eDP &&
> +		    c->connection == DRM_MODE_CONNECTED) {
> +			external_panel++;
> +		}
> +	}
> +	igt_skip_on_f(!external_panel,
> +		      "External panel not detected, skip execution\n");
> +}
> +
>  static void kms_poll_state_restore(int sig)
>  {
>  	int sysfs_fd;
> @@ -552,6 +588,14 @@ igt_main
>  		test_dc_state_dpms(&data, CHECK_DC5);
>  	}
>  
> +	igt_describe("This test validates negative scenario of DC5 display "
> +		     "engine entry to DC5 state while all connectors's DPMS "
> +		     "property set to ON");
> +	igt_subtest("dc5-dpms-negative") {
> +		check_external_panel(&data.display);
> +		test_dc_state_dpms_negative(&data, CHECK_DC5);
> +	}
> +
>  	igt_describe("This test validates display engine entry to DC5 state "
>  		     "while all connectors's DPMS property set to OFF");
>  	igt_subtest("dc6-dpms") {
> -- 
> 2.25.1
> 
