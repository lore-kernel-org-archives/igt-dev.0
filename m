Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F0D10E00A
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Aug 2023 04:11:59 +0000 (UTC)
Message-ID: <29204b19-036c-7031-1859-ff160ebb01ba@intel.com>
Date: Mon, 14 Aug 2023 09:41:45 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
 <20230811184655.157060-31-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230811184655.157060-31-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V6 30/81] tests/i915/kms_pwrite_crc: Document
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


On 8/12/2023 12:16 AM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
>
> V2: - Fix test documentation
>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/i915/kms_pwrite_crc.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/tests/i915/kms_pwrite_crc.c b/tests/i915/kms_pwrite_crc.c
> index 7bddeecba..661064cc8 100644
> --- a/tests/i915/kms_pwrite_crc.c
> +++ b/tests/i915/kms_pwrite_crc.c
> @@ -29,6 +29,20 @@
>   #include <stdio.h>
>   #include <string.h>
>   
> +/**
> + * TEST: kms pwrite crc
> + * Category: Display
> + * Description: Test to validate pwrite buffer using the display CRC
> + *
> + * SUBTEST:
> + * Description: Use the display CRC support to validate pwrite to an already
> + *              uncached future scanout buffer.
> + * Driver requirement: i915
> + * Functionality: kms_core, kms_gem_interop
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>   
>   IGT_TEST_DESCRIPTION(
>      "Use the display CRC support to validate pwrite to an already uncached future scanout buffer.");
