Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51F8510E16D
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Apr 2023 11:27:14 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 19 Apr 2023 16:52:37 +0530
Message-Id: <20230419112243.1719789-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 0/6] Enable KMS tests in XE BAT
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

Bhanuprakash Modem (6):
  lib: Use i915 namespace for XE debugfs
  tests/kms_cursor_legacy: Add XE support
  tests/kms_flip: Add XE support
  tests/i915/kms_psr: Use linear modifier to create FB
  tests/i915/kms_psr*: Add XE support
  xe-fast-feedback: Add kms tests to XE BAT

 lib/igt_kms.c                            |  4 +--
 lib/igt_psr.c                            |  4 +--
 tests/i915/kms_psr.c                     | 38 +++++++++++++++++----
 tests/i915/kms_psr2_sf.c                 |  2 +-
 tests/i915/kms_psr2_su.c                 |  2 +-
 tests/i915/kms_psr_stress_test.c         |  2 +-
 tests/intel-ci/xe-fast-feedback.testlist | 31 +++++++++++++++++
 tests/kms_cursor_legacy.c                |  4 +--
 tests/kms_flip.c                         | 42 +++++++++++++++++-------
 9 files changed, 103 insertions(+), 26 deletions(-)

--
2.40.0
