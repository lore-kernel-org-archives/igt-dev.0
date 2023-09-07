Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACF310E23E
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Sep 2023 16:22:49 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  7 Sep 2023 21:41:48 +0530
Message-Id: <20230907161155.1828658-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V3 0/7] Separate display PM tests from Core
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

Separate display specific tests from Core and maintain the
binary names with kms_ prefix.

V2: - Rebase
V3: - Restore old Copyright
    - Separate more tests from i915_pm_rpm

Bhanuprakash Modem (7):
  tests/intel/pm: Rename i915_pm_backlight to kms_pm_backlight
  tests/intel/kms_pm_backlight: Fix testplan documentation
  tests/intel/pm: Rename i915_pm_dc to kms_pm_dc
  tests/intel/kms_pm_dc: Fix testplan documentation
  tests/intel/pm: Rename i915_pm_lpsp to kms_pm_lpsp
  tests/intel/kms_pm_lpsp: Fix testplan documentation
  tests/intel/pm: Separate display specific tests from i915_pm_rpm

 tests/intel-ci/blacklist-pre-merge.txt        |    8 +-
 tests/intel-ci/blacklist.txt                  |    2 +-
 tests/intel-ci/fast-feedback.testlist         |    8 +-
 tests/intel/i915_pm_rpm.c                     | 1125 ----------
 ...i915_pm_backlight.c => kms_pm_backlight.c} |   36 +-
 tests/intel/{i915_pm_dc.c => kms_pm_dc.c}     |   66 +-
 tests/intel/{i915_pm_lpsp.c => kms_pm_lpsp.c} |   15 +-
 tests/intel/kms_pm_rpm.c                      | 1840 +++++++++++++++++
 tests/meson.build                             |    7 +-
 9 files changed, 1938 insertions(+), 1169 deletions(-)
 rename tests/intel/{i915_pm_backlight.c => kms_pm_backlight.c} (91%)
 rename tests/intel/{i915_pm_dc.c => kms_pm_dc.c} (92%)
 rename tests/intel/{i915_pm_lpsp.c => kms_pm_lpsp.c} (95%)
 create mode 100644 tests/intel/kms_pm_rpm.c

--
2.40.0
