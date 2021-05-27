Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Vidya Srinivas <vidya.srinivas@intel.com>
Date: Thu, 27 May 2021 20:35:51 +0530
Message-Id: <20210527150551.18392-1-vidya.srinivas@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] [RFC] tests/kms_flip: Some Gen11 systems are not
 able to get RTC WAKE work well. SUSPEND_TEST_NONE goes to RTC Wake. Instead
 change it to SUSPEND_TEST_PLATFORM.
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
To: intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org
Cc: charlton.lin@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Change-Id: I80930185a8799578bbec0123a389074af1edfb5d
Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
---
 tests/kms_flip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 64907c2c17a5..4d45dd77e9d9 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -835,7 +835,7 @@ static bool run_test_step(struct test_output *o, unsigned int *events)
 
 	if (o->flags & TEST_SUSPEND)
 		igt_system_suspend_autoresume(SUSPEND_STATE_MEM,
-					      SUSPEND_TEST_NONE);
+					      SUSPEND_TEST_PLATFORM);
 
 	if (do_vblank && (o->flags & TEST_EINVAL) && o->vblank_state.count > 0)
 		igt_assert(do_wait_for_vblank(o, o->pipe, target_seq, &vbl_reply)
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
