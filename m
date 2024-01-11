Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: <vitaly.prosyak@amd.com>
Subject: [PATCH 1/2] lib/amdgpu: add secure flag to sdma packet
Date: Thu, 11 Jan 2024 14:25:52 -0500
Message-ID: <20240111192553.113902-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev.lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>
Message-ID: <20240111192552.z7abfb5hywTguxn3jTNXOZQmWUYhxRTcK2O1ENOWlJQ@z>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

The change is required to handle the security flag for
trusted memory zone copy operation(TMZ feature).
Previously the security test was its own hardcoded version,
now we are allowed to use ASIC -the dependent version function
to create the SDMA packet.

v2 : added description to commit message (Kamil)

Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 1adea6987..a7ccfa38b 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -139,7 +139,7 @@ sdma_ring_copy_linear(const struct amdgpu_ip_funcs *func,
 	} else {
 		context->pm4[i++] = SDMA_PACKET(SDMA_OPCODE_COPY,
 				       SDMA_COPY_SUB_OPCODE_LINEAR,
-				       0);
+					context->secure ? 0x4 : 0);
 		if (func->family_id >= AMDGPU_FAMILY_AI)
 			context->pm4[i++] = context->write_length - 1;
 		else
-- 
2.25.1
