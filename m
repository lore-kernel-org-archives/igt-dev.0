Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C4B10E143
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Jan 2024 08:26:36 +0000 (UTC)
Message-ID: <3a621274-5c3d-477a-9f84-00e0b058b744@intel.com>
Date: Fri, 5 Jan 2024 13:56:21 +0530
Subject: Re: [PATCH i-g-t] tests/intel/kms_dsc: add new constraint
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240105065236.57782-1-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240105065236.57782-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
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


On 1/5/2024 12:22 PM, Swati Sharma wrote:
> If output max bpc is less than min dsc bpc (8) which is supported
> by intel driver, don't execute test.
>
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1066
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_dsc.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
> index 3433e0907..8ea15f4d2 100644
> --- a/tests/intel/kms_dsc.c
> +++ b/tests/intel/kms_dsc.c
> @@ -63,6 +63,7 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
>   
>   #define LEN		20
>   #define DEFAULT_BPC	0
> +#define MIN_DSC_BPC	8
>   
>   #define TEST_DSC_BASIC		(0<<0)
>   #define TEST_DSC_BPC		(1<<0)
> @@ -283,6 +284,9 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>   		      check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe)))
>   			continue;
>   
> +		if (igt_get_output_max_bpc(data->drm_fd, output->name) < MIN_DSC_BPC)
> +			continue;

Makes sense. Perhaps add this as part of above check and simplify:

if (!is_dsc_supported_by_sink() ||

!check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe) ||

igt_get_output_max_bpc(data->drm_fd, output->name) < MIN_DSC_BPC))

continue;

Regards,

Ankit


> +
>   		if ((test_type & TEST_DSC_OUTPUT_FORMAT) &&
>   		    (!is_dsc_output_format_supported(data->drm_fd, data->disp_ver,
>   						     data->output, data->output_format)))
