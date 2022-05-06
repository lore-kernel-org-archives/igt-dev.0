Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0658610E150
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 18:14:52 +0000 (UTC)
From: Jessica Zhang <quic_jesszhan@quicinc.com>
To: <igt-dev@lists.freedesktop.org>
Date: Fri, 6 May 2022 11:14:32 -0700
Message-ID: <20220506181432.165-4-quic_jesszhan@quicinc.com>
In-Reply-To: <20220506181432.165-1-quic_jesszhan@quicinc.com>
References: <20220506181432.165-1-quic_jesszhan@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t v1 3/3] tests/kms_rotation_crc: Use
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

Currently, test_plane_rotation calls igt_output_get_plane_type to get
the plane with the corresponding type then calls drmModePageFlip when
the plane is a primary plane.

This will cause issues in cases where there are multiple primary planes
as the primary plane taken from igt_output_get_plane_type might not be
the primary plane being assigned to the pipe by the driver.

To fix this, let's use igt_get_assigned_primary to get the assigned
primary plane of the driver.

Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 tests/kms_rotation_crc.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/kms_rotation_crc.c b/tests/kms_rotation_crc.c
index 50869a08a275..db93c28f843c 100644
--- a/tests/kms_rotation_crc.c
+++ b/tests/kms_rotation_crc.c
@@ -513,7 +513,11 @@ static void test_plane_rotation(data_t *data, int plane_type, bool test_bad_form
 
 		igt_output_set_pipe(output, pipe);
 
-		plane = igt_output_get_plane_type(output, plane_type);
+		if (plane_type == DRM_PLANE_TYPE_PRIMARY)
+			plane = igt_get_assigned_primary(output, &data->display.pipes[pipe]);
+		else
+			plane = igt_output_get_plane_type(output, plane_type);
+
 		igt_require(igt_plane_has_prop(plane, IGT_PLANE_ROTATION));
 		igt_require(igt_plane_has_rotation(plane, data->rotation));
 		/* CHV can't rotate and reflect simultaneously */
-- 
2.31.0
