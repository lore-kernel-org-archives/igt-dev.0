Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 11 Mar 2020 09:34:45 +0000
Message-Id: <20200311093448.4103262-2-chris@chris-wilson.co.uk>
In-Reply-To: <20200311093448.4103262-1-chris@chris-wilson.co.uk>
References: <20200311093448.4103262-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t 2/5] lib/i915: Dynamic subtest constructor
 for sysfs/engines
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Simplify testing sysfs/engines by providing a convenience routine that
iterates over each engine, calling a igt_dynamic routine.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 lib/i915/gem_engine_topology.c | 48 ++++++++++++++++++++++++++++++++++
 lib/i915/gem_engine_topology.h |  3 +++
 2 files changed, 51 insertions(+)

diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index 6eca28236..53abb29fa 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -22,6 +22,8 @@
  */
 
 #include <fcntl.h>
+#include <sys/stat.h>
+#include <sys/syscall.h>
 #include <unistd.h>
 
 #include "drmtest.h"
@@ -413,3 +415,49 @@ uint32_t gem_engine_mmio_base(int i915, const char *engine)
 
 	return mmio;
 }
+
+void dyn_sysfs_engines(int i915, int engines, const char *file,
+		       void (*test)(int, int))
+{
+	char buf[512];
+	int len;
+
+	lseek(engines, 0, SEEK_SET);
+	while ((len = syscall(SYS_getdents64, engines, buf, sizeof(buf))) > 0) {
+		void *ptr = buf;
+
+		while (len) {
+			struct linux_dirent64 {
+				ino64_t        d_ino;
+				off64_t        d_off;
+				unsigned short d_reclen;
+				unsigned char  d_type;
+				char           d_name[];
+			} *de = ptr;
+			char *name;
+			int engine;
+
+			ptr += de->d_reclen;
+			len -= de->d_reclen;
+
+			engine = openat(engines, de->d_name, O_RDONLY);
+			name = igt_sysfs_get(engine, "name");
+			if (!name) {
+				close(engine);
+				continue;
+			}
+
+			igt_dynamic(name) {
+				if (file) {
+					struct stat st;
+
+					igt_require(fstatat(engine, file, &st, 0) == 0);
+				}
+
+				test(i915, engine);
+			}
+
+			close(engine);
+		}
+	}
+}
diff --git a/lib/i915/gem_engine_topology.h b/lib/i915/gem_engine_topology.h
index 219c84b72..b624d607e 100644
--- a/lib/i915/gem_engine_topology.h
+++ b/lib/i915/gem_engine_topology.h
@@ -80,4 +80,7 @@ int gem_engine_property_scanf(int i915, const char *engine, const char *attr,
 			      const char *fmt, ...);
 uint32_t gem_engine_mmio_base(int i915, const char *engine);
 
+void dyn_sysfs_engines(int i915, int engines, const char *file,
+		       void (*test)(int i915, int engine));
+
 #endif /* GEM_ENGINE_TOPOLOGY_H */
-- 
2.25.1

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
