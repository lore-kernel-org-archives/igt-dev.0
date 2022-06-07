Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A20510FBA7
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jun 2022 21:36:51 +0000 (UTC)
From: Rohith Iyer <quic_rohiiyer@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Tue, 7 Jun 2022 14:36:29 -0700
Message-ID: <20220607213629.5031-1-quic_rohiiyer@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v1] tests/kms_writeback: Iterate over only
 non-null pipes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, quic_aravindh@quicinc.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Currently, kms_writeback_get_output iterates over all entries of
display->pipes, regardless of if the pipe is valid. This could lead to a
null dereference in igt_output_set_pipe() as the loop does not check for
null pipes. To avoid this issue, use the for_each_pipe method to iterate
over only non-null pipes.

Signed-off-by: Rohith Iyer <quic_rohiiyer@quicinc.com>
---
 tests/kms_writeback.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
index b6c815db..d416d510 100644
--- a/tests/kms_writeback.c
+++ b/tests/kms_writeback.c
@@ -110,21 +110,21 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output)
 static igt_output_t *kms_writeback_get_output(igt_display_t *display)
 {
 	int i;
+	enum pipe pipe;
 
 	for (i = 0; i < display->n_outputs; i++) {
 		igt_output_t *output = &display->outputs[i];
-		int j;
 
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
 			continue;
 
-		for (j = 0; j < igt_display_get_n_pipes(display); j++) {
-			igt_output_set_pipe(output, j);
+		for_each_pipe(display, pipe){
+			igt_output_set_pipe(output, pipe);
 
 			if (check_writeback_config(display, output)) {
 				igt_debug("Using connector %u:%s on pipe %d\n",
 					  output->config.connector->connector_id,
-					  output->name, j);
+					  output->name, pipe);
 				return output;
 			}
 		}
-- 
2.17.1
