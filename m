Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90DE5113106
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Jul 2022 15:07:19 +0000 (UTC)
From: Karolina Drobnik <karolina.drobnik@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 28 Jul 2022 17:06:56 +0200
Message-Id: <cover.1659014747.git.karolina.drobnik@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/2] i915/i915_pm_rps: Add fence-order and
 engine-order subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

This series adds two tests that check if the iteration order of fences has
an impact on applying waitboost. These regression tests make sure that
the heuristic works as expected, no matter the order in which we wait on
fences. For more background, see [1] and [2].

In addition to this, the patchset also includes a simple fix for
pm_rps_exit_handler, added in preparation for multi-gt support and per-test
sysfs files initialization.

Following the review comments, the initial patch was split up into two. So,
this series is actually v5 of the "i915/i915_pm_rps: Check impact of fence
ordering on waitboosting" patch. The previous versions can be seen at [3].

v5:
  - Added missing close() calls on sysfs handle
  - Extracted pm_rps_exit_handler change into a dedicated patch
v4:
  - Added test descriptions with igt_describe()
v3:
  - Removed unnecessary calls to gem_write
v2:
  - Introduced batch_create() with arbitration points to prevent hangs
  - Added engine-order subtest
  - Added reporting of GPU frequency
  - Changed runtimes and switched prints from us to ms

[1] - https://lore.kernel.org/intel-gfx/cover.1657289332.git.karolina.drobnik@intel.com/
[2] - https://gitlab.freedesktop.org/drm/intel/-/issues/6284
[3] - https://patchwork.freedesktop.org/patch/493954

Chris Wilson (2):
  i915/i915_pm_rps: Check impact of fence ordering on waitboosting
  i915/i915_pm_rps: Write values in pm_rps_exit_handler only for min-max
    configs

 tests/i915/i915_pm_rps.c | 265 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 259 insertions(+), 6 deletions(-)

--
2.25.1
