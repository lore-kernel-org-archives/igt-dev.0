Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFDBE10E0C8
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Aug 2023 14:43:53 +0000 (UTC)
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  8 Aug 2023 20:19:12 +0530
Message-Id: <20230808144913.600790-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230808144913.600790-1-himal.prasad.ghimiray@intel.com>
References: <20230808144913.600790-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/2] tests/xe_sysfs_tile: Update
 documentation fields.
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

- Update functionality and sub-category fields.

v2
- Fix compilation failure.

Cc: Katarzyna Dec <katarzyna.dec@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
---
 tests/xe/xe_sysfs_tile.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/xe/xe_sysfs_tile.c b/tests/xe/xe_sysfs_tile.c
index c4c3f5446..3be9c93f7 100644
--- a/tests/xe/xe_sysfs_tile.c
+++ b/tests/xe/xe_sysfs_tile.c
@@ -6,6 +6,8 @@
 /**
  * TEST: Verify physical_vram_size_bytes of each tiles
  * SUBTEST: physical_vram_size_bytes
+ * Functionality: Vram
+ * Sub-category: Total vram per tile
  * Description:
  *             Read sysfs entry for physical_vram_size_bytes and compare with
  *             vram size. physical_vram_size_bytes should be more than vram size.
-- 
2.25.1
