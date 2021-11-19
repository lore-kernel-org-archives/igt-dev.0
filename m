Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2048.outbound.protection.outlook.com [40.107.236.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A69D6ECEB
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Nov 2021 15:54:47 +0000 (UTC)
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Date: Fri, 19 Nov 2021 10:53:44 -0500
Message-ID: <20211119155344.2709274-3-Rodrigo.Siqueira@amd.com>
In-Reply-To: <20211119155344.2709274-1-Rodrigo.Siqueira@amd.com>
References: <20211119155344.2709274-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/amdgpu: Add multi-eDP support to
 ABM test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, harry.wentland@amd.com, Nicholas.Choi@amd.com, markyacoub@chromium.org
Cc: Mikita Lipski <mikita.lipski@amd.com>, Roman Li <romli@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mikita Lipski <mikita.lipski@amd.com>

[why]
Since driver can now support multiple eDPs and Debugfs structure for
backlight changed per connector - the test should then iterate through
all eDP connectors.

[how]
1. Execute each subtest on all eDP outputs connected.
2. Change helper functions to be used per connector.
3. Since debugfs current/target backlight entries are per connector now,
   change the sanity test to checking if eDP connectors present.
   The individual test should fail if entries are not found.
4. Update abm_gradual test per new ABM behavior:
 - convergence time is reduced;
 - transition can be observed within 1 sec.

Signed-off-by: Mikita Lipski <mikita.lipski@amd.com>
Signed-off-by: Roman Li <romli@amd.com>
---
 tests/amdgpu/amd_abm.c | 268 +++++++++++++++++++++++------------------
 1 file changed, 154 insertions(+), 114 deletions(-)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index 69c34882..9400ed80 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -32,32 +32,52 @@
 #include <fcntl.h>
 #include <time.h>
 
+#define DEBUGFS_CURRENT_BACKLIGHT_PWM "amdgpu_current_backlight_pwm"
+#define DEBUGFS_TARGET_BACKLIGHT_PWM "amdgpu_target_backlight_pwm"
 #define BACKLIGHT_PATH "/sys/class/backlight/amdgpu_bl0"
 
 typedef struct data {
 	igt_display_t display;
 	int drm_fd;
-	int debugfs;
-	uint32_t output_id;
 	uint32_t abm_prop_id;
 } data_t;
 
-static int read_current_backlight_pwm(int debugfs_dir)
+
+
+static int read_current_backlight_pwm(int drm_fd, char *connector_name)
 {
 	char buf[20];
+	int fd;
+
+	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
 
-	igt_debugfs_simple_read(debugfs_dir, "amdgpu_current_backlight_pwm",
-			 buf, sizeof(buf));
+	if (fd < 0) {
+		igt_info("Couldn't open connector %s debugfs directory\n",
+			 connector_name);
+		return false;
+	}
+
+	igt_debugfs_simple_read(fd, DEBUGFS_CURRENT_BACKLIGHT_PWM, buf, sizeof(buf));
+	close(fd);
 
 	return strtol(buf, NULL, 0);
 }
 
-static int read_target_backlight_pwm(int debugfs_dir)
+static int read_target_backlight_pwm(int drm_fd, char *connector_name)
 {
 	char buf[20];
+	int fd;
+
+	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
 
-	igt_debugfs_simple_read(debugfs_dir, "amdgpu_target_backlight_pwm",
-			 buf, sizeof(buf));
+	if (fd < 0) {
+		igt_info("Couldn't open connector %s debugfs directory\n",
+			 connector_name);
+		return false;
+	}
+
+	igt_debugfs_simple_read(fd, DEBUGFS_TARGET_BACKLIGHT_PWM, buf, sizeof(buf));
+	close(fd);
 
 	return strtol(buf, NULL, 0);
 }
@@ -84,13 +104,13 @@ static int backlight_write_brightness(int value)
 	return 0;
 }
 
-static void set_abm_level(data_t *data, int level)
+static void set_abm_level(int drm_fd, int level, uint32_t abm_prop_id, uint32_t output_id)
 {
 	uint32_t type = DRM_MODE_OBJECT_CONNECTOR;
 	int ret;
 
-	ret = drmModeObjectSetProperty(data->drm_fd, data->output_id, type,
-				       data->abm_prop_id, level);
+	ret = drmModeObjectSetProperty(drm_fd, output_id, type,
+				       abm_prop_id, level);
 	igt_assert_eq(ret, 0);
 }
 
