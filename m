Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5580E10E400
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 08:32:04 +0000 (UTC)
Message-ID: <48f3b441-f48c-8bbc-c92e-8a421075f706@intel.com>
Date: Wed, 9 Aug 2023 14:01:50 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-81-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230629144910.3055377-81-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [V5 i-g-t 80/81] tests/testdisplay: Document each
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

Hi Bhanu,

Review comments from v4 are not addressed in v5.

On 29-Jun-23 8:19 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/testdisplay.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/tests/testdisplay.c b/tests/testdisplay.c
> index 294d4c604..2a88eb64e 100644
> --- a/tests/testdisplay.c
> +++ b/tests/testdisplay.c
> @@ -69,6 +69,19 @@
>   #include <stdlib.h>
>   #include <signal.h>
>   
> +/**
> + * TEST: testdisplay
> + * Category: Display
> + * Description: Tests basic display functionality.
> + *
> + * SUBTEST:
> + * Description: Tests basic display functionality.
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>   IGT_TEST_DESCRIPTION("Tests basic display functionality.");
>   
>   enum {
