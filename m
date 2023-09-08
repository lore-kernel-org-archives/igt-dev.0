Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CD5410E05C
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Sep 2023 08:29:11 +0000 (UTC)
Message-ID: <6e7c5451-0b32-1087-68cc-5b446a8c9602@intel.com>
Date: Fri, 8 Sep 2023 13:59:06 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230907161155.1828658-1-bhanuprakash.modem@intel.com>
 <20230907161155.1828658-3-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230907161155.1828658-3-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V3 2/7] tests/intel/kms_pm_backlight: Fix
 testplan documentation
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

On 07-Sep-23 9:41 PM, Bhanuprakash Modem wrote:
> As kms_pm_backlight is moved to display, update the test
> documentation according to the kms testplan kms_test_config.json
> 
> V2: - Fix "Run type"
> 
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/intel/kms_pm_backlight.c | 36 ++++++++++++++++++++++++++--------
>   1 file changed, 28 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
> index 3c73b054b..81c929c54 100644
> --- a/tests/intel/kms_pm_backlight.c
> +++ b/tests/intel/kms_pm_backlight.c
> @@ -37,29 +37,49 @@
>   #include "igt_device.h"
>   #include "igt_device_scan.h"
>   /**
> - * TEST: i915 pm backlight
> + * TEST: kms pm backlight
> + * Category: Display
>    * Description: Basic backlight sysfs test
> - * Feature: backlight
>    *
>    * SUBTEST: bad-brightness
> - * Description: test the bad brightness.
> + * Description: Test the bad brightness.
> + * Driver requirement: i915
> + * Functionality: backlight
> + * Mega feature: Display Power
>    * Run type: FULL
> + * Test category: functionality test
>    *
>    * SUBTEST: basic-brightness
> - * Description: test the basic brightness.
> - * Run type: BAT
> + * Description: Test the basic brightness.
> + * Driver requirement: i915
> + * Functionality: backlight
> + * Mega feature: Display Power
> + * Run type: FULL

This test is in ffb. Run Type should be BAT.

> + * Test category: functionality test
>    *
>    * SUBTEST: fade
> - * Description: test basic fade.
> + * Description: Test basic fade.
> + * Driver requirement: i915
> + * Functionality: backlight
> + * Mega feature: Display Power
>    * Run type: FULL
> + * Test category: functionality test
>    *
>    * SUBTEST: fade-with-dpms
> - * Description: test the fade with DPMS.
> + * Description: Test the fade with DPMS.
> + * Driver requirement: i915
> + * Functionality: dpms, backlight
> + * Mega feature: Display Power
>    * Run type: FULL
> + * Test category: functionality test
>    *
>    * SUBTEST: fade-with-suspend
> - * Description: test the fade with suspend.
> + * Description: Test the fade with suspend.
> + * Driver requirement: i915
> + * Functionality: backlight, suspend
> + * Mega feature: Display Power
>    * Run type: FULL
> + * Test category: functionality test
>    */
>   
>   struct context {
