Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0DB310E096
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Aug 2023 10:31:22 +0000 (UTC)
Message-ID: <a1c4f445-b584-bc47-b6ab-8e7d597eea0d@intel.com>
Date: Wed, 16 Aug 2023 16:01:18 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
 <20230815164815.320904-24-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230815164815.320904-24-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V7 23/81] tests/i915/kms_legacy_colorkey:
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

LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 15-Aug-23 10:17 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
> 
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/i915/kms_legacy_colorkey.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/tests/i915/kms_legacy_colorkey.c b/tests/i915/kms_legacy_colorkey.c
> index 450cb2e3f..f022bab19 100644
> --- a/tests/i915/kms_legacy_colorkey.c
> +++ b/tests/i915/kms_legacy_colorkey.c
> @@ -24,6 +24,27 @@
>   #include "igt.h"
>   #include <errno.h>
>   
> +/**
> + * TEST: kms legacy colorkey
> + * Category: Display
> + * Description: Test to check the legacy set colorkey ioctl on sprite planes.
> + *
> + * SUBTEST: basic
> + * Description: Check that the legacy set colorkey ioctl only works on sprite planes.
> + * Driver requirement: i915
> + * Functionality: plane, xorg_xv
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: invalid-plane
> + * Description: Check invalid plane id's, zero and outrange
> + * Driver requirement: i915
> + * Functionality: plane, xorg_xv
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>   
>   IGT_TEST_DESCRIPTION("Check that the legacy set colorkey ioctl only works on sprite planes.");
>   
