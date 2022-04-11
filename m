Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB64410F2AB
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Apr 2022 09:44:04 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org, jani.nikula@linux.intel.com,
 ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 swati2.sharma@intel.com
Date: Mon, 11 Apr 2022 15:11:45 +0530
Message-Id: <20220411094147.1650859-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20220411094147.1650859-1-bhanuprakash.modem@intel.com>
References: <20220411094147.1650859-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V2 3/5] tests/kms_hdr: Adopt to use updated debugfs
 functions
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

Instead of writing our own wrappers of debugfs read,
use updated functions from lib.

Cc: Swati Sharma <swati2.sharma@intel.com>
Cc: Mark Yacoub <markyacoub@chromium.org>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_hdr.c | 69 +++++++------------------------------------------
 1 file changed, 9 insertions(+), 60 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 247eb658..cd2883c8 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -95,44 +95,6 @@ static void test_cycle_flags(data_t *data, uint32_t test_flags)
 					      SUSPEND_TEST_NONE);
 }
 
-/* Returns the current and maximum bpc from the connector debugfs. */
-static output_bpc_t get_output_bpc(data_t *data)
-{
-	char buf[256];
-	char *start_loc;
-	int fd, res;
-	output_bpc_t info;
-
-	fd = igt_debugfs_connector_dir(data->fd, data->output->name, O_RDONLY);
-	igt_assert(fd >= 0);
-
-	res = igt_debugfs_simple_read(fd, "output_bpc", buf, sizeof(buf));
-
-	igt_require(res > 0);
-
-	close(fd);
-
-	igt_assert(start_loc = strstr(buf, "Current: "));
-	igt_assert_eq(sscanf(start_loc, "Current: %u", &info.current), 1);
-
-	igt_assert(start_loc = strstr(buf, "Maximum: "));
-	igt_assert_eq(sscanf(start_loc, "Maximum: %u", &info.maximum), 1);
-
-	return info;
-}
-
-/* Verifies that connector has the correct output bpc. */
-static void assert_output_bpc(data_t *data, unsigned int bpc)
-{
-	output_bpc_t info = get_output_bpc(data);
-
-	igt_require_f(info.maximum >= bpc,
-		      "Monitor doesn't support %u bpc, max is %u\n", bpc,
-		      info.maximum);
-
-	igt_assert_eq(info.current, bpc);
-}
-
 /* Fills the FB with a test HDR pattern. */
 static void draw_hdr_pattern(igt_fb_t *fb)
 {
@@ -204,12 +166,7 @@ static void test_bpc_switch_on_output(data_t *data, enum pipe pipe,
 	/* Start in 8bpc. */
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	/*
-	 * i915 driver doesn't expose max bpc as debugfs entry,
-	 * so limiting assert only for amd driver.
-	 */
-	if (is_amdgpu_device(data->fd))
-		assert_output_bpc(data, 8);
+	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
 
 	/*
 	 * amdgpu requires a primary plane when the CRTC is enabled.
@@ -223,8 +180,7 @@ static void test_bpc_switch_on_output(data_t *data, enum pipe pipe,
 	/* Switch to 10bpc. */
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	if (is_amdgpu_device(data->fd))
-		assert_output_bpc(data, 10);
+	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
 
 	/* Verify that the CRC are equal after DPMS or suspend. */
 	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
@@ -234,8 +190,7 @@ static void test_bpc_switch_on_output(data_t *data, enum pipe pipe,
 	/* Drop back to 8bpc. */
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	if (is_amdgpu_device(data->fd))
-		assert_output_bpc(data, 8);
+	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
 
 	/* CRC capture is clamped to 8bpc, so capture should match. */
 	igt_assert_crc_equal(&ref_crc, &new_crc);
@@ -427,15 +382,13 @@ static void test_static_toggle(data_t *data, enum pipe pipe,
 	set_hdr_output_metadata(data, NULL);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	if (is_amdgpu_device(data->fd))
-		assert_output_bpc(data, 8);
+	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
 
 	/* Apply HDR metadata and 10bpc. We expect a modeset for entering. */
 	set_hdr_output_metadata(data, &hdr);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	if (is_amdgpu_device(data->fd))
-		assert_output_bpc(data, 10);
+	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
 
 	/* Verify that the CRC are equal after DPMS or suspend. */
 	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
@@ -446,8 +399,7 @@ static void test_static_toggle(data_t *data, enum pipe pipe,
 	set_hdr_output_metadata(data, NULL);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	if (is_amdgpu_device(data->fd))
-		assert_output_bpc(data, 8);
+	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
 
 	igt_assert_crc_equal(&ref_crc, &new_crc);
 
@@ -506,16 +458,14 @@ static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output)
 	igt_plane_set_size(data->primary, data->w, data->h);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	if (is_amdgpu_device(data->fd))
-		assert_output_bpc(data, 8);
+	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
 
 	/* Enter HDR, a modeset is allowed here. */
 	fill_hdr_output_metadata_st2048(&hdr);
 	set_hdr_output_metadata(data, &hdr);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	if (is_amdgpu_device(data->fd))
-		assert_output_bpc(data, 10);
+	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
 
 	igt_pipe_crc_collect_crc(data->pipe_crc, &ref_crc);
 
@@ -548,8 +498,7 @@ static void test_static_swap(data_t *data, enum pipe pipe, igt_output_t *output)
 	set_hdr_output_metadata(data, NULL);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-	if (is_amdgpu_device(data->fd))
-		assert_output_bpc(data, 8);
+	igt_assert_output_bpc_equal(data->fd, pipe, output->name, 8);
 
 	/* Verify that the CRC didn't change while cycling metadata. */
 	igt_assert_crc_equal(&ref_crc, &new_crc);
-- 
2.35.1
