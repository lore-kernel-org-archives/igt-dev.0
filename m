Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB4010E6C0
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Aug 2023 18:38:03 +0000 (UTC)
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 25 Aug 2023 11:37:59 -0700
Message-Id: <20230825183759.1762528-1-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] lib/i915: Add a helper to read mmio
 registers via ioctl
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Kamil Konieczny <kamil.konieczny@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add a helper into existing ioctl_wrappers.c  to call
DRM_IOCTL_I915_REG_READ to read whitelisted registers.

v2: - move the new helper into ioctl_wrapper.c/h
    - follow the ioctl_wrapper convention where __foo
      is allowed to fail and foo will assert if fails.
    - use a #define for the RENDER_RING_TIMESTAMP reg.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 lib/intel_reg.h                      |  3 ++
 lib/ioctl_wrappers.c                 | 42 ++++++++++++++++++++++++++++
 lib/ioctl_wrappers.h                 |  2 ++
 tests/i915/gem_reg_read.c            | 28 ++++---------------
 tests/i915/i915_pm_rpm.c             | 10 ++++---
 tools/i915-perf/i915_perf_recorder.c |  9 +++---
 tools/intel_forcewaked.c             |  4 ++-
 7 files changed, 66 insertions(+), 32 deletions(-)

diff --git a/lib/intel_reg.h b/lib/intel_reg.h
index 3bf3676dc..04ea93eb6 100644
--- a/lib/intel_reg.h
+++ b/lib/intel_reg.h
@@ -689,6 +689,9 @@ SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 #define GEN12_GFX_AUX_TABLE_BASE_ADDR	0x4200
 #define GEN12_VEBOX_AUX_TABLE_BASE_ADDR	0x4230
 
+/* Command Streamer registers
+ */
+#define RENDER_RING_TIMESTAMP 0x2358
 
 /* BitBlt Instructions
  *
diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 146973f0d..ddaadd673 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -887,6 +887,48 @@ bool gem_engine_reset_enabled(int fd)
 	return gem_gpu_reset_type(fd) > 1;
 }
 
+/**
+ * __i915_reg_read_ioctl:
+ * @drmfd: device file descriptor
+ * @offset: mmio register to read from
+ * @value: ptr to fill with results from read
+ *
+ * This function uses DRM_IOCTL_I915_REG_READ to read the
+ * register and so it can return NOACCES if i915 doesn't allow.
+ *
+ * Returns: This is allowed to fail, with -errno returned.
+ */
+int __i915_reg_read_ioctl(int drmfd, __u64 offset, __u64 *value)
+{
+	struct drm_i915_reg_read reg_read = {0};
+	int ret = 0;
+
+	reg_read.offset = offset;
+	if (igt_ioctl(drmfd, DRM_IOCTL_I915_REG_READ, &reg_read))
+		ret = -errno;
+	else if (value)
+		*value = reg_read.val;
+
+	return ret;
+}
+
+/**
+ * i915_reg_read_ioctl:
+ * @drmfd: device file descriptor
+ * @offset: mmio register to read from
+ * @value: ptr to fill with results from read
+ *
+ * This function uses DRM_IOCTL_I915_REG_READ to read the
+ * register and so it can return NOACCES if i915 doesn't allow.
+ * This version will assert if the ioctl fails
+ *
+ */
+void i915_reg_read_ioctl(int drmfd, __u64 offset, __u64 *value)
+{
+	igt_assert_eq(__i915_reg_read_ioctl(drmfd, offset, value), 0);
+	errno = 0;
+}
+
 bool gem_has_llc(int fd)
 {
 	int has_llc;
diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
index b7d7c2ad9..b37022401 100644
--- a/lib/ioctl_wrappers.h
+++ b/lib/ioctl_wrappers.h
@@ -79,6 +79,8 @@ void gem_execbuf_wr(int fd, struct drm_i915_gem_execbuffer2 *execbuf);
 int __gem_execbuf_wr(int fd, struct drm_i915_gem_execbuffer2 *execbuf);
 void gem_execbuf(int fd, struct drm_i915_gem_execbuffer2 *execbuf);
 int __gem_execbuf(int fd, struct drm_i915_gem_execbuffer2 *execbuf);
+int __i915_reg_read_ioctl(int drmfd, __u64 offset, __u64 *value);
+void i915_reg_read_ioctl(int drmfd, __u64 offset, __u64 *value);
 
 #ifndef I915_GEM_DOMAIN_WC
 #define I915_GEM_DOMAIN_WC 0x80
diff --git a/tests/i915/gem_reg_read.c b/tests/i915/gem_reg_read.c
index de6788abe..4bf330df6 100644
--- a/tests/i915/gem_reg_read.c
+++ b/tests/i915/gem_reg_read.c
@@ -32,6 +32,8 @@
 #include <sys/utsname.h>
 #include <time.h>
 
+#include "lib/ioctl_wrappers.h"
+
 /**
  * TEST: gem reg read
  * Feature: gem_core
@@ -52,24 +54,6 @@ struct local_drm_i915_reg_read {
 	__u64 val; /* Return value */
 };
 
