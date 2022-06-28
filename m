Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 28 Jun 2022 14:13:18 +0100
Message-Id: <20220628131318.197965-3-matthew.auld@intel.com>
In-Reply-To: <20220628131318.197965-1-matthew.auld@intel.com>
References: <20220628131318.197965-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] tests/amdgpu/amdgpu_command_submission:
 fix uaf
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
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

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>
---
 lib/amdgpu/amd_command_submission.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index 4dc4df95..16939653 100644
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
2.36.1
