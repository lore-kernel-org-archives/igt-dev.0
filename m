Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC0DE6EA30
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2019 00:59:43 +0000 (UTC)
From: D Scott Phillips <d.scott.phillips@intel.com>
Date: Tue, 10 Dec 2019 16:52:13 -0800
Message-Id: <20191211005235.67897-8-d.scott.phillips@intel.com>
In-Reply-To: <20191211005235.67897-1-d.scott.phillips@intel.com>
References: <20191211005235.67897-1-d.scott.phillips@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 07/29] kms_atomic: change `PAGE_SIZE` to
 `page_size`
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

POSIX limit.h provides a PAGE_SIZE constant, so change the
variable name here to not collide with it.

Signed-off-by: D Scott Phillips <d.scott.phillips@intel.com>
---
 tests/kms_atomic.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 8462d128..ade777e3 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -683,7 +683,7 @@ static void crtc_invalid_params_fence(igt_pipe_t *pipe,
 {
 	int timeline, fence_fd;
 	void *map;
-	const ptrdiff_t PAGE_SIZE = sysconf(_SC_PAGE_SIZE);
+	const ptrdiff_t page_size = sysconf(_SC_PAGE_SIZE);
 	uint64_t old_mode_id = pipe->values[IGT_CRTC_MODE_ID];
 
 	igt_require_sw_sync();
@@ -691,28 +691,28 @@ static void crtc_invalid_params_fence(igt_pipe_t *pipe,
 	timeline = sw_sync_timeline_create();
 
 	/* invalid out_fence_ptr */
-	map = mmap(NULL, PAGE_SIZE, PROT_READ, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+	map = mmap(NULL, page_size, PROT_READ, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
 	igt_assert(map != MAP_FAILED);
 
 	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_OUT_FENCE_PTR, (ptrdiff_t)map);
 	crtc_commit_atomic_err(pipe, plane, ATOMIC_RELAX_NONE, EFAULT);
-	munmap(map, PAGE_SIZE);
+	munmap(map, page_size);
 
 	/* invalid out_fence_ptr */
-	map = mmap(NULL, PAGE_SIZE, PROT_EXEC, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+	map = mmap(NULL, page_size, PROT_EXEC, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
 	igt_assert(map != MAP_FAILED);
 
 	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_OUT_FENCE_PTR, (ptrdiff_t)map);
 	crtc_commit_atomic_err(pipe, plane, ATOMIC_RELAX_NONE, EFAULT);
-	munmap(map, PAGE_SIZE);
+	munmap(map, page_size);
 
 	/* invalid out_fence_ptr */
-	map = mmap(NULL, PAGE_SIZE, PROT_NONE, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+	map = mmap(NULL, page_size, PROT_NONE, MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
 	igt_assert(map != MAP_FAILED);
 
 	igt_pipe_obj_set_prop_value(pipe, IGT_CRTC_OUT_FENCE_PTR, (ptrdiff_t)map);
 	crtc_commit_atomic_err(pipe, plane, ATOMIC_RELAX_NONE, EFAULT);
-	munmap(map, PAGE_SIZE);
+	munmap(map, page_size);
 
 	/* valid in fence but not allowed prop on crtc */
 	fence_fd = sw_sync_timeline_create_fence(timeline, 1);
-- 
2.23.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
