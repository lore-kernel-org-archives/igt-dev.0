Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0A710E056
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Aug 2023 05:52:54 +0000 (UTC)
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 29 Aug 2023 11:28:34 +0530
Message-Id: <20230829055835.1750432-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230829055835.1750432-1-himal.prasad.ghimiray@intel.com>
References: <20230829055835.1750432-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/xe_sysfs_tile: Update
 documentation fields
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

Update Category, Run type and Test Category fields for test.

Cc: Katarzyna Dec <katarzyna.dec@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 tests/xe/xe_sysfs_tile.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/xe/xe_sysfs_tile.c b/tests/xe/xe_sysfs_tile.c
index 3be9c93f7..f8782b3e6 100644
--- a/tests/xe/xe_sysfs_tile.c
+++ b/tests/xe/xe_sysfs_tile.c
@@ -5,9 +5,13 @@
 
 /**
  * TEST: Verify physical_vram_size_bytes of each tiles
- * SUBTEST: physical_vram_size_bytes
+ * Category: Software building block
  * Functionality: Vram
  * Sub-category: Total vram per tile
+ * Test category: functionality test
+ * Run type: FULL
+ *
+ * SUBTEST: physical_vram_size_bytes
  * Description:
  *             Read sysfs entry for physical_vram_size_bytes and compare with
  *             vram size. physical_vram_size_bytes should be more than vram size.
-- 
2.25.1
