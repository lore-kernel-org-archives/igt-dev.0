Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F37510E420
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 11:52:34 +0000 (UTC)
Message-ID: <0b5da5c2-f4ec-87c4-de2d-eb15fd9fff36@intel.com>
Date: Wed, 9 Aug 2023 17:22:29 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-24-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230629144910.3055377-24-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [V5 i-g-t 23/81] tests/i915/kms_legacy_colorkey:
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

On 29-Jun-23 8:18 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/i915/kms_legacy_colorkey.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/tests/i915/kms_legacy_colorkey.c b/tests/i915/kms_legacy_colorkey.c
> index 450cb2e3f..fb1952113 100644
> --- a/tests/i915/kms_legacy_colorkey.c
> +++ b/tests/i915/kms_legacy_colorkey.c
> @@ -24,6 +24,27 @@
>   #include "igt.h"
>   #include <errno.h>
>   
> +/**
> + * TEST: kms legacy colorkey
> + * Category: Display
> + * Description: Check that the legacy set colorkey ioctl only works on sprite planes.
> + *
> + * SUBTEST: basic
> + * Description: Test to check the legacy set colorkey ioctl only works for sprite planes.

Test description and subtest description is same.

> + * Driver requirement: i915
> + * Functionality: xorg_xv
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: invalid-plane
> + * Description: Check invalid plane id's, zero and outrange
> + * Driver requirement: i915
> + * Functionality: xorg_xv
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>   
>   IGT_TEST_DESCRIPTION("Check that the legacy set colorkey ioctl only works on sprite planes.");
>   
