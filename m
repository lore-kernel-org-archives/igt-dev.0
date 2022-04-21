Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7291810E00D
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Apr 2022 21:34:55 +0000 (UTC)
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 21 Apr 2022 14:34:42 -0700
Message-ID: <20220421213442.366-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v1] tests/kms_universal_plane: Change
 num_primary and num_cursor asserts into warnings
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

This check was originally put in place to prevent accidental calls to
drm_plane_init instead of drm_universal_plane_init to go uncaught due to
similarities in parameters.

However, both method signatures have now diverged enough so that
accidental calls will be caught by the compiler. In addition, DRM allows
drivers to support multiple primary planes, so demoting the assert to a
warning instead will prevent subtests from being blocked for drivers
where multiple primary planes are supported.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 tests/kms_universal_plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
index 2e8958979dd6..3cb6d704a6ef 100644
--- a/tests/kms_universal_plane.c
+++ b/tests/kms_universal_plane.c
@@ -154,8 +154,8 @@ functional_test_pipe(data_t *data, enum pipe pipe, igt_output_t *output)
 		else if (display->pipes[pipe].planes[i].type == DRM_PLANE_TYPE_CURSOR)
 			num_cursor++;
 
-	igt_assert_eq(num_primary, 1);
-	igt_assert_lte(num_cursor, 1);
+	igt_warn_on(num_primary != 1);
+	igt_warn_on(num_cursor > 1);
 
 	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	sprite = igt_output_get_plane_type(output, DRM_PLANE_TYPE_OVERLAY);
-- 
2.31.0
