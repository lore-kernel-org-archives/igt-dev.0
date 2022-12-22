Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD5910E18A
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Dec 2022 22:54:59 +0000 (UTC)
From: Matthew Brost <matthew.brost@intel.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 22 Dec 2022 14:47:46 -0800
Message-Id: <20221222224747.34894-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC PATCH 0/1] Initial Xe test suite
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

Initial Xe test suite for new Xe Intel GPU driver [1]. All major features of the
Xe uAPI and all internal code paths should have some basic coverage. Before
these new tests are upstreamed proper commit messages for each test will be
included plus kerneldoc describing what each test is testing and the
methodology. For the time being we are just including 1 large patch.

Cheers,
Matthew Brost

[1] https://patchwork.freedesktop.org/series/112188/

Matthew Brost (1):
  Xe: Introduce initial tests for the new Intel Xe GPU driver.

 include/drm-uapi/xe_drm.h       |  786 +++++++++++++++
 lib/drmtest.c                   |    3 +
 lib/drmtest.h                   |    1 +
 lib/meson.build                 |    4 +
 lib/xe/xe_compute.c             |  327 +++++++
 lib/xe/xe_compute.h             |   93 ++
 lib/xe/xe_ioctl.c               |  441 +++++++++
 lib/xe/xe_ioctl.h               |  107 +++
 lib/xe/xe_query.c               |  267 ++++++
 lib/xe/xe_query.h               |   76 ++
 lib/xe/xe_spin.c                |  157 +++
 lib/xe/xe_spin.h                |   66 ++
 meson.build                     |    8 +
 tests/meson.build               |    1 +
 tests/xe/meson.build            |   30 +
 tests/xe/xe_compute.c           |  130 +++
 tests/xe/xe_dma_buf_sync.c      |  226 +++++
 tests/xe/xe_evict.c             |  619 ++++++++++++
 tests/xe/xe_exec_balancer.c     |  620 ++++++++++++
 tests/xe/xe_exec_basic.c        |  294 ++++++
 tests/xe/xe_exec_compute_mode.c |  303 ++++++
 tests/xe/xe_exec_fault_mode.c   |  471 +++++++++
 tests/xe/xe_exec_reset.c        |  806 ++++++++++++++++
 tests/xe/xe_exec_threads.c      | 1148 ++++++++++++++++++++++
 tests/xe/xe_guc_pc.c            |  424 +++++++++
 tests/xe/xe_huc_copy.c          |  187 ++++
 tests/xe/xe_live_ktest.c        |   17 +
 tests/xe/xe_mmap.c              |   57 ++
 tests/xe/xe_pm.c                |  384 ++++++++
 tests/xe/xe_prime_self_import.c |  462 +++++++++
 tests/xe/xe_query.c             |  431 +++++++++
 tests/xe/xe_vm.c                | 1577 +++++++++++++++++++++++++++++++
 tests/xe/xe_waitfence.c         |   88 ++
 tools/meson.build               |    1 +
 tools/xe_reg.c                  |  366 +++++++
 35 files changed, 10978 insertions(+)
 create mode 100644 include/drm-uapi/xe_drm.h
 create mode 100644 lib/xe/xe_compute.c
 create mode 100644 lib/xe/xe_compute.h
 create mode 100644 lib/xe/xe_ioctl.c
 create mode 100644 lib/xe/xe_ioctl.h
 create mode 100644 lib/xe/xe_query.c
 create mode 100644 lib/xe/xe_query.h
 create mode 100644 lib/xe/xe_spin.c
 create mode 100644 lib/xe/xe_spin.h
 create mode 100644 tests/xe/meson.build
 create mode 100644 tests/xe/xe_compute.c
 create mode 100644 tests/xe/xe_dma_buf_sync.c
 create mode 100644 tests/xe/xe_evict.c
 create mode 100644 tests/xe/xe_exec_balancer.c
 create mode 100644 tests/xe/xe_exec_basic.c
 create mode 100644 tests/xe/xe_exec_compute_mode.c
 create mode 100644 tests/xe/xe_exec_fault_mode.c
 create mode 100644 tests/xe/xe_exec_reset.c
 create mode 100644 tests/xe/xe_exec_threads.c
 create mode 100644 tests/xe/xe_guc_pc.c
 create mode 100644 tests/xe/xe_huc_copy.c
 create mode 100644 tests/xe/xe_live_ktest.c
 create mode 100644 tests/xe/xe_mmap.c
 create mode 100644 tests/xe/xe_pm.c
 create mode 100644 tests/xe/xe_prime_self_import.c
 create mode 100644 tests/xe/xe_query.c
 create mode 100644 tests/xe/xe_vm.c
 create mode 100644 tests/xe/xe_waitfence.c
 create mode 100644 tools/xe_reg.c

-- 
2.37.3
