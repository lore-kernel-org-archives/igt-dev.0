Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B4410E1A0
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Dec 2023 17:31:11 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v1 0/6] uAPI Alignment - More cleanup before upstream
Date: Tue, 12 Dec 2023 17:30:53 +0000
Message-Id: <20231212173059.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This series contains changes to align on kernel series below:
https://patchwork.freedesktop.org/series/127365/
https://patchwork.freedesktop.org/series/127440/
https://patchwork.freedesktop.org/series/127593/
https://patchwork.freedesktop.org/series/127598/

Bommu Krishnaiah (2):
  drm-uapi/xe: add exec_queue_id member to drm_xe_wait_user_fence
    structure
  drm-uapi/xe: Don't wait on user_fence during exec queue reset

Francois Dugast (4):
  drm-uapi/xe: Align header with current kernel uAPI
  drm-uapi/xe: Remove DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY
  drm-uapi/xe: Remove DRM_XE_UFENCE_WAIT_MASK_*
  drm-uapi/xe: Remove PMU from Xe till uapi is finalized

 include/drm-uapi/xe_drm.h          |  81 ++++++--------------
 lib/xe/xe_ioctl.c                  |  29 ++++----
 lib/xe/xe_ioctl.h                  |  13 ++--
 tests/intel/xe_evict.c             |   4 +-
 tests/intel/xe_exec_balancer.c     |  15 ++--
 tests/intel/xe_exec_compute_mode.c |  18 ++---
 tests/intel/xe_exec_fault_mode.c   |  21 +++---
 tests/intel/xe_exec_reset.c        |   6 +-
 tests/intel/xe_exec_threads.c      |  15 ++--
 tests/intel/xe_waitfence.c         | 114 ++++++++++++++++++++++++-----
 10 files changed, 179 insertions(+), 137 deletions(-)

-- 
2.34.1
