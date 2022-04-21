Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B9C10E44B
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Apr 2022 17:03:35 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 21 Apr 2022 22:32:45 +0530
Message-Id: <20220421170245.11898-4-anshuman.gupta@intel.com>
In-Reply-To: <20220421170245.11898-1-anshuman.gupta@intel.com>
References: <20220421170245.11898-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] i915_pm_rpm: rpm resume by user
 forcewake
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris.p.wilson@intel.com>, badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Few gem rpm tests relies on enabling kms crtc in order to
trigger rpm resume but on headless platforms these tests
skips. Let it triggered the rpm resume by taking user
forcewake.

Cc: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 tests/i915/i915_pm_rpm.c | 76 +++++++++++++++++++++++++++++++---------
 1 file changed, 60 insertions(+), 16 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 7a0176b2f..a325f59b9 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -99,6 +99,7 @@ struct mode_set_data {
 	igt_display_t display;
 
 	uint32_t devid;
+	int fw_fd;
 };
 
 /* Stuff we query at different times so we can compare. */
@@ -369,6 +370,42 @@ static void enable_one_screen(struct mode_set_data *data)
 	igt_assert(wait_for_active()); \
 } while (0)
 
+static void
+enable_one_screen_or_forcewake_and_wait(struct mode_set_data *data)
+{
+	bool headless;
+
+	/* Try to resume by enabling any type of display */
+	headless = !enable_one_screen_with_type(data, SCREEN_TYPE_ANY);
+
+	/*
+	 * Get User Forcewake to trigger rpm resume in case of headless
+	 * as well as no display being connected.
+	 */
+	if (headless && has_runtime_pm) {
+		data->fw_fd = igt_open_forcewake_handle(drm_fd);
+		igt_require(data->fw_fd > 0);
+	}
+	igt_assert(wait_for_active());
+}
+
+static void clear_forcewake(struct mode_set_data *data)
+{
+	if (data->fw_fd <= 0)
+		return;
+
+	data->fw_fd = close(data->fw_fd);
+	igt_assert_eq(data->fw_fd, 0);
+}
+
+static void
+disable_all_screens_or_clr_forcewake_and_wait(struct mode_set_data *data)
+{
+	clear_forcewake(data);
+	disable_all_screens(data);
+	igt_assert(wait_for_suspended());
+}
+
 static drmModePropertyBlobPtr get_connector_edid(drmModeConnectorPtr connector,
 						 int index)
 {
@@ -842,8 +879,10 @@ static void basic_subtest(void)
 {
 	disable_all_screens_and_wait(&ms_data);
 
-	if (ms_data.res)
-		enable_one_screen_and_wait(&ms_data);
+	if (ms_data.res) {
+		enable_one_screen_or_forcewake_and_wait(&ms_data);
+		clear_forcewake(&ms_data);
+	}
 
 	/* XXX Also we can test wake up via exec nop */
 }
@@ -1078,7 +1117,7 @@ static void gem_mmap_args(const struct mmap_offset *t)
 	uint8_t *gem_buf;
 
 	/* Create, map and set data while the device is active. */
-	enable_one_screen_and_wait(&ms_data);
+	enable_one_screen_or_forcewake_and_wait(&ms_data);
 
 	handle = gem_create(drm_fd, buf_size);
 
@@ -1093,7 +1132,7 @@ static void gem_mmap_args(const struct mmap_offset *t)
 		igt_assert(gem_buf[i] == (i & 0xFF));
 
 	/* Now suspend, read and modify. */
-	disable_all_screens_and_wait(&ms_data);
+	disable_all_screens_or_clr_forcewake_and_wait(&ms_data);
 
 	for (i = 0; i < buf_size; i++)
 		igt_assert(gem_buf[i] == (i & 0xFF));
@@ -1104,7 +1143,7 @@ static void gem_mmap_args(const struct mmap_offset *t)
 	igt_assert(wait_for_suspended());
 
 	/* Now resume and see if it's still there. */
-	enable_one_screen_and_wait(&ms_data);
+	enable_one_screen_or_forcewake_and_wait(&ms_data);
 	for (i = 0; i < buf_size; i++)
 		igt_assert(gem_buf[i] == (~i & 0xFF));
 
@@ -1112,7 +1151,7 @@ static void gem_mmap_args(const struct mmap_offset *t)
 
 	/* Now the opposite: suspend, and try to create the mmap while
 	 * suspended. */
-	disable_all_screens_and_wait(&ms_data);
+	disable_all_screens_or_clr_forcewake_and_wait(&ms_data);
 
 	gem_buf = __gem_mmap_offset(drm_fd, handle, 0, buf_size,
 				    PROT_READ | PROT_WRITE, t->type);
@@ -1129,12 +1168,13 @@ static void gem_mmap_args(const struct mmap_offset *t)
 	igt_assert(wait_for_suspended());
 
 	/* Resume and check if it's still there. */
-	enable_one_screen_and_wait(&ms_data);
+	enable_one_screen_or_forcewake_and_wait(&ms_data);
 	for (i = 0; i < buf_size; i++)
 		igt_assert(gem_buf[i] == (i & 0xFF));
 
 	igt_assert(munmap(gem_buf, buf_size) == 0);
 	gem_close(drm_fd, handle);
+	clear_forcewake(&ms_data);
 }
 
 static void gem_pread_subtest(void)
