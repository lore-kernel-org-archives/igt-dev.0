Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CC66E2E3
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Sep 2021 05:29:12 +0000 (UTC)
From: priyanka.dandamudi@intel.com
Date: Thu, 30 Sep 2021 10:51:24 +0530
Message-Id: <20210930052124.980259-1-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_nop: Update poll
 sequential
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com, priyanka.dandamudi@intel.com, matthew.auld@intel.com, ashutosh.dixit@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

The set_caching ioctl returns -ENODEV for discrete.
So,updated the poll sequential test case accordingly.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 tests/i915/gem_exec_nop.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_nop.c b/tests/i915/gem_exec_nop.c
index c435335b..9123f9f5 100644
--- a/tests/i915/gem_exec_nop.c
+++ b/tests/i915/gem_exec_nop.c
@@ -232,6 +232,7 @@ static void poll_sequential(int fd, const intel_ctx_t *ctx,
 	unsigned long cycles;
 	uint64_t elapsed;
 	bool cached;
+	int expect;
 
 	flags = I915_EXEC_NO_RELOC;
 	if (gen == 4 || gen == 5)
@@ -251,7 +252,8 @@ static void poll_sequential(int fd, const intel_ctx_t *ctx,
 	memset(obj, 0, sizeof(obj));
 	obj[0].handle = gem_create(fd, 4096);
 	obj[0].flags = EXEC_OBJECT_WRITE;
-	cached = __gem_set_caching(fd, obj[0].handle, 1) == 0;
+	expect = __gem_set_caching(fd, obj[0].handle, 1);
+	cached = gem_has_lmem(fd)? expect == -ENODEV: expect == 0;
 	obj[1].handle = gem_create(fd, 4096);
 	obj[1].relocs_ptr = to_user_pointer(reloc);
 	obj[1].relocation_count = ARRAY_SIZE(reloc);
-- 
2.25.1
