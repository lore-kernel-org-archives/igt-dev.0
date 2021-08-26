Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2684289A91
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Aug 2021 06:33:47 +0000 (UTC)
From: Arjun Melkaveri <arjun.melkaveri@intel.com>
Date: Thu, 26 Aug 2021 11:57:14 +0530
Message-Id: <20210826062714.4885-1-arjun.melkaveri@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_exec_nop: Resolve missing
 context id in sequential test
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: arjun.melkaveri@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Resolved missing context id in exec buf, for sequential test. 
This was due to context mutation changes that was implemeted in gem_exec_nop. 

Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/i915/gem_exec_nop.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/i915/gem_exec_nop.c b/tests/i915/gem_exec_nop.c
index 09a0c29e..c435335b 100644
--- a/tests/i915/gem_exec_nop.c
+++ b/tests/i915/gem_exec_nop.c
@@ -749,6 +749,7 @@ static void sequential(int fd, uint32_t handle,
 	execbuf.buffer_count = 2;
 	execbuf.flags |= I915_EXEC_HANDLE_LUT;
 	execbuf.flags |= I915_EXEC_NO_RELOC;
+	execbuf.rsvd1 = ctx->id;
 	igt_require(__gem_execbuf(fd, &execbuf) == 0);
 
 	if (flags & CONTEXT) {
-- 
2.25.1
