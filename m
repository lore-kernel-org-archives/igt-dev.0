Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon,  6 Apr 2020 12:00:26 +0100
Message-Id: <20200406110026.1641189-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_busy: Drop i915_hangcheck_info
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

All the information for hangcheck is pulled into i915_engine_info so the
separate dump is redundant.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Andi Shyti <andi.shyti@intel.com>
---
 tests/i915/gem_busy.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/i915/gem_busy.c b/tests/i915/gem_busy.c
index 64e6fe6bd..5e4e2d939 100644
--- a/tests/i915/gem_busy.c
+++ b/tests/i915/gem_busy.c
@@ -452,7 +452,6 @@ static void basic(int fd, const struct intel_execution_engine2 *e, unsigned flag
 	while (gem_bo_busy(fd, spin->handle)) {
 		if (igt_seconds_elapsed(&tv) > timeout) {
 			igt_debugfs_dump(fd, "i915_engine_info");
-			igt_debugfs_dump(fd, "i915_hangcheck_info");
 			igt_assert_f(igt_seconds_elapsed(&tv) < timeout,
 				     "%s batch did not complete within %ds\n",
 				     flags & HANG ? "Hanging" : "Normal",
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
