Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80FA210E0EE
 for <igt-dev@lists.freedesktop.org>; Fri,  1 Dec 2023 11:47:54 +0000 (UTC)
Message-ID: <2e7040d6-8cf5-4aaf-89df-3ab99b7cdb41@intel.com>
Date: Fri, 1 Dec 2023 17:17:49 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20231128061533.2612350-1-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20231128061533.2612350-1-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t 1/3] tests/kms_addfb_basic: Fix testplan
 documentation for tiled tests
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

On 28-Nov-23 11:45 AM, Bhanuprakash Modem wrote:
> Fix 'Driver requirement' field for recently modified tests by the
> commit: 2ddd8cac9 tests/kms_addfb_basic: Skip not relevant subtests for Xe
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_addfb_basic.c | 13 ++++++-------
>   1 file changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> index 337fef77e..877c70ded 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -95,8 +95,12 @@
>    */
>   
>   /**
> - * SUBTEST: basic-%s-tiled-legacy
> - * Description: Check if addfb2 and rmfb call works for basic %arg[1] test
> + * SUBTEST: basic-x-tiled-legacy
> + * Description: Check if addfb2 and rmfb call works for basic x-tiling test
> + * Functionality: kms_gem_interop, tiling
> + *
> + * SUBTEST: basic-y-tiled-legacy
> + * Description: Check if addfb2 and rmfb call works for basic y-tiling test
>    * Driver requirement: i915
>    * Functionality: kms_gem_interop, tiling
>    *
> @@ -109,11 +113,6 @@
>    * Description: Test that addfb2 call fails correctly for pitches mismatch
>    * Driver requirement: i915
>    * Functionality: kms_gem_interop, tiling
> - *
> - * arg[1]:
> - *
> - * @x:        x-tiling
> - * @y:        y-tiling
>    */
>   
>   /**
