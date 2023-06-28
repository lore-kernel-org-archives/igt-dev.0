Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2C310E0C7
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Jun 2023 07:45:18 +0000 (UTC)
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 28 Jun 2023 15:45:03 +0800
Message-ID: <20230628074503.2902624-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH] lib/amdgpu: add the fence status check
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Jesse Zhang <Jesse.Zhang@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

when waiting for the fence to time out, the fence status will return -ETIME.
Because it is a negative test, the -ETIME should be our expect error.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index bef70893..177e58a3 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -255,7 +255,7 @@ bad_access_helper(amdgpu_device_handle device_handle, int reg_access, unsigned i
 
 	r = amdgpu_cs_query_fence_status(&fence_status,
 			AMDGPU_TIMEOUT_INFINITE,0, &expired);
-	if (r != 0 && r != -ECANCELED)
+	if (r != 0 && r != -ECANCELED && r == -ETIME)
 		igt_assert(0);
 
 	amdgpu_bo_list_destroy(bo_list);
-- 
2.25.1
