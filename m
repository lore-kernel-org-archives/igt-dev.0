Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 15 Sep 2023 06:23:42 -0700
Message-Id: <20230915132346.1845909-11-lucas.demarchi@intel.com>
In-Reply-To: <20230915132346.1845909-1-lucas.demarchi@intel.com>
References: <20230915132346.1845909-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 10/14] lib/intel_mocs: Remove unused
 lefotver defines
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Leftover from previous refactors. Remove since they are unused.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/intel_mocs.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/lib/intel_mocs.c b/lib/intel_mocs.c
index d9de16932..aafe27692 100644
--- a/lib/intel_mocs.c
+++ b/lib/intel_mocs.c
@@ -16,8 +16,6 @@
 #define GEN12_MOCS_WB_IDX			2
 #define XE2_MOCS_UC_IDX				3
 #define XE2_MOCS_WB_IDX				1
-#define XY_BLOCK_COPY_BLT_MOCS_SHIFT		21
-#define XY_CTRL_SURF_COPY_BLT_MOCS_SHIFT	25
 
 struct drm_intel_mocs_index {
 	uint8_t uc_index;
-- 
2.40.1
