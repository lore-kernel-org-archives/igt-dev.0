Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B4C310F49B
 for <igt-dev@lists.freedesktop.org>; Tue, 31 May 2022 09:05:45 +0000 (UTC)
Message-ID: <5c36945d-571c-ca04-b275-32426b53a3ca@intel.com>
Date: Tue, 31 May 2022 14:35:33 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20220531053625.3886441-1-bhanuprakash.modem@intel.com>
 <20220531053625.3886441-4-bhanuprakash.modem@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20220531053625.3886441-4-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [V3 3/4] tests/kms_color: Skip if current & requested
 BPC doesn't match
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

Looks good to me.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

Regards,

Ankit

On 5/31/2022 11:06 AM, Bhanuprakash Modem wrote:
> The "max bpc" property only ensures that the bpc will not go beyond
> the value set through this property. It does not guarantee that the
> same bpc will be used for the given mode.
>
> If clock/bandwidth constraints permit, the max bpc will be used to
> show the mode, otherwise the bpc will be reduced. So, if we really
> want a particular bpc set, we can try reducing the resolution, till
> we get the bpc that we set in max bpc property.
>
> This patch will skip the test, if there is no valid resolution to get
> the same bpc as set by max_bpc property.
>
> V2:
> * Refactor the logic
> V3:
> * Minor changes
>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> CC: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_color.c | 29 +++++++++++++++++++++++++----
>   1 file changed, 25 insertions(+), 4 deletions(-)
>
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 93957f50..cb50cbbf 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -635,6 +635,28 @@ static void test_pipe_limited_range_ctm(data_t *data,
>   }
>   #endif
>   
> +static bool i915_clock_constraint(data_t *data, enum pipe pipe, int bpc)
> +{
> +	igt_output_t *output = data->output;
> +	drmModeConnector *connector = output->config.connector;
> +
> +	igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
> +
> +	for_each_connector_mode(output) {
> +		igt_output_override_mode(output, &connector->modes[j__]);
> +		igt_display_commit(&data->display);
> +
> +		if (!igt_check_output_bpc_equal(data->drm_fd, pipe,
> +						data->output->name, bpc))
> +			continue;
> +
> +		return true;
> +	}
> +
> +	igt_output_override_mode(output, NULL);
> +	return false;
> +}
> +
>   static void
>   prep_pipe(data_t *data, enum pipe p)
>   {
> @@ -898,10 +920,9 @@ run_tests_for_pipe(data_t *data, enum pipe p)
>   			igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
>   			igt_display_commit(&data->display);
>   
> -			if (!igt_check_output_bpc_equal(data->drm_fd, p, output->name, 10)) {
> -				igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, max_bpc);
> -				igt_fail_on_f(true, "Failed to set max_bpc as: 10\n");
> -			}
> +			if (is_i915_device(data->drm_fd) &&
> +			    !i915_clock_constraint(data, p, 10))
> +				continue;
>   
>   			igt_dynamic_f("gamma-%s", output->name) {
>   				ret = test_pipe_gamma(data, primary);
