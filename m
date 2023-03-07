Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A25A10E5E0
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Mar 2023 16:20:05 +0000 (UTC)
From: Vikas Srivastava <vikas.srivastava@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  7 Mar 2023 21:47:13 +0530
Message-Id: <20230307161713.498564-2-vikas.srivastava@intel.com>
In-Reply-To: <20230307161713.498564-1-vikas.srivastava@intel.com>
References: <20230307161713.498564-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/2] include/intel_gpu_commands: Copy
 intel_gpu_commands from the kernel
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

From: Chris Wilson <chris.p.wilson@linux.intel.com>

Cherry picking this patch to resolve conflicts while merging
gem_exec_await patch to fix timeout issue.

Define the GPU commands at one place and consolidate on a
single interface consistent with usage inside the kernel.

Signed-off-by: Chris Wilson <chris.p.wilson@linux.intel.com>
Signed-off-by: Vikas Srivastava <vikas.srivastava@intel.com>
---
 include/linux_scaffold.h | 51 ++++++++++++++++++++++++++++++++++++++++
 lib/ioctl_wrappers.h     |  4 ++--
 meson.build              |  2 +-
 3 files changed, 54 insertions(+), 3 deletions(-)
 create mode 100644 include/linux_scaffold.h

diff --git a/include/linux_scaffold.h b/include/linux_scaffold.h
new file mode 100644
index 000000000..57c456180
--- /dev/null
+++ b/include/linux_scaffold.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef _INTEL_GPU_COMMANDS_SCAFFOLD_H_
+#define _INTEL_GPU_COMMANDS_SCAFFOLD_H_
+
+#include <linux/const.h>
+
+#include <stdint.h>
+
+typedef uint8_t  u8;
+typedef uint16_t u16;
+typedef uint32_t u32;
+typedef uint64_t u64;
+
+typedef int8_t  s8;
+typedef int16_t s16;
+typedef int32_t s32;
+typedef int64_t s64;
+
+static s64 sign_extend64(u64 value, int index)
+{
+	int shift = 63 - index;
+
+	return (s64)(value << shift) >> shift;
+}
+
+/* Make IGT build with Kernels < 4.17 */
+#ifndef _AC
+#  define _AC(X, Y)	__AC(X, Y)
+#endif
+#ifndef _UL
+#  define  _UL(x)		(_AC(x, UL))
+#endif
+#ifndef _ULL
+#  define _ULL(x)		(_AC(x, ULL))
+#endif
+
+#define GENMASK(h, l) \
+	       (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
+	       (~_UL(0) >> (BITS_PER_LONG - 1 - (h))))
+
+#define GENMASK_ULL(h, l) \
+		   (((~_ULL(0)) - (_ULL(1) << (l)) + 1) & \
+		   (~_ULL(0) >> (BITS_PER_LONG_LONG - 1 - (h))))
+
+#define BITS_PER_BYTE 8
+#define BITS_PER_TYPE(t) (sizeof(t) * BITS_PER_BYTE)
+#define BITS_PER_LONG BITS_PER_TYPE(long)
+#define BITS_PER_LONG_LONG BITS_PER_TYPE(long long)
+
+#endif /* _INTEL_GPU_COMMANDS_SCAFFOLD_H_ */
diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
index cf228c265..aecad2d7d 100644
--- a/lib/ioctl_wrappers.h
+++ b/lib/ioctl_wrappers.h
@@ -173,9 +173,9 @@ static inline uint64_t to_user_pointer(const void *ptr)
  *
  * Casts a 64bit value from an ioctl into a pointer.
  */
-static inline void *from_user_pointer(uint64_t u64)
+static inline void *from_user_pointer(uint64_t x64)
 {
-	return (void *)(uintptr_t)u64;
+	return (void *)(uintptr_t)x64;
 }
 
 /**
diff --git a/meson.build b/meson.build
index e7a68503d..4dc720bc2 100644
--- a/meson.build
+++ b/meson.build
@@ -85,7 +85,7 @@ with_libdrm = get_option('libdrm_drivers')
 
 build_info = ['Build type: ' + get_option('buildtype')]
 
-inc = include_directories('include/drm-uapi', 'include/linux-uapi', 'lib', 'lib/stubs/syscalls', '.')
+inc = include_directories('include', 'include/drm-uapi', 'include/linux-uapi', 'lib', 'lib/stubs/syscalls', '.')
 
 inc_for_gtkdoc = include_directories('lib')
 
-- 
2.25.1
