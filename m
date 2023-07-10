Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4AE10E070
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jul 2023 04:38:42 +0000 (UTC)
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 10 Jul 2023 10:13:26 +0530
Message-Id: <20230710044330.770948-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v9 0/4] Handle GT and tile seperation in IGT
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Upadhyay <tejas.upadhyay@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

With seperation of GT and tiles in KMD, we will have sysfs entries
for properties associated with tile and gtX sysfs parent will be moving
under tileX. This series provides helper functions for accessing tile
associated sysfs entries and gt specific sysfs under respective tile.

series addresses gt related sysfs path change for xe_guc_pc.c test case 
and introduces new test to verify addr_range for each vram.

Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Himal Prasad Ghimiray (4):
  lib/igt_sysfs: Add support to query number of tiles
  lib/igt_sysfs: Handling gt related sysfs uapi changes
  tests/xe/xe_guc_pc: Change the sysfs paths
  tests/xe/xe_sysfs_tile: adds new test to verify per tile vram
    addr_range

 lib/igt_sysfs.c          | 125 ++++++++++++++++++++++++++
 lib/igt_sysfs.h          |  10 +++
 tests/meson.build        |   1 +
 tests/xe/xe_guc_pc.c     | 186 ++++++++++++++++++++-------------------
 tests/xe/xe_sysfs_tile.c |  55 ++++++++++++
 5 files changed, 288 insertions(+), 89 deletions(-)
 create mode 100644 tests/xe/xe_sysfs_tile.c

-- 
2.25.1
