Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E2A10E041
 for <igt-dev@lists.freedesktop.org>; Wed, 18 May 2022 16:55:20 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 18 May 2022 22:24:54 +0530
Message-Id: <20220518165454.17352-5-anshuman.gupta@intel.com>
In-Reply-To: <20220518165454.17352-1-anshuman.gupta@intel.com>
References: <20220518165454.17352-1-anshuman.gupta@intel.com>
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

Cc: Chris Wilson <chris.p.wilson@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/i915_pm_rpm.c | 78 ++++++++++++++++++++++++++++++----------
 1 file changed, 59 insertions(+), 19 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index a6035e60b8..fe0175f31b 100644
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
+disable_all_screens_or_forcewake_put_and_wait(struct mode_set_data *data)
+{
+	clear_forcewake(data);
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
+	clear_forcewake(&ms_data);
 
 	/* XXX Also we can test wake up via exec nop */
 }
@@ -1077,7 +1114,7 @@ static void gem_mmap_args(const struct mmap_offset *t)
 	uint8_t *gem_buf;
 
 	/* Create, map and set data while the device is active. */
-	enable_one_screen_and_wait(&ms_data);
+	enable_one_screen_or_forcewake_get_and_wait(&ms_data);
 
 	handle = gem_create(drm_fd, buf_size);
 
@@ -1092,7 +1129,7 @@ static void gem_mmap_args(const struct mmap_offset *t)
 		igt_assert(gem_buf[i] == (i & 0xFF));
 
 	/* Now suspend, read and modify. */
-	disable_all_screens_and_wait(&ms_data);
+	disable_all_screens_or_forcewake_put_and_wait(&ms_data);
 
 	for (i = 0; i < buf_size; i++)
 		igt_assert(gem_buf[i] == (i & 0xFF));
@@ -1103,7 +1140,7 @@ static void gem_mmap_args(const struct mmap_offset *t)
 	igt_assert(wait_for_suspended());
 
 	/* Now resume and see if it's still there. */
-	enable_one_screen_and_wait(&ms_data);
+	enable_one_screen_or_forcewake_get_and_wait(&ms_data);
 	for (i = 0; i < buf_size; i++)
 		igt_assert(gem_buf[i] == (~i & 0xFF));
 
@@ -1111,7 +1148,7 @@ static void gem_mmap_args(const struct mmap_offset *t)
 
 	/* Now the opposite: suspend, and try to create the mmap while
 	 * suspended. */
-	disable_all_screens_and_wait(&ms_data);
+	disable_all_screens_or_forcewake_put_and_wait(&ms_data);
 
 	gem_buf = __gem_mmap_offset(drm_fd, handle, 0, buf_size,
 				    PROT_READ | PROT_WRITE, t->type);
@@ -1128,12 +1165,13 @@ static void gem_mmap_args(const struct mmap_offset *t)
 	igt_assert(wait_for_suspended());
 
 	/* Resume and check if it's still there. */
-	enable_one_screen_and_wait(&ms_data);
+	enable_one_screen_or_forcewake_get_and_wait(&ms_data);
 	for (i = 0; i < buf_size; i++)
 		igt_assert(gem_buf[i] == (i & 0xFF));
 
 	igt_assert(munmap(gem_buf, buf_size) == 0);
 	gem_close(drm_fd, handle);
+	clear_forcewake(&ms_data);
 }
 
 static void gem_pread_subtest(void)
@@ -1151,7 +1189,7 @@ static void gem_pread_subtest(void)
 	memset(read_buf, 0, buf_size);
 
 	/* Create and set data while the device is active. */
-	enable_one_screen_and_wait(&ms_data);
+	enable_one_screen_or_forcewake_get_and_wait(&ms_data);
 
 	handle = gem_create(drm_fd, buf_size);
 
@@ -1166,7 +1204,7 @@ static void gem_pread_subtest(void)
 		igt_assert(cpu_buf[i] == read_buf[i]);
 
 	/* Now suspend, read and modify. */
-	disable_all_screens_and_wait(&ms_data);
+	disable_all_screens_or_forcewake_put_and_wait(&ms_data);
 
 	memset(read_buf, 0, buf_size);
 	gem_read(drm_fd, handle, 0, read_buf, buf_size);
@@ -1181,7 +1219,7 @@ static void gem_pread_subtest(void)
 	igt_assert(wait_for_suspended());
 
 	/* Now resume and see if it's still there. */
-	enable_one_screen_and_wait(&ms_data);
+	enable_one_screen_or_forcewake_get_and_wait(&ms_data);
 
 	memset(read_buf, 0, buf_size);
 	gem_read(drm_fd, handle, 0, read_buf, buf_size);
@@ -1193,6 +1231,7 @@ static void gem_pread_subtest(void)
 
 	free(cpu_buf);
 	free(read_buf);
+	clear_forcewake(&ms_data);
 }
 
 /* Paints a square of color $color, size $width x $height, at position $x x $y
@@ -1306,7 +1345,7 @@ static void gem_execbuf_subtest(void)
 	gem_require_blitter(drm_fd);
 
 	/* Create and set data while the device is active. */
-	enable_one_screen_and_wait(&ms_data);
+	enable_one_screen_or_forcewake_get_and_wait(&ms_data);
 
 	handle = gem_create(drm_fd, dst_size);
 
@@ -1316,7 +1355,7 @@ static void gem_execbuf_subtest(void)
 	gem_write(drm_fd, handle, 0, cpu_buf, dst_size);
 
 	/* Now suspend and try it. */
-	disable_all_screens_and_wait(&ms_data);
+	disable_all_screens_or_forcewake_put_and_wait(&ms_data);
 
 	color = 0x12345678;
 	submit_blt_cmd(handle, dst_size, sq_x, sq_y, sq_w, sq_h, pitch, color,
@@ -1338,7 +1377,7 @@ static void gem_execbuf_subtest(void)
 	}
 
 	/* Now resume and check for it again. */
-	enable_one_screen_and_wait(&ms_data);
+	enable_one_screen_or_forcewake_get_and_wait(&ms_data);
 
 	memset(cpu_buf, 0, dst_size);
 	gem_read(drm_fd, handle, 0, cpu_buf, dst_size);
@@ -1361,7 +1400,7 @@ static void gem_execbuf_subtest(void)
 	submit_blt_cmd(handle, dst_size, sq_x, sq_y, sq_w, sq_h, pitch, color,
 		       &presumed_offset);
 
-	disable_all_screens_and_wait(&ms_data);
+	disable_all_screens_or_forcewake_put_and_wait(&ms_data);
 
 	memset(cpu_buf, 0, dst_size);
 	gem_read(drm_fd, handle, 0, cpu_buf, dst_size);
@@ -1519,10 +1558,9 @@ static void pci_d3_state_subtest(void)
 	disable_all_screens_and_wait(&ms_data);
 	igt_assert(igt_wait(device_in_pci_d3(), 2000, 100));
 
-	if (ms_data.res) {
-		enable_one_screen_and_wait(&ms_data);
-		igt_assert(!device_in_pci_d3());
-	}
+	enable_one_screen_or_forcewake_get_and_wait(&ms_data);
+	igt_assert(!device_in_pci_d3());
+	clear_forcewake(&ms_data);
 }
 
 __noreturn static void stay_subtest(void)
@@ -2194,8 +2232,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 		pm_test_caching();
 	}
 
-	igt_fixture
+	igt_fixture {
 		teardown_environment(true);
+		clear_forcewake(&ms_data);
+	}
 
 	igt_subtest("module-reload") {
 		igt_debug("Reload w/o display\n");
-- 
2.26.2
