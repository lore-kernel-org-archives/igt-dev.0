Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 13 May 2020 11:47:15 +0100
Message-Id: <20200513104715.792111-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/sysfs_heartbeat_interval: Watch out
 for CPU scheduler delays
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

If our CPU client is very slow to notice that the GPU spinner has
started, we may consume the full heartbeat interval without noticing.
This is bad if we are trying to test that a client that yield within the
heartbeat interval is not selected for termination.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/1879
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/sysfs_heartbeat_interval.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/i915/sysfs_heartbeat_interval.c b/tests/i915/sysfs_heartbeat_interval.c
index 6d4413d62..fe0cc046c 100644
--- a/tests/i915/sysfs_heartbeat_interval.c
+++ b/tests/i915/sysfs_heartbeat_interval.c
@@ -308,8 +308,13 @@ static void client(int i915, int engine, int *ctl, int duration, int expect)
 					      IGT_SPIN_POLL_RUN |
 					      IGT_SPIN_FENCE_OUT));
 
+		/* XXX we need more precise means of limiting the spinner */
 		igt_spin_busywait_until_started(spin);
-		igt_assert_eq(sync_fence_status(spin->out_fence), 0);
+		if (sync_fence_status(spin->out_fence)) {
+			/* CPU too slow! */
+			igt_spin_free(i915, spin);
+			continue;
+		}
 
 		elapsed = measured_usleep(duration * 1000);
 		igt_spin_end(spin);
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
