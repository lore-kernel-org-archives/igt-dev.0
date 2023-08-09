Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5FBF10E232
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 05:06:53 +0000 (UTC)
Message-ID: <1df7d379-ec75-9595-b14a-c075212642e7@intel.com>
Date: Wed, 9 Aug 2023 10:36:48 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-38-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230629144910.3055377-38-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [V5 i-g-t 37/81] tests/kms_bw: Document each subtest
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



On 29-Jun-23 8:18 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_bw.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> index b66473e60..331be5755 100644
> --- a/tests/kms_bw.c
> +++ b/tests/kms_bw.c
> @@ -25,6 +25,26 @@
>   #include "drm.h"
>   #include <stdio.h>
>   #include <xf86drmMode.h>
> +/**
> + * TEST: kms bw
> + * Category: Display
> + *
> + * SUBTEST: linear-tiling-%d-displays-%s
> + * Description: bw test with %arg[2]
> + * Driver requirement: any
> + * Functionality: obsolete

Why functionality is obsolete?

> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1].values: 1, 2, 3, 4, 5, 6, 7, 8
> + *
> + * arg[2]:
> + *
> + * @1920x1080p:       1920x1080 resolution
> + * @2560x1440p:       2560x1440 resolution
> + * @3840x2160p:       3840x2160 resolution
> + */
>   
>   /* Common test data. */
>   typedef struct data {
