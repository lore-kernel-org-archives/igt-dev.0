Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18D510E3FD
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 08:38:02 +0000 (UTC)
Message-ID: <c434c385-0e1a-1b72-cee5-8cb1aa000e21@intel.com>
Date: Wed, 9 Aug 2023 14:07:57 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-79-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230629144910.3055377-79-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [V5 i-g-t 78/81] tests/kms_vrr: Document each subtest
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

On 29-Jun-23 8:19 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_vrr.c | 47 +++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 47 insertions(+)
> 
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 6a766bfb9..286f071e9 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -24,6 +24,53 @@
>   #include "sw_sync.h"
>   #include <fcntl.h>
>   #include <signal.h>
> +/**
> + * TEST: kms vrr
> + * Category: Display
> + *
> + * SUBTEST: flip-basic
> + * Description: Tests that VRR is enabled and that the difference between flip
> + *              timestamps converges to the requested rate
> + * Driver requirement: any
> + * Functionality: vrr
> + * Mega feature: VRR
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: flip-dpms
> + * Description: Tests with DPMS that VRR is enabled and that the difference
> + *              between flip timestamps converges to the requested rate.
> + * Driver requirement: any
> + * Functionality: vrr
> + * Mega feature: VRR
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: flip-suspend
> + * Description: Tests that VRR is enabled and that the difference between flip
> + *              timestamps converges to the requested rate in a suspend test
> + * Driver requirement: any
> + * Functionality: vrr
> + * Mega feature: VRR
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: flipline
> + * Description: Make sure that flips happen at flipline decision boundary.
> + * Driver requirement: any
> + * Functionality: vrr
> + * Mega feature: VRR
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: negative-basic
> + * Description: Make sure that VRR should not be enabled on the Non-VRR panel.
> + * Driver requirement: any
> + * Functionality: vrr
> + * Mega feature: VRR

Shouldn't this be under Generic Display Features?

> + * Run type: FULL
> + * Test category: functionality test
> + */
>   
>   #define NSECS_PER_SEC (1000000000ull)
>   
