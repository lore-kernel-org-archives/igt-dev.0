Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5A910E41E
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Aug 2023 09:47:21 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 17 Aug 2023 11:46:49 +0200
Message-Id: <20230817094652.40243-5-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230817094652.40243-1-zbigniew.kempczynski@intel.com>
References: <20230817094652.40243-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/7] lib/intel_compute: Add i915 path in
 compute library
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

Add code which fills requirement to run compute workload on i915.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/intel_compute.c | 50 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 0c89118bcd..4f3d686d74 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -8,6 +8,7 @@
 
 #include <stdint.h>
 
+#include "i915/gem_create.h"
 #include "igt.h"
 #include "xe_drm.h"
 #include "lib/igt_syncobj.h"
@@ -38,6 +39,7 @@ struct bo_dict_entry {
 	uint32_t size;
 	void *data;
 	const char *name;
+	uint32_t handle;
 };
 
 struct bo_execenv {
@@ -47,6 +49,10 @@ struct bo_execenv {
 	/* Xe part */
 	uint32_t vm;
 	uint32_t exec_queue;
+
+	/* i915 part */
+	struct drm_i915_gem_execbuffer2 execbuf;
+	struct drm_i915_gem_exec_object2 *obj;
 };
 
 static void bo_execenv_create(int fd, struct bo_execenv *execenv)
@@ -101,6 +107,33 @@ static void bo_execenv_bind(struct bo_execenv *execenv,
 		}
 
 		syncobj_destroy(fd, sync.handle);
+	} else {
+		struct drm_i915_gem_execbuffer2 *execbuf = &execenv->execbuf;
+		struct drm_i915_gem_exec_object2 *obj;
+
+		obj = calloc(entries, sizeof(*obj));
+		execenv->obj = obj;
+
+		for (int i = 0; i < entries; i++) {
+			bo_dict[i].handle = gem_create(fd, bo_dict[i].size);
+			bo_dict[i].data = gem_mmap__device_coherent(fd, bo_dict[i].handle,
+								    0, bo_dict[i].size,
+								    PROT_READ | PROT_WRITE);
+			igt_debug("[i: %2d name: %20s] handle: %u, data: %p, addr: %16llx, size: %llx\n",
+				  i, bo_dict[i].name,
+				  bo_dict[i].handle, bo_dict[i].data,
+				  (long long)bo_dict[i].addr,
+				  (long long)bo_dict[i].size);
+
+			obj[i].handle = bo_dict[i].handle;
+			obj[i].offset = CANONICAL(bo_dict[i].addr);
+			obj[i].flags = EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+			if (bo_dict[i].addr == ADDR_OUTPUT)
+				obj[i].flags |= EXEC_OBJECT_WRITE;
+		}
+
+		execbuf->buffers_ptr = to_user_pointer(obj);
+		execbuf->buffer_count = entries;
 	}
 }
 
@@ -123,6 +156,12 @@ static void bo_execenv_unbind(struct bo_execenv *execenv,
 		}
 
 		syncobj_destroy(fd, sync.handle);
+	} else {
+		for (int i = 0; i < entries; i++) {
+			gem_close(fd, bo_dict[i].handle);
+			munmap(bo_dict[i].data, bo_dict[i].size);
+		}
+		free(execenv->obj);
 	}
 }
 
@@ -130,8 +169,17 @@ static void bo_execenv_exec(struct bo_execenv *execenv, uint64_t start_addr)
 {
 	int fd = execenv->fd;
 
-	if (execenv->driver == INTEL_DRIVER_XE)
+	if (execenv->driver == INTEL_DRIVER_XE) {
 		xe_exec_wait(fd, execenv->exec_queue, start_addr);
+	} else {
+		struct drm_i915_gem_execbuffer2 *execbuf = &execenv->execbuf;
+		struct drm_i915_gem_exec_object2 *obj = execenv->obj;
+		int num_objects = execbuf->buffer_count;
+
+		execbuf->flags = I915_EXEC_RENDER;
+		gem_execbuf(fd, execbuf);
+		gem_sync(fd, obj[num_objects - 1].handle); /* batch handle */
+	}
 }
 
 /*
-- 
2.34.1
