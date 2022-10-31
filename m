Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 31 Oct 2022 12:17:30 +0000
Message-Id: <20221031121730.32056-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/query: use 48B_ADDRESS in upload
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Our working set could be larger than 4G here.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/6671
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/i915/i915_query.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
index 4e43c7cd..e725e04e 100644
--- a/tests/i915/i915_query.c
+++ b/tests/i915/i915_query.c
@@ -625,10 +625,14 @@ static void upload(int fd, struct igt_list_head *handles, uint32_t num_handles)
 		      sizeof(struct drm_i915_gem_exec_object2));
 
 	i = 0;
-	igt_list_for_each_entry(iter, handles, link)
-		exec[i++].handle = iter->handle;
+	igt_list_for_each_entry(iter, handles, link) {
+		exec[i].handle = iter->handle;
+		exec[i].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
+		i++;
+	}
 
 	exec[i].handle = batch_create_size(fd, 4096);
+	exec[i].flags = EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
 
 	execbuf.buffers_ptr = to_user_pointer(exec);
 	execbuf.buffer_count = num_handles + 1;
-- 
2.38.1
