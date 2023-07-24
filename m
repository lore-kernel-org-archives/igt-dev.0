Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E1810E0FA
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jul 2023 05:23:24 +0000 (UTC)
Message-ID: <d9a49769-6fd9-66e0-f97e-6cbd3e4da719@intel.com>
Date: Mon, 24 Jul 2023 10:53:13 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230704173107.842296-1-swati2.sharma@intel.com>
 <20230704173107.842296-4-swati2.sharma@intel.com>
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20230704173107.842296-4-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [v2 3/9] tests/i915/kms_dsc: use #define for default
 bpc
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

LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

On 7/4/2023 11:01 PM, Swati Sharma wrote:
> For default bpc, use #define. By setting bpc as 0, means driver
> will set its own value and we are not enforcing input bpc.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/i915/kms_dsc.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
> index 99d35a7ff..7b9bae91a 100644
> --- a/tests/i915/kms_dsc.c
> +++ b/tests/i915/kms_dsc.c
> @@ -35,6 +35,7 @@
>   IGT_TEST_DESCRIPTION("Test to validate display stream compression");
>   
>   #define LEN		20
> +#define DEFAULT_BPC	0
>   
>   #define TEST_DSC_BASIC		(0<<0)
>   #define TEST_DSC_BPC		(1<<0)
> @@ -300,7 +301,7 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
>   		     "by a connector by forcing DSC on all connectors that support it "
>   		     "with default parameters");
>   	igt_subtest_with_dynamic("dsc-basic")
> -			test_dsc(&data, TEST_DSC_BASIC, 0,
> +			test_dsc(&data, TEST_DSC_BASIC, DEFAULT_BPC,
>   				 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB);
>   
>   	igt_describe("Tests basic display stream compression functionality if supported "
> @@ -308,7 +309,7 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
>   		     "with default parameters and creating fb with diff formats");
>   	igt_subtest_with_dynamic("dsc-with-formats") {
>   		for (int k = 0; k < ARRAY_SIZE(format_list); k++)
> -			test_dsc(&data, TEST_DSC_FORMAT, 0,
> +			test_dsc(&data, TEST_DSC_FORMAT, DEFAULT_BPC,
>   				 format_list[k], DSC_FORMAT_RGB);
>   	}
>   
> @@ -339,7 +340,8 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
>   		     "that support it");
>   	igt_subtest_with_dynamic("dsc-with-output-formats") {
>   		for (int k = 0; k < ARRAY_SIZE(output_format_list); k++)
> -			test_dsc(&data, TEST_DSC_OUTPUT_FORMAT, 0, DRM_FORMAT_XRGB8888,
> +			test_dsc(&data, TEST_DSC_OUTPUT_FORMAT, DEFAULT_BPC,
> +				 DRM_FORMAT_XRGB8888,
>   				 output_format_list[k]);
>   	}
>   
