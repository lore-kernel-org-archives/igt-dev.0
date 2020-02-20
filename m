Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 20 Feb 2020 17:41:55 +0000
Message-Id: <20200220174155.2162242-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/i915_pm_rpm: Only check for suspend
 failures after each debugfs entry
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Since we check before and then after each debugfs entry, we do not need
to check before each time as well. We will error out as soon as it does
fail, at all other times we know the system to be idle.

No impact on runtime for glk (which apparently is one of the better
behaving systems).

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Martin Peres <martin.peres@linux.intel.com>
---
 tests/i915/i915_pm_rpm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 0c2821122..bf412b5cc 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -932,9 +932,6 @@ static int read_entry(const char *filepath,
 	int fd;
 	int rc;
 
-	igt_assert_f(wait_for_suspended(), "Before opening: %s (%s)\n",
-		     filepath + pathinfo->base, filepath);
-
 	fd = open(filepath, O_RDONLY | O_NONBLOCK);
 	if (fd < 0) {
 		igt_debug("Failed to open '%s': %m\n", filepath);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
