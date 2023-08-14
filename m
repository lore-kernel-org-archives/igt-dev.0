Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BAF10E15C
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Aug 2023 08:20:25 +0000 (UTC)
Message-ID: <2a91281a-b1b8-ceaf-c3e4-312a19e6063c@intel.com>
Date: Mon, 14 Aug 2023 13:50:21 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
 <20230811184655.157060-53-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230811184655.157060-53-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V6 52/81] tests/kms_hdr: Document each subtest
 for testplan
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



On 12-Aug-23 12:16 AM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
> 
> V2: - Fix functionality
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_hdr.c | 76 +++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 76 insertions(+)
> 
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index ba19761e2..e035231be 100644
> --- a/tests/kms_hdr.c
> +++ b/tests/kms_hdr.c
> @@ -20,6 +20,11 @@
>    * OTHER DEALINGS IN THE SOFTWARE.
>    */
>   
> +/**
> + * TEST: kms hdr
> + * Category: Display
> + * Description: Test HDR metadata interfaces and bpc switch
> + */
>   #include "igt.h"
>   #include <fcntl.h>
>   #include <termios.h>
> @@ -208,6 +213,31 @@ static bool has_max_bpc(igt_output_t *output)
>   	       igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
>   }
>   
> +/**
> + * SUBTEST: bpc-switch
> + * Description: Tests switching between different display output bpc modes
> + * Driver requirement: any
> + * Functionality: colorspace, hdr
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: bpc-switch-dpms
> + * Description: Tests switching between different display output bpc modes with dpms
> + * Driver requirement: any
> + * Functionality: colorspace, dpms, hdr
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: bpc-switch-suspend
> + * Description: Tests switching between different display output bpc modes with suspend
> + * Driver requirement: any
> + * Functionality: colorspace, hdr, suspend
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>   static void test_bpc_switch(data_t *data, uint32_t flags)
>   {
>   	igt_display_t *display = &data->display;
> @@ -561,6 +591,52 @@ static bool has_hdr(igt_output_t *output)
>   	return igt_output_has_prop(output, IGT_CONNECTOR_HDR_OUTPUT_METADATA);
>   }
>   
> +/**
> + * SUBTEST: invalid-hdr
> + * Description: Test to ensure HDR is not enabled on non-HDR panel
> + * Driver requirement: any
> + * Functionality: colorspace, hdr
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: invalid-metadata-sizes
> + * Description: Tests invalid HDR metadata sizes
> + * Driver requirement: any
> + * Functionality: colorspace, hdr
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: static-toggle-dpms
> + * Description: Tests static toggle with dpms
> + * Driver requirement: any
> + * Functionality: colorspace, dpms, hdr
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: static-toggle-suspend
> + * Description: Tests static toggle with suspend
> + * Driver requirement: any
> + * Functionality: colorspace, hdr, suspend
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: static-%s
> + * Description: Tests %arg[1].
> + * Driver requirement: any
> + * Functionality: colorspace, hdr
> + * Mega feature: General Display Features

Lets make this similar to VRR. and put Mega Feature as HDR here.

> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @swap:                    swapping static HDR metadata
> + * @toggle:                  entering and exiting HDR mode
> + */
>   static void test_hdr(data_t *data, uint32_t flags)
>   {
>   	igt_display_t *display = &data->display;
