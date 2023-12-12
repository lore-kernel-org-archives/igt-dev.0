Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150CE10E540
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Dec 2023 01:13:34 +0000 (UTC)
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Subject: [PATCH i-g-t v5 5/6] tests/intel/gem_ccs: Add compression support for
 Lunarlake
Date: Tue, 12 Dec 2023 05:13:14 -0800
Message-Id: <14df0b1486b80257b7d5d505b7a84b177f880ce1.1702386259.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1702386259.git.akshata.jahagirdar@intel.com>
References: <cover.1702386259.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, ayaz.siddiqui@intel.com,
 akshata.jahagirdar@intel.com, matthew.auld@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Update the ccs_ratio call to get value according to platform.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
---
 tests/intel/gem_ccs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/gem_ccs.c b/tests/intel/gem_ccs.c
index 0a691778d..5a17be4cb 100644
--- a/tests/intel/gem_ccs.c
+++ b/tests/intel/gem_ccs.c
@@ -99,7 +99,7 @@ static void surf_copy(int i915,
 	struct blt_block_copy_data_ext ext = {};
 	struct blt_ctrl_surf_copy_data surf = {};
 	uint32_t bb1, bb2, ccs, ccs2, *ccsmap, *ccsmap2;
-	uint64_t bb_size, ccssize = mid->size / CCS_RATIO;
+	uint64_t bb_size, ccssize = mid->size / (CCS_RATIO(i915));
 	uint32_t *ccscopy;
 	uint8_t uc_mocs = intel_get_uc_mocs_index(i915);
 	int result;
-- 
2.34.1
