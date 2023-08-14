Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A5410E0EB
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Aug 2023 05:06:44 +0000 (UTC)
Message-ID: <0c48d960-0dac-d89a-903f-1c31c4c12ba7@intel.com>
Date: Mon, 14 Aug 2023 10:36:29 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>, Jeevan B <jeevan.b@intel.com>
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
 <20230811184655.157060-73-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230811184655.157060-73-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V6 72/81] tests/kms_setmode: Document each
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

On 8/12/2023 12:16 AM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
>
> V2: - Fix test description
>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_setmode.c | 60 +++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 60 insertions(+)
>
> diff --git a/tests/kms_setmode.c b/tests/kms_setmode.c
> index 035bbd0b0..19bda6b26 100644
> --- a/tests/kms_setmode.c
> +++ b/tests/kms_setmode.c
> @@ -31,6 +31,66 @@
>   #include <sys/time.h>
>   #include <math.h>
>   #include "xe/xe_query.h"
> +/**
> + * TEST: kms setmode
> + * Category: Display
> + * Description: Tests the mode by iterating through all valid/invalid crtc/connector
> + *              combinations
> + *
> + * SUBTEST: basic
> + * Description: Tests the vblank timing by iterating through all valid crtc/connector
> + *              combinations
> + * Driver requirement: any
> + * Functionality: kms_core, vblank
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: basic-clone-single-crtc
> + * Description: Tests the mode by cloning the single crtc by iterating through all
> + *              valid crtc/connector combinations

The descriptions seem confusing to me at least.

@Jeevan: Please provide your inputs on these as you're looking into 
these subtests.

Thanks,
Karthik.B.S
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: clone-exclusive-crtc
> + * Description: Tests the mode by cloning the single exclusive crtc by iterating
> + *              through all valid crtc/connector combinations
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: invalid-clone-exclusive-crtc
> + * Description: Tests the mode by cloning the single exclusive crtc by iterating
> + *              through all invalid crtc/connector combinations
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: invalid-clone-single-crtc
> + * Description: Tests the mode by cloning the single crtc by iterating through all
> + *              invalid crtc/connector combinations
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: invalid-clone-single-crtc-stealing
> + * Description: Tests the stealing mode by cloning the single crtc by iterating
> + *              through all invalid crtc/connector combinations
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>   
>   #define MAX_CONNECTORS  10
>   #define MAX_CRTCS       6
