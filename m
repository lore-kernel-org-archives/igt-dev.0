Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C1E210E09F
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Sep 2023 23:49:43 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 12 Sep 2023 16:49:52 -0700
Message-Id: <20230912234954.2110973-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 0/2] Remove
 XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE from Xe uAPI
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

XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE is getting removed in the Xe
uAPI, update IGTs as needed.

Matt

Matthew Brost (2):
  xe_exec_threads: Use DRM_XE_VM_CREATE_COMPUTE_MODE when creating a
    compute VM
  xe: Update uAPI and remove XE_EXEC_QUEUE_SET_PROPERTY_COMPUTE_MODE

 include/drm-uapi/xe_drm.h          | 27 ++++++++++-----------------
 tests/intel/xe_evict.c             | 14 +++-----------
 tests/intel/xe_exec_balancer.c     |  8 +-------
 tests/intel/xe_exec_compute_mode.c | 20 ++------------------
 tests/intel/xe_exec_reset.c        | 10 ++--------
 tests/intel/xe_exec_threads.c      | 17 ++++-------------
 tests/intel/xe_noexec_ping_pong.c  | 10 +---------
 7 files changed, 23 insertions(+), 83 deletions(-)

-- 
2.34.1
