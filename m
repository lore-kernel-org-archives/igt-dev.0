Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 668AE10E22D
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Sep 2023 12:46:25 +0000 (UTC)
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 12 Sep 2023 14:46:11 +0200
Message-ID: <20230912124613.27850-2-nirmoy.das@intel.com>
In-Reply-To: <20230912124613.27850-1-nirmoy.das@intel.com>
References: <20230912124613.27850-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH igt-dii-client 1/3] lib/igt_gt: Add a method to
 detect ggtt bind
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: andi.shyti@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On MTL GGTT updates happens through MI_UPDATE_GGTT command.
Add a method to detect that.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 lib/igt_gt.c | 5 +++++
 lib/igt_gt.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index a24a566c76..6895964a9b 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -659,3 +659,8 @@ int gem_execbuf_flags_to_engine_class(unsigned int flags)
 		igt_assert(0);
 	}
 }
+
+bool gem_has_ggtt_bind(int fd)
+{
+	return IS_METEORLAKE(intel_get_drm_devid(fd));
+}
diff --git a/lib/igt_gt.h b/lib/igt_gt.h
index 3d10349e46..7d35a209da 100644
--- a/lib/igt_gt.h
+++ b/lib/igt_gt.h
@@ -83,5 +83,6 @@ extern const struct intel_execution_engine2 {
 } intel_execution_engines2[];
 
 int gem_execbuf_flags_to_engine_class(unsigned int flags);
+bool gem_has_ggtt_bind(int fd);
 
 #endif /* IGT_GT_H */
-- 
2.41.0
