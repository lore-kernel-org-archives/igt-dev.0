Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94A910E408
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 09:21:09 +0000 (UTC)
Message-ID: <4cbf748f-30b7-7d8d-0d8f-148576a4dbda@intel.com>
Date: Wed, 9 Aug 2023 14:50:56 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-20-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230629144910.3055377-20-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [V5 i-g-t 19/81] tests/i915/kms_fence_pin_leak:
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

Hi,

On 6/29/2023 8:18 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/i915/kms_fence_pin_leak.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
>
> diff --git a/tests/i915/kms_fence_pin_leak.c b/tests/i915/kms_fence_pin_leak.c
> index 3d63acfef..0321aa3cb 100644
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

This test actually has no subtest defined. Do we need duplicate 
definitions in this case?

Thanks,
Karthik.B.S

> + *
> + * SUBTEST:
> + * Description: Exercises full ppgtt fence pin_count leak in the kernel.
> + * Driver requirement: i915
> + * Functionality: kms_core, synchronization
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>   
>   IGT_TEST_DESCRIPTION("Exercises full ppgtt fence pin_count leak in the "
>   		     "kernel.");
