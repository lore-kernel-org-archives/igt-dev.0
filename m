Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA6510E0EF
 for <igt-dev@lists.freedesktop.org>; Sat,  6 May 2023 01:02:55 +0000 (UTC)
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 5 May 2023 18:01:48 -0700
Message-ID: <20230506010148.6099-1-quic_abhinavk@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t] tests/kms_writeback: fix teardown path for
 kms_writeback
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

When [1] was pushed, it was incorrectly verified as the
condition to clear the writeback connector's pipe [2] never
hits because the IGT_CONNECTOR_WRITEBACK_FB_ID is already
cleared in [3].

To fix this, lets clear the writeback connector's pipe only
for the test case which actually commits a frame because
there seems to be no other reliable way to find if an actual
commit was performed in any of the test-cases because some of
the test cases dont actually want to commit to go through and
test that the driver actually fails invalid parameters.

For those, the IGT SW state still shows valid parameters but commit
was actually never called or never went through.

Clearing the pipeline with a commit which was never setup up
results in commit failures arising from detach_crtc() and thats
why the check [2] was added.

[1] : https://patchwork.freedesktop.org/patch/486177/
[2] : https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_writeback.c#L169
[3] : https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/lib/igt_kms.c#L4189

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 tests/kms_writeback.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index c4808b02c2c4..325b757b2f6f 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -159,16 +159,8 @@ static igt_output_t *kms_writeback_get_output(igt_display_t *display)
 	return NULL;
 }
 
-static uint64_t get_writeback_fb_id(igt_output_t *output)
-{
-	return igt_output_get_prop(output, IGT_CONNECTOR_WRITEBACK_FB_ID);
-}
-
 static void detach_crtc(igt_display_t *display, igt_output_t *output)
 {
-	if (get_writeback_fb_id(output) == 0)
-		return;
-
 	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 }
@@ -599,11 +591,12 @@ igt_main_args("b:c:dl", long_options, help_str, opt_handler, NULL)
 
 		writeback_check_output(output, plane, &input_fb, &output_fb);
 
+		detach_crtc(&display, output);
+
 		igt_remove_fb(display.drm_fd, &output_fb);
 	}
 
 	igt_fixture {
-		detach_crtc(&display, output);
 		igt_remove_fb(display.drm_fd, &input_fb);
 		igt_display_fini(&display);
 	}
-- 
2.40.1