@@ -122,30 +142,23 @@ static int backlight_read_max_brightness(int *result)
 static void test_init(data_t *data)
 {
 	igt_display_t *display = &data->display;
-	int ret, i;
-	char buf[20];
+	int i;
 	bool abm_prop_exists;
 	uint32_t type = DRM_MODE_OBJECT_CONNECTOR;
+	uint32_t output_id;
 
-	ret = igt_debugfs_simple_read(data->debugfs, "amdgpu_current_backlight_pwm",
-			 buf, sizeof(buf));
-
-	if (ret < 0)
-		igt_skip("No current backlight debugfs entry.\n");
-
-	ret = igt_debugfs_simple_read(data->debugfs, "amdgpu_target_backlight_pwm",
-			 buf, sizeof(buf));
-
-	if (ret < 0)
-		igt_skip("No target backlight debugfs entry.\n");
+	for (i = 0; i < display->n_outputs; i++)
+		if (display->outputs[i].config.connector->connector_type == DRM_MODE_CONNECTOR_eDP)
+			break;
+	igt_skip_on_f(i ==  display->n_outputs, "no eDP connector found\n");
 
 	abm_prop_exists = false;
 
 	for (i = 0; i < display->n_outputs; i++) {
-		data->output_id = display->outputs[i].id;
+		output_id = display->outputs[i].id;
 
 		abm_prop_exists = kmstest_get_property(
-			data->drm_fd, data->output_id, type, "abm level",
+			data->drm_fd, output_id, type, "abm level",
 			&data->abm_prop_id, NULL, NULL);
 
 		if (abm_prop_exists)
@@ -157,25 +170,34 @@ static void test_init(data_t *data)
 }
 
 
-static void backlight_dpms_cycle(data_t *data, igt_output_t *output)
+static void backlight_dpms_cycle(data_t *data)
 {
 	int ret;
 	int max_brightness;
 	int pwm_1, pwm_2;
+	igt_output_t *output;
+	enum pipe pipe;
 
-	ret = backlight_read_max_brightness(&max_brightness);
-	igt_assert_eq(ret, 0);
+	for_each_pipe_with_valid_output(&data->display, pipe, output) {
+		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+			continue;
+
+		igt_info("Testing backlight dpms on %s\n", output->name);
+
+		ret = backlight_read_max_brightness(&max_brightness);
+		igt_assert_eq(ret, 0);
 
-	set_abm_level(data, 0);
-	backlight_write_brightness(max_brightness / 2);
-	usleep(100000);
-	pwm_1 = read_target_backlight_pwm(data->debugfs);
+		set_abm_level(data->drm_fd, 0, data->abm_prop_id, output->id);
+		backlight_write_brightness(max_brightness / 2);
+		usleep(100000);
+		pwm_1 = read_target_backlight_pwm(data->drm_fd, output->name);
 
-	kmstest_set_connector_dpms(data->drm_fd, output->config.connector, DRM_MODE_DPMS_OFF);
-	kmstest_set_connector_dpms(data->drm_fd, output->config.connector, DRM_MODE_DPMS_ON);
-	usleep(100000);
-	pwm_2 = read_target_backlight_pwm(data->debugfs);
-	igt_assert_eq(pwm_1, pwm_2);
+		kmstest_set_connector_dpms(data->drm_fd, output->config.connector, DRM_MODE_DPMS_OFF);
+		kmstest_set_connector_dpms(data->drm_fd, output->config.connector, DRM_MODE_DPMS_ON);
+		usleep(100000);
+		pwm_2 = read_target_backlight_pwm(data->drm_fd, output->name);
+		igt_assert_eq(pwm_1, pwm_2);
+	}
 }
 
 static void backlight_monotonic_basic(data_t *data)
@@ -185,26 +207,31 @@ static void backlight_monotonic_basic(data_t *data)
 	int prev_pwm, pwm;
 	int brightness_step;
 	int brightness;
+	enum pipe pipe;
+	igt_output_t *output;
 
-	ret = backlight_read_max_brightness(&max_brightness);
-	igt_assert_eq(ret, 0);
+	for_each_pipe_with_valid_output(&data->display, pipe, output) {
+		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+			continue;
+		ret = backlight_read_max_brightness(&max_brightness);
+		igt_assert_eq(ret, 0);
 
-	brightness_step = max_brightness / 10;
+		brightness_step = max_brightness / 10;
 
-	set_abm_level(data, 0);
-	backlight_write_brightness(max_brightness);
-	usleep(100000);
-	prev_pwm = read_target_backlight_pwm(data->debugfs);
-	for (brightness = max_brightness - brightness_step;
-	     brightness > 0;
-	     brightness -= brightness_step) {
-		backlight_write_brightness(brightness);
+		set_abm_level(data->drm_fd, 0, data->abm_prop_id, output->id);
+		backlight_write_brightness(max_brightness);
 		usleep(100000);
-		pwm = read_target_backlight_pwm(data->debugfs);
-		igt_assert(pwm < prev_pwm);
-		prev_pwm = pwm;
+		prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
+		for (brightness = max_brightness - brightness_step;
+			brightness > 0;
+			brightness -= brightness_step) {
+			backlight_write_brightness(brightness);
+			usleep(100000);
+			pwm = read_target_backlight_pwm(data->drm_fd, output->name);
+			igt_assert(pwm < prev_pwm);
+			prev_pwm = pwm;
+		}
 	}
-
 }
 
 static void backlight_monotonic_abm(data_t *data)
@@ -214,24 +241,30 @@ static void backlight_monotonic_abm(data_t *data)
 	int prev_pwm, pwm;
 	int brightness_step;
 	int brightness;
+	enum pipe pipe;
+	igt_output_t *output;
 
-	ret = backlight_read_max_brightness(&max_brightness);
-	igt_assert_eq(ret, 0);
+	for_each_pipe_with_valid_output(&data->display, pipe, output) {
+		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+			continue;
+		ret = backlight_read_max_brightness(&max_brightness);
+		igt_assert_eq(ret, 0);
 
-	brightness_step = max_brightness / 10;
-	for (i = 1; i < 5; i++) {
-		set_abm_level(data, i);
-		backlight_write_brightness(max_brightness);
-		usleep(100000);
-		prev_pwm = read_target_backlight_pwm(data->debugfs);
-		for (brightness = max_brightness - brightness_step;
-		     brightness > 0;
-		     brightness -= brightness_step) {
-			backlight_write_brightness(brightness);
+		brightness_step = max_brightness / 10;
+		for (i = 1; i < 5; i++) {
+			set_abm_level(data->drm_fd, 0, data->abm_prop_id, output->id);
+			backlight_write_brightness(max_brightness);
 			usleep(100000);
-			pwm = read_target_backlight_pwm(data->debugfs);
-			igt_assert(pwm < prev_pwm);
-			prev_pwm = pwm;
+			prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
+			for (brightness = max_brightness - brightness_step;
+				brightness > 0;
+				brightness -= brightness_step) {
+				backlight_write_brightness(brightness);
+				usleep(100000);
+				pwm = read_target_backlight_pwm(data->drm_fd, output->name);
+				igt_assert(pwm < prev_pwm);
+				prev_pwm = pwm;
+			}
 		}
 	}
 }
@@ -241,68 +274,82 @@ static void abm_enabled(data_t *data)
 	int ret, i;
 	int max_brightness;
 	int pwm, prev_pwm, pwm_without_abm;
+	enum pipe pipe;
+	igt_output_t *output;
 
-	ret = backlight_read_max_brightness(&max_brightness);
-	igt_assert_eq(ret, 0);
+	for_each_pipe_with_valid_output(&data->display, pipe, output) {
+		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+			continue;
 
-	set_abm_level(data, 0);
-	backlight_write_brightness(max_brightness);
-	usleep(100000);
-	prev_pwm = read_target_backlight_pwm(data->debugfs);
-	pwm_without_abm = prev_pwm;
+		ret = backlight_read_max_brightness(&max_brightness);
+		igt_assert_eq(ret, 0);
 
-	for (i = 1; i < 5; i++) {
-		set_abm_level(data, i);
+		set_abm_level(data->drm_fd, 0, data->abm_prop_id, output->id);
+		backlight_write_brightness(max_brightness);
 		usleep(100000);
-		pwm = read_target_backlight_pwm(data->debugfs);
-		igt_assert(pwm <= prev_pwm);
-		igt_assert(pwm < pwm_without_abm);
-		prev_pwm = pwm;
-	}
+		prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
+		pwm_without_abm = prev_pwm;
 
+		for (i = 1; i < 5; i++) {
+			set_abm_level(data->drm_fd, i, data->abm_prop_id, output->id);
+			usleep(100000);
+			pwm = read_target_backlight_pwm(data->drm_fd, output->name);
+			igt_assert(pwm <= prev_pwm);
+			igt_assert(pwm < pwm_without_abm);
+			prev_pwm = pwm;
+		}
+	}
 }
 
 static void abm_gradual(data_t *data)
 {
 	int ret, i;
-	int convergence_delay = 30;
+	int convergence_delay = 10;
 	int prev_pwm, pwm, curr;
 	int max_brightness;
+	enum pipe pipe;
+	igt_output_t *output;
 
-	ret = backlight_read_max_brightness(&max_brightness);
-
-	igt_assert_eq(ret, 0);
+	for_each_pipe_with_valid_output(&data->display, pipe, output) {
+		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+			continue;
 
-	set_abm_level(data, 0);
-	backlight_write_brightness(max_brightness);
+		ret = backlight_read_max_brightness(&max_brightness);
 
-	sleep(convergence_delay);
-	prev_pwm = read_target_backlight_pwm(data->debugfs);
-	curr = read_current_backlight_pwm(data->debugfs);
+		igt_assert_eq(ret, 0);
 
-	igt_assert_eq(prev_pwm, curr);
-	set_abm_level(data, 4);
-	for (i = 0; i < 10; i++) {
-		usleep(100000);
-		pwm = read_current_backlight_pwm(data->debugfs);
-		igt_assert(pwm < prev_pwm);
-		prev_pwm = pwm;
-	}
+		set_abm_level(data->drm_fd, 0, data->abm_prop_id, output->id);
+		backlight_write_brightness(max_brightness);
 
-	sleep(convergence_delay - 1);
+		sleep(convergence_delay);
+		prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
+		curr = read_current_backlight_pwm(data->drm_fd, output->name);
 
-	prev_pwm = read_target_backlight_pwm(data->debugfs);
-	curr = read_current_backlight_pwm(data->debugfs);
+		igt_assert_eq(prev_pwm, curr);
+		set_abm_level(data->drm_fd, 4, data->abm_prop_id, output->id);
+		for (i = 0; i < 10; i++) {
+			usleep(100000);
+			pwm = read_current_backlight_pwm(data->drm_fd, output->name);
+			if (pwm == prev_pwm)
+				break;
+			igt_assert(pwm < prev_pwm);
+			prev_pwm = pwm;
+		}
 
-	igt_assert_eq(prev_pwm, curr);
+		if (i < 10)
+			igt_assert(i);
+		else {
+			sleep(convergence_delay - 1);
+			prev_pwm = read_target_backlight_pwm(data->drm_fd, output->name);
+			curr = read_current_backlight_pwm(data->drm_fd, output->name);
+			igt_assert_eq(prev_pwm, curr);
+		}
+	}
 }
 
 igt_main
 {
 	data_t data = {};
-	enum pipe pipe;
-	igt_output_t *output;
-
 	igt_skip_on_simulation();
 
 	igt_fixture {
@@ -311,22 +358,15 @@ igt_main
 		if (data.drm_fd == -1)
 			igt_skip("Not an amdgpu driver.\n");
 
-		data.debugfs = igt_debugfs_dir(data.drm_fd);
-
 		kmstest_set_vt_graphics_mode();
 
 		igt_display_require(&data.display, data.drm_fd);
 
 		test_init(&data);
-
-		for_each_pipe_with_valid_output(&data.display, pipe, output) {
-			if (output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP)
-				break;
-		}
 	}
 
 	igt_subtest("dpms_cycle")
-		backlight_dpms_cycle(&data, output);
+		backlight_dpms_cycle(&data);
 	igt_subtest("backlight_monotonic_basic")
 		backlight_monotonic_basic(&data);
 	igt_subtest("backlight_monotonic_abm")
-- 
2.25.1
