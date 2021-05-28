Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Fri, 28 May 2021 09:54:43 +0530
Message-Id: <1622175883-12405-1-git-send-email-vidya.srinivas@intel.com>
Subject: [Intel-gfx] [PATCH i-g-t] [RFC] tests/kms_flip.c: Fix subtests
 flip-vs-suspend
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org
Cc: markyacoub@chromium.org, charlton.lin@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Some Intel Gen11 systems are not able to do a RTC wake.
Instead change the default SUSPEND_TEST_NONE to
SUSPEND_TEST_PLATFORM.

Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tests/kms_flip.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 8f736652be90..8afac88c9b15 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -835,7 +835,8 @@ static bool run_test_step(struct test_output *o, unsigned int *events)
 
 	if (o->flags & TEST_SUSPEND)
 		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
-					      SUSPEND_TEST_NONE);
+					      is_i915_device(drm_fd)?
+					      SUSPEND_TEST_PLATFORM:SUSPEND_TEST_NONE);
 
 	if (do_vblank && (o->flags & TEST_EINVAL) && o->vblank_state.count > 0)
 		igt_assert(do_wait_for_vblank(o, o->pipe, target_seq, &vbl_reply)
-- 
2.7.4

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
