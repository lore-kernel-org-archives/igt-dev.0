Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48B110E11B
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jun 2022 18:33:38 +0000 (UTC)
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 3 Jun 2022 11:32:57 -0700
Message-ID: <20220603183257.145-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v1] lib/igt_kms: Call get_assigned_primary
 only if display is initialized
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

Move code for getting the driver-assigned primary plane to before the
`out` tag. This will avoid any crashes in cases where the display
resources haven't been initialized.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 lib/igt_kms.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index af4fb85b9a7b..36dfcfcb886d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2528,9 +2528,6 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 	/* Set reasonable default values for every object in the display. */
 	igt_display_reset(display);
 
-out:
-	LOG_UNINDENT(display);
-
 	for_each_pipe(display, i) {
 		igt_pipe_t *pipe = &display->pipes[i];
 		igt_output_t *output;
@@ -2565,6 +2562,9 @@ out:
 		}
 	}
 
+out:
+	LOG_UNINDENT(display);
+
 	if (display->n_pipes && display->n_outputs)
 		igt_enable_connectors(drm_fd);
 	else
-- 
2.31.0
