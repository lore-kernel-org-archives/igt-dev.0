Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9779B10E0EB
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 03:27:52 +0000 (UTC)
Message-ID: <257b12f3-8fd8-6768-4a53-c29720750e04@intel.com>
Date: Wed, 9 Aug 2023 08:57:34 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-12-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230629144910.3055377-12-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [V5 i-g-t 11/81] tests/i915/kms_big_joiner: Document
 each subtest for testplan
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


On 6/29/2023 8:18 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/i915/kms_big_joiner.c | 33 +++++++++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
>
> diff --git a/tests/i915/kms_big_joiner.c b/tests/i915/kms_big_joiner.c
> index 2ff23398a..c448853c5 100644
> --- a/tests/i915/kms_big_joiner.c
> +++ b/tests/i915/kms_big_joiner.c
> @@ -24,6 +24,11 @@
>    *  Karthik B S <karthik.b.s@intel.com>
>    */
>   
> +/**
> + * TEST: kms big joiner
> + * Category: Display
> + * Description: Test big joiner
> + */
>   #include "igt.h"
>   
>   #define MAX_HDISPLAY_PER_PIPE 5120
> @@ -40,6 +45,16 @@ typedef struct {
>   	uint32_t big_joiner_output[2];
>   } data_t;
>   
> +/**
> + * SUBTEST: invalid-modeset
> + * Description: Verify if the modeset on the adjoining pipe is rejected when
> + *              the pipe is active with a big joiner modeset
> + * Driver requirement: any
> + * Functionality: 2p1p
> + * Mega feature: Bigjoiner
> + * Run type: FULL
> + * Test category: functionality test
> + */
>   static void test_invalid_modeset(data_t *data)
>   {
>   	igt_output_t *output;
> @@ -80,6 +95,15 @@ static void test_invalid_modeset(data_t *data)
>   	igt_assert_lt(ret, 0);
>   }
>   
> +/**
> + * SUBTEST: basic
> + * Description: Verify the basic modeset on big joiner mode on all pipes
> + * Driver requirement: any
> + * Functionality: 2p1p
> + * Mega feature: Bigjoiner
> + * Run type: FULL
> + * Test category: functionality test
> + */
>   static void test_basic_modeset(data_t *data)
>   {
>   	drmModeModeInfo *mode;
> @@ -118,6 +142,15 @@ static void test_basic_modeset(data_t *data)
>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   }
>   
> +/**
> + * SUBTEST: 2x-modeset
> + * Description: Verify simultaneous modeset on 2 big joiner outputs
> + * Driver requirement: any
> + * Functionality: 2p1p
> + * Mega feature: Bigjoiner
> + * Run type: FULL
> + * Test category: functionality test
> + */
>   static void test_dual_display(data_t *data)
>   {
>   	drmModeModeInfo *mode;
