Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C27810E252
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Aug 2023 16:55:58 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Aug 2023 22:16:59 +0530
Message-Id: <20230815164815.320904-6-bhanuprakash.modem@intel.com>
In-Reply-To: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
References: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 05/81] tests/chamelium/kms_chamelium_audio:
 Document each subtest for testplan
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add documentation for all kms tests which is used by IGT testplan
documentation.

V2: - Include Audio in Mega feature
    - Include Chamelium in Functionality
V3: - Driver requirement: s/any/i915, xe/

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/chamelium/kms_chamelium_audio.c | 44 +++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/kms_chamelium_audio.c
index 8fbc1f80e..3dc33c9c9 100644
--- a/tests/chamelium/kms_chamelium_audio.c
+++ b/tests/chamelium/kms_chamelium_audio.c
@@ -28,6 +28,12 @@
 #include "igt_infoframe.h"
 #include "kms_chamelium_helper.h"
 
+/**
+ * TEST: kms chamelium audio
+ * Category: Display
+ * Description: Testing Audio with a Chamelium board
+ */
+
 /* Playback parameters control the audio signal we synthesize and send */
 #define PLAYBACK_CHANNELS 2
 #define PLAYBACK_SAMPLES 1024
@@ -669,6 +675,25 @@ static bool check_audio_configuration(struct alsa *alsa,
 	return true;
 }
 
+/**
+ * SUBTEST: dp-audio
+ * Description: Playback various audio signals with various audio formats/rates,
+ *              capture them and check they are correct
+ * Functionality: chamelium, dp_audio
+ * Mega feature: Audio, DP
+ * Run type: FULL
+ * Test category: functionality test
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: hdmi-audio
+ * Description: Playback various audio signals with various audio formats/rates,
+ *              capture them and check they are correct
+ * Functionality: chamelium, hdmi_audio
+ * Mega feature: Audio, HDMI
+ * Run type: FULL
+ * Test category: functionality test
+ * Driver requirement: i915, xe
+ */
 static const char test_display_audio_desc[] =
 	"Playback various audio signals with various audio formats/rates, "
 	"capture them and check they are correct";
@@ -763,6 +788,25 @@ static void test_display_audio(chamelium_data_t *data,
 	free(alsa);
 }
 
+/**
+ * SUBTEST: dp-audio-edid
+ * Description: Plug a connector with an EDID suitable for audio, check ALSA's
+ *              EDID-Like Data reports the correct audio parameters
+ * Functionality: chamelium, dp_audio
+ * Mega feature: Audio, DP
+ * Run type: FULL
+ * Test category: functionality test
+ * Driver requirement: i915, xe
+ *
+ * SUBTEST: hdmi-audio-edid
+ * Description: Plug a connector with an EDID suitable for audio, check ALSA's
+ *              EDID-Like Data reports the correct audio parameters
+ * Functionality: chamelium, hdmi_audio
+ * Mega feature: Audio, HDMI
+ * Run type: FULL
+ * Test category: functionality test
+ * Driver requirement: i915, xe
+ */
 static const char test_display_audio_edid_desc[] =
 	"Plug a connector with an EDID suitable for audio, check ALSA's "
 	"EDID-Like Data reports the correct audio parameters";
-- 
2.40.0
