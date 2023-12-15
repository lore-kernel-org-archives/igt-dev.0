Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8997A10E333
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Dec 2023 07:42:09 +0000 (UTC)
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Subject: [PATCH i-g-t v7 3/5] lib/intel_pat: Add uc_comp pat_index
Date: Fri, 15 Dec 2023 11:41:47 -0800
Message-Id: <742a4385f7db7a03e8c9fbd171be73d85e60f9e4.1702669191.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1702669191.git.akshata.jahagirdar@intel.com>
References: <cover.1702669191.git.akshata.jahagirdar@intel.com>
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
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>, akshata.jahagirdar@intel.co,
 ayaz.siddiqui@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Compression in XE2 is programmed through pat-index attribute.
Add a dedicated pat-index for compression for XE2 and later platforms.
The caller to this helper function ensures GFX version is correct.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 lib/intel_pat.c | 14 +++++++++++++-
 lib/intel_pat.h |  2 ++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/lib/intel_pat.c b/lib/intel_pat.c
index 2b892ee52..041952bd8 100644
--- a/lib/intel_pat.c
+++ b/lib/intel_pat.c
@@ -11,7 +11,7 @@ struct intel_pat_cache {
 	uint8_t uc; /* UC + COH_NONE */
 	uint8_t wt; /* WT + COH_NONE */
 	uint8_t wb; /* WB + COH_AT_LEAST_1WAY */
-
+	uint8_t uc_comp; /* UC + COH_NONE + COMPRESSION, XE2 and later*/
 	uint8_t max_index;
 };
 
@@ -23,6 +23,7 @@ static void intel_get_pat_idx(int fd, struct intel_pat_cache *pat)
 		pat->uc = 3;
 		pat->wt = 15; /* Compressed + WB-transient */
 		pat->wb = 2;
+		pat->uc_comp = 12; /* Compressed + UC, XE2 and later */
 		pat->max_index = 31;
 	} else if (IS_METEORLAKE(dev_id)) {
 		pat->uc = 2;
@@ -60,6 +61,17 @@ uint8_t intel_get_pat_idx_uc(int fd)
 	return pat.uc;
 }
 
+uint8_t intel_get_pat_idx_uc_comp(int fd)
+{
+	struct intel_pat_cache pat = {};
+	uint16_t dev_id = intel_get_drm_devid(fd);
+
+	igt_assert(AT_LEAST_GEN(dev_id, 20));
+
+	intel_get_pat_idx(fd, &pat);
+	return pat.uc_comp;
+}
+
 uint8_t intel_get_pat_idx_wt(int fd)
 {
 	struct intel_pat_cache pat = {};
diff --git a/lib/intel_pat.h b/lib/intel_pat.h
index c24dbc275..eb48cbc65 100644
--- a/lib/intel_pat.h
+++ b/lib/intel_pat.h
@@ -16,4 +16,6 @@ uint8_t intel_get_pat_idx_uc(int fd);
 uint8_t intel_get_pat_idx_wt(int fd);
 uint8_t intel_get_pat_idx_wb(int fd);
 
+uint8_t intel_get_pat_idx_uc_comp(int fd);
+
 #endif /* INTEL_PAT_H */
-- 
2.34.1
