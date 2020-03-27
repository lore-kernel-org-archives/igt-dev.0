Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83296E32D
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Mar 2020 04:56:55 +0000 (UTC)
From: Arjun Melkaveri <arjun.melkaveri@intel.com>
Date: Fri, 27 Mar 2020 10:25:48 +0530
Message-Id: <20200327045548.8340-1-arjun.melkaveri@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] [PATCH i-g-t]tests/i915/gem_exec_nop:-Fixed Crash
 issue seen on few platform
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
To: arjun.melkaveri@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Crash issue was seen w.r.t engines on different platforms.
Fixed this by initializing engine and engine name with
maximum supported engines value.

Reviewed-by: Antonio Argenziano <antonio.argenziano@intel.com>
Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
---
 tests/i915/gem_exec_nop.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/i915/gem_exec_nop.c b/tests/i915/gem_exec_nop.c
index 6da6234f..a8c18b5d 100644
--- a/tests/i915/gem_exec_nop.c
+++ b/tests/i915/gem_exec_nop.c
@@ -55,6 +55,7 @@
 
 #define MAX_PRIO LOCAL_I915_CONTEXT_MAX_USER_PRIORITY
 #define MIN_PRIO LOCAL_I915_CONTEXT_MIN_USER_PRIORITY
+#define GEM_MAX_ENGINES I915_EXEC_RING_MASK + 1
 
 #define FORKED 1
 #define CHAINED 2
@@ -435,14 +436,15 @@ static void parallel(int fd, uint32_t handle, int timeout)
 	const struct intel_execution_engine2 *e;
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_exec_object2 obj;
-	unsigned engines[16];
-	char *names[16];
+	unsigned engines[GEM_MAX_ENGINES];
+	char *names[GEM_MAX_ENGINES];
 	unsigned nengine;
 	unsigned long count;
 	double time, sum;
 
 	sum = 0;
 	nengine = 0;
+
 	__for_each_physical_engine(fd, e) {
 		engines[nengine] = e->flags;
 		names[nengine++] = strdup(e->name);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
