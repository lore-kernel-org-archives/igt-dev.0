Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E777010E55A
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Dec 2023 05:15:36 +0000 (UTC)
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v5 0/2] RFC: drm-uapi/xe: add exec_queue_id member to
 drm_xe_wait_user_fence structure
Date: Tue, 12 Dec 2023 10:40:38 +0530
Message-Id: <20231212051040.6912-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Remove the num_engines/instances members from drm_xe_wait_user_fence structure
and add a exec_queue_id member

exec_queue-reset-wait subtest to excess behaviour when exec_queue reset happen

about test
Don't wait till timeout on user fence when exec_queue reset is detected
and return return  proper error code

I am able to see exec_queue reset was happened and xe_wait_user_fence_ioctl returned EIO 

test result
below igt tests are passing
xe_exec_balancer.c
xe_exec_compute_mode.c
xe_exec_fault_mode.c
xe_exec_reset.c
xe_exec_threads.c
xe_waitfence.c


Bommu Krishnaiah (2):
  drm-uapi/xe: add exec_queue_id member to drm_xe_wait_user_fence
    structure
  drm-uapi/xe: Don't wait on user_fence during exec queue reset

 include/drm-uapi/xe_drm.h          |  28 ++++----
 lib/xe/xe_ioctl.c                  |  29 ++++----
 lib/xe/xe_ioctl.h                  |  11 ++-
 tests/intel/xe_evict.c             |   4 +-
 tests/intel/xe_exec_balancer.c     |  15 ++--
 tests/intel/xe_exec_compute_mode.c |  18 ++---
 tests/intel/xe_exec_fault_mode.c   |  21 +++---
 tests/intel/xe_exec_reset.c        |   6 +-
 tests/intel/xe_exec_threads.c      |  15 ++--
 tests/intel/xe_waitfence.c         | 111 +++++++++++++++++++++++++----
 10 files changed, 169 insertions(+), 89 deletions(-)

-- 
2.25.1
