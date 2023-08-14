Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA00010E00A
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Aug 2023 04:10:16 +0000 (UTC)
Message-ID: <87abd6b7-09e4-1a85-05da-471652f825bf@intel.com>
Date: Mon, 14 Aug 2023 09:39:58 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
 <20230811184655.157060-20-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230811184655.157060-20-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V6 19/81] tests/i915/kms_fence_pin_leak:
 Document each subtest for testplan
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


On 8/12/2023 12:15 AM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/i915/kms_fence_pin_leak.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/tests/i915/kms_fence_pin_leak.c b/tests/i915/kms_fence_pin_leak.c
> index 3d63acfef..3db5767af 100644
> --- a/tests/i915/kms_fence_pin_leak.c
> +++ b/tests/i915/kms_fence_pin_leak.c
> @@ -30,6 +30,19 @@
>   
>   #include "i915/gem.h"
>   #include "igt.h"
> +/**
> + * TEST: kms fence pin leak
> + * Category: Display
> + * Description: Exercises full ppgtt fence pin_count leak in the kernel.
> + *
> + * SUBTEST:
> + * Description: Along with the modeset, validate fence pin_count leakage.
> + * Driver requirement: i915
> + * Functionality: kms_core, synchronization
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>   
>   IGT_TEST_DESCRIPTION("Exercises full ppgtt fence pin_count leak in the "
>   		     "kernel.");
