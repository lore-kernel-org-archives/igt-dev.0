Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B5310E488
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 16:21:15 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 23 Mar 2023 18:18:08 +0200
Message-Id: <20230323161808.1439499-2-imre.deak@intel.com>
In-Reply-To: <20230323161808.1439499-1-imre.deak@intel.com>
References: <20230323161808.1439499-1-imre.deak@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_dp_aux_dev: Treat ENXIO as a
 sink detect error
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

The Nouveau/gm200 and the i915 drivers' AUX handlers return -ENXIO if
there was no sink detected. The other drivers don't use this error code
in the same handler, so assume this error always means a sink detect
error.

Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 tests/kms_dp_aux_dev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
index 86e111bf2..69edc1585 100644
--- a/tests/kms_dp_aux_dev.c
+++ b/tests/kms_dp_aux_dev.c
@@ -46,6 +46,7 @@ static bool sink_detect_error(int drm_fd, uint32_t connector_id, int error_code)
 {
 	switch (error_code) {
 	case ETIMEDOUT:
+	case ENXIO:
 		return true;
 	case EIO:
 		return is_mst_connector(drm_fd, connector_id) ||
-- 
2.37.1
