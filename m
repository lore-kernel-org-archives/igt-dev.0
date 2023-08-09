Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC25D10E232
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 04:54:46 +0000 (UTC)
Message-ID: <6db693b0-4fb4-2b06-cb32-997c24fa0e02@intel.com>
Date: Wed, 9 Aug 2023 10:24:40 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-32-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230629144910.3055377-32-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [V5 i-g-t 31/81] tests/kms_3d: Document each subtest
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

LGTM

Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 29-Jun-23 8:18 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_3d.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/tests/kms_3d.c b/tests/kms_3d.c
> index c7a9d42d2..df0b54b37 100644
> --- a/tests/kms_3d.c
> +++ b/tests/kms_3d.c
> @@ -24,6 +24,19 @@
>   
>   #include "igt.h"
>   #include "xe/xe_query.h"
> +/**
> + * TEST: kms 3d
> + * Category: Display
> + * Description: Tests 3D mode setting.
> + *
> + * SUBTEST:
> + * Description: Tests 3D mode setting.
> + * Driver requirement: any
> + * Functionality: stereoscopic
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>   
>   IGT_TEST_DESCRIPTION("Tests 3D mode setting.");
>   
