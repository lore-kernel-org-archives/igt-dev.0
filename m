Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F224210E488
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 16:21:14 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 23 Mar 2023 18:18:07 +0200
Message-Id: <20230323161808.1439499-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_dp_aux_dev: Factor out helper
 checking for sink detect errors
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

For clarity, factor out a helper to check if the AUX transfer failed
due to not detecting the sink being connected.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 tests/kms_dp_aux_dev.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
index 850ec8e26..86e111bf2 100644
--- a/tests/kms_dp_aux_dev.c
+++ b/tests/kms_dp_aux_dev.c
@@ -42,6 +42,19 @@ static bool is_mst_connector(int drm_fd, uint32_t connector_id)
 				    NULL, NULL);
 }
 
+static bool sink_detect_error(int drm_fd, uint32_t connector_id, int error_code)
+{
+	switch (error_code) {
+	case ETIMEDOUT:
+		return true;
+	case EIO:
+		return is_mst_connector(drm_fd, connector_id) ||
+		       is_amdgpu_device(drm_fd);
+	default:
+		return false;
+	};
+}
+
 static bool test(int drm_fd, uint32_t connector_id)
 {
 	drmModeConnector *connector;
@@ -85,9 +98,7 @@ static bool test(int drm_fd, uint32_t connector_id)
 			 ret > 0 ? "success" : strerror(errno));
 
 		igt_assert(ret == sizeof(buf) ||
-			   errno == ETIMEDOUT ||
-			   (errno == EIO && (is_mst_connector(drm_fd, connector_id) ||
-			    is_amdgpu_device(drm_fd))));
+			   sink_detect_error(drm_fd, connector_id, errno));
 
 		close(fd);
 
-- 
2.37.1
