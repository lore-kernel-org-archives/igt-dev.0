Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B1D10E2E0
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jan 2023 08:06:06 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 17 Jan 2023 13:35:07 +0530
Message-Id: <20230117080507.127924-1-mohammed.thasleem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/kms_lease: close mcl.fd when
 drmModeSetCrtc fails
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Close mcl.fd when drmModeSetCrtc retuns fail and it will
unblock the resources for other subtests execution with
out fail.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_lease.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 67e8d3be..c1cf8567 100644
--- a/tests/kms_lease.c
+++ b/tests/kms_lease.c
@@ -317,6 +317,7 @@ static void setcrtc_implicit_plane(data_t *data)
 	struct drm_mode_create_lease mcl;
 	drmModePlaneRes *plane_resources;
 	uint32_t wrong_plane_id = 0;
+	int ret = 0;
 	igt_output_t *output =
 		connector_id_to_output(&data->master.display,
 				       data->connector_id);
@@ -351,10 +352,14 @@ static void setcrtc_implicit_plane(data_t *data)
 	/* sanity check */
 	do_or_die(drmModeSetCrtc(data->master.fd, data->crtc_id, -1,
 				 0, 0, object_ids, 1, mode));
-	do_or_die(drmModeSetCrtc(mcl.fd, data->crtc_id, -1,
-				 0, 0, object_ids, 1, mode));
-	close(mcl.fd);
+	ret = drmModeSetCrtc(mcl.fd, data->crtc_id, -1, 0, 0, object_ids,
+			     1, mode);
+	if (ret) {
+		close(mcl.fd);
+		igt_assert_eq(ret, 0);
+	}
 
+	close(mcl.fd);
 	object_ids[mcl.object_count++] = wrong_plane_id;
 	do_or_die(create_lease(data->master.fd, &mcl));
 
-- 
2.25.1
