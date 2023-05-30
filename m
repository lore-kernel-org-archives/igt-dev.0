Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A6F10E230
 for <igt-dev@lists.freedesktop.org>; Tue, 30 May 2023 16:44:13 +0000 (UTC)
Message-ID: <dd293d82-b99b-fd85-8b96-013329fbfe40@intel.com>
Date: Tue, 30 May 2023 22:14:08 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230529052835.860047-1-bhanuprakash.modem@intel.com>
 <20230529052835.860047-72-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230529052835.860047-72-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V4 71/82] tests/kms_scaling_modes: Document
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
>   tests/kms_scaling_modes.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
> index 906ae76de..9aace5147 100644
> --- a/tests/kms_scaling_modes.c
> +++ b/tests/kms_scaling_modes.c
> @@ -25,6 +25,26 @@
>    */
>   
>   #include "igt.h"
> +/**
> + * TEST: kms scaling modes
> + * Category: Display
> + * Description: Test display scaling modes
> + *
> + * SUBTEST: scaling-mode-%s
> + * Description: Tests %arg[1] display scaling mode
> + * Driver requirement: any
> + * Functionality: plane
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @center:           center
> + * @full:             full
> + * @full-aspect:      full aspect
> + * @none:             none (no scaling)
> + */
>   
>   IGT_TEST_DESCRIPTION("Test display scaling modes")

This is not required. Overall it looks okay.

>   
