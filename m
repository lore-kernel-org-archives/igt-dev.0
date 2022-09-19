Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F2710E64B
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Sep 2022 14:44:27 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 19 Sep 2022 20:14:00 +0530
Message-Id: <20220919144408.251981-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 0/8] Add hwmon energy support for dgfx
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Introduce igt_power library that reads energy from hwmon & rapl
interfaces. Replace igt_rapl with igt_power.

Modify the existing tests that use igt_rapl to igt_power.

Rev2 : Re-order patches to fix compilation 

Riana Tauro (8):
  lib/igt_hwmon: Introduce library igt_hwmon
  lib/igt_power: Rename lib igt_rapl with igt_power
  lib/igt_power: Add hwmon interface to igt_power
  i915/i915_pm_rc6_residency: Add energy support for dgfx
  i915/gem_exec_schedule: Add energy support for dgfx
  i915/gem_exec_whisper: Add energy support for dgfx
  lib/igt_power: clean-up igt_power library
  HAX: run i915_pm_rc6_residency tests in BAT

 lib/igt_hwmon.c                       |  73 +++++++++
 lib/igt_hwmon.h                       |  12 ++
 lib/igt_power.c                       | 211 ++++++++++++++++++++++++++
 lib/{igt_rapl.h => igt_power.h}       |  78 +++-------
 lib/igt_rapl.c                        |  69 ---------
 lib/meson.build                       |   3 +-
 tests/i915/gem_exec_fair.c            |   1 -
 tests/i915/gem_exec_schedule.c        |  51 +++----
 tests/i915/gem_exec_whisper.c         |  16 +-
 tests/i915/i915_pm_rc6_residency.c    |  65 ++++----
 tests/intel-ci/fast-feedback.testlist |   2 +
 11 files changed, 392 insertions(+), 189 deletions(-)
 create mode 100644 lib/igt_hwmon.c
 create mode 100644 lib/igt_hwmon.h
 create mode 100644 lib/igt_power.c
 rename lib/{igt_rapl.h => igt_power.h} (51%)
 delete mode 100644 lib/igt_rapl.c

-- 
2.25.1
