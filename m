Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4832C6FAEE
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jan 2020 11:02:12 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 31 Jan 2020 11:02:01 +0000
Message-Id: <20200131110201.2533544-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib: Find the associated runtime-pm sysfs
 for the device
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Remove the hardcoded path to the igfx (00:00:02.00) and instead pass in
the fd of the DRM device we wish to control, and look up the associated
device/power/ under sysfs.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Imre Deak <imre.deak@intel.com>
---
 lib/igt_pm.c                   | 116 +++++++++++++++++++++++++--------
 lib/igt_pm.h                   |   2 +-
 tests/i915/i915_pm_backlight.c |   2 +-
 tests/i915/i915_pm_dc.c        |   4 +-
 tests/i915/i915_pm_rpm.c       |   2 +-
 tests/kms_vblank.c             |   2 +-
 tests/perf_pmu.c               |   2 +-
 7 files changed, 95 insertions(+), 35 deletions(-)

diff --git a/lib/igt_pm.c b/lib/igt_pm.c
index d96fee7a2..608bf0983 100644
--- a/lib/igt_pm.c
+++ b/lib/igt_pm.c
@@ -32,6 +32,7 @@
 #include <string.h>
 #include <unistd.h>
 #include <sys/stat.h>
+#include <sys/sysmacros.h>
 #include <sys/types.h>
 #include <dirent.h>
 
