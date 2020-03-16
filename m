Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 16 Mar 2020 10:54:27 +0000
Message-Id: <20200316105427.517192-2-chris@chris-wilson.co.uk>
In-Reply-To: <20200316105427.517192-1-chris@chris-wilson.co.uk>
References: <20200316105427.517192-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] i915/sysfs_heartbeat_interval: Check
 for support prior to 'nopreempt' test
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

To turn off preemption, we now require per-engine resets.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/sysfs_heartbeat_interval.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/sysfs_heartbeat_interval.c b/tests/i915/sysfs_heartbeat_interval.c
index 0ba19b263..ef131a16c 100644
--- a/tests/i915/sysfs_heartbeat_interval.c
+++ b/tests/i915/sysfs_heartbeat_interval.c
@@ -227,7 +227,7 @@ static void test_nopreempt(int i915, int engine)
 	 */
 
 	/* Test heartbeats with forced preemption  disabled */
-	igt_sysfs_printf(engine, "preempt_timeout_ms", "%u", 0);
+	igt_require(igt_sysfs_printf(engine, "preempt_timeout_ms", "%u", 0) > 0);
 
 	igt_assert(igt_sysfs_scanf(engine, ATTR, "%u", &saved) == 1);
 	igt_debug("Initial %s:%u\n", ATTR, saved);
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
