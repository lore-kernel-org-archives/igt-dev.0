Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: John.C.Harrison@Intel.com
Date: Wed,  3 Nov 2021 10:04:41 -0700
Message-Id: <20211103170449.1614314-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v2 i-g-t 0/8] Fixes for gem_exec_capture
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Fix a bunch of issues with gem_exec_capture with the ultimate aim of
making it pass on GuC enabled platforms.

v2: Abstract the 'find first available engine' block into a helper
(review feedback from Matthew B). Note that for unknown reasons, this
helper does not work as a function. After wasting far too long trying
to debug out why the engine mask in the execbuf was *sometimes*
invalid, just making it a macro instead worked fine. Seems like maybe
the for_each_ctx_engine macro creates a local stack variable that is
silently required to remain in scope for the resulting ctx to be valid?

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (8):
  tests/i915/gem_exec_capture: Remove pointless assert
  tests/i915/gem_exec_capture: Cope with larger page sizes
  tests/i915/gem_exec_capture: Make the error decode a common helper
  tests/i915/gem_exec_capture: Use contexts and engines properly
  tests/i915/gem_exec_capture: Check for memory allocation failure
  lib/igt_sysfs: Support large files
  lib/igt_gt: Allow per engine reset testing
  tests/i915/gem_exec_capture: Update to support GuC based resets

 lib/igt_gt.c                  |  44 ++--
 lib/igt_gt.h                  |   1 +
 lib/igt_sysfs.c               |  17 +-
 tests/i915/gem_exec_capture.c | 469 ++++++++++++++++++++--------------
 4 files changed, 315 insertions(+), 216 deletions(-)

-- 
2.25.1
