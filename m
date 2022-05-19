Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2CF011A3C5
 for <igt-dev@lists.freedesktop.org>; Thu, 19 May 2022 11:36:06 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 19 May 2022 17:05:42 +0530
Message-Id: <20220519113542.31219-5-anshuman.gupta@intel.com>
In-Reply-To: <20220519113542.31219-1-anshuman.gupta@intel.com>
References: <20220519113542.31219-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 4/4] i915_pm_rpm: rpm resume by user
 forcewake
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, Chris Wilson <chris.p.wilson@intel.com>,
 badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Few gem rpm tests relies on enabling kms crtc in order to
trigger rpm resume but on headless platforms these tests
skip. Let it trigger the rpm resume by taking user
forcewake.

v2:
- removed has_runtime_pm cond from
  enable_one_screen_or_forcewake_and_wait(). [Ashutosh]
- removed if (ms_data.res) cond from basic_subtest(). [Ashutosh]
- clear forcewake in both only for headless. [Ashutosh]
v3:
- s/disable_all_screens_or_clr_forcewake_and_wait/
  disable_all_screens_or_forcewake_put_and_wait. [Ashutosh]
- s/enable_one_screen_or_forcewake_and_wait/
  enable_one_screen_or_forcewake_get_and_wait. [Ashutosh]
- Removed if (!default_mode_params) cond. [Ashutosh]
- s/clear_forcewake/forcewake_put/

