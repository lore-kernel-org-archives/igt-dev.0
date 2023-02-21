Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4209610E31D
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Feb 2023 11:46:27 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 21 Feb 2023 12:46:14 +0100
Message-Id: <20230221114621.32785-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [RFC PATCH i-g-t 0/7] Initial Xe test suite
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

This is continuation of https://patchwork.freedesktop.org/series/112191/

Series doesn't contain KUnit changes as they are not upstream IGT ready
yet. Functional changes (library, tests, etc.) were squashed to dedicated
patch to make review easier.

Zbigniew Kempczyński (7):
  lib/xe: Introduce Xe library
  drm-uapi/xe_drm: Add Xe uAPI
  tests/xe: Add Xe IGT tests
  tools/xe_reg: Add Xe register read/write tool
  intel-ci/xe-fast-feedback: Introduce xe-fast-feedback list
  docs/testplan: Introduce new way for documenting IGT
  runner/job_list: return error on crashes while running --list-subtests

 docs/meson.build                         |    1 +
 docs/testplan/meson.build                |   28 +
 docs/testplan/testplan.css               |    7 +
 include/drm-uapi/xe_drm.h                |  807 +++++++++++
 lib/drmtest.c                            |    3 +
 lib/drmtest.h                            |    1 +
 lib/igt_map.c                            |   32 +
 lib/igt_map.h                            |    3 +
 lib/igt_pm.c                             |   12 +
 lib/igt_pm.h                             |    1 +
 lib/meson.build                          |    4 +
 lib/xe/xe_compute.c                      |  327 +++++
 lib/xe/xe_compute.h                      |   93 ++
 lib/xe/xe_ioctl.c                        |  441 ++++++
 lib/xe/xe_ioctl.h                        |  107 ++
 lib/xe/xe_query.c                        |  377 +++++
 lib/xe/xe_query.h                        |   82 ++
 lib/xe/xe_spin.c                         |  157 +++
 lib/xe/xe_spin.h                         |   66 +
 meson.build                              |    8 +
 meson_options.txt                        |    4 +
 runner/job_list.c                        |    1 +
 scripts/igt_doc.py                       |  490 ++++++-
 scripts/meson.build                      |    2 +
 tests/intel-ci/xe-fast-feedback.testlist |  140 ++
 tests/meson.build                        |    1 +
 tests/xe/meson.build                     |   33 +
 tests/xe/xe_compute.c                    |  148 ++
 tests/xe/xe_debugfs.c                    |  257 ++++
 tests/xe/xe_dma_buf_sync.c               |  262 ++++
 tests/xe/xe_evict.c                      |  623 +++++++++
 tests/xe/xe_exec_balancer.c              |  714 ++++++++++
 tests/xe/xe_exec_basic.c                 |  350 +++++
 tests/xe/xe_exec_compute_mode.c          |  364 +++++
 tests/xe/xe_exec_fault_mode.c            |  575 ++++++++
 tests/xe/xe_exec_reset.c                 |  817 +++++++++++
 tests/xe/xe_exec_threads.c               | 1159 ++++++++++++++++
 tests/xe/xe_guc_pc.c                     |  425 ++++++
 tests/xe/xe_huc_copy.c                   |  205 +++
 tests/xe/xe_mmap.c                       |   79 ++
 tests/xe/xe_mmio.c                       |   94 ++
 tests/xe/xe_pm.c                         |  385 ++++++
 tests/xe/xe_prime_self_import.c          |  489 +++++++
 tests/xe/xe_query.c                      |  475 +++++++
 tests/xe/xe_test_config.json             |  133 ++
 tests/xe/xe_vm.c                         | 1604 ++++++++++++++++++++++
 tests/xe/xe_waitfence.c                  |  103 ++
 tools/meson.build                        |    1 +
 tools/xe_reg.c                           |  366 +++++
 49 files changed, 12803 insertions(+), 53 deletions(-)
 create mode 100644 docs/testplan/meson.build
 create mode 100644 docs/testplan/testplan.css
 create mode 100644 include/drm-uapi/xe_drm.h
 create mode 100644 lib/xe/xe_compute.c
 create mode 100644 lib/xe/xe_compute.h
 create mode 100644 lib/xe/xe_ioctl.c
 create mode 100644 lib/xe/xe_ioctl.h
 create mode 100644 lib/xe/xe_query.c
 create mode 100644 lib/xe/xe_query.h
 create mode 100644 lib/xe/xe_spin.c
 create mode 100644 lib/xe/xe_spin.h
 create mode 100644 tests/intel-ci/xe-fast-feedback.testlist
 create mode 100644 tests/xe/meson.build
 create mode 100644 tests/xe/xe_compute.c
 create mode 100644 tests/xe/xe_debugfs.c
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
 create mode 100644 tests/xe/xe_mmap.c
 create mode 100644 tests/xe/xe_mmio.c
 create mode 100644 tests/xe/xe_pm.c
 create mode 100644 tests/xe/xe_prime_self_import.c
 create mode 100644 tests/xe/xe_query.c
 create mode 100644 tests/xe/xe_test_config.json
 create mode 100644 tests/xe/xe_vm.c
 create mode 100644 tests/xe/xe_waitfence.c
 create mode 100644 tools/xe_reg.c

-- 
2.34.1
