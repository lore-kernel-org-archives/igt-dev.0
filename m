Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E89D10E486
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jan 2022 09:08:56 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Mon, 17 Jan 2022 14:26:59 +0530
Message-Id: <20220117085700.1723228-2-priyanka.dandamudi@intel.com>
In-Reply-To: <20220117085700.1723228-1-priyanka.dandamudi@intel.com>
References: <20220117085700.1723228-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 1/2] lib/igt_gt: Check for shared reset
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
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com, ashutosh.dixit@intel.com, John.C.Harrison@Intel.com, saurabhg.gupta@intel.com, matthew.d.roper@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Function to check if a platform has shared reset domain.

v2: Some minor fixes (Ashutosh)

v3: Add logic for multiple CCS (Roper Matt)

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 lib/igt_gt.c | 20 ++++++++++++++++++++
 lib/igt_gt.h |  2 ++
 2 files changed, 22 insertions(+)

diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index 7c7df95e..2cf7be2b 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -637,3 +637,23 @@ int gem_execbuf_flags_to_engine_class(unsigned int flags)
 		igt_assert(0);
 	}
 }
+
+bool has_shared_reset_domain(int fd, const intel_ctx_t *ctx)
+{
+	const struct intel_execution_engine2 *e;
+	bool rcs0 = false;
+	bool ccs0 = false;
+	int ccs_count = 0;
+
+	for_each_ctx_engine(fd, ctx, e) {
+		if ((rcs0 && ccs0) || (ccs_count > 1))
+			break;
+		else if (e->class == I915_ENGINE_CLASS_RENDER)
+			rcs0 = true;
+		else if (e->class == I915_ENGINE_CLASS_COMPUTE) {
+			ccs0 = true;
+			ccs_count++;
+		}
+	}
+	return ((rcs0 && ccs0) || (ccs_count > 1));
+}
diff --git a/lib/igt_gt.h b/lib/igt_gt.h
index c5059817..f0340552 100644
--- a/lib/igt_gt.h
+++ b/lib/igt_gt.h
@@ -84,4 +84,6 @@ extern const struct intel_execution_engine2 {
 
 int gem_execbuf_flags_to_engine_class(unsigned int flags);
 
+bool has_shared_reset_domain(int fd, const intel_ctx_t *ctx);
+
 #endif /* IGT_GT_H */
-- 
2.25.1
