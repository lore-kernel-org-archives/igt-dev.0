Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0278F10E4B9
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 06:08:13 +0000 (UTC)
Message-ID: <1c8c7175-224e-254f-fd49-992a93a21c11@intel.com>
Date: Thu, 10 Aug 2023 11:38:08 +0530
MIME-Version: 1.0
Content-Language: en-US
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230629144910.3055377-8-bhanuprakash.modem@intel.com>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <20230629144910.3055377-8-bhanuprakash.modem@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [V5, i-g-t,
 07/81] tests/chamelium/kms_chamelium_edid: Document each subtest
 for testplan
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


On 6/29/2023 8:17 PM, Bhanuprakash Modem wrote:
> Add documentation for all kms tests which is used by IGT testplan
> documentation.
>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>   tests/chamelium/kms_chamelium_edid.c | 90 +++++++++++++++++++++++++++-
>   1 file changed, 89 insertions(+), 1 deletion(-)
>
> diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_chamelium_edid.c
> index 446bbd204..579d61d15 100644
> --- a/tests/chamelium/kms_chamelium_edid.c
> +++ b/tests/chamelium/kms_chamelium_edid.c
> @@ -25,8 +25,9 @@
>    */
>   
>   /**
> - * TEST: Tests behaviour of edid & timings using chamelium
> + * TEST: kms chamelium edid
>    * Category: Display
> + * Description: Testing EDID with a Chamelium board
>    */
>   
>   #include <fcntl.h>
> @@ -151,6 +152,7 @@ static void check_mode(struct chamelium *chamelium, struct chamelium_port *port,
>    * Run type: BAT
>    * Functionality: dp
>    * Mega feature: DP
> + * Driver requirement: any
>    *
>    * SUBTEST: hdmi-edid-read
>    * Description: Make sure the EDID exposed by KMS is the same as the screen's
> @@ -158,6 +160,7 @@ static void check_mode(struct chamelium *chamelium, struct chamelium_port *port,
>    * Run type: BAT
>    * Functionality: hdmi
>    * Mega feature: HDMI
> + * Driver requirement: any
>    *
>    * SUBTEST: vga-edid-read
>    * Description: Make sure the EDID exposed by KMS is the same as the screen's
> @@ -165,6 +168,7 @@ static void check_mode(struct chamelium *chamelium, struct chamelium_port *port,
>    * Run type: BAT
>    * Functionality: vga
>    * Mega feature: VGA
> + * Driver requirement: any
>    */
>   static const char igt_custom_edid_type_read_desc[] =
>   	"Make sure the EDID exposed by KMS is the same as the screen's";
> @@ -205,6 +209,32 @@ static void igt_custom_edid_type_read(chamelium_data_t *data,
>   	drmModeFreeConnector(connector);
>   }
>   
> +/**
> + * SUBTEST: dp-edid-stress-resolution-%s
> + * Description: Stress test the DUT by testing multiple EDIDs, one right after
> + *              the other, and ensure their validity by check the real screen
> + *              resolution vs the advertised mode (%arg[1]) resolution.
> + * Test category: functionality test
> + * Run type: FULL
> + * Functionality: dp
> + * Mega feature: DP
> + * Driver requirement: any
> + *
> + * SUBTEST: hdmi-edid-stress-resolution-%s
> + * Description: Stress test the DUT by testing multiple EDIDs, one right after
> + *              the other, and ensure their validity by check the real screen
> + *              resolution vs the advertised mode (%arg[1]) resolution.
> + * Test category: functionality test
> + * Run type: FULL
> + * Functionality: hdmi
> + * Mega feature: HDMI
> + * Driver requirement: any
> + *
> + * arg[1]:
> + *
> + * @4k:      4K
> + * @non-4k:  Non 4K
> + */
>   static const char igt_edid_stress_resolution_desc[] =
>   	"Stress test the DUT by testing multiple EDIDs, one right after the other, "
>   	"and ensure their validity by check the real screen resolution vs the "
> @@ -274,6 +304,17 @@ static void edid_stress_resolution(chamelium_data_t *data,
>   			      data->ports, data->port_count);
>   }
>   
> +/**
> + * SUBTEST: dp-edid-resolution-list
> + * Description: Get an EDID with many modes of different configurations, set
> + *              them on the screen and check the screen resolution matches the
> + *              mode resolution.
> + * Test category: functionality test
> + * Run type: FULL
> + * Functionality: dp
> + * Mega feature: DP
> + * Driver requirement: any
> + */
>   static const char igt_edid_resolution_list_desc[] =
>   	"Get an EDID with many modes of different configurations, set them on the screen and check the"
>   	" screen resolution matches the mode resolution.";
> @@ -337,6 +378,32 @@ static void edid_resolution_list(chamelium_data_t *data,
>   	drmModeFreeConnector(connector);
>   }
>   
> +/**
> + * SUBTEST: dp-edid-change-during-%s
> + * Description: Simulate a screen being unplugged and another screen being
> + *              plugged during suspend, check that a uevent is sent and
> + *              connector status is updated during %arg[1]
> + * Test category: functionality test
> + * Run type: FULL
> + * Functionality: dp
> + * Mega feature: DP
> + * Driver requirement: any
> + *
> + * SUBTEST: hdmi-edid-change-during-%s
> + * Description: Simulate a screen being unplugged and another screen being
> + *              plugged during suspend, check that a uevent is sent and
> + *              connector status is updated during %arg[1]
> + * Test category: functionality test
> + * Run type: FULL
> + * Functionality: dp
> + * Mega feature: DP
> + * Driver requirement: any
> + *
> + * arg[1]:
> + *
> + * @hibernate:    hibernation
> + * @suspend:      suspend
> + */
>   static const char test_suspend_resume_edid_change_desc[] =
>   	"Simulate a screen being unplugged and another screen being plugged "
>   	"during suspend, check that a uevent is sent and connector status is "
> @@ -389,6 +456,27 @@ static void test_suspend_resume_edid_change(chamelium_data_t *data,
>   			    link_status_failed[1][p]);
>   }
>   
> +/**
> + * SUBTEST: dp-mode-timings
> + * Description: For each mode of the IGT base EDID, perform a modeset and check
> + *              the mode detected by the Chamelium receiver matches the mode we
> + *              set
> + * Test category: functionality test
> + * Run type: FULL
> + * Functionality: dp
> + * Mega feature: DP
> + * Driver requirement: any
> + *
> + * SUBTEST: hdmi-mode-timings
> + * Description: For each mode of the IGT base EDID, perform a modeset and check
> + *              the mode detected by the Chamelium receiver matches the mode we
> + *              set
> + * Test category: functionality test
> + * Run type: FULL
> + * Functionality: dp
> + * Mega feature: DP
> + * Driver requirement: any
> + */
>   static const char test_mode_timings_desc[] =
>   	"For each mode of the IGT base EDID, perform a modeset and check the "
>   	"mode detected by the Chamelium receiver matches the mode we set";


1) Same for all chamelium tests, we should have a some identifier for 
getting testlist
    for chamelium test

2) Have Functionality as DP-EDID-READ or something?
