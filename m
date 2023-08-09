Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B36210E232
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 05:33:39 +0000 (UTC)
Message-ID: <d543501b-1402-7f1f-06be-5f63212c5bff@intel.com>
Date: Wed, 9 Aug 2023 11:03:30 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-54-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230629144910.3055377-54-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [V5 i-g-t 53/81] tests/kms_hdr: Document each subtest
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

LGTM.
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 29-Jun-23 8:18 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_hdr.c | 52 +++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 52 insertions(+)
> 
> diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
> index ba19761e2..0442cc168 100644
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
> @@ -208,6 +213,21 @@ static bool has_max_bpc(igt_output_t *output)
>   	       igt_output_get_prop(output, IGT_CONNECTOR_MAX_BPC);
>   }
>   
> +/**
> + * SUBTEST: bpc-%s
> + * Description: Tests switching between different display output bpc modes %arg[1]
> + * Driver requirement: any
> + * Functionality: kms_hdr
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @switch:              default
> + * @switch-dpms:         with dpms
> + * @switch-suspend:      with suspend
> + */
>   static void test_bpc_switch(data_t *data, uint32_t flags)
>   {
>   	igt_display_t *display = &data->display;
> @@ -561,6 +581,38 @@ static bool has_hdr(igt_output_t *output)
>   	return igt_output_has_prop(output, IGT_CONNECTOR_HDR_OUTPUT_METADATA);
>   }
>   
> +/**
> + * SUBTEST: invalid-hdr
> + * Description: Test to ensure HDR is not enabled on non-HDR panel
> + * Driver requirement: any
> + * Functionality: kms_hdr
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: invalid-metadata-sizes
> + * Description: Tests invalid HDR metadata sizes
> + * Driver requirement: any
> + * Functionality: kms_hdr
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: static-%s
> + * Description: Tests %arg[1].
> + * Driver requirement: any
> + * Functionality: kms_hdr
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @swap:                    swapping static HDR metadata
> + * @toggle:                  entering and exiting HDR mode
> + * @toggle-dpms:             static toggle with dpms
> + * @toggle-suspend:          static toggle with suspend
> + */
>   static void test_hdr(data_t *data, uint32_t flags)
>   {
>   	igt_display_t *display = &data->display;
