Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 797AF10E414
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 11:43:51 +0000 (UTC)
Message-ID: <c40039c6-47ef-3a3f-bd99-4b63c0ccbdae@intel.com>
Date: Wed, 9 Aug 2023 17:13:46 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-46-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230629144910.3055377-46-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [V5 i-g-t 45/81] tests/kms_dither: Document each
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

LGTM
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 29-Jun-23 8:18 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_dither.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/tests/kms_dither.c b/tests/kms_dither.c
> index d6c16dd0b..79a002d46 100644
> --- a/tests/kms_dither.c
> +++ b/tests/kms_dither.c
> @@ -25,6 +25,11 @@
>    *
>    */
>   
> +/**
> + * TEST: kms dither
> + * Category: Display
> + * Description: Test Dithering block status
> + */
>   #include "igt.h"
>   #include <fcntl.h>
>   #include <termios.h>
> @@ -181,6 +186,23 @@ static bool is_supported(igt_output_t *output)
>   		igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
>   }
>   
> +/**
> + * SUBTEST: FB-8BPC-Vs-Panel-6BPC
> + * Description: Framebuffer BPC:8, Panel BPC:6, Expected Dither:Enable
> + * Driver requirement: any
> + * Functionality: kms_gem_interop
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: FB-8BPC-Vs-Panel-8BPC
> + * Description: Framebuffer BPC:8, Panel BPC:8, Expected Dither:Disable
> + * Driver requirement: any
> + * Functionality: kms_gem_interop
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>   static void
>   run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
>   {
