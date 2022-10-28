Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2082.outbound.protection.outlook.com [40.107.223.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB93010E0B1
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Oct 2022 03:00:54 +0000 (UTC)
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Thu, 27 Oct 2022 20:59:15 -0600
Message-ID: <20221028025915.2896834-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] tests/kms_dp_aux_dev: Skip failure on EIO for
 amdgpu
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: petri.latvala@intel.com, markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

amdgpu returns -EIO (-5) when DP is not connected instead of -ETIMEOUT.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_dp_aux_dev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/kms_dp_aux_dev.c b/tests/kms_dp_aux_dev.c
index ed9dd510..850ec8e2 100644
--- a/tests/kms_dp_aux_dev.c
+++ b/tests/kms_dp_aux_dev.c
@@ -86,7 +86,8 @@ static bool test(int drm_fd, uint32_t connector_id)
 
 		igt_assert(ret == sizeof(buf) ||
 			   errno == ETIMEDOUT ||
-			   (errno == EIO && is_mst_connector(drm_fd, connector_id)));
+			   (errno == EIO && (is_mst_connector(drm_fd, connector_id) ||
+			    is_amdgpu_device(drm_fd))));
 
 		close(fd);
 
-- 
2.34.1
