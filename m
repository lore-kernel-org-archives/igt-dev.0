Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D27A10E1CE
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Dec 2022 18:35:35 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 13 Dec 2022 10:35:25 -0800
Message-Id: <20221213183529.2290856-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/4] i915/i915_hwmon: General verification
 of hwmon attributes
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

Ensure we can read all hwmon attributes. For writable attributes, also
ensure the read value approximately matches the written value, taking the
clamping of writes into account.

v2: Added new patch "lib/igt_sysfs: Make it easier to extend verification
    of clamped sysfs attr". No changes to previous patches.

Ashutosh Dixit (4):
  lib/igt_sysfs: Generic verification of clamped sysfs attributes
  i915/i915_hwmon: General verification of hwmon attributes
  lib/igt_sysfs: Make it easier to extend verification of clamped sysfs
    attr
  HAX: Add i915_hwmon* to fast-feedback.testlist

 lib/igt_sysfs.c                       | 176 ++++++++++++++++++++++++++
 lib/igt_sysfs.h                       |  23 ++++
 tests/i915/i915_hwmon.c               |  88 +++++++++++++
 tests/intel-ci/fast-feedback.testlist |   2 +
 tests/meson.build                     |   1 +
 5 files changed, 290 insertions(+)
 create mode 100644 tests/i915/i915_hwmon.c

-- 
2.38.0
