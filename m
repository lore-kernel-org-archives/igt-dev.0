Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9495910E410
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Aug 2023 11:51:59 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 23 Aug 2023 17:13:47 +0530
Message-Id: <20230823114354.787212-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 0/7] Separate display PM tests from Core
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

Bhanuprakash Modem (7):
  tests/i915/pm: Rename i915_pm_backlight to kms_pm_backlight
  tests/i915/kms_pm_backlight: Fix testplan documentation
  tests/i915/pm: Rename i915_pm_dc to kms_pm_dc
  tests/i915/kms_pm_dc: Fix testplan documentation
  tests/i915/pm: Rename i915_pm_lpsp to kms_pm_lpsp
  tests/i915/kms_pm_lpsp: Fix testplan documentation
  tests/i915/pm: Separate display specific tests from i915_pm_rpm

 tests/i915/i915_pm_rpm.c                      |  869 ---------
 ...i915_pm_backlight.c => kms_pm_backlight.c} |   43 +-
 tests/i915/{i915_pm_dc.c => kms_pm_dc.c}      |   69 +-
 tests/i915/{i915_pm_lpsp.c => kms_pm_lpsp.c}  |   18 +-
 tests/i915/kms_pm_rpm.c                       | 1665 +++++++++++++++++
 tests/intel-ci/blacklist-pre-merge.txt        |    8 +-
 tests/intel-ci/blacklist.txt                  |    2 +-
 tests/intel-ci/fast-feedback.testlist         |    8 +-
 tests/meson.build                             |    7 +-
 9 files changed, 1771 insertions(+), 918 deletions(-)
 rename tests/i915/{i915_pm_backlight.c => kms_pm_backlight.c} (90%)
 rename tests/i915/{i915_pm_dc.c => kms_pm_dc.c} (92%)
 rename tests/i915/{i915_pm_lpsp.c => kms_pm_lpsp.c} (94%)
 create mode 100644 tests/i915/kms_pm_rpm.c

--
2.40.0
