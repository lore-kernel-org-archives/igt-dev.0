Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298A86EABF
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Apr 2021 19:12:08 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id d8so12619777plh.11
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Apr 2021 12:12:08 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 15 Apr 2021 14:10:41 -0500
Message-Id: <20210415191145.2137858-11-jason@jlekstrand.net>
In-Reply-To: <20210415191145.2137858-1-jason@jlekstrand.net>
References: <20210415191145.2137858-1-jason@jlekstrand.net>
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
