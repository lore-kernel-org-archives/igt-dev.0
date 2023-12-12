Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BD8310E16D
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Dec 2023 05:39:45 +0000 (UTC)
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Subject: [PATCH i-g-t v5 0/6] Compression support for Lunarlake
Date: Tue, 12 Dec 2023 09:39:22 -0800
Message-Id: <cover.1702402592.git.akshata.jahagirdar@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Series enables the compression feature for Lunarlake and address various
changes of the feature from Gen12. The Main-to-CCS ratio has been
changed to 512:1. This changes the calculations and value for fields
such as CCS Copy size for blitter command APIs. 
This patch series updates tests xe_ccs and gem_ccs for XE2.
This series doesn't solve "in-place" and "suspend-resume" subtests.

These changes are based on top of the "vm_bind pat_index" patch here:
https://patchwork.freedesktop.org/series/124667/

v2: Lots of improvements/tweaks (Kamil)
    Addressed review comments (Matthew, Karolina)
v3: Reused dg2_xy_fast_copy definition for defing xe2_cmds_info struct(Karolina)
    Split the patch to address ccs_size calculation and updating
pat_index, updated the intel_get_pat_idx_uc_comp function as per review
comments (Kamil)
v4: Addressed review comments (Karolina)
    Rebase. Removed few unnecessary conditions, plus few fixes.
v5: Addressed Review comments (Matthew, Zbigniew)
    Rebase, Fixes for pre-merge IGT tests.

Akshata Jahagirdar (6):
  lib: Add blt command properties for lunarlake
  lib/intel_blt: Update calculation of ccs_size and size_of_ctrl_copy
  lib/intel_pat: Add uc_comp pat_index
  lib/intel_blt: Update caching mode and pat_index
  tests/intel/gem_ccs: Add compression support for Lunarlake
  tests/intel/xe_ccs: Add compression support for Lunarlake

 lib/intel_blt.c         | 26 ++++++++++++++++--------
 lib/intel_blt.h         |  2 +-
 lib/intel_cmds_info.c   | 16 +++++++++++++++
 lib/intel_cmds_info.h   |  1 +
 lib/intel_device_info.c |  2 +-
 lib/intel_pat.c         | 14 ++++++++++++-
 lib/intel_pat.h         |  2 ++
 tests/intel/gem_ccs.c   |  2 +-
 tests/intel/xe_ccs.c    | 45 ++++++++++++++++++++++++-----------------
 9 files changed, 79 insertions(+), 31 deletions(-)

-- 
2.34.1
