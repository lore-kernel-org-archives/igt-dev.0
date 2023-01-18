Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2564E10E10D
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jan 2023 07:34:49 +0000 (UTC)
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 18 Jan 2023 13:03:39 +0530
Message-Id: <20230118073339.141643-1-mohammed.thasleem@intel.com>
In-Reply-To: <20230117080507.127924-1-mohammed.thasleem@intel.com>
References: <20230117080507.127924-1-mohammed.thasleem@intel.com>
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
unblock the resources so that test continue execution on
another panels.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_lease.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/kms_lease.c b/tests/kms_lease.c
index 67e8d3be..c870bfd1 100644
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
@@ -351,9 +352,10 @@ static void setcrtc_implicit_plane(data_t *data)
 	/* sanity check */
 	do_or_die(drmModeSetCrtc(data->master.fd, data->crtc_id, -1,
 				 0, 0, object_ids, 1, mode));
-	do_or_die(drmModeSetCrtc(mcl.fd, data->crtc_id, -1,
-				 0, 0, object_ids, 1, mode));
+	ret = drmModeSetCrtc(mcl.fd, data->crtc_id, -1, 0, 0, object_ids,
+			     1, mode);
 	close(mcl.fd);
+	igt_assert_eq(ret, 0);
 
 	object_ids[mcl.object_count++] = wrong_plane_id;
 	do_or_die(create_lease(data->master.fd, &mcl));
-- 
2.25.1
