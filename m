Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADAC389DA9
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Nov 2023 17:09:13 +0000 (UTC)
Message-ID: <433434eb-b1e9-4551-bbc8-54b75d04c708@intel.com>
Date: Fri, 24 Nov 2023 22:39:12 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20231124093602.2358565-1-bhanuprakash.modem@intel.com>
 <20231124093602.2358565-5-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20231124093602.2358565-5-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t 4/5] tests/kms/testplan: Fix Mega Feature in
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

LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 24-Nov-23 3:06 PM, Bhanuprakash Modem wrote:
> Adjust KMS testplan Mega Feature to allign with internal tools.
> 
> - s/Bigjoiner/Pipe Joiner/
> - s/Color mgmt/Color Management/
> - s/General Display Features/E2E Compression/ (CCS tests)
> - s/Display Power/Display Power Management/
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/chamelium/kms_chamelium_color.c | 2 +-
>   tests/intel/kms_big_joiner.c          | 2 +-
>   tests/intel/kms_ccs.c                 | 2 +-
>   tests/intel/kms_pm_backlight.c        | 2 +-
>   tests/intel/kms_pm_dc.c               | 2 +-
>   tests/intel/kms_pm_lpsp.c             | 2 +-
>   tests/kms_color.c                     | 2 +-
>   7 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
> index e94e13e40..4156023da 100644
> --- a/tests/chamelium/kms_chamelium_color.c
> +++ b/tests/chamelium/kms_chamelium_color.c
> @@ -28,7 +28,7 @@
>    * Description: Test Color Features at Pipe level using Chamelium to verify instead of CRC
>    * Driver requirement: i915, xe
>    * Functionality: chamelium, colorspace
> - * Mega feature: Color mgmt
> + * Mega feature: Color Management
>    * Test category: functionality test
>    */
>   
> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_big_joiner.c
> index c5f9f8db7..aba2adfbe 100644
> --- a/tests/intel/kms_big_joiner.c
> +++ b/tests/intel/kms_big_joiner.c
> @@ -30,7 +30,7 @@
>    * Description: Test big joiner
>    * Driver requirement: i915, xe
>    * Functionality: 2p1p
> - * Mega feature: Bigjoiner
> + * Mega feature: Pipe Joiner
>    * Test category: functionality test
>    */
>   
> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
> index 0a202d037..7a3fd7cf6 100644
> --- a/tests/intel/kms_ccs.c
> +++ b/tests/intel/kms_ccs.c
> @@ -30,7 +30,7 @@
>    *              uses to interpret the compressed data.
>    * Driver requirement: i915, xe
>    * Functionality: ccs, tiling
> - * Mega feature: General Display Features
> + * Mega feature: E2E Compression
>    * Test category: functionality test
>    */
>   
> diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
> index 5b4c397bb..2e691dab0 100644
> --- a/tests/intel/kms_pm_backlight.c
> +++ b/tests/intel/kms_pm_backlight.c
> @@ -31,7 +31,7 @@
>    * Description: Basic backlight sysfs test
>    * Driver requirement: i915, xe
>    * Functionality: backlight
> - * Mega feature: Display Power
> + * Mega feature: Display Power Management
>    * Test category: functionality test
>    */
>   
> diff --git a/tests/intel/kms_pm_dc.c b/tests/intel/kms_pm_dc.c
> index f11d6d29a..739ed6112 100644
> --- a/tests/intel/kms_pm_dc.c
> +++ b/tests/intel/kms_pm_dc.c
> @@ -28,7 +28,7 @@
>    * Description: Tests to validate display power DC states.
>    * Driver requirement: i915, xe
>    * Functionality: dpms, pm_dc
> - * Mega feature: Display Power
> + * Mega feature: Display Power Management
>    * Test category: functionality test
>    */
>   
> diff --git a/tests/intel/kms_pm_lpsp.c b/tests/intel/kms_pm_lpsp.c
> index 30158f673..005438d87 100644
> --- a/tests/intel/kms_pm_lpsp.c
> +++ b/tests/intel/kms_pm_lpsp.c
> @@ -29,7 +29,7 @@
>    * Category: Display
>    * Description: These tests validates display Low Power Single Pipe configurations
>    * Functionality: pm_lpsp
> - * Mega feature: Display Power
> + * Mega feature: Display Power Management
>    * Test category: functionality test
>    */
>   
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 39752de81..bdb80a4ad 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -28,7 +28,7 @@
>    * Description: Test Color Features at Pipe level
>    * Driver requirement: i915, xe
>    * Functionality: colorspace
> - * Mega feature: Color mgmt
> + * Mega feature: Color Management
>    * Test category: functionality test
>    */
>   
