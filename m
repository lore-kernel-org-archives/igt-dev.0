Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21AEE10E20D
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jun 2022 16:39:28 +0000 (UTC)
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 22 Jun 2022 09:39:15 -0700
Message-ID: <20220622163915.364-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v2] tests/kms_writeback: Detach pipe only
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

Changes since V1:
- Fix improper brace style for detach_crtc()
- Rebase onto tip of master

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 tests/kms_writeback.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index 6efc72df4327..1a623655da49 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -139,7 +139,16 @@ static igt_output_t *kms_writeback_get_output(igt_display_t *display)
 	return NULL;
 }
 
-static void detach_crtc(igt_display_t *display, igt_output_t *output) {
+static uint64_t get_writeback_fb_id(igt_output_t *output)
+{
+	return igt_output_get_prop(output, IGT_CONNECTOR_WRITEBACK_FB_ID);
+}
+
+static void detach_crtc(igt_display_t *display, igt_output_t *output)
+{
+	if (get_writeback_fb_id(output) == 0)
+		return;
+
 	igt_output_set_pipe(output, PIPE_NONE);
 	igt_display_commit2(display, COMMIT_ATOMIC);
 }
-- 
2.31.0
