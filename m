Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82FBA10E4E2
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Dec 2022 02:31:15 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 14 Dec 2022 18:31:07 -0800
Message-Id: <20221215023110.2436554-1-ashutosh.dixit@intel.com>
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
v5: Dropped function rw_attr_reverify_points since it was repeating the
    verification already done during the sweep so has limited utility. This
    results in simplifying the code even more.

Ashutosh Dixit (3):
  lib/igt_sysfs: Generic verification of writable sysfs attributes
  i915/i915_hwmon: General verification of hwmon attributes
  HAX: Add i915_hwmon* to fast-feedback.testlist

 lib/igt_sysfs.c                       | 79 ++++++++++++++++++++++++
 lib/igt_sysfs.h                       | 20 ++++++
 tests/i915/i915_hwmon.c               | 88 +++++++++++++++++++++++++++
 tests/intel-ci/fast-feedback.testlist |  2 +
 tests/meson.build                     |  1 +
 5 files changed, 190 insertions(+)
 create mode 100644 tests/i915/i915_hwmon.c

-- 
2.38.0
