Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0542A10E644
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Oct 2023 10:26:31 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 11 Oct 2023 15:47:18 +0530
Message-Id: <20231011101722.3188258-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 0/4] tests/intel/pm: Separate display specific
 tests from i915_pm_rpm
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

Separate display specific tests from i915_pm_rpm and maintain
in kms_pm_rpm.

Bhanuprakash Modem (4):
  tests/intel/pm: Separate display specific tests from i915_pm_rpm
  tests/intel/pm_rpm: Split module-reload test
  tests/intel/pm_rpm: Fix CI with renamed tests
  tests/intel-ci: Add module-reload test to CI

 tests/intel-ci/blacklist-pre-merge.txt |    8 +-
 tests/intel-ci/blacklist.txt           |    1 +
 tests/intel-ci/fast-feedback.testlist  |    5 +-
 tests/intel/i915_pm_rpm.c              | 1136 ----------------
 tests/intel/kms_pm_rpm.c               | 1722 ++++++++++++++++++++++++
 tests/meson.build                      |    1 +
 6 files changed, 1731 insertions(+), 1142 deletions(-)
 create mode 100644 tests/intel/kms_pm_rpm.c

--
2.40.0
