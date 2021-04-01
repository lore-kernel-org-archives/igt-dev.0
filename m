Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Thu,  1 Apr 2021 12:43:16 +0100
Message-Id: <20210401114316.2597715-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [Intel-gfx] [PATCH i-g-t] gem_watchdog: Fix autotools build
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Correcting a brain malfunction while typing in Makefile.sources.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 tests/Makefile.sources | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/Makefile.sources b/tests/Makefile.sources
index e992285fedc5..194df8e27dd0 100644
--- a/tests/Makefile.sources
+++ b/tests/Makefile.sources
@@ -464,7 +464,7 @@ TESTS_progs += gem_wait
 gem_wait_SOURCES = i915/gem_wait.c
 
 TESTS_progs += gem_watchdog
-gem_exec_watchdog_SOURCES = i915/gem_watchdog.c
+gem_watchdog_SOURCES = i915/gem_watchdog.c
 
 TESTS_progs += gem_workarounds
 gem_workarounds_SOURCES = i915/gem_workarounds.c
-- 
2.27.0

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
