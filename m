Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F09810E065
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Nov 2023 08:03:22 +0000 (UTC)
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
Date: Wed, 29 Nov 2023 16:03:07 +0800
Message-ID: <20231129080307.135383-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Subject: [igt-dev] [PATCH i-g-t] tests/amdgpu: fix secure bounce test issue
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Luben Tuikov <luben.tuikov@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Christian
 Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

To the secure memory, the destination data(bo2) has been encrypted,
after copying it via SDMA from bo to bo2.
It cannot compare bo2 with the original data.
Therefore, skip this memory check.

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Luben Tuikov <luben.tuikov@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_security.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
index d1146a7ce..678270fdf 100644
--- a/tests/amdgpu/amd_security.c
+++ b/tests/amdgpu/amd_security.c
@@ -225,14 +225,16 @@ amdgpu_secure_bounce(amdgpu_device_handle device_handle, int fd,
 			secure == true ? 1 : 0);
 
 	/* Verify the contents of Bob. */
-	for (pp = (__typeof__(pp))ring_context->bo2_cpu;
-	     pp < (__typeof__(pp)) ring_context->bo2_cpu + SECURE_BUFFER_SIZE;
-	     pp += sizeof(secure_pattern)) {
-		r = memcmp(pp, secure_pattern, sizeof(secure_pattern));
-		if (r) {
-			// test failure
-			igt_assert(false);
-			break;
+	if (!secure) {
+		for (pp = (__typeof__(pp))ring_context->bo2_cpu;
+			pp < (__typeof__(pp)) ring_context->bo2_cpu + SECURE_BUFFER_SIZE;
+			pp += sizeof(secure_pattern)) {
+			r = memcmp(pp, secure_pattern, sizeof(secure_pattern));
+			if (r) {
+				// test failure
+				igt_assert(false);
+				break;
+			}
 		}
 	}
 
-- 
2.25.1
