Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2077.outbound.protection.outlook.com [40.107.94.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188446E1B7
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Sep 2021 12:38:12 +0000 (UTC)
From: Stylon Wang <stylon.wang@amd.com>
Date: Wed, 1 Sep 2021 20:37:51 +0800
Message-ID: <20210901123752.14633-3-stylon.wang@amd.com>
In-Reply-To: <20210901123752.14633-1-stylon.wang@amd.com>
References: <20210901123752.14633-1-stylon.wang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v2 2/3] tests/amdgpu: Add tests for relaxed
 reporting of Freesync capability
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

These new tests only check if frame rate range is within legal range.

Signed-off-by: Stylon Wang <stylon.wang@amd.com>
---
 tests/amdgpu/amd_vrr_range.c | 43 ++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/tests/amdgpu/amd_vrr_range.c b/tests/amdgpu/amd_vrr_range.c
index 219162c0..1d0e6b54 100644
--- a/tests/amdgpu/amd_vrr_range.c
+++ b/tests/amdgpu/amd_vrr_range.c
@@ -232,6 +232,42 @@ static void test_freesync_parsing(data_t *data, uint32_t connector_type)
 	igt_info("Freesync range: %d-%d\n", range.min, range.max);
 }
 
+/* Returns true if an output supports VRR. */
+static bool has_vrr(igt_output_t *output)
+{
+	return igt_output_has_prop(output, IGT_CONNECTOR_VRR_CAPABLE) &&
+	       igt_output_get_prop(output, IGT_CONNECTOR_VRR_CAPABLE);
+}
+
+/* More relaxed checking on Freesync capability.
+ * Only checks if frame rate range is within legal range.
+ */
+static void test_freesync_range(data_t *data, uint32_t connector_type)
+{
+	range_t range;
+
+	test_init(data, connector_type);
+
+	igt_amd_require_hpd(&data->display, data->fd);
+
+	igt_assert_f(has_vrr(data->output),
+			"connector %s is not VRR capable\n",
+			data->output->name);
+
+	igt_amd_trigger_hotplug(data->fd, data->output->name);
+
+	range = get_freesync_range(data, data->output);
+
+	test_fini(data);
+
+	igt_assert_f(range.min != 0 &&
+			range.max != 0 &&
+			range.max - range.min > 10,
+			"Invalid Freesync range %d-%d\n",
+			range.min, range.max);
+	igt_info("Freesync range: %d-%d\n", range.min, range.max);
+}
+
 igt_main
 {
 	data_t data;
@@ -258,6 +294,13 @@ igt_main
 	igt_subtest("freesync-parsing-dp") test_freesync_parsing(&data,
 			DRM_MODE_CONNECTOR_DisplayPort);
 
+	igt_describe("Freesync range on HDMI");
+	igt_subtest("freesync-range-hdmi") test_freesync_range(&data,
+			DRM_MODE_CONNECTOR_HDMIA);
+	igt_describe("Freesync range on DP");
+	igt_subtest("freesync-range-dp") test_freesync_range(&data,
+			DRM_MODE_CONNECTOR_DisplayPort);
+
 	igt_fixture
 	{
 		igt_display_fini(&data.display);
-- 
2.32.0
