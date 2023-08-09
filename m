Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA2410E23A
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 05:46:36 +0000 (UTC)
Message-ID: <3b798ad2-956f-4ee0-7232-8f84562cb9e8@intel.com>
Date: Wed, 9 Aug 2023 11:16:23 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-55-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230629144910.3055377-55-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [V5 i-g-t 54/81] tests/kms_invalid_mode: Document
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
>   tests/kms_invalid_mode.c | 32 ++++++++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
> 
> diff --git a/tests/kms_invalid_mode.c b/tests/kms_invalid_mode.c
> index c26f8befe..f9d953014 100644
> --- a/tests/kms_invalid_mode.c
> +++ b/tests/kms_invalid_mode.c
> @@ -22,10 +22,42 @@
>    *
>    */
>   
> +/**
> + * TEST: kms invalid mode
> + * Category: Display
> + * Description: Make sure all modesets are rejected when the requested mode is
> + *              invalid
> + */
>   #include "igt.h"
>   #include <limits.h>
>   #include <stdbool.h>
>   
> +/**
> + * SUBTEST: %s
> + * Description: Make sure all modesets are rejected when the requested mode is
> + *              invalid
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @bad-hsync-end:
> + * @bad-hsync-start:
> + * @bad-htotal:
> + * @bad-vsync-end:
> + * @bad-vsync-start:
> + * @bad-vtotal:
> + * @clock-too-high:
> + * @int-max-clock:
> + * @uint-max-clock:
> + * @zero-clock:
> + * @zero-hdisplay:
> + * @zero-vdisplay:
> + */
> +

Do we need to write description of all these subtests?

>   IGT_TEST_DESCRIPTION("Make sure all modesets are rejected when the requested mode is invalid");
>   
>   typedef struct _data data_t;
