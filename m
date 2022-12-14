Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C245B10E20C
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Dec 2022 03:09:55 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 13 Dec 2022 19:09:48 -0800
Message-Id: <20221214030951.2424386-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] i915/i915_hwmon: General verification
 of hwmon attributes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Ensure we can read all hwmon attributes. For writable attributes, also
ensure the read value approximately matches the written value, taking the
clamping of writes into account.

v2: Added new patch "lib/igt_sysfs: Make it easier to extend verification
    of clamped sysfs attr". No changes to previous patches.
v3: Identical to v2, failed to copy reviewers
v4: Drop the concept of a 'clamped' sysfs attribute, it is not
    necessary. All we need is a writable attribute for which the read
    values will match the written values for a few points across the range
    of all possible values.

Ashutosh Dixit (3):
  lib/igt_sysfs: Generic verification of writable sysfs attributes
  i915/i915_hwmon: General verification of hwmon attributes
  HAX: Add i915_hwmon* to fast-feedback.testlist

 lib/igt_sysfs.c                       | 119 ++++++++++++++++++++++++++
 lib/igt_sysfs.h                       |  21 +++++
 tests/i915/i915_hwmon.c               |  88 +++++++++++++++++++
 tests/intel-ci/fast-feedback.testlist |   2 +
 tests/meson.build                     |   1 +
 5 files changed, 231 insertions(+)
 create mode 100644 tests/i915/i915_hwmon.c

-- 
2.38.0
