Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C64D110E258
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jun 2023 13:33:00 +0000 (UTC)
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 13 Jun 2023 19:07:09 +0530
Message-Id: <20230613133713.3315078-1-himal.prasad.ghimiray@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/4] Handle GT and tile seperation in IGT.
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

Cc: Francois Dugast <francois.dugast@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Upadhyay <tejas.upadhyay@intel.com>
Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>

Himal Prasad Ghimiray (4):
  lib/igt_sysfs: Add support to query number of tiles.
  lib/igt_sysfs: Handling gt related sysfs uapi changes.
  test/xe_guc_pc: Change the sysfs paths.
  tests/xe/xe_tile_prop: adds new test to verify per tile vram
    addr_range

 lib/igt_sysfs.c         |  28 ++++++
 lib/igt_sysfs.h         |  11 +++
 tests/meson.build       |   1 +
 tests/xe/xe_guc_pc.c    | 199 ++++++++++++++++++++--------------------
 tests/xe/xe_tile_prop.c |  66 +++++++++++++
 5 files changed, 206 insertions(+), 99 deletions(-)
 create mode 100644 tests/xe/xe_tile_prop.c

-- 
2.25.1
