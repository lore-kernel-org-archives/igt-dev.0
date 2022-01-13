Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: John.C.Harrison@Intel.com
Date: Thu, 13 Jan 2022 15:51:03 -0800
Message-Id: <20220113235118.1575410-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 i-g-t 00/15] Fixes for i915_hangman and
 gem_exec_capture
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

Fix a bunch of issues with i915_hangman and gem_exec_capture with the
ultimate aim of making them pass on GuC enabled platforms.

v2: Fixes to the store code. Add engine properties management.
v3: Fix for platforms without pre-emption.
v4: Simplify anti-ban code, support >32bit store offsets and fix
memory mapping on discrete platforms.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (15):
  tests/i915/i915_hangman: Add descriptions
  lib/hang: Fix igt_require_hang_ring to work with all engines
  tests/i915/i915_hangman: Update capture test to use engine structure
  tests/i915/i915_hangman: Explicitly test per engine reset vs full GPU
    reset
  tests/i915/i915_hangman: Add uevent test & fix detector
  tests/i915/i915_hangman: Use the correct context in
    hangcheck_unterminated
  lib/store: Refactor common store code into helper function
  tests/i915/i915_hangman: Add alive-ness test after error capture
  tests/i915/i915_hangman: Remove reliance on context persistance
  tests/i915/i915_hangman: Run background task on all engines
  tests/i915/i915_hangman: Don't let background contexts cause a ban
  tests/i915/gem_exec_fence: Configure correct context
  lib/i915: Add helper for non-destructive engine property updates
  tests/i915/i915_hangman: Configure engine properties for quicker hangs
  tests/i915/gem_exec_capture: Restore engines

 lib/i915/gem_engine_topology.c |  46 ++++++
 lib/i915/gem_engine_topology.h |   9 ++
 lib/igt_aux.c                  |   7 +
 lib/igt_gt.c                   |   6 +-
 lib/igt_gt.h                   |   2 +-
 lib/igt_store.c                | 100 +++++++++++++
 lib/igt_store.h                |  12 ++
 lib/meson.build                |   1 +
 tests/i915/gem_exec_capture.c  |  37 +++--
 tests/i915/gem_exec_fence.c    |  79 +----------
 tests/i915/i915_hangman.c      | 252 +++++++++++++++++++++++++++------
 11 files changed, 423 insertions(+), 128 deletions(-)
 create mode 100644 lib/igt_store.c
 create mode 100644 lib/igt_store.h

-- 
2.25.1
