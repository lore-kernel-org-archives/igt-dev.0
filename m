Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1473810E0FA
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jul 2023 05:30:00 +0000 (UTC)
Message-ID: <a5f6d52e-d0d8-005b-458d-232cf6b4c854@intel.com>
Date: Mon, 24 Jul 2023 10:59:46 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230704173107.842296-1-swati2.sharma@intel.com>
 <20230704173107.842296-5-swati2.sharma@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20230704173107.842296-5-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [v2 4/9] tests/i915/kms_dsc: add get_status()
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


On 7/4/2023 11:01 PM, Swati Sharma wrote:
> Use get_status() to get current bpc when TEST_DSC_BPC test
> flag is used. If input bpc is not equal to current bpc,
> skip test.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/i915/kms_dsc.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
> index 7b9bae91a..df9b27225 100644
> --- a/tests/i915/kms_dsc.c
> +++ b/tests/i915/kms_dsc.c
> @@ -111,12 +111,18 @@ static void test_cleanup(data_t *data)
>   	igt_remove_fb(data->drm_fd, &data->fb_test_pattern);
>   }
>   
> +static int get_status(int drmfd, enum pipe pipe)
> +{
> +	return igt_get_pipe_current_bpc(drmfd, pipe);
> +}

I think we can directly call the lib function, so this is not required.

Otherwise the change looks good to me.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

> +
>   /* re-probe connectors and do a modeset with DSC */
>   static void update_display(data_t *data, uint32_t test_type)
>   {
>   	int ret;
>   	bool enabled;
>   	int index = 0;
> +	int current_bpc = 0;
>   	igt_plane_t *primary;
>   	drmModeModeInfo *mode;
>   	igt_output_t *output = data->output;
> @@ -202,11 +208,17 @@ static void update_display(data_t *data, uint32_t test_type)
>   
>   	restore_force_dsc_en();
>   
> +	if (test_type & TEST_DSC_BPC) {
> +		current_bpc = get_status(data->drm_fd, data->pipe);
> +		igt_skip_on_f(data->input_bpc != current_bpc,
> +			      "Input bpc = %d is not equal to current bpc = %d\n",
> +			      data->input_bpc, current_bpc);
> +	}
> +
>   	igt_assert_f(enabled,
>   		     "Default DSC enable failed on connector: %s pipe: %s\n",
>   		     output->name,
>   		     kmstest_pipe_name(data->pipe));
> -
>   reset:
>   	test_reset(data);
>   
