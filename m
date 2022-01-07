Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C04210F5A9
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jan 2022 16:30:54 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Fri,  7 Jan 2022 21:49:19 +0530
Message-Id: <20220107161920.1643369-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20220107161920.1643369-1-priyanka.dandamudi@intel.com>
References: <20220107161920.1643369-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/igt_gt: Check for shared reset
 domain
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com, ashutosh.dixit@intel.com, John.C.Harrison@Intel.com, saurabhg.gupta@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Function to check if a platform has shared reset domain.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 lib/igt_gt.c | 17 +++++++++++++++++
 lib/igt_gt.h |  2 ++
 2 files changed, 19 insertions(+)

diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index 7c7df95e..e5cd7b26 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -637,3 +637,20 @@ int gem_execbuf_flags_to_engine_class(unsigned int flags)
 		igt_assert(0);
 	}
 }
+
+bool has_shared_reset_domain(int fd, const intel_ctx_t *ctx, const struct intel_execution_engine2 *e)
+{
+	bool rcs0 = false;
+	bool ccs0 = false;
+
+	for_each_ctx_engine (fd, ctx, e) {
+                if (rcs0 && ccs0)
+                        break;
+                else if (e->class == I915_ENGINE_CLASS_RENDER && e->instance == 0)
+                                rcs0 = true;
+                else if (e->class == I915_ENGINE_CLASS_COMPUTE && e->instance == 0)
+                                ccs0 = true;
+        }
+        return (rcs0 && ccs0);
+
+}
diff --git a/lib/igt_gt.h b/lib/igt_gt.h
index c5059817..e54a695c 100644
--- a/lib/igt_gt.h
+++ b/lib/igt_gt.h
@@ -84,4 +84,6 @@ extern const struct intel_execution_engine2 {
 
 int gem_execbuf_flags_to_engine_class(unsigned int flags);
 
+bool has_shared_reset_domain(int fd, const intel_ctx_t *ctx, const struct intel_execution_engine2 *e);
+
 #endif /* IGT_GT_H */
-- 
2.25.1
