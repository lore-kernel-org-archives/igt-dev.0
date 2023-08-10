Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B9010E4BE
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 06:42:28 +0000 (UTC)
Message-ID: <0eed8662-2944-f3fd-0bcc-ab4dfdc35a95@intel.com>
Date: Thu, 10 Aug 2023 12:12:24 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230629144910.3055377-29-bhanuprakash.modem@intel.com>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20230629144910.3055377-29-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [V5, i-g-t,
 28/81] tests/i915/kms_psr2_su: Document each subtest for testplan
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


On 6/29/2023 8:18 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/i915/kms_psr2_su.c | 27 +++++++++++++++++++++++++++
>   1 file changed, 27 insertions(+)
>
> diff --git a/tests/i915/kms_psr2_su.c b/tests/i915/kms_psr2_su.c
> index 3081887ca..6da283643 100644
> --- a/tests/i915/kms_psr2_su.c
> +++ b/tests/i915/kms_psr2_su.c
> @@ -30,6 +30,33 @@
>   #include <stdio.h>
>   #include <string.h>
>   #include <sys/timerfd.h>
> +/**
> + * TEST: kms psr2 su
> + * Category: Display
> + * Description: Test PSR2 selective update
> + *
> + * SUBTEST: frontbuffer-XRGB8888
> + * Description: Test that selective update works when screen changes
> + * Driver requirement: any
> + * Functionality: psr2
> + * Mega feature: PSR
> + * Run type: FULL
> + * Test category: functionality test
Here we can have FBT also as functionality
Also we need to add selective update as a functionality
Apart from that
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
> + *
> + * SUBTEST: page_flip-%s
> + * Description: Test the selective update with %arg[1] when screen changes
> + * Driver requirement: any
> + * Functionality: psr2
> + * Mega feature: PSR
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @NV12:        NV12 format
> + * @P010:        P010 format
> + * @XRGB8888:    XRGB8888 format
> + */
>   
>   IGT_TEST_DESCRIPTION("Test PSR2 selective update");
>   