@@ -1152,7 +1192,7 @@ static void gem_pread_subtest(void)
 	memset(read_buf, 0, buf_size);
 
 	/* Create and set data while the device is active. */
-	enable_one_screen_and_wait(&ms_data);
+	enable_one_screen_or_forcewake_and_wait(&ms_data);
 
 	handle = gem_create(drm_fd, buf_size);
 
@@ -1167,7 +1207,7 @@ static void gem_pread_subtest(void)
 		igt_assert(cpu_buf[i] == read_buf[i]);
 
 	/* Now suspend, read and modify. */
-	disable_all_screens_and_wait(&ms_data);
+	disable_all_screens_or_clr_forcewake_and_wait(&ms_data);
 
 	memset(read_buf, 0, buf_size);
 	gem_read(drm_fd, handle, 0, read_buf, buf_size);
@@ -1182,7 +1222,7 @@ static void gem_pread_subtest(void)
 	igt_assert(wait_for_suspended());
 
 	/* Now resume and see if it's still there. */
-	enable_one_screen_and_wait(&ms_data);
+	enable_one_screen_or_forcewake_and_wait(&ms_data);
 
 	memset(read_buf, 0, buf_size);
 	gem_read(drm_fd, handle, 0, read_buf, buf_size);
@@ -1194,6 +1234,7 @@ static void gem_pread_subtest(void)
 
 	free(cpu_buf);
 	free(read_buf);
+	clear_forcewake(&ms_data);
 }
 
 /* Paints a square of color $color, size $width x $height, at position $x x $y
@@ -1307,7 +1348,7 @@ static void gem_execbuf_subtest(void)
 	gem_require_blitter(drm_fd);
 
 	/* Create and set data while the device is active. */
-	enable_one_screen_and_wait(&ms_data);
+	enable_one_screen_or_forcewake_and_wait(&ms_data);
 
 	handle = gem_create(drm_fd, dst_size);
 
@@ -1317,7 +1358,7 @@ static void gem_execbuf_subtest(void)
 	gem_write(drm_fd, handle, 0, cpu_buf, dst_size);
 
 	/* Now suspend and try it. */
-	disable_all_screens_and_wait(&ms_data);
+	disable_all_screens_or_clr_forcewake_and_wait(&ms_data);
 
 	color = 0x12345678;
 	submit_blt_cmd(handle, dst_size, sq_x, sq_y, sq_w, sq_h, pitch, color,
@@ -1339,7 +1380,7 @@ static void gem_execbuf_subtest(void)
 	}
 
 	/* Now resume and check for it again. */
-	enable_one_screen_and_wait(&ms_data);
+	enable_one_screen_or_forcewake_and_wait(&ms_data);
 
 	memset(cpu_buf, 0, dst_size);
 	gem_read(drm_fd, handle, 0, cpu_buf, dst_size);
@@ -1362,7 +1403,7 @@ static void gem_execbuf_subtest(void)
 	submit_blt_cmd(handle, dst_size, sq_x, sq_y, sq_w, sq_h, pitch, color,
 		       &presumed_offset);
 
-	disable_all_screens_and_wait(&ms_data);
+	disable_all_screens_or_clr_forcewake_and_wait(&ms_data);
 
 	memset(cpu_buf, 0, dst_size);
 	gem_read(drm_fd, handle, 0, cpu_buf, dst_size);
@@ -1521,8 +1562,9 @@ static void pci_d3_state_subtest(void)
 	igt_assert(igt_wait(device_in_pci_d3(), 2000, 100));
 
 	if (ms_data.res) {
-		enable_one_screen_and_wait(&ms_data);
+		enable_one_screen_or_forcewake_and_wait(&ms_data);
 		igt_assert(!device_in_pci_d3());
+		clear_forcewake(&ms_data);
 	}
 }
 
@@ -2195,8 +2237,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		pm_test_caching();
 	}
 
-	igt_fixture
+	igt_fixture {
 		teardown_environment(false);
+		clear_forcewake(&ms_data);
+	}
 
 	igt_subtest("module-reload") {
 		igt_debug("Reload w/o display\n");
-- 
2.26.2
