Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA0510E60E
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Apr 2022 15:00:43 +0000 (UTC)
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, petri.latvala@intel.com,
 ashutosh.dixit@intel.com, umesh.nerlige.ramappa@intel.com,
 arjun.melkaveri@intel.com, krishnaiah.bommu@intel.com,
 igt-dev@lists.freedesktop.org
Date: Thu, 21 Apr 2022 20:22:10 +0530
Message-Id: <20220421145211.464313-6-priyanka.dandamudi@intel.com>
In-Reply-To: <20220421145211.464313-1-priyanka.dandamudi@intel.com>
References: <20220421145211.464313-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 5/6] lib/intel_ctx: Create intel_ctx with
 physical engines in a single gt
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

From: Ashutosh Dixit <ashutosh.dixit@intel.com>

Introduce intel_ctx_create_for_gt for creating an intel_ctx_t containing
all physical engines belonging to a single gt.

Cc: Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 lib/intel_ctx.c | 41 +++++++++++++++++++++++++++++++++++++++++
 lib/intel_ctx.h |  2 ++
 2 files changed, 43 insertions(+)

diff --git a/lib/intel_ctx.c b/lib/intel_ctx.c
index e19a54a8..14866511 100644
--- a/lib/intel_ctx.c
+++ b/lib/intel_ctx.c
@@ -61,6 +61,27 @@ intel_ctx_cfg_t intel_ctx_cfg_all_physical(int fd)
 	return cfg;
 }
 
+/**
+ * intel_ctx_cfg_for_gt:
+ * @fd: open i915 drm file descriptor
+ * @gt: gt id
+ *
+ * Returns an intel_ctx_cfg_t containing all physical engines belonging to @gt
+ */
+intel_ctx_cfg_t intel_ctx_cfg_for_gt(int fd, int gt)
+{
+	struct i915_engine_class_instance *ci;
+	intel_ctx_cfg_t cfg = {};
+	unsigned int count;
+
+	ci = gem_list_engines(fd, 1u << gt, ~0u, &count);
+	memcpy(&cfg.engines, ci, count * sizeof(*ci));
+	cfg.num_engines = count;
+	free(ci);
+
+	return cfg;
+}
+
 /**
  * intel_ctx_cfg_for_engine:
  * @class: engine class
@@ -295,6 +316,26 @@ const intel_ctx_t *intel_ctx_create_all_physical(int fd)
 	return intel_ctx_create(fd, &cfg);
 }
 
+/**
+ * intel_ctx_create_for_gt:
+ * @fd: open i915 drm file descriptor
+ * @gt: gt id
+ *
+ * Creates an intel_ctx_t containing all physical engines belonging to @gt
+ */
+const intel_ctx_t *intel_ctx_create_for_gt(int fd, int gt)
+{
+	intel_ctx_cfg_t cfg;
+
+	igt_require(gem_has_contexts(fd) || !gt);
+
+	if (!gem_has_contexts(fd))
+		return intel_ctx_0(fd);
+
+	cfg = intel_ctx_cfg_for_gt(fd, gt);
+	return intel_ctx_create(fd, &cfg);
+}
+
 /**
  * intel_ctx_cfg_engine_class:
  * @cfg: an intel_ctx_cfg_t
diff --git a/lib/intel_ctx.h b/lib/intel_ctx.h
index 89c65fcd..3cfeaae8 100644
--- a/lib/intel_ctx.h
+++ b/lib/intel_ctx.h
@@ -54,6 +54,7 @@ typedef struct intel_ctx_cfg {
 
 intel_ctx_cfg_t intel_ctx_cfg_for_engine(unsigned int class, unsigned int inst);
 intel_ctx_cfg_t intel_ctx_cfg_all_physical(int fd);
+intel_ctx_cfg_t intel_ctx_cfg_for_gt(int fd, int gt);
 int intel_ctx_cfg_engine_class(const intel_ctx_cfg_t *cfg, unsigned int engine);
 
 /**
@@ -75,6 +76,7 @@ const intel_ctx_t *intel_ctx_0(int fd);
 const intel_ctx_t *intel_ctx_create_for_engine(int fd, unsigned int class,
 					       unsigned int inst);
 const intel_ctx_t *intel_ctx_create_all_physical(int fd);
+const intel_ctx_t *intel_ctx_create_for_gt(int fd, int gt);
 void intel_ctx_destroy(int fd, const intel_ctx_t *ctx);
 
 unsigned int intel_ctx_engine_class(const intel_ctx_t *ctx, unsigned int engine);
-- 
2.25.1
