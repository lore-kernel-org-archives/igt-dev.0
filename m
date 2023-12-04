Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C0AE10E1E9
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Dec 2023 08:49:34 +0000 (UTC)
Message-ID: <0a0c4569-62b2-4876-9841-fc7b7cd29cc7@intel.com>
Date: Mon, 4 Dec 2023 14:19:15 +0530
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20231204081111.225754-1-swati2.sharma@intel.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20231204081111.225754-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms: fix buckets and mega features
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


On 04-12-2023 01:41 pm, Swati Sharma wrote:
> Align mega features with internal tools.
> 
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

> ---
>   tests/chamelium/kms_chamelium_audio.c  | 13 +++---
>   tests/chamelium/kms_chamelium_edid.c   | 31 +++++---------
>   tests/chamelium/kms_chamelium_frames.c | 22 +++++-----
>   tests/chamelium/kms_chamelium_hpd.c    | 57 +++++++++++---------------
>   tests/kms_atomic_transition.c          |  2 +-
>   tests/kms_bw.c                         |  2 +-
>   tests/kms_dp_aux_dev.c                 |  4 +-
>   tests/kms_feature_discovery.c          |  4 +-
>   tests/kms_hdmi_inject.c                |  6 +--
>   tests/kms_panel_fitting.c              |  2 +-
>   tests/kms_scaling_modes.c              |  2 +-
>   tests/kms_vrr.c                        |  2 +-
>   12 files changed, 63 insertions(+), 84 deletions(-)
> 
> diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/kms_chamelium_audio.c
> index cc2c23a76..74e50db3b 100644
> --- a/tests/chamelium/kms_chamelium_audio.c
> +++ b/tests/chamelium/kms_chamelium_audio.c
> @@ -29,6 +29,7 @@
>    * Category: Display
>    * Description: Testing Audio with a Chamelium board
>    * Driver requirement: i915, xe
> + * Mega feature: Display Audio
>    * Test category: functionality test
>    */
>   
> @@ -40,26 +41,22 @@
>    * SUBTEST: dp-audio
>    * Description: Playback various audio signals with various audio formats/rates,
>    *              capture them and check they are correct
> - * Functionality: chamelium, dp_audio
> - * Mega feature: Audio, DP
> + * Functionality: chamelium, dp, audio
>    *
>    * SUBTEST: hdmi-audio
>    * Description: Playback various audio signals with various audio formats/rates,
>    *              capture them and check they are correct
> - * Functionality: chamelium, hdmi_audio
> - * Mega feature: Audio, HDMI
> + * Functionality: chamelium, hdmi, audio
>    *
>    * SUBTEST: dp-audio-edid
>    * Description: Plug a connector with an EDID suitable for audio, check ALSA's
>    *              EDID-Like Data reports the correct audio parameters
> - * Functionality: chamelium, dp_audio
> - * Mega feature: Audio, DP
> + * Functionality: chamelium, dp, audio
>    *
>    * SUBTEST: hdmi-audio-edid
>    * Description: Plug a connector with an EDID suitable for audio, check ALSA's
>    *              EDID-Like Data reports the correct audio parameters
> - * Functionality: chamelium, hdmi_audio
> - * Mega feature: Audio, HDMI
> + * Functionality: chamelium, hdmi, audio
>    */
>   
>   /* Playback parameters control the audio signal we synthesize and send */
> diff --git a/tests/chamelium/kms_chamelium_edid.c b/tests/chamelium/kms_chamelium_edid.c
> index 6550b7b74..8438f5f15 100644
> --- a/tests/chamelium/kms_chamelium_edid.c
> +++ b/tests/chamelium/kms_chamelium_edid.c
> @@ -29,6 +29,7 @@
>    * Category: Display
>    * Description: Testing EDID with a Chamelium board
>    * Driver requirement: i915, xe
> + * Mega feature: General Display Features
>    * Test category: functionality test
>    */
>   
> @@ -53,39 +54,33 @@
>   /**
>    * SUBTEST: dp-edid-read
>    * Description: Make sure the EDID exposed by KMS is the same as the screen's
> - * Functionality: chamelium, dp_edid
> - * Mega feature: DP
> + * Functionality: chamelium, dp, edid
>    *
>    * SUBTEST: hdmi-edid-read
>    * Description: Make sure the EDID exposed by KMS is the same as the screen's
> - * Functionality: chamelium, hdmi_edid
> - * Mega feature: HDMI
> + * Functionality: chamelium, hdmi, edid
>    *
>    * SUBTEST: vga-edid-read
>    * Description: Make sure the EDID exposed by KMS is the same as the screen's
> - * Functionality: chamelium, vga_edid
> - * Mega feature: VGA
> + * Functionality: chamelium, vga, edid
>    *
>    * SUBTEST: dp-edid-resolution-list
>    * Description: Get an EDID with many modes of different configurations, set
>    *              them on the screen and check the screen resolution matches the
>    *              mode resolution.
> - * Functionality: chamelium, dp_edid
> - * Mega feature: DP
> + * Functionality: chamelium, dp, edid
>    *
>    * SUBTEST: dp-mode-timings
>    * Description: For each mode of the IGT base EDID, perform a modeset and check
>    *              the mode detected by the Chamelium receiver matches the mode we
>    *              set
> - * Functionality: chamelium, dp_edid
> - * Mega feature: DP
> + * Functionality: chamelium, dp, edid
>    *
>    * SUBTEST: hdmi-mode-timings
>    * Description: For each mode of the IGT base EDID, perform a modeset and check
>    *              the mode detected by the Chamelium receiver matches the mode we
>    *              set
> - * Functionality: chamelium, dp_edid
> - * Mega feature: DP
> + * Functionality: chamelium, dp, edid
>    */
>   
>   /**
> @@ -93,15 +88,13 @@
>    * Description: Stress test the DUT by testing multiple EDIDs, one right after
>    *              the other, and ensure their validity by check the real screen
>    *              resolution vs the advertised mode (%arg[1]) resolution.
> - * Functionality: chamelium, dp_edid
> - * Mega feature: DP
> + * Functionality: chamelium, dp, edid
>    *
>    * SUBTEST: hdmi-edid-stress-resolution-%s
>    * Description: Stress test the DUT by testing multiple EDIDs, one right after
>    *              the other, and ensure their validity by check the real screen
>    *              resolution vs the advertised mode (%arg[1]) resolution.
> - * Functionality: chamelium, hdmi_edid
> - * Mega feature: HDMI
> + * Functionality: chamelium, hdmi, edid
>    *
>    * arg[1]:
>    *
> @@ -114,15 +107,13 @@
>    * Description: Simulate a screen being unplugged and another screen being
>    *              plugged during suspend, check that a uevent is sent and
>    *              connector status is updated during %arg[1]
> - * Functionality: chamelium, dp_edid
> - * Mega feature: DP
> + * Functionality: chamelium, dp, edid
>    *
>    * SUBTEST: hdmi-edid-change-during-%s
>    * Description: Simulate a screen being unplugged and another screen being
>    *              plugged during suspend, check that a uevent is sent and
>    *              connector status is updated during %arg[1]
> - * Functionality: chamelium, dp_edid
> - * Mega feature: DP
> + * Functionality: chamelium, dp, edid
>    *
>    * arg[1]:
>    *
> diff --git a/tests/chamelium/kms_chamelium_frames.c b/tests/chamelium/kms_chamelium_frames.c
> index c14245a71..05eeca593 100644
> --- a/tests/chamelium/kms_chamelium_frames.c
> +++ b/tests/chamelium/kms_chamelium_frames.c
> @@ -29,7 +29,7 @@
>    * Category: Display
>    * Description: Tests requiring a Chamelium board
>    * Driver requirement: i915, xe
> - * Functionality: chamelium, frame_integrity
> + * Mega feature: General Display Features
>    * Test category: functionality test
>    */
>   
> @@ -41,17 +41,17 @@
>    * SUBTEST: dp-crc-fast
>    * Description: Pick the first mode of the IGT base EDID, display and capture
>    * 		a few frames, then check captured frames are correct
> - * Mega feature: DP
> + * Functionality: chamelium, dp, frame_integrity
>    *
>    * SUBTEST: hdmi-crc-fast
>    * Description: Pick the first mode of the IGT base EDID, display and capture
>    * 		a few frames, then check captured frames are correct
> - * Mega feature: HDMI
> + * Functionality: chamelium, hdmi, frame_integrity
>    *
>    * SUBTEST: hdmi-%s-formats
>    * Description: Pick the first mode of the IGT base EDID, display and capture a
>    *              few frames, then check captured frames are correct
> - * Mega feature: HDMI
> + * Functionality: chamelium, hdmi, frame_integrity
>    *
>    * arg[1]:
>    *
> @@ -63,17 +63,17 @@
>    * SUBTEST: vga-frame-dump
>    * Description: For each mode of the IGT base EDID, display and capture a few
>    *              frames, then check captured frames are correct
> - * Mega feature: VGA
> + * Functionality: chamelium, vga, frame_integrity
>    *
>    * SUBTEST: dp-crc-%s
>    * Description: For each mode of the IGT base EDID, display and capture a %arg[1]
>    *              frame(s), then check captured frame(s) are correct
> - * Mega feature: DP
> + * Functionality: chamelium, dp, frame_integrity
>    *
>    * SUBTEST: hdmi-crc-%s
>    * Description: For each mode of the IGT base EDID, display and capture a %arg[1]
>    *              frame(s), then check captured frame(s) are correct
> - * Mega feature: HDMI
> + * Functionality: chamelium, hdmi, frame_integrity
>    *
>    * arg[1]:
>    *
> @@ -86,23 +86,23 @@
>    * Description: For each mode of the IGT base EDID, display and capture a few
>    *              frames, then download the captured frames and compare them
>    *              bit-by-bit to the sent ones
> - * Mega feature: DP
> + * Functionality: chamelium, dp, frame_integrity
>    *
>    * SUBTEST: hdmi-frame-dump
>    * Description: For each mode of the IGT base EDID, display and capture a few
>    *              frames, then download the captured frames and compare them
>    *              bit-by-bit to the sent ones
> - * Mega feature: HDMI
> + * Functionality: chamelium, hdmi, frame_integrity
>    *
>    * SUBTEST: hdmi-aspect-ratio
>    * Description: Pick a mode with a picture aspect-ratio, capture AVI InfoFrames
>    *              and check they include the relevant fields
> - * Mega feature: HDMI
> + * Functionality: chamelium, hdmi, frame_integrity
>    *
>    * SUBTEST: hdmi-%s-planes-random
>    * Description: Setup a few overlay planes with random parameters, capture the
>    *              frame and check it matches the expected output
> - * Mega feature: HDMI
> + * Functionality: chamelium, hdmi, frame_integrity
>    *
>    * arg[1]:
>    *
> diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
> index 7e580e20e..858c595cb 100644
> --- a/tests/chamelium/kms_chamelium_hpd.c
> +++ b/tests/chamelium/kms_chamelium_hpd.c
> @@ -29,7 +29,7 @@
>    * Category: Display
>    * Description: Testing HPD with a Chamelium board
>    * Driver requirement: i915, xe
> - * Functionality: chamelium, hotplug
> + * Mega feature: General Display Features
>    * Test category: functionality test
>    */
>   
> @@ -39,47 +39,47 @@
>    * SUBTEST: dp-hpd-fast
>    * Description: Check that we get uevents and updated connector status on
>    * 		hotplug and unplug
> - * Mega feature: DP
> + * Functionality: chamelium, hotplug, dp
>    *
>    * SUBTEST: hdmi-hpd-fast
>    * Description: Check that we get uevents and updated connector status on
>    * 		hotplug and unplug
> - * Mega feature: HDMI
> + * Functionality: chamelium, hotplug, hdmi
>    *
>    * SUBTEST: vga-hpd-fast
>    * Description: Check that we get uevents and updated connector status on
>    * 		hotplug and unplug
> - * Mega feature: VGA
> + * Functionality: chamelium, hotplug, vga
>    *
>    * SUBTEST: dp-hpd
>    * Description: Check that we get uevents and updated connector status on
>    *              hotplug and unplug
> - * Mega feature: DP
> + * Functionality: chamelium, hotplug, dp
>    *
>    * SUBTEST: hdmi-hpd
>    * Description: Check that we get uevents and updated connector status on
>    *              hotplug and unplug
> - * Mega feature: HDMI
> + * Functionality: chamelium, hotplug, hdmi
>    *
>    * SUBTEST: vga-hpd
>    * Description: Check that we get uevents and updated connector status on
>    *              hotplug and unplug
> - * Mega feature: VGA
> + * Functionality: chamelium, hotplug, vga
>    *
>    * SUBTEST: dp-hpd-%s
>    * Description: Check that we get uevents and updated connector status on
>    *              hotplug and unplug
> - * Mega feature: DP
> + * Functionality: chamelium, hotplug, dp
>    *
>    * SUBTEST: hdmi-hpd-%s
>    * Description: Check that we get uevents and updated connector status on
>    *              hotplug and unplug
> - * Mega feature: HDMI
> + * Functionality: chamelium, hotplug, hdmi
>    *
>    * SUBTEST: vga-hpd-%s
>    * Description: Check that we get uevents and updated connector status on
>    *              hotplug and unplug
> - * Mega feature: VGA
> + * Functionality: chamelium, hotplug, vga
>    *
>    * arg[1]:
>    *
> @@ -91,93 +91,84 @@
>    * SUBTEST: dp-hpd-for-each-pipe
>    * Description: Check that we get uevents and updated connector status on
>    *              hotplug and unplug for each pipe with valid output
> - * Mega feature: DP
> + * Functionality: chamelium, hotplug, dp
>    *
>    * SUBTEST: hdmi-hpd-for-each-pipe
>    * Description: Check that we get uevents and updated connector status on
>    *              hotplug and unplug for each pipe with valid output
> - * Mega feature: HDMI
> + * Functionality: chamelium, hotplug, hdmi
>    *
>    * SUBTEST: vga-hpd-for-each-pipe
>    * Description: Check that we get uevents and updated connector status on
>    *              hotplug and unplug for each pipe with valid output
> - * Mega feature: VGA
> - * Test category: functionality test
> + * Functionality: chamelium, hotplug, vga
>    *
>    * SUBTEST: dp-hpd-after-hibernate
>    * Description: Toggle HPD during Hibernation, check that uevents are sent and
>    *              connector status is updated
> - * Functionality: chamelium, hotplug, hibernation
> - * Mega feature: DP
> + * Functionality: chamelium, hotplug, dp, hibernation
>    *
>    * SUBTEST: hdmi-hpd-after-hibernate
>    * Description: Toggle HPD during Hibernation, check that uevents are sent and
>    *              connector status is updated
> - * Functionality: chamelium, hotplug, hibernation
> - * Mega feature: HDMI
> + * Functionality: chamelium, hotplug, hdmi, hibernation
>    *
>    * SUBTEST: vga-hpd-after-hibernate
>    * Description: Toggle HPD during Hibernation, check that uevents are sent and
>    *              connector status is updated
> - * Functionality: chamelium, hotplug, hibernation
> - * Mega feature: VGA
> + * Functionality: chamelium, hotplug, vga, hibernation
>    *
>    * SUBTEST: dp-hpd-after-suspend
>    * Description: Toggle HPD during Suspend, check that uevents are sent and
>    *              connector status is updated
> - * Functionality: chamelium, hotplug, suspend
> - * Mega feature: DP
> + * Functionality: chamelium, hotplug, dp, suspend
>    *
>    * SUBTEST: hdmi-hpd-after-suspend
>    * Description: Toggle HPD during Suspend, check that uevents are sent and
>    *              connector status is updated
> - * Functionality: chamelium, hotplug, suspend
> - * Mega feature: HDMI
> + * Functionality: chamelium, hotplug, hdmi, suspend
>    *
>    * SUBTEST: vga-hpd-after-suspend
>    * Description: Toggle HPD during Suspend, check that uevents are sent and
>    *              connector status is updated
> - * Functionality: chamelium, hotplug, suspend
> - * Mega feature: VGA
> + * Functionality: chamelium, hotplug, vga, suspend
>    *
>    * SUBTEST: common-hpd-after-suspend
>    * Description: Toggle HPD during suspend on all connectors, check that uevents
>    * 		are sent and connector status is updated
>    * Functionality: chamelium, hotplug, suspend
> - * Mega feature: General Display Features
>    *
>    * SUBTEST: common-hpd-after-hibernate
>    * Description: Toggle HPD during suspend on all connectors, check that uevents
>    *              are sent and connector status is updated
>    * Functionality: chamelium, hotplug, hibernation
> - * Mega feature: General Display Features
>    *
>    * SUBTEST: vga-hpd-without-ddc
>    * Description: Disable DDC on a VGA connector, check we still get a uevent on
>    *              hotplug
> - * Mega feature: VGA
> + * Functionality: chamelium, hotplug, vga
>    *
>    * SUBTEST: dp-hpd-storm
>    * Description: Trigger a series of hotplugs in a very small timeframe to
>    *              simulate abad cable, check the kernel falls back to polling
>    *              to avoid a hotplug storm
> - * Mega feature: DP
> + * Functionality: chamelium, hotplug, dp
>    *
>    * SUBTEST: hdmi-hpd-storm
>    * Description: Trigger a series of hotplugs in a very small timeframe to
>    *              simulate abad cable, check the kernel falls back to polling
>    *              to avoid a hotplug storm
> - * Mega feature: HDMI
> + * Functionality: chamelium, hotplug, hdmi
>    *
>    * SUBTEST: dp-hpd-storm-disable
>    * Description: Disable HPD storm detection, trigger a storm and check the
>    *              kernel doesn't detect one
> - * Mega feature: DP
> + * Functionality: chamelium, hotplug, dp
>    *
>    * SUBTEST: hdmi-hpd-storm-disable
>    * Description: Disable HPD storm detection, trigger a storm and check the
>    *              kernel doesn't detect one
> - * Mega feature: HDMI
> + * Functionality: chamelium, hotplug, hdmi
>    */
>   
>   #define HPD_STORM_PULSE_INTERVAL_DP 100 /* ms */
> diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
> index 210986f55..e8992790d 100644
> --- a/tests/kms_atomic_transition.c
> +++ b/tests/kms_atomic_transition.c
> @@ -59,7 +59,7 @@
>   /**
>    * SUBTEST: plane-all-modeset-%s
>    * Description: Modeset test for all plane combinations %arg[1]
> - * Mega feature: eDP
> + * Functionality: plane, watermark, edp
>    *
>    * arg[1]:
>    *
> diff --git a/tests/kms_bw.c b/tests/kms_bw.c
> index ddea7f2ff..dd10d640d 100644
> --- a/tests/kms_bw.c
> +++ b/tests/kms_bw.c
> @@ -26,7 +26,7 @@
>    * Description: BW test with different resolutions
>    * Driver requirement: i915, xe
>    * Functionality: kms_core
> - * Mega feature: General Display Features
> + * Mega feature: Display Latency/Bandwidth
>    * Test category: functionality test
>    */
>   
> diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
> index 597d4c2ef..3e1d8be3a 100644
> --- a/tests/kms_dp_aux_dev.c
> +++ b/tests/kms_dp_aux_dev.c
> @@ -42,8 +42,8 @@
>    * SUBTEST:
>    * Description: Test that /dev/drm_dp_aux reads work
>    * Driver requirement: i915, xe
> - * Functionality: dp_aux
> - * Mega feature: DP
> + * Functionality: dp_aux, edp, dp
> + * Mega feature: General Display Features
>    * Test category: functionality test
>    */
>   
> diff --git a/tests/kms_feature_discovery.c b/tests/kms_feature_discovery.c
> index dff667c73..5bca9ad76 100644
> --- a/tests/kms_feature_discovery.c
> +++ b/tests/kms_feature_discovery.c
> @@ -57,12 +57,12 @@
>    *
>    * SUBTEST: psr1
>    * Description: Make sure that we have eDP panel with PSR1 support.
> - * Functionality: feature_discovery, psr1, eDP_core
> + * Functionality: feature_discovery, psr1, edp
>    * Mega feature: PSR
>    *
>    * SUBTEST: psr2
>    * Description: Make sure that we have eDP panel with PSR2 support.
> - * Functionality: feature_discovery, psr2, eDP_core
> + * Functionality: feature_discovery, psr2, edp
>    * Mega feature: PSR
>    *
>    * SUBTEST: dp-mst
> diff --git a/tests/kms_hdmi_inject.c b/tests/kms_hdmi_inject.c
> index a554ca2b1..dce74fac0 100644
> --- a/tests/kms_hdmi_inject.c
> +++ b/tests/kms_hdmi_inject.c
> @@ -29,7 +29,7 @@
>    *              by forcing a HDMI connector with a known EDID and checking that
>    *              the metadata exposed to user space matches.
>    * Driver requirement: i915, xe
> - * Mega feature: HDMI
> + * Mega feature: General Display Features
>    * Test category: functionality test
>    */
>   
> @@ -46,12 +46,12 @@
>    * SUBTEST: inject-4k
>    * Description: Make sure that 4K modes exposed by DRM match the forced EDID and
>    *              modesetting using it succeed.
> - * Functionality: force_connector, hdmi_edid
> + * Functionality: force_connector, hdmi, edid
>    *
>    * SUBTEST: inject-audio
>    * Description: Make sure that audio information exposed by ALSA match the forced
>    *              EDID.
> - * Functionality: hdmi_audio, force_connector
> + * Functionality: force_connector, hdmi, audio
>    */
>   
>   #define HDISPLAY_4K	3840
> diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
> index f714ab474..d30f7f095 100644
> --- a/tests/kms_panel_fitting.c
> +++ b/tests/kms_panel_fitting.c
> @@ -27,7 +27,7 @@
>    * Category: Display
>    * Description: Test display panel fitting
>    * Driver requirement: i915, xe
> - * Functionality: eDP_core, panel_fitting, scaling
> + * Functionality: edp, panel_fitting, scaling
>    * Mega feature: General Display Features
>    * Test category: functionality test
>    */
> diff --git a/tests/kms_scaling_modes.c b/tests/kms_scaling_modes.c
> index fae5755a8..5fd34c4b2 100644
> --- a/tests/kms_scaling_modes.c
> +++ b/tests/kms_scaling_modes.c
> @@ -29,7 +29,7 @@
>    * Category: Display
>    * Description: Test display scaling modes
>    * Driver requirement: i915, xe
> - * Functionality: eDP_core, plane, scaling
> + * Functionality: edp, plane, scaling
>    * Mega feature: General Display Features
>    * Test category: functionality test
>    */
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 13b347631..5c190cd8c 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -26,7 +26,7 @@
>    * Description: Test to validate diffent features of VRR
>    * Driver requirement: i915, xe
>    * Functionality: adaptive_sync
> - * Mega feature: VRR
> + * Mega feature: Adaptive Sync
>    * Test category: functionality test
>    */
>   
