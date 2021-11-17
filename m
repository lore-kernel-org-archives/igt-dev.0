Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A58F89BF4
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Nov 2021 19:48:06 +0000 (UTC)
From: Arjun Melkaveri <arjun.melkaveri@intel.com>
Date: Thu, 18 Nov 2021 01:08:03 +0530
Message-Id: <20211117193803.28670-1-arjun.melkaveri@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_capture: Minor fix of
 bug in code
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: arjun.melkaveri@intel.com, ashutosh.dixit@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Minor fix of bug in code, This was causing Test assertion
failure in function "__captureN" for gem_execbuf_wr.

Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
---
 tests/i915/gem_exec_capture.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
index 143d97ad..b80f597f 100644
--- a/tests/i915/gem_exec_capture.c
+++ b/tests/i915/gem_exec_capture.c
@@ -428,7 +428,7 @@ __captureN(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
 
 	obj[0].handle = gem_create(fd, 4096);
 	obj[0].offset = get_offset(ahnd, obj[0].handle, 4096, 0);
-	obj[0].flags = EXEC_OBJECT_WRITE | ahnd ? EXEC_OBJECT_PINNED : 0;
+	obj[0].flags = EXEC_OBJECT_WRITE | (ahnd ? EXEC_OBJECT_PINNED : 0);
 
 	for (i = 0; i < count; i++) {
 		obj[i + 1].handle = gem_create(fd, size);
-- 
2.25.1
