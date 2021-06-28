Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2074.outbound.protection.outlook.com [40.107.95.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E5E6E461
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Jun 2021 13:21:13 +0000 (UTC)
From: Anson Jacob <Anson.Jacob@amd.com>
Date: Mon, 28 Jun 2021 09:21:04 -0400
Message-ID: <20210628132104.1071786-1-Anson.Jacob@amd.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t V2] tests/kms_content_protection: Enable
 Primary plane for CRTC.
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
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>, Anson Jacob <Anson.Jacob@amd.com>, Bindu Ramamurthy <bindu.r@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Bindu Ramamurthy <bindu.r@amd.com>

[Why]
Atomic driver check fails for crtc, when there is no primary plane.

[How]
Enable primary plane before committing the streams.

Signed-off-by: Bindu Ramamurthy <bindu.r@amd.com>
Acked-by: Anson Jacob <Anson.Jacob@amd.com>
Cc: Petri Latvala <petri.latvala@intel.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Mark Yacoub <markyacoub@chromium.org>
---
 tests/kms_content_protection.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index bab61817bcc1..04b9ab30334a 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -180,10 +180,13 @@ static void modeset_with_fb(const enum pipe pipe, igt_output_t *output,
 	igt_output_set_pipe(output, pipe);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
-	igt_display_commit2(display, s);
 	igt_plane_set_fb(primary, &data.red);
 	igt_fb_set_size(&data.red, primary, mode.hdisplay, mode.vdisplay);
 
+	igt_display_commit2(display, s);
+
+	igt_plane_set_fb(primary, &data.green);
+
 	/* Wait for Flip completion before starting the HDCP authentication */
 	commit_display_and_wait_for_flip(s);
 }
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
