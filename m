Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8B310E320
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Oct 2022 05:35:41 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 17 Oct 2022 11:05:16 +0530
Message-Id: <20221017053524.2538178-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 0/8] Add hwmon energy support for dgfx
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: badal.nilawar@intel.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Introduce igt_power library that reads energy from hwmon & rapl
interfaces. Replace igt_rapl with igt_power.

Modify the existing tests that use igt_rapl to igt_power.

Rev2: Re-order patches to fix compilation
Rev3: Add tests temporarily to BAT to test hwmon kernel series
Rev4: Identical to v3, sending again in order to "Test-with" kernel
       hwmon series
Rev5: Add license to igt_hwmon files

Riana Tauro (8):
  lib/igt_hwmon: Introduce library igt_hwmon
  lib/igt_power: Rename lib igt_rapl with igt_power
  lib/igt_power: Add hwmon interface to igt_power
  i915/i915_pm_rc6_residency: Add energy support for dgfx
  i915/gem_exec_schedule: Add energy support for dgfx
  i915/gem_exec_whisper: Add energy support for dgfx
  lib/igt_power: clean-up igt_power library
  HAX: run i915_pm_rc6_residency tests in BAT

 lib/igt_hwmon.c                       |  74 +++++++++
 lib/igt_hwmon.h                       |  13 ++
 lib/igt_power.c                       | 211 ++++++++++++++++++++++++++
 lib/{igt_rapl.h => igt_power.h}       |  78 +++-------
 lib/igt_rapl.c                        |  69 ---------
 lib/meson.build                       |   3 +-
 tests/i915/gem_exec_fair.c            |   1 -
 tests/i915/gem_exec_schedule.c        |  51 +++----
 tests/i915/gem_exec_whisper.c         |  16 +-
 tests/i915/i915_pm_rc6_residency.c    |  65 ++++----
 tests/intel-ci/fast-feedback.testlist |   2 +
 11 files changed, 394 insertions(+), 189 deletions(-)
 create mode 100644 lib/igt_hwmon.c
 create mode 100644 lib/igt_hwmon.h
 create mode 100644 lib/igt_power.c
 rename lib/{igt_rapl.h => igt_power.h} (51%)
 delete mode 100644 lib/igt_rapl.c

-- 
2.25.1
