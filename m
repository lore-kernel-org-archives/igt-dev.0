Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE8FF6E34C
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2020 15:23:01 +0000 (UTC)
From: Daniel Mrzyglod <daniel.t.mrzyglod@intel.com>
Date: Thu,  5 Mar 2020 16:22:56 +0100
Message-Id: <20200305152256.13716-1-daniel.t.mrzyglod@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2] lib: move upper_32_bits() and
 lower_32_bits() to library
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

Move inline upper_32_bits() and lower_32_bits() function from tests to
library. Functiom will be usefull for elsewhere use.

v2: fix function description

Cc: Katarzyna Dec <katarzyna.dec@intel.com>
Signed-off-by: Daniel Mrzyglod <daniel.t.mrzyglod@intel.com>
---
 lib/ioctl_wrappers.h        | 20 ++++++++++++++++++++
 tests/i915/gem_exec_fence.c | 10 ----------
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
index 7614e688c..9b29fce81 100644
--- a/lib/ioctl_wrappers.h
+++ b/lib/ioctl_wrappers.h
@@ -244,4 +244,24 @@ static inline void *from_user_pointer(uint64_t u64)
 	return (void *)(uintptr_t)u64;
 }
 
+/**
+ * lower_32_bits:
+ *
+ * return bits 0-31 of a number.
+ */
+static inline uint32_t lower_32_bits(uint64_t x)
+{
+	return x & 0xffffffff;
+}
+
+/**
+ * upper_32_bits:
+ *
+ * return bits 32-63 of a number.
+ */
+static inline uint32_t upper_32_bits(uint64_t x)
+{
+	return x >> 32;
+}
+
 #endif /* IOCTL_WRAPPERS_H */
diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index 9b3735325..ebd0f931f 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -590,16 +590,6 @@ static uint32_t batch_create(int fd)
 	return handle;
 }
 
-static inline uint32_t lower_32_bits(uint64_t x)
-{
-	return x & 0xffffffff;
-}
-
-static inline uint32_t upper_32_bits(uint64_t x)
-{
-	return x >> 32;
-}
-
 static void test_keep_in_fence(int fd, const struct intel_execution_engine2 *e)
 {
 	struct sigaction sa = { .sa_handler = alarm_handler };
-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
