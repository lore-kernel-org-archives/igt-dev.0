Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7ABD10E747
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Apr 2023 16:32:06 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 13 Apr 2023 21:57:25 +0530
Message-Id: <20230413162732.1155058-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 0/7] Enable KMS tests in XE BAT
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

Add kms tests to XE BAT and update tests to support XE device.
- kms_chamelium_*
- kms_cursor_legacy
- kms_flip
- kms_pipe_crc_basic
- kms_psr

Note: Tests are expected to fail, as intel_bb changes for XE is not
yet landed in IGT lib.

Bhanuprakash Modem (7):
  lib/intel_bufops: Fix bops creation to support XE
  lib/igt_fb: Add copy engine support for XE
  lib: Use i915 namespace for XE debugfs
  tests/kms_cursor_legacy: Add XE support
  tests/kms_flip: Add XE support
  tests/i915/kms_psr: Add XE support
  xe-fast-feedback: Add kms tests to XE BAT

 lib/igt_fb.c                             | 30 +++++++++++++++---
 lib/igt_fb.h                             |  2 ++
 lib/igt_kms.c                            |  2 +-
 lib/igt_psr.c                            |  4 +--
 lib/intel_bufops.c                       | 19 ++++++++++++
 tests/i915/kms_psr.c                     | 39 ++++++++++++++++++++----
 tests/i915/kms_psr2_sf.c                 |  2 +-
 tests/i915/kms_psr2_su.c                 |  2 +-
 tests/i915/kms_psr_stress_test.c         |  2 +-
 tests/intel-ci/xe-fast-feedback.testlist | 31 +++++++++++++++++++
 tests/kms_cursor_legacy.c                |  3 +-
 tests/kms_flip.c                         | 35 +++++++++++++++------
 12 files changed, 145 insertions(+), 26 deletions(-)

--
2.40.0
