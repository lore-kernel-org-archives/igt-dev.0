Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6351710E25E
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 08:03:07 +0000 (UTC)
Message-ID: <d4ee9b70-3ae8-fc05-4d34-f4db9ceaeae8@intel.com>
Date: Wed, 9 Aug 2023 13:29:29 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-71-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230629144910.3055377-71-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [V5 i-g-t 70/81] tests/kms_scaling_modes: Document
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

On 29-Jun-23 8:18 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_scaling_modes.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
> index 31b806ae2..88e6471b8 100644
> --- a/tests/kms_scaling_modes.c
> +++ b/tests/kms_scaling_modes.c
> @@ -25,6 +25,26 @@
>    */
>   
>   #include "igt.h"
> +/**
> + * TEST: kms scaling modes
> + * Category: Display
> + * Description: Test display scaling modes
> + *
> + * SUBTEST: scaling-mode-%s
> + * Description: Tests %arg[1] display scaling mode
> + * Driver requirement: any
> + * Functionality: plane

scaling, eDP should be added in functionality.

> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @center:           center
> + * @full:             full
> + * @full-aspect:      full aspect
> + * @none:             none (no scaling)
> + */
>   
>   IGT_TEST_DESCRIPTION("Test display scaling modes");
>   
