Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382F610E0B6
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Nov 2023 03:38:27 +0000 (UTC)
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Date: Thu, 16 Nov 2023 07:38:32 -0800
Message-Id: <59981c734849e48d10e2b36e6062987b45bf9971.1700146980.git.akshata.jahagirdar@intel.com>
In-Reply-To: <cover.1700146980.git.akshata.jahagirdar@intel.com>
References: <cover.1700146980.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/5] tests/intel/gem_ccs: Add compression
 support for Lunarlake
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, ayaz.siddiqui@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>, matthew.auld@intel.com
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
