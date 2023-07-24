Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E1110E0FA
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jul 2023 05:08:58 +0000 (UTC)
Message-ID: <932d4a21-4f6f-761f-7877-f1d26379975a@intel.com>
Date: Mon, 24 Jul 2023 10:38:40 +0530
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230704173107.842296-1-swati2.sharma@intel.com>
 <20230704173107.842296-2-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20230704173107.842296-2-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [v2 1/9] tests/i915/kms_dsc: add new test flag
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


On 7/4/2023 11:00 PM, Swati Sharma wrote:
> Add new test flag TEST_DSC_FORMAT.

I understand, this flag is added to differentiate the basic dsc test and 
the tests where we want to change different plane pixel formats.

Lets capture this in the commit message too.

With that change this is:

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>

>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/i915/kms_dsc.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tests/i915/kms_dsc.c b/tests/i915/kms_dsc.c
> index 0a3e29924..23ccbca00 100644
> --- a/tests/i915/kms_dsc.c
> +++ b/tests/i915/kms_dsc.c
> @@ -37,6 +37,7 @@ IGT_TEST_DESCRIPTION("Test to validate display stream compression");
>   enum dsc_test_type {
>   	TEST_DSC_BASIC,
>   	TEST_DSC_BPC,
> +	TEST_DSC_FORMAT,
>   	TEST_DSC_OUTPUT_FORMAT,
>   };
>   
> @@ -302,7 +303,7 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
>   		     "with default parameters and creating fb with diff formats");
>   	igt_subtest_with_dynamic("dsc-with-formats") {
>   		for (int k = 0; k < ARRAY_SIZE(format_list); k++)
> -			test_dsc(&data, TEST_DSC_BASIC, 0,
> +			test_dsc(&data, TEST_DSC_FORMAT, 0,
>   				 format_list[k], DSC_FORMAT_RGB);
>   	}
>   