-#define REG_READ_IOCTL DRM_IOWR(DRM_COMMAND_BASE + 0x31, struct local_drm_i915_reg_read)
-
-#define RENDER_RING_TIMESTAMP 0x2358
-
-static int read_register(int fd, uint64_t offset, uint64_t * val)
-{
-	int ret = 0;
-	struct local_drm_i915_reg_read reg_read;
-	reg_read.offset = offset;
-
-	if (drmIoctl(fd, REG_READ_IOCTL, &reg_read))
-		ret = -errno;
-
-	*val = reg_read.val;
-
-	return ret;
-}
-
 static bool check_kernel_x86_64(void)
 {
 	int ret;
@@ -87,9 +71,9 @@ static bool check_kernel_x86_64(void)
 static bool check_timestamp(int fd)
 {
 	int ret;
-	uint64_t val;
+	__u64 val;
 
-	ret = read_register(fd, RENDER_RING_TIMESTAMP | 1, &val);
+	ret = __i915_reg_read_ioctl(fd, RENDER_RING_TIMESTAMP | 1, &val);
 
 	return ret == 0;
 }
@@ -103,7 +87,7 @@ static int timer_query(int fd, uint64_t * val)
 	if (has_proper_timestamp)
 		offset |= 1;
 
-	ret = read_register(fd, offset, val);
+	ret = __i915_reg_read_ioctl(fd, offset, (__u64 *)val);
 
 /*
  * When reading the timestamp register with single 64b read, we are observing
@@ -168,7 +152,7 @@ igt_main
 	}
 
 	igt_subtest("bad-register")
-		igt_assert_eq(read_register(fd, 0x12345678, &val), -EINVAL);
+		igt_assert_eq(__i915_reg_read_ioctl(fd, 0x12345678, (__u64 *)&val), -EINVAL);
 
 	igt_subtest("timestamp-moving") {
 		igt_skip_on(timer_query(fd, &val) != 0);
diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 17413ffe5..4bc1f37a3 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -40,6 +40,10 @@
 #include <sys/mman.h>
 #include <sys/types.h>
 #include <sys/stat.h>
+
+#include "lib/ioctl_wrappers.h"
+#include "lib/intel_reg.h"
+
 /**
  * TEST: i915 pm rpm
  *
@@ -1852,13 +1856,11 @@ static void gem_evict_pwrite_subtest(void)
 /* This also triggered WARNs on dmesg at some point. */
 static void reg_read_ioctl_subtest(void)
 {
-	struct drm_i915_reg_read rr = {
-		.offset = 0x2358, /* render ring timestamp */
-	};
+	__u64 val;
 
 	disable_all_screens_and_wait(&ms_data);
 
-	do_ioctl(drm_fd, DRM_IOCTL_I915_REG_READ, &rr);
+	i915_reg_read_ioctl(drm_fd, RENDER_RING_TIMESTAMP, &val);
 
 	igt_assert(wait_for_suspended());
 }
diff --git a/tools/i915-perf/i915_perf_recorder.c b/tools/i915-perf/i915_perf_recorder.c
index ca4354832..9873fec4c 100644
--- a/tools/i915-perf/i915_perf_recorder.c
+++ b/tools/i915-perf/i915_perf_recorder.c
@@ -44,14 +44,15 @@
 
 #include <i915_drm.h>
 
-#include "i915/i915_drm_local.h"
-
+#include "i915_perf_recorder_commands.h"
 #include "igt_core.h"
 #include "intel_chipset.h"
+
+#include "i915/i915_drm_local.h"
 #include "i915/perf.h"
 #include "i915/perf_data.h"
 
-#include "i915_perf_recorder_commands.h"
+#include "lib/intel_reg.h"
 
 #define ALIGN(v, a) (((v) + (a)-1) & ~((a)-1))
 #define ARRAY_SIZE(arr) (sizeof(arr)/sizeof((arr)[0]))
@@ -623,8 +624,6 @@ get_correlation_timestamps(struct intel_perf_record_timestamp_correlation *corr,
 	} attempts[3];
 	uint32_t best = 0;
 
-#define RENDER_RING_TIMESTAMP 0x2358
-
         reg_read.offset = RENDER_RING_TIMESTAMP | I915_REG_READ_8B_WA;
 
 	/* Gather 3 correlations. */
diff --git a/tools/intel_forcewaked.c b/tools/intel_forcewaked.c
index 87b26d43a..584358446 100644
--- a/tools/intel_forcewaked.c
+++ b/tools/intel_forcewaked.c
@@ -38,6 +38,8 @@
 #include "intel_chipset.h"
 #include "drmtest.h"
 
+#include "lib/intel_reg.h"
+
 bool daemonized;
 
 #define INFO_PRINT(...) \
@@ -59,7 +61,7 @@ help(char *prog) {
 static int
 is_alive(struct intel_mmio_data *mmio_data) {
 	/* Read the timestamp, which should *almost* always be !0 */
-	return (intel_register_read(mmio_data, 0x2358) != 0);
+	return (intel_register_read(mmio_data, RENDER_RING_TIMESTAMP) != 0);
 }
 
 int main(int argc, char *argv[])
-- 
2.39.0