Cc: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/i915_pm_rpm.c | 78 ++++++++++++++++++++++++++++++----------
 1 file changed, 59 insertions(+), 19 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index b63367725b..bf145b6cc6 100644
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
+enable_one_screen_or_forcewake_get_and_wait(struct mode_set_data *data)
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
+	if (headless) {
+		data->fw_fd = igt_open_forcewake_handle(drm_fd);
+		igt_require(data->fw_fd > 0);
+	}
+	igt_assert(wait_for_active());
+}
+
+static void forcewake_put(struct mode_set_data *data)
+{
+	if (data->fw_fd <= 0)
+		return;
+
+	data->fw_fd = close(data->fw_fd);
+	igt_assert_eq(data->fw_fd, 0);
+}
+
+static void
+disable_all_screens_or_forcewake_put_and_wait(struct mode_set_data *data)
+{
+	forcewake_put(data);
+	disable_all_screens(data);
+	igt_assert(wait_for_suspended());
+}
+
 static drmModePropertyBlobPtr get_connector_edid(drmModeConnectorPtr connector,
 						 int index)
 {
@@ -841,8 +878,8 @@ static void basic_subtest(void)
 {
 	disable_all_screens_and_wait(&ms_data);
 
-	if (ms_data.res)
-		enable_one_screen_and_wait(&ms_data);
+	enable_one_screen_or_forcewake_get_and_wait(&ms_data);
+	forcewake_put(&ms_data);
 
 	/* XXX Also we can test wake up via exec nop */
 }
@@ -1078,7 +1115,7 @@ static void gem_mmap_args(const struct mmap_offset *t,
 	uint8_t *gem_buf;
 
 	/* Create, map and set data while the device is active. */
-	enable_one_screen_and_wait(&ms_data);
+	enable_one_screen_or_forcewake_get_and_wait(&ms_data);
 
 	handle = gem_create_in_memory_region_list(drm_fd, buf_size, mem_regions, 1);
 
@@ -1093,7 +1130,7 @@ static void gem_mmap_args(const struct mmap_offset *t,
 		igt_assert(gem_buf[i] == (i & 0xFF));
 
 	/* Now suspend, read and modify. */
-	disable_all_screens_and_wait(&ms_data);
+	disable_all_screens_or_forcewake_put_and_wait(&ms_data);
 
 	for (i = 0; i < buf_size; i++)
 		igt_assert(gem_buf[i] == (i & 0xFF));
@@ -1104,7 +1141,7 @@ static void gem_mmap_args(const struct mmap_offset *t,
 	igt_assert(wait_for_suspended());
 
 	/* Now resume and see if it's still there. */
-	enable_one_screen_and_wait(&ms_data);
+	enable_one_screen_or_forcewake_get_and_wait(&ms_data);
 	for (i = 0; i < buf_size; i++)
 		igt_assert(gem_buf[i] == (~i & 0xFF));
 
@@ -1112,7 +1149,7 @@ static void gem_mmap_args(const struct mmap_offset *t,
 
 	/* Now the opposite: suspend, and try to create the mmap while
 	 * suspended. */
-	disable_all_screens_and_wait(&ms_data);
+	disable_all_screens_or_forcewake_put_and_wait(&ms_data);
 
 	gem_buf = __gem_mmap_offset(drm_fd, handle, 0, buf_size,
 				    PROT_READ | PROT_WRITE, t->type);
@@ -1129,12 +1166,13 @@ static void gem_mmap_args(const struct mmap_offset *t,
 	igt_assert(wait_for_suspended());
 
 	/* Resume and check if it's still there. */
-	enable_one_screen_and_wait(&ms_data);
+	enable_one_screen_or_forcewake_get_and_wait(&ms_data);
 	for (i = 0; i < buf_size; i++)
 		igt_assert(gem_buf[i] == (i & 0xFF));
 
 	igt_assert(munmap(gem_buf, buf_size) == 0);
 	gem_close(drm_fd, handle);
+	forcewake_put(&ms_data);
 }
 
 static void gem_pread_subtest(void)
@@ -1152,7 +1190,7 @@ static void gem_pread_subtest(void)
 	memset(read_buf, 0, buf_size);
 
 	/* Create and set data while the device is active. */
-	enable_one_screen_and_wait(&ms_data);
+	enable_one_screen_or_forcewake_get_and_wait(&ms_data);
 
 	handle = gem_create(drm_fd, buf_size);
 
@@ -1167,7 +1205,7 @@ static void gem_pread_subtest(void)
 		igt_assert(cpu_buf[i] == read_buf[i]);
 
 	/* Now suspend, read and modify. */
-	disable_all_screens_and_wait(&ms_data);
+	disable_all_screens_or_forcewake_put_and_wait(&ms_data);
 
 	memset(read_buf, 0, buf_size);
 	gem_read(drm_fd, handle, 0, read_buf, buf_size);
@@ -1182,7 +1220,7 @@ static void gem_pread_subtest(void)
 	igt_assert(wait_for_suspended());
 
 	/* Now resume and see if it's still there. */
-	enable_one_screen_and_wait(&ms_data);
+	enable_one_screen_or_forcewake_get_and_wait(&ms_data);
 
 	memset(read_buf, 0, buf_size);
 	gem_read(drm_fd, handle, 0, read_buf, buf_size);
@@ -1194,6 +1232,7 @@ static void gem_pread_subtest(void)
 
 	free(cpu_buf);
 	free(read_buf);
+	forcewake_put(&ms_data);
 }
 
 /* Paints a square of color $color, size $width x $height, at position $x x $y
@@ -1307,7 +1346,7 @@ static void gem_execbuf_subtest(struct drm_i915_gem_memory_class_instance *mem_r
 	gem_require_blitter(drm_fd);
 
 	/* Create and set data while the device is active. */
-	enable_one_screen_and_wait(&ms_data);
+	enable_one_screen_or_forcewake_get_and_wait(&ms_data);
 
 	handle = gem_create_in_memory_region_list(drm_fd, dst_size, mem_regions, 1);
 
@@ -1317,7 +1356,7 @@ static void gem_execbuf_subtest(struct drm_i915_gem_memory_class_instance *mem_r
 	gem_write(drm_fd, handle, 0, cpu_buf, dst_size);
 
 	/* Now suspend and try it. */
-	disable_all_screens_and_wait(&ms_data);
+	disable_all_screens_or_forcewake_put_and_wait(&ms_data);
 
 	color = 0x12345678;
 	submit_blt_cmd(handle, dst_size, sq_x, sq_y, sq_w, sq_h, pitch, color,
@@ -1339,7 +1378,7 @@ static void gem_execbuf_subtest(struct drm_i915_gem_memory_class_instance *mem_r
 	}
 
 	/* Now resume and check for it again. */
-	enable_one_screen_and_wait(&ms_data);
+	enable_one_screen_or_forcewake_get_and_wait(&ms_data);
 
 	memset(cpu_buf, 0, dst_size);
 	gem_read(drm_fd, handle, 0, cpu_buf, dst_size);
@@ -1362,7 +1401,7 @@ static void gem_execbuf_subtest(struct drm_i915_gem_memory_class_instance *mem_r
 	submit_blt_cmd(handle, dst_size, sq_x, sq_y, sq_w, sq_h, pitch, color,
 		       &presumed_offset);
 
-	disable_all_screens_and_wait(&ms_data);
+	disable_all_screens_or_forcewake_put_and_wait(&ms_data);
 
 	memset(cpu_buf, 0, dst_size);
 	gem_read(drm_fd, handle, 0, cpu_buf, dst_size);
@@ -1520,10 +1559,9 @@ static void pci_d3_state_subtest(void)
 	disable_all_screens_and_wait(&ms_data);
 	igt_assert(igt_wait(device_in_pci_d3(), 2000, 100));
 
-	if (ms_data.res) {
-		enable_one_screen_and_wait(&ms_data);
-		igt_assert(!device_in_pci_d3());
-	}
+	enable_one_screen_or_forcewake_get_and_wait(&ms_data);
+	igt_assert(!device_in_pci_d3());
+	forcewake_put(&ms_data);
 }
 
 __noreturn static void stay_subtest(void)
@@ -2201,8 +2239,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		pm_test_caching();
 	}
 
-	igt_fixture
+	igt_fixture {
 		teardown_environment(true);
+		forcewake_put(&ms_data);
+	}
 
 	igt_subtest("module-reload") {
 		igt_debug("Reload w/o display\n");
-- 
2.26.2
