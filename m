Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB81F10E4B3
 for <igt-dev@lists.freedesktop.org>; Sat,  2 Jul 2022 03:05:42 +0000 (UTC)
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri,  1 Jul 2022 20:05:37 -0700
Message-Id: <b85d766b61d385c82611d920eaddec35ea82b62c.1656731010.git.ashutosh.dixit@intel.com>
In-Reply-To: <cover.1656731010.git.ashutosh.dixit@intel.com>
References: <cover.1656731010.git.ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/4] lib/amdgpu/amd_command_submission: Fix
 -Wuse-after-free
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

../lib/amdgpu/amd_command_submission.c: In function ‘amdgpu_command_submission_write_linear_helper’:
../lib/amdgpu/amd_command_submission.c:201:13: warning: pointer ‘ring_context’ used after ‘free’ [-Wuse-after-free]
  201 |         r = amdgpu_cs_ctx_free(ring_context->context_handle);
      |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
../lib/amdgpu/amd_command_submission.c:199:9: note: call to ‘free’ here
  199 |         free(ring_context);
      |         ^~~~~~~~~~~~~~~~~~

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/amdgpu/amd_command_submission.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index 4dc4df95c971..16939653b8fb 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -196,10 +196,10 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 	}
 	/* clean resources */
 	free(ring_context->pm4);
-	free(ring_context);
 	/* end of test */
 	r = amdgpu_cs_ctx_free(ring_context->context_handle);
 	igt_assert_eq(r, 0);
+	free(ring_context);
 }
 
 
-- 
2.34.1
