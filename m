Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4AF10E6A3
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jul 2023 08:45:52 +0000 (UTC)
Message-ID: <5ccdedfa-f6a0-ceeb-57e2-79b8c32480db@intel.com>
Date: Fri, 28 Jul 2023 14:15:26 +0530
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230728074913.939188-1-swati2.sharma@intel.com>
 <20230728074913.939188-5-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20230728074913.939188-5-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [v4 04/10] tests/i915/kms_dsc: update if condition
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


On 7/28/2023 1:19 PM, Swati Sharma wrote:
> Check is_dsc_output_format_supported() iff test flag is set to
> OUTPUT_FORMAT.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/i915/kms_dsc.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
> index 7b9bae91a..266918f74 100644
> --- a/tests/i915/kms_dsc.c
> +++ b/tests/i915/kms_dsc.c
> @@ -238,8 +238,9 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>   		if (!is_dsc_supported_by_sink(data->drm_fd, data->output))
>   			continue;
>   
> -		if (!is_dsc_output_format_supported(data->drm_fd, data->disp_ver,
> -						    data->output, data->output_format))
> +		if ((test_type & TEST_DSC_OUTPUT_FORMAT) &&
> +		    (!is_dsc_output_format_supported(data->drm_fd, data->disp_ver,
> +						     data->output, data->output_format)))
>   			continue;

The change look good.

Makes sense to check for output format constraint, only when we are 
forcing the output format.

>   
>   		if (!check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe))

Perhaps this check and the first check: is_dsc_output_format_supported 
can be together.

Also realized that check_gen11_bpc_constraint which come later should 
not be in the loop, as it does not depend on either pipe or output.

So lets move that outside the loop.


Regards,

Ankit
