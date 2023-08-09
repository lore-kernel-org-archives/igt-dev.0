Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1379A10E105
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 20:16:48 +0000 (UTC)
Message-ID: <db4adaf0-5ab2-a751-2420-2d13c782e671@intel.com>
Date: Thu, 10 Aug 2023 01:46:42 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230629144910.3055377-19-bhanuprakash.modem@intel.com>
From: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>
In-Reply-To: <20230629144910.3055377-19-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [V5, i-g-t,
 18/81] tests/i915/kms_fbcon_fbt: Document each subtest for testplan
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
Reviewed-by: Nidhi Gupta <nidhi1.gupta@intel.com>

On 6/29/2023 8:18 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/i915/kms_fbcon_fbt.c | 42 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
> 
> diff --git a/tests/i915/kms_fbcon_fbt.c b/tests/i915/kms_fbcon_fbt.c
> index 71c5285f1..990d31a23 100644
> --- a/tests/i915/kms_fbcon_fbt.c
> +++ b/tests/i915/kms_fbcon_fbt.c
> @@ -32,6 +32,48 @@
>   #include <sys/stat.h>
>   #include <fcntl.h>
>   
> +/**
> + * TEST: kms fbcon fbt
> + * Category: Display
> + * Description: Test the relationship between fbcon and the frontbuffer tracking
> + *              infrastructure.
> + *
> + * SUBTEST: fbc
> + * Description: Test the relationship between fbcon and the frontbuffer tracking
> + *              infrastructure with fbc enabled.
> + * Driver requirement: any
> + * Functionality: fbc, fbcon
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: fbc-suspend
> + * Description: Suspend test to validate  the relationship between fbcon and the
> + *              frontbuffer tracking infrastructure with fbc enabled.
> + * Driver requirement: any
> + * Functionality: fbc, fbcon
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: psr
> + * Description: Test the relationship between fbcon and the frontbuffer tracking
> + *              infrastructure with psr enabled.
> + * Driver requirement: any
> + * Functionality: fbcon, psr
> + * Mega feature: PSR
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: psr-suspend
> + * Description: Suspend test to validate the relationship between fbcon and the
> + *              frontbuffer tracking infrastructure with psr enabled.
> + * Driver requirement: any
> + * Functionality: fbcon, psr
> + * Mega feature: PSR
> + * Run type: FULL
> + * Test category: functionality test
> + */
>   
>   IGT_TEST_DESCRIPTION("Test the relationship between fbcon and the frontbuffer "
>   		     "tracking infrastructure.");

-- 
~Nidhi Gupta
