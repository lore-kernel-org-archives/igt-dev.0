Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C7046EC6D
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 21:49:13 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id e2so21553953plh.8
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Apr 2021 14:49:13 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Fri, 23 Apr 2021 16:47:31 -0500
Message-Id: <20210423214853.876911-8-jason@jlekstrand.net>
In-Reply-To: <20210423214853.876911-1-jason@jlekstrand.net>
References: <20210423214853.876911-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 07/89] lib/i915/gem_engine_topology: Expose
 the __query_engines helper (v2)
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

v2 (Jason Ekstrand):
 - Add docs

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 lib/i915/gem_engine_topology.c | 28 +++++++++++++++++++---------
 lib/i915/gem_engine_topology.h |  4 ++++
 2 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index 291fb028..eb7a4c26 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -70,14 +70,17 @@ static int __gem_query(int fd, struct drm_i915_query *q)
 	return err;
 }
 
-static void gem_query(int fd, struct drm_i915_query *q)
-{
-	igt_assert_eq(__gem_query(fd, q), 0);
-}
-
-static void query_engines(int fd,
-			  struct drm_i915_query_engine_info *query_engines,
-			  int length)
+/**
+ * __gem_query_engines:
+ * @fd: open i915 drm file descriptor
+ * @query_engines: Returned engine query info
+ * @length: Size of query_engines, including room for the engines array
+ *
+ * Queries the set of engines available on this device.
+ */
+int __gem_query_engines(int fd,
+			struct drm_i915_query_engine_info *query_engines,
+			int length)
 {
 	struct drm_i915_query_item item = { };
 	struct drm_i915_query query = { };
@@ -89,7 +92,14 @@ static void query_engines(int fd,
 
 	item.data_ptr = to_user_pointer(query_engines);
 
-	gem_query(fd, &query);
+	return __gem_query(fd, &query);
+}
+
+static void query_engines(int fd,
+			  struct drm_i915_query_engine_info *query_engines,
+			  int length)
+{
+	igt_assert_eq(__gem_query_engines(fd, query_engines, length), 0);
 }
 
 static void ctx_map_engines(int fd, struct intel_engine_data *ed,
diff --git a/lib/i915/gem_engine_topology.h b/lib/i915/gem_engine_topology.h
index ac37b19a..26a7af18 100644
--- a/lib/i915/gem_engine_topology.h
+++ b/lib/i915/gem_engine_topology.h
@@ -29,6 +29,10 @@
 
 #define GEM_MAX_ENGINES		I915_EXEC_RING_MASK + 1
 
+int __gem_query_engines(int fd,
+			struct drm_i915_query_engine_info *query_engines,
+			int length);
+
 /**
  * intel_engine_data:
  * @nengines: Number of engines
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
