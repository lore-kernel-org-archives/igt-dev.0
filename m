Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB1B10EAF4
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Jan 2024 11:55:03 +0000 (UTC)
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Subject: [PATCH i-g-t 1/1] tests/intel/xe_ccs: fix block-multicopy-inplace
 subtest
Date: Fri, 12 Jan 2024 15:54:14 -0800
Message-Id: <1ffebacea9673a0c143e535bd0b5fe9ff8c65e9d.1705103321.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1705103321.git.akshata.jahagirdar@intel.com>
References: <cover.1705103321.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, matthew.auld@intel.com,
 akshata.jahagirdar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Passing correct pat_index based on compression and graphics version,
fixes the "block-multicopy-inplace" subtest of xe_ccs.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
---
 tests/intel/xe_ccs.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index 596735aaa..55ae0e46c 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -378,8 +378,13 @@ static void block_copy(int xe,
 	blt_set_object_ext(&ext.src, mid_compression_format, width, height, SURFACE_TYPE_2D);
 	blt_set_object_ext(&ext.dst, 0, width, height, SURFACE_TYPE_2D);
 	if (config->inplace) {
+		uint8_t pat_index = DEFAULT_PAT_INDEX;
+
+		if (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) && config->compression)
+			pat_index = intel_get_pat_idx_uc_comp(xe);
+
 		blt_set_object(&blt.dst, mid->handle, dst->size, mid->region, 0,
-			       DEFAULT_PAT_INDEX, T_LINEAR, COMPRESSION_DISABLED,
+			       pat_index, T_LINEAR, COMPRESSION_DISABLED,
 			       comp_type);
 		blt.dst.ptr = mid->ptr;
 	}
@@ -461,8 +466,13 @@ static void block_multicopy(int xe,
 	blt_set_copy_object(&blt3.final, final);
 
 	if (config->inplace) {
+		uint8_t pat_index = DEFAULT_PAT_INDEX;
+
+		if (AT_LEAST_GEN(intel_get_drm_devid(xe), 20) && config->compression)
+			pat_index = intel_get_pat_idx_uc_comp(xe);
+
 		blt_set_object(&blt3.dst, mid->handle, dst->size, mid->region,
-			       mid->mocs_index, DEFAULT_PAT_INDEX, mid_tiling,
+			       mid->mocs_index, pat_index, mid_tiling,
 			       COMPRESSION_DISABLED, comp_type);
 		blt3.dst.ptr = mid->ptr;
 	}
-- 
2.34.1
