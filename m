Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B42C710E51B
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Apr 2022 01:11:53 +0000 (UTC)
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 28 Apr 2022 18:11:17 -0700
Message-ID: <20220429011117.147-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v1] tests/kms_universal_plane: Skip
 pageflip_test_pipe subtest if pipe has more than 1 primary plane
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

Currently, IGT assumes that the first primary plane it encounters in
display->planes is the primary plane being assigned to the current pipe
in the driver [1]. However, this is not always the case when planes are
being shared between pipes and there are multiple possible primary
planes.

It's possible for IGT to set pipe->plane_primary to a primary plane
that's different from the one being used in the driver, since IGT uses
possible_crtcs to find the primary planes and stops at the first match.

Unfortunately, DRM doesn't expose which primary plane is being used by a
pipe, so let's skip pageflip_test_pipe for cases where there are
multiple possible primary planes.

[1]
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/lib/igt_kms.c#L2305

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 tests/kms_universal_plane.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 3cb6d704a6ef..95cae2be1aaf 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -470,13 +470,25 @@ static void
 pageflip_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 {
 	pageflip_test_t test = { .data = data };
-	igt_plane_t *primary;
+	igt_plane_t *primary, *plane;
 	struct timeval timeout = { .tv_sec = 0, .tv_usec = 500 };
 	drmEventContext evctx = { .version = 2 };
 
 	fd_set fds;
+	int primary_plane_count = 0;
 	int ret = 0;
 
+	for_each_plane_on_pipe(&data->display, pipe, plane)
+		if (plane->type == DRM_PLANE_TYPE_PRIMARY)
+			primary_plane_count++;
+
+	/*
+	 * Skip subtest when there are multiple primary planes since we
+	 * aren't able to distinguish which primary plane is actually being
+	 * assigned a pipe
+	 */
+	igt_skip_on(primary_plane_count > 1);
+
 	igt_require_pipe(&data->display, pipe);
 
 	igt_output_set_pipe(output, pipe);
-- 
2.31.0
