Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE64C6EABD
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Apr 2021 19:12:01 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id 10so7825743pfl.1
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Apr 2021 12:12:01 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 15 Apr 2021 14:10:37 -0500
Message-Id: <20210415191145.2137858-7-jason@jlekstrand.net>
In-Reply-To: <20210415191145.2137858-1-jason@jlekstrand.net>
References: <20210415191145.2137858-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 06/74] lib/i915/gem_engine_topology: Expose
 the __query_engines helper
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
 lib/i915/gem_engine_topology.c | 20 +++++++++++---------
 lib/i915/gem_engine_topology.h |  4 ++++
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/lib/i915/gem_engine_topology.c b/lib/i915/gem_engine_topology.c
index c12cd920..5d196f59 100644
--- a/lib/i915/gem_engine_topology.c
+++ b/lib/i915/gem_engine_topology.c
@@ -62,14 +62,9 @@ static int __gem_query(int fd, struct drm_i915_query *q)
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
+int __gem_query_engines(int fd,
+			struct drm_i915_query_engine_info *query_engines,
+			int length)
 {
 	struct drm_i915_query_item item = { };
 	struct drm_i915_query query = { };
@@ -81,7 +76,14 @@ static void query_engines(int fd,
 
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
index f5edcb5d..76b7cd4d 100644
--- a/lib/i915/gem_engine_topology.h
+++ b/lib/i915/gem_engine_topology.h
@@ -29,6 +29,10 @@
 
 #define GEM_MAX_ENGINES		I915_EXEC_RING_MASK + 1
 
+int __gem_query_engines(int fd,
+			struct drm_i915_query_engine_info *query_engines,
+			int length);
+
 struct intel_engine_data {
 	uint32_t nengines;
 	uint32_t n;
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
