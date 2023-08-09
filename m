Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E1BC10E013
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 08:50:49 +0000 (UTC)
Message-ID: <a14d1540-776f-adc3-959a-50eafd679801@intel.com>
Date: Wed, 9 Aug 2023 14:20:44 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-76-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230629144910.3055377-76-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [V5 i-g-t 75/81] tests/kms_tv_load_detect: Document
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

Hi Bhanu,

Review comments from v4 are not addressed in v5.

On 29-Jun-23 8:19 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_tv_load_detect.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/tests/kms_tv_load_detect.c b/tests/kms_tv_load_detect.c
> index c8e5338d2..ceefe26d2 100644
> --- a/tests/kms_tv_load_detect.c
> +++ b/tests/kms_tv_load_detect.c
> @@ -23,6 +23,19 @@
>    */
>   
>   #include "igt.h"
> +/**
> + * TEST: kms tv load detect
> + * Category: Display
> + * Description: Check tv load detection works correctly.
> + *
> + * SUBTEST: load-detect
> + * Description: Check tv load detection works correctly.
> + * Driver requirement: any
> + * Functionality: obsolete
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>   
>   IGT_TEST_DESCRIPTION("Check tv load detection works correctly.");
>   
