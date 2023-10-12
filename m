Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Intel-gfx@lists.freedesktop.org
Date: Thu, 12 Oct 2023 09:15:38 +0100
Message-Id: <20231012081547.852052-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/9] Client memory fdinfo test and
 intel_gpu_top support
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

Some new tests to exercise per client fdinfo memory stats.

Same as the previous posting, just rebased on top of latest intel_gpu_top fixes.

i915 kernel side at https://patchwork.freedesktop.org/series/119082/.

Tvrtko Ursulin (9):
  tests/i915/drm_fdinfo: Check engine info is supported
  tests/i915/drm_fdinfo: Stress test context close versus fdinfo reads
  tests/i915/drm_fdinfo: Add some memory info tests
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
 tests/intel/drm_fdinfo.c | 286 +++++++++++++++++++++++++++++++++++++++
 tools/gputop.c           |   4 +-
 tools/intel_gpu_top.c    | 191 +++++++++++++++++++++++---
 7 files changed, 472 insertions(+), 29 deletions(-)

-- 
2.39.2
