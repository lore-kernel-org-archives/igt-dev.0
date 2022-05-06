Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59A3310E208
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 18:14:51 +0000 (UTC)
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 6 May 2022 11:14:31 -0700
Message-ID: <20220506181432.165-3-quic_jesszhan@quicinc.com>
In-Reply-To: <20220506181432.165-1-quic_jesszhan@quicinc.com>
References: <20220506181432.165-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v1 2/3] tests/kms_universal_plane: Use
 igt_get_assigned_primary to get the primary plane
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: robdclark@chromium.org, petri.latvala@intel.com, quic_aravindh@quicinc.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Currently, pageflip_test_pipe will use igt_output_get_plane_type to get
the primary plane of the pipe and assumes that the primary plane marked
by the driver will also be used by drmModePageFlip to perform the page flip.

This is not necessarily true in cases where there are multiple possible
primary planes.

To fix this, let's use igt_get_assigned_primary to get the primary plane
instead.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 tests/kms_universal_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 3cb6d704a6ef..7bd2c667b552 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -483,7 +483,7 @@ pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 
 	pageflip_test_init(&test, output, pipe);
 
-	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	primary = igt_get_assigned_primary(output, &data->display.pipes[pipe]);
 
 	/* Use legacy API to set a mode with a blue FB */
 	igt_plane_set_fb(primary, &test.blue_fb);
-- 
2.31.0
