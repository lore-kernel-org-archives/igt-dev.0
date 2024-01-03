Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2084.outbound.protection.outlook.com [40.107.95.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C64D10E2CA
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jan 2024 14:46:43 +0000 (UTC)
From: Hersen Wu <hersenxs.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>, <rodrigo.siqueira@amd.com>,
 <aurabindo.pillai@amd.com>, <alex.hung@amd.com>, <hamza.mahfooz@amd.com>,
 <wayne.lin@amd.com>
Subject: [PATCH] [i-g-t] tests/amdgpu/amd_link_settings: Fix run eDP link
 training with unsupported link rate
Date: Wed, 3 Jan 2024 09:46:24 -0500
Message-ID: <20240103144624.59716-1-hersenxs.wu@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Hersen Wu <hersenxs.wu@amd.com>, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Hersen Wu <Hersenxs.Wu@amd.com>

Add check eDP intermedidate link rate caps from DPCD
offset 0x10 - 0x1f. Only run DP link training for link
rate supported by eDP.

Beside max link rate, eDP1.4b introduces intermediate link
rate. eDP reports ilr caps with DPCD register 0x10 - 0x1f.

Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
---
 lib/igt_amd.h                    |  1 +
 tests/amdgpu/amd_ilr.c           |  2 --
 tests/amdgpu/amd_link_settings.c | 32 ++++++++++++++++++++++++++++----
 3 files changed, 29 insertions(+), 6 deletions(-)

diff --git a/lib/igt_amd.h b/lib/igt_amd.h
index 1e66348ad..254b5d37b 100644
--- a/lib/igt_amd.h
+++ b/lib/igt_amd.h
@@ -46,6 +46,7 @@
 /* eDP related */
 #define DEBUGFS_EDP_ILR_SETTING "ilr_setting"
 #define MAX_SUPPORTED_ILR 8
+#define MULTIPLIER_TO_LR 270000
 #define DEBUGFS_EDP_PSR_CAP	"psr_capability"
 #define DEBUGFS_EDP_PSR_STATE	"psr_state"
 #define DEBUGFS_ALLOW_EDP_HOTPLUG_DETECT "allow_edp_hotplug_detection"
diff --git a/tests/amdgpu/amd_ilr.c b/tests/amdgpu/amd_ilr.c
index 50ca93a14..b2c0f294d 100644
--- a/tests/amdgpu/amd_ilr.c
+++ b/tests/amdgpu/amd_ilr.c
@@ -29,8 +29,6 @@
 #include <sys/types.h>
 #include <sys/stat.h>
 
-#define MULTIPLIER_TO_LR 270000
-
 IGT_TEST_DESCRIPTION("This igt test validates ILR (Intermediate Link Rate) "
 	"feature from two perspective: "
 	"1. Test if we can sucessfully train link rate at all supported ILRs"
diff --git a/tests/amdgpu/amd_link_settings.c b/tests/amdgpu/amd_link_settings.c
index 6a7e8cc53..226c94d73 100644
--- a/tests/amdgpu/amd_link_settings.c
+++ b/tests/amdgpu/amd_link_settings.c
@@ -34,6 +34,7 @@ typedef struct
         enum pipe pipe_id;
 	int connector_type;
 	int w, h;
+	int supported_ilr[MAX_SUPPORTED_ILR];
 } data_t;
 
 const enum dc_lane_count lane_count_values[] =
@@ -51,12 +52,17 @@ const enum dc_link_rate dp_link_rate_values[] =
 	LINK_RATE_HIGH3
 };
 
+/* eDP 1.4b */
 const enum dc_link_rate edp_link_rate_values[] =
 {
-	LINK_RATE_LOW,
-	LINK_RATE_HIGH,
-	LINK_RATE_RBR2,
-	LINK_RATE_HIGH2
+	LINK_RATE_LOW,		/* 0x6 Rate_1 (RBR)	- 1.62 Gbps/Lane */
+	LINK_RATE_RATE_2,	/* 0x8 Rate_2		- 2.16 Gbps/Lane */
+	LINK_RATE_RATE_3,	/* 0x9 Rate_3		- 2.43 Gbps/Lane */
+	LINK_RATE_HIGH,		/* 0xA Rate_4 (HBR)	- 2.70 Gbps/Lane */
+	LINK_RATE_RBR2,		/* 0xC Rate_5 (RBR2)	- 3.24 Gbps/Lane */
+	LINK_RATE_RATE_6,	/* 0x10 Rate_6		- 4.32 Gbps/Lane */
+	LINK_RATE_HIGH2,	/* 0x14 Rate_7 (HBR2)	- 5.40 Gbps/Lane */
+	LINK_RATE_HIGH3		/* 0x1E Rate_8 (HBR3)	- 8.10 Gbps/Lane */
 };
 
 static void test_fini(data_t *data)
@@ -116,6 +122,8 @@ static void run_link_training_config(data_t *data, igt_output_t *output)
 	} else if (data->connector_type == DRM_MODE_CONNECTOR_eDP) {
 		link_rate_values = edp_link_rate_values;
 		num_link_rates = ARRAY_SIZE(edp_link_rate_values);
+		igt_amd_read_ilr_setting(data->drm_fd, connector_name,
+			data->supported_ilr);
 	} else {
 		igt_info("Not a DP or eDP connector\n");
 		return;
@@ -137,6 +145,22 @@ static void run_link_training_config(data_t *data, igt_output_t *output)
 			if (link_rate_values[j] > max_lr)
 				continue;
 
+			/* Check if ilr link rate is supported */
+			if (data->connector_type == DRM_MODE_CONNECTOR_eDP) {
+				bool valid_link_rate = false;
+
+				for (int k = 0; k < MAX_SUPPORTED_ILR; k++) {
+					if (data->supported_ilr[k] ==
+						link_rate_values[j] * MULTIPLIER_TO_LR) {
+						valid_link_rate = true;
+						break;
+					} else if (data->supported_ilr[k] == 0)
+						break;
+				}
+				if (!valid_link_rate)
+					continue;
+			}
+
 			/* Write link settings */
 			igt_info("Applying lane count: %d, link rate 0x%02x, on default training\n",
 				  lane_count_values[i], link_rate_values[j]);
-- 
2.25.1
