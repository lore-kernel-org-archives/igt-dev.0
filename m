Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CF16EB21
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2020 07:58:16 +0000 (UTC)
From: Nidhi Gupta <nidhi1.gupta@intel.com>
Date: Thu, 16 Apr 2020 13:33:39 +0530
Message-Id: <1587024219-3447-1-git-send-email-nidhi1.gupta@intel.com>
Subject: [igt-dev] [PATCH v2] Add eDP support in Link Layer Compliance Tool
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Adding eDP support for Link Layer Compliance tool
of DP-PHY test automation. Current Implementation
of this compliance tool can be used for dp and eDP
both. Hence extending to eDP too.

Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
Reviewed-by: Animesh Manna <animesh.manna@intel.com>
---
 tools/intel_dp_compliance.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/intel_dp_compliance.c b/tools/intel_dp_compliance.c
index 2d42cb1..f26108b 100644
--- a/tools/intel_dp_compliance.c
+++ b/tools/intel_dp_compliance.c
@@ -849,7 +849,8 @@ int update_display(int mode, bool is_compliance_test)
 		conn = &connectors[cnt];
 		conn->id = resources->connectors[cnt];
 		c = drmModeGetConnector(drm_fd, conn->id);
-		if (c->connector_type == DRM_MODE_CONNECTOR_DisplayPort &&
+		if ((c->connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
+		    c->connector_type == DRM_MODE_CONNECTOR_eDP) &&
 		    c->connection == DRM_MODE_CONNECTED) {
 			test_connector_id = c->connector_id;
 			conn->connector = c;
-- 
2.7.4

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
