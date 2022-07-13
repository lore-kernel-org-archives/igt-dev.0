Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C2211BE3B
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Jul 2022 11:18:20 +0000 (UTC)
Message-ID: <0a8186cc-e9b5-116c-40f3-5c03972c6f45@intel.com>
Date: Wed, 13 Jul 2022 16:48:03 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20220708052906.1896-1-swati2.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20220708052906.1896-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/kms_dsc: Skip test if DP
 res. < 5K
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

On Fri-08-07-2022 10:59 am, Swati Sharma wrote:
> While rewriting the kms_dsc IGT; missed one condition.
> Skip test if connector type is DP and resolution
> is less than 5K since force dsc enable supports resolutions
> above 5K in DP.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>   tests/i915/kms_dsc.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
> index 3506fcb52..d8f924a93 100644
> --- a/tests/i915/kms_dsc.c
> +++ b/tests/i915/kms_dsc.c
> @@ -165,6 +165,23 @@ static bool check_dsc_on_connector(data_t *data)
>   	return true;
>   }
>   
> +/* Force dsc enable supports resolutions above 5K in DP */
> +static bool check_5k_dp_test_constraint(data_t *data)
> +{
> +	igt_output_t *output = data->output;
> +	drmModeConnector *connector = output->config.connector;
> +	drmModeModeInfo *mode = get_highres_mode(output);
> +
> +	if (connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
> +	    mode->hdisplay < 5120) {
> +		igt_debug("Force dsc enable does not support res. < 5k in %s\n",
> +			   output->name);
> +		return false;
> +	}
> +
> +	return true;
> +}
> +
>   static bool check_big_joiner_test_constraint(data_t *data,
>   					     enum dsc_test_type test_type)
>   {
> @@ -285,6 +302,7 @@ static void update_display(data_t *data, enum dsc_test_type test_type, unsigned
>   	test_cleanup(data);
>   }
>   
> +
>   static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpp, unsigned int plane_format)
>   {
>   	igt_display_t *display = &data->display;
> @@ -300,6 +318,9 @@ static void test_dsc(data_t *data, enum dsc_test_type test_type, int bpp, unsign
>   		if (!check_dsc_on_connector(data))
>   			continue;
>   
> +		if (!check_5k_dp_test_constraint(data))
> +			continue;
> +
>   		if (!check_big_joiner_test_constraint(data, test_type))
>   			continue;
>   
