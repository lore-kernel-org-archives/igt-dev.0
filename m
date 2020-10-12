Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6376C6E0F2
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Oct 2020 17:56:58 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Mon, 12 Oct 2020 20:56:54 +0300
Message-Id: <20201012175654.2422295-1-imre.deak@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] tests/kms_dp_aux_dev: Handle AUX failures on
 disconnected MST connectors
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
List-ID: <igt-dev@lists.freedesktop.org>

The DPCD of an MST connector is read out with a REMOTE_DPCD_READ MST
request. If the given connector is disconnected this read will result in
an MST NAK reply and this will be reported as an EIO error to the
initiator of the AUX read.

Handle this in the test that attempts to read the DPCD of any exposed
connector, whether they are connected or not.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 tests/kms_dp_aux_dev.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
index 4f52434a..39fc2b92 100644
--- a/tests/kms_dp_aux_dev.c
+++ b/tests/kms_dp_aux_dev.c
@@ -34,6 +34,14 @@
 
 IGT_TEST_DESCRIPTION("Test that /dev/drm_dp_aux reads work");
 
+static bool is_mst_connector(int drm_fd, uint32_t connector_id)
+{
+	return kmstest_get_property(drm_fd, connector_id,
+				    DRM_MODE_OBJECT_CONNECTOR,
+				    "PATH", NULL,
+				    NULL, NULL);
+}
+
 static bool test(int drm_fd, uint32_t connector_id)
 {
 	drmModeConnector *connector;
@@ -67,10 +75,12 @@ static bool test(int drm_fd, uint32_t connector_id)
 		igt_assert(fd >= 0);
 
 		ret = read(fd, buf, sizeof(buf));
-		igt_assert(ret == sizeof(buf) || errno == ETIMEDOUT);
-
 		igt_info("%s: %s\n", path,
-			 ret > 0 ? "success" : "timed out");
+			 ret > 0 ? "success" : strerror(errno));
+
+		igt_assert(ret == sizeof(buf) ||
+			   errno == ETIMEDOUT ||
+			   (errno == EIO && is_mst_connector(drm_fd, connector_id)));
 
 		close(fd);
 
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
