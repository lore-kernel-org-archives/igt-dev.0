Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C741D6E1BE
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Sep 2021 12:38:15 +0000 (UTC)
From: Stylon Wang <stylon.wang@amd.com>
Date: Wed, 1 Sep 2021 20:37:52 +0800
Message-ID: <20210901123752.14633-4-stylon.wang@amd.com>
In-Reply-To: <20210901123752.14633-1-stylon.wang@amd.com>
References: <20210901123752.14633-1-stylon.wang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v2 3/3] tests/amdgpu: Add tests for Freesync
 capability with suspend-resume
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: nicholas.kazlauskas@amd.com, sunpeng.li@amd.com, rodrigo.siqueira@amd.com, Stylon Wang <stylon.wang@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

Add tests to check Freesync capability reporting after system resume
from suspend.

Signed-off-by: Stylon Wang <stylon.wang@amd.com>
---
 tests/amdgpu/amd_vrr_range.c | 50 ++++++++++++++++++++++++++++++------
 1 file changed, 42 insertions(+), 8 deletions(-)

diff --git a/tests/amdgpu/amd_vrr_range.c b/tests/amdgpu/amd_vrr_range.c
index 1d0e6b54..2f27296d 100644
--- a/tests/amdgpu/amd_vrr_range.c
+++ b/tests/amdgpu/amd_vrr_range.c
@@ -40,6 +40,12 @@ typedef struct range {
 	unsigned int max;
 } range_t;
 
+/* Test flags. */
+enum {
+	TEST_NONE = 1 << 0,
+	TEST_SUSPEND = 1 << 1,
+};
+
 struct {
 	const char *name;
 	uint32_t connector_type;
@@ -193,11 +199,24 @@ static range_t get_freesync_range(data_t *data, igt_output_t *output)
 	return range;
 }
 
+static void trigger_edid_parse(data_t *data, uint32_t test_flags)
+{
+	if (test_flags & TEST_SUSPEND)
+		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
+					      SUSPEND_TEST_NONE);
+	else
+		igt_amd_trigger_hotplug(data->fd, data->output->name);
+
+	/* more safe margin until resume and hotplug is completed */
+	usleep(1500000);
+}
+
 /* Check if EDID parsing is correctly reporting Freesync capability
  * by overriding EDID with ones from golden sample. Display under test
  * must still support Freesync.
  */
-static void test_freesync_parsing(data_t *data, uint32_t connector_type)
+static void test_freesync_parsing(data_t *data, uint32_t connector_type,
+		uint32_t test_flags)
 {
 	const struct edid *edid;
 	range_t range, expected_range;
@@ -214,7 +233,7 @@ static void test_freesync_parsing(data_t *data, uint32_t connector_type)
 
 	kmstest_force_edid(data->fd, data->output->config.connector, edid);
 
-	igt_amd_trigger_hotplug(data->fd, data->output->name);
+	trigger_edid_parse(data, test_flags);
 
 	range = get_freesync_range(data, data->output);
 
@@ -242,7 +261,8 @@ static bool has_vrr(igt_output_t *output)
 /* More relaxed checking on Freesync capability.
  * Only checks if frame rate range is within legal range.
  */
-static void test_freesync_range(data_t *data, uint32_t connector_type)
+static void test_freesync_range(data_t *data, uint32_t connector_type,
+		uint32_t test_flags)
 {
 	range_t range;
 
@@ -254,7 +274,7 @@ static void test_freesync_range(data_t *data, uint32_t connector_type)
 			"connector %s is not VRR capable\n",
 			data->output->name);
 
-	igt_amd_trigger_hotplug(data->fd, data->output->name);
+	trigger_edid_parse(data, test_flags);
 
 	range = get_freesync_range(data, data->output);
 
@@ -289,17 +309,31 @@ igt_main
 
 	igt_describe("Freesync EDID parsing on HDMI");
 	igt_subtest("freesync-parsing-hdmi") test_freesync_parsing(&data,
-			DRM_MODE_CONNECTOR_HDMIA);
+			DRM_MODE_CONNECTOR_HDMIA, TEST_NONE);
 	igt_describe("Freesync EDID parsing on DP");
 	igt_subtest("freesync-parsing-dp") test_freesync_parsing(&data,
-			DRM_MODE_CONNECTOR_DisplayPort);
+			DRM_MODE_CONNECTOR_DisplayPort, TEST_NONE);
+
+	igt_describe("Freesync EDID parsing on HDMI after suspend");
+	igt_subtest("freesync-parsing-hdmi-suspend") test_freesync_parsing(&data,
+			DRM_MODE_CONNECTOR_HDMIA, TEST_SUSPEND);
+	igt_describe("Freesync EDID parsing on DP after suspend");
+	igt_subtest("freesync-parsing-dp-suspend") test_freesync_parsing(&data,
+			DRM_MODE_CONNECTOR_DisplayPort, TEST_SUSPEND);
 
 	igt_describe("Freesync range on HDMI");
 	igt_subtest("freesync-range-hdmi") test_freesync_range(&data,
-			DRM_MODE_CONNECTOR_HDMIA);
+			DRM_MODE_CONNECTOR_HDMIA, TEST_NONE);
 	igt_describe("Freesync range on DP");
 	igt_subtest("freesync-range-dp") test_freesync_range(&data,
-			DRM_MODE_CONNECTOR_DisplayPort);
+			DRM_MODE_CONNECTOR_DisplayPort, TEST_NONE);
+
+	igt_describe("Freesync range on HDMI after suspend");
+	igt_subtest("freesync-range-hdmi-suspend") test_freesync_range(&data,
+			DRM_MODE_CONNECTOR_HDMIA, TEST_SUSPEND);
+	igt_describe("Freesync range on DP after suspend");
+	igt_subtest("freesync-range-dp-suspend") test_freesync_range(&data,
+			DRM_MODE_CONNECTOR_DisplayPort, TEST_SUSPEND);
 
 	igt_fixture
 	{
-- 
2.32.0
