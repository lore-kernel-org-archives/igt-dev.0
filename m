Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898A010E53B
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 18:44:45 +0000 (UTC)
Message-ID: <d69c6a63-f704-18f6-2cda-77157345074f@intel.com>
Date: Fri, 18 Aug 2023 00:14:22 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230810081743.1065566-1-swati2.sharma@intel.com>
 <20230810081743.1065566-5-swati2.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230810081743.1065566-5-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [v2 4/4] tests/kms_color: skip deep-color test for mst
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

On Thu-10-08-2023 01:47 pm, Swati Sharma wrote:
> In intel driver, for MST streams pipe_bpp is restricted to 8bpc.
> So, deep-color >= 10bpc will never work for DP-MST even if panel
> supports 10bpc.
> 
> Test checks panel supports 10bpc and tries to find such a
> combination of mode that can really work with 10bpc. So, with
> n1 modes in MST1 and n2 modes in MST2, test will try n1xn2 times
> and eventually SKIP. However, trying with these many combinations
> it is leading to excessive logging ultimately killing the test.
> 
> Once KMD FIXME, is resolved this MST constraint can be removed.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8615
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_color.c | 13 +++++++++++--
>   1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index b15b9572c..4a410c039 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -847,8 +847,17 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
>   		igt_output_set_prop_value(output, IGT_CONNECTOR_MAX_BPC, 10);
>   		igt_output_set_pipe(output, p);
>   
> -		if (is_intel_device(data->drm_fd) &&
> -		    !igt_max_bpc_constraint(&data->display, p, output, 10))
> +		/*
> +		 * In intel driver, for MST streams pipe_bpp is
> +		 * restricted to 8bpc. So, deep-color >= 10bpc
> +		 * will never work for DP-MST even if the panel
> +		 * supports 10bpc. Once KMD FIXME, is resolved
> +		 * this MST constraint can be removed.
> +		 */
> +		if (is_intel_device(data->drm_fd) && igt_check_output_is_dp_mst(data->drm_fd, output))
> +			continue;

This check can be done before setting the output to pipe, even before 
igt_display_reset().

> +
> +		if (is_intel_device(data->drm_fd) && !igt_max_bpc_constraint(&data->display, p, output, 10))

Unrelated change, please drop it.

Otherwise, this patch LGTM. You can get my R-b by addressing above comments.

- Bhanu

>   			continue;
>   
>   		data->color_depth = 10;
