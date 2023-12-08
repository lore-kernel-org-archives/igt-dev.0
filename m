Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A87710EA24
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Dec 2023 08:45:28 +0000 (UTC)
From: Riana Tauro <riana.tauro@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/3] Test for Engine busyness
Date: Fri,  8 Dec 2023 14:22:48 +0530
Message-Id: <20231208085251.3798137-1-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add a test to validate engine busyness using busy-ticks for each
engine and total active ticks

busyness % = (engine busy ticks/total active ticks) * 100.

Kernel Patchwork : https://patchwork.freedesktop.org/series/126919/
(Engine busyness)

Riana Tauro (3):
  lib/igt_perf: modify a perf events dir function for xe
  lib/igt_perf: Add a helper function to check if events are present
  tests/xe/xe_perf_pmu: Test for engine busyness

 include/drm-uapi/xe_drm.h |  24 ++++++
 lib/igt_perf.c            |  40 +++++++++-
 lib/igt_perf.h            |   3 +-
 tests/intel/perf_pmu.c    |   3 +-
 tests/intel/xe_perf_pmu.c | 151 ++++++++++++++++++++++++++++++++++++++
 5 files changed, 215 insertions(+), 6 deletions(-)

-- 
2.40.0
