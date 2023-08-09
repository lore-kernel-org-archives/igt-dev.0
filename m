Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7A010E12A
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 03:41:02 +0000 (UTC)
Message-ID: <aa67cb78-4d15-2e70-54f7-dd7936300550@intel.com>
Date: Wed, 9 Aug 2023 09:10:43 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-74-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230629144910.3055377-74-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [V5 i-g-t 73/81] tests/kms_setmode: Document each
 subtest for testplan
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

On 6/29/2023 8:19 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_setmode.c | 58 +++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 58 insertions(+)
>
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 035bbd0b0..bce41fc3b 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -31,6 +31,64 @@
>   #include <sys/time.h>
>   #include <math.h>
>   #include "xe/xe_query.h"
> +/**
> + * TEST: kms setmode
> + * Category: Display

Description missing?

> + *
> + * SUBTEST: basic
> + * Description: Tests the mode by iterating through all valid/invalid crtc/connector
> + *              combinations
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: basic-clone-single-crtc
> + * Description: Tests the mode by iterating through all valid/invalid crtc/connector
> + *              combinations
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: clone-exclusive-crtc
> + * Description: Tests the mode by iterating through all valid/invalid crtc/connector
> + *              combinations
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: invalid-clone-exclusive-crtc
> + * Description: Tests the mode by iterating through all valid/invalid crtc/connector
> + *              combinations
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: invalid-clone-single-crtc
> + * Description: Tests the mode by iterating through all valid/invalid crtc/connector
> + *              combinations
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: invalid-clone-single-crtc-stealing
> + * Description: Tests the mode by iterating through all valid/invalid crtc/connector
> + *              combinations
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */

All the subtests are having the same description. Could you please add 
subtest specific details. May be the current description of subtests 
could be the overall test description.

Thanks,
Karthik.B.S
>   
>   #define MAX_CONNECTORS  10
>   #define MAX_CRTCS       6
