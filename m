Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 13 Mar 2020 20:04:50 +0000
Message-Id: <20200313200451.208504-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/i915: Allow writing of engine
 properties
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Make setting engine tunables easier!

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 lib/i915/gem_engine_topology.c | 49 +++++++++++++++++++++++++++-------
 lib/i915/gem_engine_topology.h |  4 +++
 2 files changed, 44 insertions(+), 9 deletions(-)

diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index 6eca28236..79bc977eb 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -333,13 +333,25 @@ bool gem_engine_is_equal(const struct intel_execution_engine2 *e1,
 	return e1->class == e2->class && e1->instance == e2->instance;
 }
 
-static FILE *__open_attr(int dir, ...)
+static int reopen(int dir, int mode)
+{
+	char buf[128];
+	int fd;
+
+	snprintf(buf, sizeof(buf), "/proc/self/fd/%d", dir);
+	fd = open(buf, mode);
+	close(dir);
+
+	return fd;
+}
+
+static FILE *__open_attr(int dir, const char *mode, ...)
 {
 	const char *path;
 	FILE *file;
 	va_list ap;
 
-	va_start(ap, dir);
+	va_start(ap, mode);
 	while (dir >= 0 && (path = va_arg(ap, const char *))) {
 		int fd;
 
@@ -350,7 +362,10 @@ static FILE *__open_attr(int dir, ...)
 	}
 	va_end(ap);
 
-	file = fdopen(dir, "r");
+	if (*mode != 'r') /* clumsy, but fun */
+		dir = reopen(dir, O_RDWR);
+
+	file = fdopen(dir, mode);
 	if (!file) {
 		close(dir);
 		return NULL;
@@ -365,13 +380,9 @@ int gem_engine_property_scanf(int i915, const char *engine, const char *attr,
 	FILE *file;
 	va_list ap;
 	int ret;
-	int fd;
-
-	fd = igt_sysfs_open(i915);
-	if (fd < 0)
-		return fd;
 
-	file = __open_attr(fd, "engine", engine, attr, NULL);
+	file = __open_attr(igt_sysfs_open(i915), "r",
+			   "engine", engine, attr, NULL);
 	if (!file)
 		return -1;
 
@@ -383,6 +394,26 @@ int gem_engine_property_scanf(int i915, const char *engine, const char *attr,
 	return ret;
 }
 
+int gem_engine_property_printf(int i915, const char *engine, const char *attr,
+			       const char *fmt, ...)
+{
+	FILE *file;
+	va_list ap;
+	int ret;
+
+	file = __open_attr(igt_sysfs_open(i915), "w",
+			   "engine", engine, attr, NULL);
+	if (!file)
+		return -1;
+
+	va_start(ap, fmt);
+	ret = vfprintf(file, fmt, ap);
+	va_end(ap);
+
+	fclose(file);
+	return ret;
+}
+
 uint32_t gem_engine_mmio_base(int i915, const char *engine)
 {
 	unsigned int mmio = 0;
diff --git a/lib/i915/gem_engine_topology.h b/lib/i915/gem_engine_topology.h
index 219c84b72..5e3440fa8 100644
--- a/lib/i915/gem_engine_topology.h
+++ b/lib/i915/gem_engine_topology.h
@@ -78,6 +78,10 @@ struct intel_execution_engine2 gem_eb_flags_to_engine(unsigned int flags);
 __attribute__((format(scanf, 4, 5)))
 int gem_engine_property_scanf(int i915, const char *engine, const char *attr,
 			      const char *fmt, ...);
+__attribute__((format(printf, 4, 5)))
+int gem_engine_property_printf(int i915, const char *engine, const char *attr,
+			       const char *fmt, ...);
+
 uint32_t gem_engine_mmio_base(int i915, const char *engine);
 
 #endif /* GEM_ENGINE_TOPOLOGY_H */
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
