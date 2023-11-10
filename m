Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E02F010E103
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Nov 2023 15:52:24 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 10 Nov 2023 15:52:04 +0000
Message-Id: <20231110155211.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v1 0/7] uAPI Alignment - Remove unused features
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

The series "uAPI Alignment - take 2 v3" [1] has grown too much which makes
it difficult to review and to digest by UMDs. This new series is a first
break down which focuses only on removing features which were not used.

It aligns on kernel series [2].

[1] https://patchwork.freedesktop.org/series/126204/
[2] https://patchwork.freedesktop.org/series/126278/

Francois Dugast (5):
  drm-uapi/xe: Remove useless XE_QUERY_CONFIG_NUM_PARAM
  drm-uapi/xe: Remove unused inaccessible memory region
  drm-uapi/xe: Remove unused QUERY_CONFIG_MEM_REGION_COUNT
  drm-uapi/xe: Remove unused QUERY_CONFIG_GT_COUNT
  drm-uapi/xe: Drop interrupt pmu event

Rodrigo Vivi (2):
  drm-uapi/xe: Remove GT_TYPE_REMOTE.
  drm-uapi/xe: Kill VM_MADVISE IOCTL and the atomic tests

 include/drm-uapi/xe_drm.h        | 121 ++++-----------------
 lib/xe/xe_ioctl.c                |  14 ---
 lib/xe/xe_ioctl.h                |   2 -
 lib/xe/xe_query.c                |  11 +-
 lib/xe/xe_query.h                |   3 -
 tests/intel/xe_debugfs.c         |   2 -
 tests/intel/xe_exec_fault_mode.c | 174 ++-----------------------------
 tests/intel/xe_query.c           |   6 --
 8 files changed, 35 insertions(+), 298 deletions(-)

-- 
2.34.1
