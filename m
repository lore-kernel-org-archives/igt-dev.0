Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2D310E00A
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Aug 2023 04:15:44 +0000 (UTC)
Message-ID: <f513bd04-29f8-1de3-b219-9321d7b381f1@intel.com>
Date: Mon, 14 Aug 2023 09:45:30 +0530
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
 <20230811184655.157060-41-bhanuprakash.modem@intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20230811184655.157060-41-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [i-g-t V6 40/81] tests/kms_content_protection:
 Document each subtest for testplan
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
> V2: - Update functionality
>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_content_protection.c | 81 ++++++++++++++++++++++++++++++++++
>   1 file changed, 81 insertions(+)
>
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index 6cdf81a28..930a7bc0c 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -22,6 +22,11 @@
>    *
>    */
>   
> +/**
> + * TEST: kms content protection
> + * Category: Display
> + * Description: Test content protection (HDCP)
> + */
>   #include <poll.h>
>   #include <fcntl.h>
>   #include <sys/epoll.h>
> @@ -485,6 +490,66 @@ test_fini(igt_output_t *output, enum igt_commit_style s)
>   	igt_display_commit2(&data.display, s);
>   }
>   
> +/**
> + * SUBTEST: LIC
> + * Description: Test for the integrity of link.
> + * Driver requirement: any
> + * Functionality: hdcp1.4
> + * Mega feature: HDCP
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: content_type_change
> + * Description: Test the content type change when the content protection already
> + *              enabled
> + * Driver requirement: any
> + * Functionality: hdcp1.4, hdcp2.2
> + * Mega feature: HDCP
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: mei_interface
> + * Description: Test the teardown and rebuild of the interface between Intel
> + *              and mei hdcp.
> + * Driver requirement: any
> + * Functionality: hdcp1.4, hdcp2.2
> + * Mega feature: HDCP
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: srm
> + * Description: This test writes the facsimile SRM into the /lib/firmware/ and
> + *              check the kernel parsing of it by invoking the hdcp authentication.
> + * Driver requirement: any
> + * Functionality: hdcp1.4
> + * Mega feature: HDCP
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: uevent
> + * Description: Test to detect the HDCP status change when we are reading the
> + *              uevent sent with the corresponding connector id and property id.
> + * Driver requirement: any
> + * Functionality: hdcp1.4
> + * Mega feature: HDCP
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * SUBTEST: %s
> + * Description: Test content protection with %arg[1]
> + * Driver requirement: any
> + * Functionality: hdcp1.4
> + * Mega feature: HDCP
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @atomic:         atomic modesetting
> + * @atomic-dpms:    DPMS ON/OFF during atomic modesetting.
> + * @legacy:         legacy style commit
> + * @type1:          content type 1 that can be handled only through HDCP2.2.
> + */
>   static void
>   test_content_protection(enum igt_commit_style s, int content_type)
>   {
> @@ -602,6 +667,22 @@ static void test_cp_lic_on_mst(igt_output_t *mst_outputs[], int valid_outputs, b
>   	}
>   }
>   
> +/**
> + * SUBTEST: dp-mst-%s
> + * Description: Test Content protection %arg[1] over DP MST.
> + * Driver requirement: any
> + * Functionality: hdcp1.4
> + * Mega feature: HDCP
> + * Run type: FULL
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @lic-type-0:   Type 0 with LIC
> + * @lic-type-1:   Type 1 with LIC.
> + * @type-0:       Type 0
> + * @type-1:       Type 1
> + */
>   static void
>   test_content_protection_mst(int content_type)
>   {
