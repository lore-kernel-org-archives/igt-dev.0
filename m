Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 369EF10E7D2
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jan 2024 06:25:00 +0000 (UTC)
From: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v3 2/3] tests/xe_waitfence: Removed drm_xe_sync data in
 exec_queue_reset_wait
Date: Thu, 11 Jan 2024 11:55:17 +0530
Message-Id: <20240111062518.393544-3-krishnaiah.bommu@intel.com>
In-Reply-To: <20240111062518.393544-1-krishnaiah.bommu@intel.com>
References: <20240111062518.393544-1-krishnaiah.bommu@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Removed drm_xe_sync data in exec_queue_reset_wait since it was declared
and unused, failure Intel XE#1081

Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_waitfence.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/tests/intel/xe_waitfence.c b/tests/intel/xe_waitfence.c
index fd515a151..2f0f00cf4 100644
--- a/tests/intel/xe_waitfence.c
+++ b/tests/intel/xe_waitfence.c
@@ -248,16 +248,8 @@ exec_queue_reset_wait(int fd)
 		uint32_t data;
 	} *data;
 
-#define USER_FENCE_VALUE        0xdeadbeefdeadbeefull
-	struct drm_xe_sync sync[1] = {
-		{ .flags = DRM_XE_SYNC_TYPE_USER_FENCE | DRM_XE_SYNC_FLAG_SIGNAL,
-			.timeline_value = USER_FENCE_VALUE },
-	};
-
 	struct drm_xe_exec exec = {
 		.num_batch_buffer = 1,
-		.num_syncs = 1,
-		.syncs = to_user_pointer(sync),
 	};
 
 	uint32_t vm = xe_vm_create(fd, 0, 0);
-- 
2.25.1
