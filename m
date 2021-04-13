Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B9B6E171
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Apr 2021 03:54:10 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id l123so10550119pfl.8
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Apr 2021 20:54:10 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 12 Apr 2021 22:52:46 -0500
Message-Id: <20210413035350.261794-11-jason@jlekstrand.net>
In-Reply-To: <20210413035350.261794-1-jason@jlekstrand.net>
References: <20210413035350.261794-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 10/74] lib/i915/gem_engine_topology: Factor
 out static engine listing
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

---
 lib/i915/gem_engine_topology.c | 51 +++++++++++++++++++---------------
 1 file changed, 29 insertions(+), 22 deletions(-)

diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index 833b3abe..606d3c1d 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -196,6 +196,34 @@ intel_get_current_physical_engine(struct intel_engine_data *ed)
 	return e;
 }
 
+static struct intel_engine_data intel_engine_list_for_static(int fd)
+{
+	const struct intel_execution_engine2 *e2;
+	struct intel_engine_data engine_data = { };
+
+	igt_debug("using pre-allocated engine list\n");
+
+	__for_each_static_engine(e2) {
+		if (igt_only_list_subtests() ||
+		    (fd < 0) ||
+		    gem_has_ring(fd, e2->flags)) {
+			struct intel_execution_engine2 *__e2 =
+				&engine_data.engines[
+				engine_data.nengines];
+
+			strcpy(__e2->name, e2->name);
+			__e2->instance   = e2->instance;
+			__e2->class      = e2->class;
+			__e2->flags      = e2->flags;
+			__e2->is_virtual = false;
+
+			engine_data.nengines++;
+                }
+	}
+
+	return engine_data;
+}
+
 static int gem_topology_get_param(int fd,
 				  struct drm_i915_gem_context_param *p)
 {
@@ -216,28 +244,7 @@ struct intel_engine_data intel_init_engine_list(int fd, uint32_t ctx_id)
 
 	if (gem_topology_get_param(fd, &param)) {
 		/* if kernel does not support engine/context mapping */
-		const struct intel_execution_engine2 *e2;
-
-		igt_debug("using pre-allocated engine list\n");
-
-		__for_each_static_engine(e2) {
-			if (igt_only_list_subtests() ||
-			    (fd < 0) ||
-			    gem_has_ring(fd, e2->flags)) {
-				struct intel_execution_engine2 *__e2 =
-					&engine_data.engines[
-					engine_data.nengines];
-
-				strcpy(__e2->name, e2->name);
-				__e2->instance   = e2->instance;
-				__e2->class      = e2->class;
-				__e2->flags      = e2->flags;
-				__e2->is_virtual = false;
-
-				engine_data.nengines++;
-                        }
-		}
-		return engine_data;
+		return intel_engine_list_for_static(fd);
 	}
 
 	if (!param.size) {
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
