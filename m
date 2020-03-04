Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed,  4 Mar 2020 11:13:06 +0000
Message-Id: <20200304111306.2438943-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/i915_pm_rpm: Flush pm-idle before
 waiting for suspend
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

After we may have deliberately woken the device up for reading the
debugfs/sysfs file, we then wait for the system to suspend again before
trying the next. Speed up the wait by first flushing the pm-idle.

"Slowest file + suspend: /sys/kernel/debug/dri/0/i915_forcewake_user
took 3951.33ms!"

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/i915_pm_rpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 9118e8953..db035ef86 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -964,6 +964,7 @@ static int read_entry(const char *filepath,
 
 	close(fd);
 
+	igt_drop_caches_set(drm_fd, DROP_IDLE); /* flush pm-idle */
 	igt_assert_f(wait_for_suspended(), "After closing: %s (%s)\n",
 		     filepath + pathinfo->base, filepath);
 
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