@@ -76,6 +77,8 @@ enum {
 int8_t *__sata_pm_policies;
 int __scsi_host_cnt;
 
+static int __igt_pm_power = -1;
+
 static char __igt_pm_audio_runtime_power_save[64];
 static char * __igt_pm_audio_runtime_control_path;
 static char __igt_pm_audio_runtime_control[64];
@@ -83,6 +86,33 @@ static char __igt_pm_audio_runtime_control[64];
 static void __igt_pm_sata_link_pm_exit_handler(int sig);
 static void __igt_pm_restore_sata_link_power_management(void);
 
+static int descend(int dir, const char *path)
+{
+	int fd;
+
+	if (dir == -1)
+		return dir;
+
+	fd = openat(dir, path, O_RDONLY);
+	close(dir);
+
+	return fd;
+}
+
+static int find_runtime_pm(int device)
+{
+	char path[128];
+	struct stat st;
+
+	if (fstat(device, &st) || !S_ISCHR(st.st_mode))
+		return -1;
+
+	snprintf(path, sizeof(path), "/sys/dev/char/%d:%d",
+		 major(st.st_rdev), minor(st.st_rdev));
+
+	return descend(open(path, O_RDONLY), "power");
+}
+
 static int __igt_pm_audio_restore_runtime_pm(void)
 {
 	int fd;
@@ -465,10 +495,6 @@ static void __igt_pm_sata_link_pm_exit_handler(int sig)
 	__igt_pm_restore_sata_link_power_management();
 }
 
-#define POWER_DIR "/sys/devices/pci0000:00/0000:00:02.0/power"
-/* We just leak this on exit ... */
-int pm_status_fd = -1;
-
 static char __igt_pm_runtime_autosuspend[64];
 static char __igt_pm_runtime_control[64];
 
@@ -476,10 +502,10 @@ static int __igt_restore_runtime_pm(void)
 {
 	int fd;
 
-	if (pm_status_fd < 0)
+	if (__igt_pm_power < 0)
 		return 0;
 
-	fd = open(POWER_DIR "/autosuspend_delay_ms", O_WRONLY);
+	fd = openat(__igt_pm_power, "autosuspend_delay_ms", O_WRONLY);
 	if (fd < 0)
 		return errno;
 
@@ -492,7 +518,7 @@ static int __igt_restore_runtime_pm(void)
 
 	close(fd);
 
-	fd = open(POWER_DIR "/control", O_WRONLY);
+	fd = openat(__igt_pm_power, "control", O_WRONLY);
 	if (fd < 0)
 		return errno;
 
@@ -505,8 +531,8 @@ static int __igt_restore_runtime_pm(void)
 
 	close(fd);
 
-	close(pm_status_fd);
-	pm_status_fd = -1;
+	close(__igt_pm_power);
+	__igt_pm_power = -1;
 
 	return 0;
 }
@@ -521,7 +547,7 @@ void igt_restore_runtime_pm(void)
 {
 	int ret;
 
-	if (pm_status_fd < 0)
+	if (__igt_pm_power < 0)
 		return;
 
 	igt_debug("Restoring runtime PM management to '%s' and '%s'\n",
@@ -549,15 +575,19 @@ static void __igt_pm_runtime_exit_handler(int sig)
  * Returns:
  * True if runtime pm is available, false otherwise.
  */
-bool igt_setup_runtime_pm(void)
+bool igt_setup_runtime_pm(int device)
 {
 	int fd;
 	ssize_t size;
 	char buf[6];
 
-	if (pm_status_fd >= 0)
+	if (__igt_pm_power != -1) /* XXX assume it's the same device! */
 		return true;
 
+	__igt_pm_power = find_runtime_pm(device);
+	if (__igt_pm_power < 0)
+		return false;
+
 	igt_pm_enable_audio_runtime_pm();
 
 	/*
@@ -565,9 +595,11 @@ bool igt_setup_runtime_pm(void)
 	 * test suite goes faster and we have a higher probability of
 	 * triggering race conditions.
 	 */
-	fd = open(POWER_DIR "/autosuspend_delay_ms", O_RDWR);
+	fd = openat(__igt_pm_power, "autosuspend_delay_ms", O_RDWR);
 	if (fd < 0) {
 		igt_pm_audio_restore_runtime_pm();
+		close(__igt_pm_power);
+		__igt_pm_power = -1;
 		return false;
 	}
 
@@ -585,6 +617,8 @@ bool igt_setup_runtime_pm(void)
 	if (size <= 0) {
 		close(fd);
 		igt_pm_audio_restore_runtime_pm();
+		close(__igt_pm_power);
+		__igt_pm_power = -1;
 		return false;
 	}
 
@@ -597,12 +631,15 @@ bool igt_setup_runtime_pm(void)
 
 	close(fd);
 
-	if (size != 2)
+	if (size != 2) {
+		close(__igt_pm_power);
+		__igt_pm_power = -1;
 		return false;
+	}
 
 	/* We know we support runtime PM, let's try to enable it now. */
-	fd = open(POWER_DIR "/control", O_RDWR);
-	igt_assert_f(fd >= 0, "Can't open " POWER_DIR "/control\n");
+	fd = openat(__igt_pm_power, "control", O_RDWR);
+	igt_assert_f(fd >= 0, "Can't open control\n");
 
 	igt_assert(read(fd, __igt_pm_runtime_control,
 			sizeof(__igt_pm_runtime_control) - 1) > 0);
@@ -621,10 +658,6 @@ bool igt_setup_runtime_pm(void)
 
 	close(fd);
 
-	pm_status_fd = open(POWER_DIR "/runtime_status", O_RDONLY);
-	igt_assert_f(pm_status_fd >= 0,
-		     "Can't open " POWER_DIR "/runtime_status\n");
-
 	return true;
 }
 
@@ -641,11 +674,11 @@ void igt_disable_runtime_pm(void)
 	ssize_t size;
 	char buf[6];
 
-	igt_assert_fd(pm_status_fd);
+	igt_assert_fd(__igt_pm_power);
 
 	/* We know we support runtime PM, let's try to disable it now. */
-	fd = open(POWER_DIR "/control", O_RDWR);
-	igt_assert_f(fd >= 0, "Can't open " POWER_DIR "/control\n");
+	fd = openat(__igt_pm_power, "control", O_RDWR);
+	igt_assert_f(fd >= 0, "Can't open control\n");
 
 	size = write(fd, "on\n", 3);
 	igt_assert(size == 3);
@@ -661,13 +694,13 @@ void igt_disable_runtime_pm(void)
  *
  * Returns: The current runtime PM status.
  */
-enum igt_runtime_pm_status igt_get_runtime_pm_status(void)
+static enum igt_runtime_pm_status __igt_get_runtime_pm_status(int fd)
 {
 	ssize_t n_read;
 	char buf[32];
 
-	lseek(pm_status_fd, 0, SEEK_SET);
-	n_read = read(pm_status_fd, buf, ARRAY_SIZE(buf) - 1);
+	lseek(fd, 0, SEEK_SET);
+	n_read = read(fd, buf, ARRAY_SIZE(buf) - 1);
 	igt_assert(n_read >= 0);
 	buf[n_read] = '\0';
 
@@ -684,6 +717,23 @@ enum igt_runtime_pm_status igt_get_runtime_pm_status(void)
 	return IGT_RUNTIME_PM_STATUS_UNKNOWN;
 }
 
+enum igt_runtime_pm_status igt_get_runtime_pm_status(void)
+{
+	enum igt_runtime_pm_status status;
+	int fd;
+
+	if (__igt_pm_power < 0)
+		return IGT_RUNTIME_PM_STATUS_UNKNOWN;
+
+	fd = openat(__igt_pm_power, "runtime_status", O_RDONLY);
+	igt_assert_f(fd >= 0, "Can't open runtime_status\n");
+
+	status = __igt_get_runtime_pm_status(fd);
+	close(fd);
+
+	return status;
+}
+
 /**
  * _pm_status_name
  * @status: runtime PM status to stringify
@@ -719,10 +769,20 @@ static const char *_pm_status_name(enum igt_runtime_pm_status status)
  */
 bool igt_wait_for_pm_status(enum igt_runtime_pm_status status)
 {
-	bool ret;
 	enum igt_runtime_pm_status expected = status;
+	bool ret;
+	int fd;
+
+	if (__igt_pm_power < 0)
+		return false;
+
+	fd = openat(__igt_pm_power, "runtime_status", O_RDONLY);
+	igt_assert_f(fd >= 0, "Can't open runtime_status\n");
+
+	ret = igt_wait((status = __igt_get_runtime_pm_status(fd)) == expected,
+		       10000, 100);
+	close(fd);
 
-	ret = igt_wait((status = igt_get_runtime_pm_status()) == expected, 10000, 100);
 	if (!ret)
 		igt_warn("timeout: pm_status expected:%s, got:%s\n",
 			_pm_status_name(expected),
diff --git a/lib/igt_pm.h b/lib/igt_pm.h
index 7dc241749..5e4384522 100644
--- a/lib/igt_pm.h
+++ b/lib/igt_pm.h
@@ -46,7 +46,7 @@ enum igt_runtime_pm_status {
 	IGT_RUNTIME_PM_STATUS_UNKNOWN,
 };
 
-bool igt_setup_runtime_pm(void);
+bool igt_setup_runtime_pm(int device);
 void igt_disable_runtime_pm(void);
 void igt_restore_runtime_pm(void);
 enum igt_runtime_pm_status igt_get_runtime_pm_status(void);
diff --git a/tests/i915/i915_pm_backlight.c b/tests/i915/i915_pm_backlight.c
index 83b1ed688..08c07a578 100644
--- a/tests/i915/i915_pm_backlight.c
+++ b/tests/i915/i915_pm_backlight.c
@@ -156,7 +156,7 @@ static void test_fade(struct context *context)
 static void
 test_fade_with_dpms(struct context *context, igt_output_t *output)
 {
-	igt_require(igt_setup_runtime_pm());
+	igt_require(igt_setup_runtime_pm(output->display->drm_fd));
 
 	kmstest_set_connector_dpms(output->display->drm_fd,
 				   output->config.connector,
diff --git a/tests/i915/i915_pm_dc.c b/tests/i915/i915_pm_dc.c
index da5c1c643..afcc10bc7 100644
--- a/tests/i915/i915_pm_dc.c
+++ b/tests/i915/i915_pm_dc.c
@@ -323,7 +323,7 @@ static void cleanup_dc_dpms(data_t *data)
 	 */
 	if (data->runtime_suspend_disabled) {
 		igt_restore_runtime_pm();
-		igt_setup_runtime_pm();
+		igt_setup_runtime_pm(data->drm_fd);
 	}
 }
 
@@ -390,7 +390,7 @@ int main(int argc, char *argv[])
 		kmstest_set_vt_graphics_mode();
 		data.devid = intel_get_drm_devid(data.drm_fd);
 		igt_pm_enable_sata_link_power_management();
-		igt_require(igt_setup_runtime_pm());
+		igt_require(igt_setup_runtime_pm(data.drm_fd));
 		igt_require(igt_pm_dmc_loaded(data.debugfs_fd));
 		igt_display_require(&data.display, data.drm_fd);
 		igt_require(psr_sink_support(data.debugfs_fd, PSR_MODE_1));
diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index f5f813c3d..3d7343240 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -768,7 +768,7 @@ static bool setup_environment(void)
 
 	igt_pm_enable_sata_link_power_management();
 
-	has_runtime_pm = igt_setup_runtime_pm();
+	has_runtime_pm = igt_setup_runtime_pm(drm_fd);
 	setup_pc8();
 
 	igt_info("Runtime PM support: %d\n", has_runtime_pm);
diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index 736944331..a895ab80b 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -121,7 +121,7 @@ static void run_test(data_t *data, void (*testfunc)(data_t *, int, int))
 	prepare_crtc(data, fd, output);
 
 	if (data->flags & RPM)
-		igt_require(igt_setup_runtime_pm());
+		igt_require(igt_setup_runtime_pm(fd));
 
 	igt_info("Beginning %s on pipe %s, connector %s\n",
 		 igt_subtest_name(), kmstest_pipe_name(data->pipe),
diff --git a/tests/perf_pmu.c b/tests/perf_pmu.c
index e17efe293..c94aaf9aa 100644
--- a/tests/perf_pmu.c
+++ b/tests/perf_pmu.c
@@ -1572,7 +1572,7 @@ test_rc6(int gem_fd, unsigned int flags)
 		kmstest_unset_all_crtcs(gem_fd, res);
 		drmModeFreeResources(res);
 
-		igt_require(igt_setup_runtime_pm());
+		igt_require(igt_setup_runtime_pm(gem_fd));
 		igt_require(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
 
 		/*
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
