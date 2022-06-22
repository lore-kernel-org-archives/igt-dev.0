Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E030310FED1
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jun 2022 02:41:54 +0000 (UTC)
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 21 Jun 2022 19:41:41 -0700
Message-ID: <20220622024141.208-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v1] tests/kms_writeback: Detach pipe only
 for valid FB_ID
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: quic_aravindh@quicinc.com, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Currently, the writeback DRM driver will accept a commit on the
writeback connector only if a valid FB_ID is presented. When we run
the "writeback-invalid-parameters" or "writeback-format-pixels" subtests
individually, this will not be true because no successful commit has
happened. So there is no need to clean up the pipes in detach_crtc.

Only issue a NULL commit if FB_ID is greater than zero. This will make
sure that a cleanup happens only when necessary.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 tests/kms_writeback.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index d5e86df7b0ae..bdfbd227f7c4 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -167,8 +167,15 @@ static igt_output_t *kms_writeback_get_output(igt_display_t *display)
 	return NULL;
 }
 
-static void detach_crtc(igt_display_t *display, igt_output_t *output)
+static uint64_t get_writeback_fb_id(igt_output_t *output)
 {
+	return igt_output_get_prop(output, IGT_CONNECTOR_WRITEBACK_FB_ID);
+}
+
+static void detach_crtc(igt_display_t *display, igt_output_t *output) {
+	if (get_writeback_fb_id(output) == 0)
+		return;
+
 	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 }
-- 
2.35.1
