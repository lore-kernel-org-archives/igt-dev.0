Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7658510E15B
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Dec 2022 06:12:38 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sun, 11 Dec 2022 22:12:30 -0800
Message-Id: <20221212061233.2220742-1-ashutosh.dixit@intel.com>
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

Ashutosh Dixit (3):
  lib/igt_sysfs: Generic verification of clamped sysfs attributes
  i915/i915_hwmon: General verification of hwmon attributes
  HAX: Add i915_hwmon* to fast-feedback.testlist

 lib/igt_sysfs.c                       | 177 ++++++++++++++++++++++++++
 lib/igt_sysfs.h                       |   2 +
 tests/i915/i915_hwmon.c               |  82 ++++++++++++
 tests/intel-ci/fast-feedback.testlist |   2 +
 tests/meson.build                     |   1 +
 5 files changed, 264 insertions(+)
 create mode 100644 tests/i915/i915_hwmon.c

-- 
2.38.0
