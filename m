Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <igt-dev@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:19:54 -0400
Message-ID: <20230919142000.91363-12-rodrigo.vivi@intel.com>
In-Reply-To: <20230919142000.91363-1-rodrigo.vivi@intel.com>
References: <20230919142000.91363-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 11/16] drm-uapi/xe: Remove unused field of
 drm_xe_query_gt
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Align with commit ("drm/xe/uapi: Remove unused field of drm_xe_query_gt")

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
---
 include/drm-uapi/xe_drm.h | 2 --
 tests/intel/xe_query.c    | 1 -
 2 files changed, 3 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 544f2f14b..6ba86c1f1 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -354,8 +354,6 @@ struct drm_xe_query_gt {
 	__u16 gt_id;
 	/** @clock_freq: A clock frequency for timestamp */
 	__u32 clock_freq;
-	/** @features: Reserved for future information about GT features */
-	__u64 features;
 	/**
 	 * @native_mem_regions: Bit mask of instances from
 	 * drm_xe_query_mem_usage that lives on the same GPU/Tile and have
diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index eb8d52897..3aa2918f0 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -281,7 +281,6 @@ test_query_gts(int fd)
 		igt_info("type: %d\n", gts->gts[i].type);
 		igt_info("gt_id: %d\n", gts->gts[i].gt_id);
 		igt_info("clock_freq: %u\n", gts->gts[i].clock_freq);
-		igt_info("features: 0x%016llx\n", gts->gts[i].features);
 		igt_info("native_mem_regions: 0x%016llx\n",
 		       gts->gts[i].native_mem_regions);
 		igt_info("slow_mem_regions: 0x%016llx\n",
-- 
2.41.0
