Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8FEF10FAD6
 for <igt-dev@lists.freedesktop.org>; Thu, 12 May 2022 08:32:02 +0000 (UTC)
Message-ID: <4793d23c-77b6-0004-615a-ba828527e584@intel.com>
Date: Thu, 12 May 2022 14:01:56 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Nidhi Gupta <nidhi1.gupta@intel.com>, igt-dev@lists.freedesktop.org,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
References: <20220512073549.5535-1-nidhi1.gupta@intel.com>
 <20220512073549.5535-2-nidhi1.gupta@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20220512073549.5535-2-nidhi1.gupta@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH 1/2] tests/kms_bw : Added dynamic test cases
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

This test is blacklisted for i915.
Can you modify test to enable it ?
++Modem

On 12-May-22 1:05 PM, Nidhi Gupta wrote:
> Modified kms_bw to include dynamic test cases
> for better reporting of the results.
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
> ---
>   tests/kms_bw.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> index a4553cde..60f87537 100644
> --- a/tests/kms_bw.c
> +++ b/tests/kms_bw.c
> @@ -195,6 +195,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
>   igt_main
>   {
>   	data_t data;
> +	igt_output_t *output;
>   	int i = 0, j = 0;
>   
>   	memset(&data, 0, sizeof(data));
> @@ -215,9 +216,11 @@ igt_main
>   	 * _amount_ of pipes */
>   	for (i = 0; i < IGT_MAX_PIPES; i++) {
>   		for (j = 0; j < ARRAY_SIZE(test_mode); j++) {
> -			igt_subtest_f("linear-tiling-%d-displays-%s", i+1,
> -			      test_mode[j].name)
> -			run_test_linear_tiling(&data, i, &test_mode[j]);
> +			igt_subtest_with_dynamic_f("linear-tiling-%d-displays-%s", i+1,
> +			      test_mode[j].name) {
> +				igt_dynamic_f("pipe-%s", igt_output_name(output))
> +					run_test_linear_tiling(&data, i, &test_mode[j]);
> +			}
>   		}
>   	}
>   

-- 
~Swati Sharma
