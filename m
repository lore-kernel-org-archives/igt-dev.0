Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Brost <matthew.brost@intel.com>
Date: Tue,  3 Aug 2021 18:23:00 -0700
Message-Id: <20210804012303.158392-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 0/3] IGT fixes for priority management +
 capture with GuC submission
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Matthew Brost (2):
  i915/gem_exec_schedule: Make gem_exec_schedule understand static
    priority mapping
  i915/gem_ctx_shared: Make gem_ctx_shared understand static priority
    mapping

Signed-off-by: John Harrison (1):
  i915/gem_exec_capture: Update to support GuC based resets

 lib/i915/gem_scheduler.c       | 14 ++++++++
 lib/i915/gem_scheduler.h       |  1 +
 lib/i915/i915_drm_local.h      | 10 ++++++
 lib/igt_gt.c                   | 44 ++++++++++++++++--------
 lib/igt_gt.h                   |  1 +
 tests/i915/gem_ctx_shared.c    | 12 ++++---
 tests/i915/gem_exec_capture.c  | 52 +++++++++++++++++++++++-----
 tests/i915/gem_exec_schedule.c | 62 +++++++++++++++++++++-------------
 8 files changed, 144 insertions(+), 52 deletions(-)

-- 
2.28.0
