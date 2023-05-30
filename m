Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C4010E3DE
 for <igt-dev@lists.freedesktop.org>; Tue, 30 May 2023 16:38:22 +0000 (UTC)
Message-ID: <39a0209c-fb36-efaa-b597-ad901ae1a426@intel.com>
Date: Tue, 30 May 2023 22:08:11 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230529052835.860047-1-bhanuprakash.modem@intel.com>
 <20230529052835.860047-77-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230529052835.860047-77-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V4 76/82] tests/kms_tv_load_detect: Document
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



On 29-May-23 10:58 AM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_tv_load_detect.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/tests/kms_tv_load_detect.c b/tests/kms_tv_load_detect.c
> index 80ced9918..5cbe6f65f 100644
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

Subtest and Test description is same?

> + * Driver requirement: any
> + * Functionality: obsolete
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>   
>   IGT_TEST_DESCRIPTION("Check tv load detection works correctly.");

IGT_TEST_DESCRIPTION has become redundant. Same thing we are writing 3 
times.
>   
