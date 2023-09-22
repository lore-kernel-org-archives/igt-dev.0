Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Intel-gfx@lists.freedesktop.org
Date: Fri, 22 Sep 2023 14:44:25 +0100
Message-Id: <20230922134437.234888-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 00/12] fdinfo tests,
 intel_gpu_top memory support, etc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Some basic testst for fdinfo memory stats, intel_gpu_top memory stats support
(first draft) and a couple fixlets.

Primarily sending to use as "Test-with" but review is also welcome.

Tvrtko Ursulin (12):
  tests/i915/drm_fdinfo: Stress test context close versus fdinfo reads
  tests/i915/drm_fdinfo: Add some memory info tests
  tools/intel_gpu_top: Restore user friendly error message
  tools/intel_gpu_top: Fix clients header width when no clients
  tools/intel_gpu_top: Fix client layout on first sample period
  tools/intel_gpu_top: Optimise interactive display a bit
  lib/igt_drm_fdinfo: Copy over region map name on match
  lib/igt_drm_clients: Fix client id type confusion
  lib/igt_drm_clients: Allow passing in the memory region map
  tools/intel_gpu_top: Fully wrap clients operations
  tools/intel_gpu_top: Add per client memory info
  tools/intel_gpu_top: Add ability to show memory region breakdown

 lib/igt_drm_clients.c    |   7 +-
 lib/igt_drm_clients.h    |   5 +-
 lib/igt_drm_fdinfo.c     |   4 +
 man/intel_gpu_top.rst    |   4 +
 tests/intel/drm_fdinfo.c | 269 +++++++++++++++++++++++++++++++++++++++
 tools/gputop.c           |   4 +-
 tools/intel_gpu_top.c    | 260 +++++++++++++++++++++++++++++++------
 7 files changed, 508 insertions(+), 45 deletions(-)

-- 
2.39.2
