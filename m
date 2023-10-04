Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAFFA10E11F
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Oct 2023 15:49:16 +0000 (UTC)
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  4 Oct 2023 08:49:19 -0700
Message-Id: <20231004154922.3478014-11-lucas.demarchi@intel.com>
In-Reply-To: <20231004154922.3478014-1-lucas.demarchi@intel.com>
References: <20231004154922.3478014-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 10/13] lib/intel_mocs: Remove unused
 lefotver defines
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Leftover from previous refactors. Remove since they are unused.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 lib/intel_mocs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/lib/intel_mocs.c b/lib/intel_mocs.c
index 9e16b32f1..0659ff50b 100644
--- a/lib/intel_mocs.c
+++ b/lib/intel_mocs.c
@@ -16,8 +16,6 @@
 #define GEN12_MOCS_WB_IDX			2
 #define XE2_MOCS_UC_IDX				3
 #define XE2_MOCS_WB_IDX				4
-#define XY_BLOCK_COPY_BLT_MOCS_SHIFT		21
-#define XY_CTRL_SURF_COPY_BLT_MOCS_SHIFT	25
 
 struct drm_intel_mocs_index {
 	uint8_t uc_index;
-- 
2.40.1
