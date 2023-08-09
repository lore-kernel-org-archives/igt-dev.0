Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331E310E405
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 09:03:49 +0000 (UTC)
Message-ID: <ae687e4f-cdb2-9498-ca11-5c271f817f8d@intel.com>
Date: Wed, 9 Aug 2023 14:33:32 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-39-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230629144910.3055377-39-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [V5 i-g-t 38/81] tests/kms_color: Document each
 subtest for testplan
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


On 29-Jun-23 8:18 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
> 
> V2: - Include ctm-signed test
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_color.c | 91 +++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 91 insertions(+)
> 
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index b15b9572c..3c837d258 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -22,10 +22,24 @@
>    *
>    */
>   
> +/**
> + * TEST: kms color
> + * Category: Display
> + * Description: Test Color Features at Pipe level
> + */
>   #include "kms_color_helper.h"
>   
>   IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
>   
> +/**
> + * SUBTEST: degamma
> + * Description: Verify that degamma LUT transformation works correctly
> + * Driver requirement: any
> + * Functionality: colorspace
> + * Mega feature: Color mgmt
> + * Run type: FULL
> + * Test category: functionality test
> + */
>   static bool test_pipe_degamma(data_t *data,
>   			      igt_plane_t *primary)
>   {
> @@ -114,6 +128,16 @@ static bool test_pipe_degamma(data_t *data,
>   	return ret;
>   }
>   
> +/**
> + * SUBTEST: gamma
> + * Description: Verify that gamma LUT transformation works correctly
> + * Driver requirement: any
> + * Functionality: colorspace, colorspace_gamma

colorspace_gamma not required. Lets have unified functionality as 
colorspace since there is no colorspace_degamma, colorspace_ctm.

> + * Mega feature: Color mgmt
> + * Run type: FULL
> + * Test category: functionality test
> + */
> +
>   /*
>    * Draw 3 gradient rectangles in red, green and blue, with a maxed out gamma
>    * LUT and verify we have the same CRC as drawing solid color rectangles.
> @@ -202,6 +226,16 @@ static bool test_pipe_gamma(data_t *data,
>   	return ret;
>   }
>   
> +/**
> + * SUBTEST: legacy-gamma
> + * Description: Verify that legacy gamma LUT transformation works correctly
> + * Driver requirement: any
> + * Functionality: colorspace, colorspace_gamma
> + * Mega feature: Color mgmt
> + * Run type: FULL
> + * Test category: functionality test
> + */
> +
>   /*
>    * Draw 3 gradient rectangles in red, green and blue, with a maxed out legacy
>    * gamma LUT and verify we have the same CRC as drawing solid color rectangles
> @@ -314,6 +348,17 @@ static bool test_pipe_legacy_gamma(data_t *data,
>   	return ret;
>   }
>   
> +/**
> + * SUBTEST: legacy-gamma-reset
> + * Description: Verify that setting the legacy gamma LUT resets the gamma LUT
> + *              set through GAMMA_LUT property
> + * Driver requirement: any
> + * Functionality: colorspace, colorspace_gamma
> + * Mega feature: Color mgmt
> + * Run type: FULL
> + * Test category: functionality test
> + */
> +
>   /*
>    * Verify that setting the legacy gamma LUT resets the gamma LUT set
>    * through the GAMMA_LUT property.
> @@ -448,6 +493,28 @@ end:
>   	return ret;
>   }
>   
> +/**
> + * SUBTEST: ctm-%s
> + * Description: Check the color transformation %arg[1]
> + * Driver requirement: any
> + * Functionality: colorspace
> + * Mega feature: Color mgmt
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @0-25:           for 0.25 transparency
> + * @0-50:           for 0.50 transparency
> + * @0-75:           for 0.75 transparency
> + * @blue-to-red:    from blue to red
> + * @green-to-red:   from green to red
> + * @max:            for maximum transparency
> + * @negative:       for negative transparency
> + * @red-to-blue:    from red to blue
> + * @signed:         for correct signed handling
> + */
> +
>   /*
>    * Draw 3 rectangles using before colors with the ctm matrix apply and verify
>    * the CRC is equal to using after colors with an identify ctm matrix.
> @@ -807,6 +874,15 @@ out:
>   	test_cleanup(data);
>   }
>   
> +/**
> + * SUBTEST: deep-color
> + * Description: Verify that deep color works correctly
> + * Driver requirement: any
> + * Functionality: colorspace
> + * Mega feature: Color mgmt
> + * Run type: FULL
> + * Test category: functionality test
> + */
>   static void
>   run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
>   {
> @@ -899,6 +975,21 @@ run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
>   	test_cleanup(data);
>   }
>   
> +/**
> + * SUBTEST: invalid-%s-sizes
> + * Description: Negative check for %arg[1] sizes
> + * Driver requirement: any
> + * Functionality: colorspace
> + * Mega feature: Color mgmt
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @ctm-matrix:         Color transformation matrix
> + * @degamma-lut:        Degamma LUT
> + * @gamma-lut:          Gamma LUT
> + */
>   static void
>   run_invalid_tests_for_pipe(data_t *data)
>   {
