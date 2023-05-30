Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1E810E3A2
 for <igt-dev@lists.freedesktop.org>; Tue, 30 May 2023 15:06:26 +0000 (UTC)
Message-ID: <7003c8ee-eac7-997e-cdbf-d6bc35bfac48@intel.com>
Date: Tue, 30 May 2023 20:36:20 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230529052835.860047-1-bhanuprakash.modem@intel.com>
 <20230529052835.860047-81-bhanuprakash.modem@intel.com>
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20230529052835.860047-81-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t V4 80/82] tests/kms_writeback: Document each
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



On 29-May-23 10:58 AM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/kms_writeback.c | 42 ++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 42 insertions(+)
> 
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index c4808b02c..ee3c5dba1 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -32,6 +32,48 @@
>   #include "igt_core.h"
>   #include "igt_fb.h"
>   #include "sw_sync.h"
> +/**
> + * TEST: kms writeback
> + * Category: Display
> + * Description: This test validates the expected behavior of the writeback
> + *              connectors feature by checking if the target device support
> + *              writeback; it validates bad and good combination, check color
> + *              format, and check the output result by using CRC.
> + *
> + * SUBTEST: writeback-check-output
> + * Description: Check writeback output with CRC validation
> + * Driver requirement: any

i915 driver doesn't support WB feature.
Should we still add this test to kms testplan?

> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: writeback-fb-id
> + * Description: Validate WRITEBACK_FB_ID with valid and invalid options
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: writeback-invalid-parameters
> + * Description: Writeback has a couple of parameters linked together(output
> + *              framebuffer and fence); this test goes throughthe combination
> + *              of possible bad options
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: writeback-pixel-formats
> + * Description: Check the writeback format
> + * Driver requirement: any
> + * Functionality: kms_core
> + * Mega feature: General Display Features
> + * Run type: FULL
> + * Test category: functionality test
> + */
>   
>   IGT_TEST_DESCRIPTION(
>      "This test validates the expected behavior of the writeback connectors "
