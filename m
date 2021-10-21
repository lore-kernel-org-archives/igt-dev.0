Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: John.C.Harrison@Intel.com
Date: Thu, 21 Oct 2021 16:40:36 -0700
Message-Id: <20211021234044.3071069-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Intel-gfx] [PATCH i-g-t 0/8] Fixes for gem_exec_capture
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: Intel-GFX@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Fix a bunch of issues with gem_exec_capture with the ultimate aim of
making it pass on GuC enabled platforms.

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
 tests/i915/gem_exec_capture.c | 472 ++++++++++++++++++++--------------
 4 files changed, 317 insertions(+), 217 deletions(-)

-- 
2.25.1
