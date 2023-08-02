Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D4210E0E3
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Aug 2023 17:05:43 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  2 Aug 2023 17:04:36 +0000
Message-Id: <20230802170437.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 0/1] xe: Rename engine to exec_queue
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: rodrigo.vivi@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This will be required once the kernel series below is merged
as xe_drm.h will be updated:
https://patchwork.freedesktop.org/series/121627/

v2: Use generated uapi header (Rodrigo Vivi)

Francois Dugast (1):
  xe: Rename engine to exec_queue

 include/drm-uapi/xe_drm.h                |  96 +++++-----
 lib/igt_fb.c                             |   4 +-
 lib/intel_batchbuffer.c                  |   4 +-
 lib/intel_ctx.c                          |   2 +-
 lib/xe/xe_compute.c                      |   8 +-
 lib/xe/xe_ioctl.c                        |  80 ++++----
 lib/xe/xe_ioctl.h                        |  32 ++--
 lib/xe/xe_spin.c                         |  24 +--
 lib/xe/xe_spin.h                         |   2 +-
 tests/intel-ci/xe-fast-feedback.testlist |  60 +++---
 tests/xe/xe_ccs.c                        |  16 +-
 tests/xe/xe_create.c                     |  60 +++---
 tests/xe/xe_dma_buf_sync.c               |   8 +-
 tests/xe/xe_evict.c                      | 234 +++++++++++------------
 tests/xe/xe_exec_balancer.c              |  96 +++++-----
 tests/xe/xe_exec_basic.c                 | 116 +++++------
 tests/xe/xe_exec_compute_mode.c          | 126 ++++++------
 tests/xe/xe_exec_fault_mode.c            | 176 ++++++++---------
 tests/xe/xe_exec_reset.c                 | 214 ++++++++++-----------
 tests/xe/xe_exec_store.c                 |  20 +-
 tests/xe/xe_exec_threads.c               | 172 ++++++++---------
 tests/xe/xe_exercise_blt.c               |   8 +-
 tests/xe/xe_guc_pc.c                     |  46 ++---
 tests/xe/xe_huc_copy.c                   |   8 +-
 tests/xe/xe_intel_bb.c                   |   4 +-
 tests/xe/xe_noexec_ping_pong.c           |  16 +-
 tests/xe/xe_pm.c                         |  34 ++--
 tests/xe/xe_spin_batch.c                 |  20 +-
 tests/xe/xe_vm.c                         | 214 ++++++++++-----------
 29 files changed, 955 insertions(+), 945 deletions(-)

-- 
2.34.1
