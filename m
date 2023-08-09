Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FF8010E40C
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 09:27:13 +0000 (UTC)
Message-ID: <204673f9-2279-1c78-9aaa-0eaad451ec6e@intel.com>
Date: Wed, 9 Aug 2023 14:56:54 +0530
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
 <20230629144910.3055377-31-bhanuprakash.modem@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230629144910.3055377-31-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [V5 i-g-t 30/81] tests/i915/kms_pwrite_crc: Document
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

Hi,

On 6/29/2023 8:18 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/i915/kms_pwrite_crc.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/tests/i915/kms_pwrite_crc.c b/tests/i915/kms_pwrite_crc.c
> index 7bddeecba..38f466bae 100644
> --- a/tests/i915/kms_pwrite_crc.c
> +++ b/tests/i915/kms_pwrite_crc.c
> @@ -29,6 +29,21 @@
>   #include <stdio.h>
>   #include <string.h>
>   
> +/**
> + * TEST: kms pwrite crc
> + * Category: Display
> + * Description: Use the display CRC support to validate pwrite to an already
> + *              uncached future scanout buffer.

This test actually has no subtest defined. Do we need to duplicate 
definitions in this case?

Thanks,
Karthik.B.S
> + *
> + * SUBTEST:
> + * Description: Use the display CRC support to validate pwrite to an already
> + *              uncached future scanout buffer.
> + * Driver requirement: i915
> + * Functionality: kms_gem_interop
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>   
>   IGT_TEST_DESCRIPTION(
>      "Use the display CRC support to validate pwrite to an already uncached future scanout buffer.");
