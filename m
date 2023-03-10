Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A0310E068
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Mar 2023 19:41:38 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 10 Mar 2023 20:41:06 +0100
Message-Id: <20230310194125.14781-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 00/19] Add igt_doc.py
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

Introduce documentation and testlist generator.

v2: add has_implemented fix

Mauro Carvalho Chehab (19):
  scripts/igt_doc.py: beautify its code
  scripts/igt_doc.py: add JSON file output
  scripts/igt_doc.py: dynamically create fields array from a JSON file
  scripts/igt_doc.py: add support to specify numeric values
  scripts/igt_doc.py: improve --show-subtests logic
  scripts/igt_doc.py: add error handler for subprocess
  scripts/igt_doc.py: improve multi-line logic
  scripts/igt_doc.py: don't use ":=" operator
  scripts/igt_doc.py: make it compatible with Python 3.6
  scripts/igt_doc.py: sets the minimal version to run the script
  scripts/igt_doc.py: use a different logic to get IGT prefix
  testplan/meson.build: add targets to build Xe test documentation
  xe/xe_test_config.json: cleanup the field struct
  xe/xe_huc_copy: add GPU dependency to its documentation
  xe/xe_*: add TEST/SUBTEST documentation
  xe-fast-feedback.testlist: update debugfs tests
  xe_mmap: skip VRAM tests if no VRAM is found
  meson: replace "igt@xe/" by "igt@"
  scripts/igt_doc.py: set have_implemented when --files is used

 docs/testplan/meson.build                |  59 ++
 meson.build                              |   7 -
 scripts/igt_doc.py                       | 685 ++++++++++++++++++++---
 tests/intel-ci/xe-fast-feedback.testlist | 279 +++++----
 tests/meson.build                        |  32 ++
 tests/xe/meson.build                     |  32 --
 tests/xe/xe_debugfs.c                    |  53 +-
 tests/xe/xe_evict.c                      |  82 +++
 tests/xe/xe_exec_balancer.c              |   7 +-
 tests/xe/xe_exec_compute_mode.c          |   2 +
 tests/xe/xe_exec_reset.c                 | 134 +++++
 tests/xe/xe_exec_threads.c               | 242 ++++++++
 tests/xe/xe_guc_pc.c                     |  74 +++
 tests/xe/xe_huc_copy.c                   |   4 +
 tests/xe/xe_mmap.c                       |  13 +-
 tests/xe/xe_pm.c                         |  61 ++
 tests/xe/xe_prime_self_import.c          |  65 ++-
 tests/xe/xe_query.c                      |   2 +-
 tests/xe/xe_test_config.json             |  80 +--
 tests/xe/xe_vm.c                         | 199 +++++++
 20 files changed, 1745 insertions(+), 367 deletions(-)
 create mode 100644 docs/testplan/meson.build

-- 
2.34.1
