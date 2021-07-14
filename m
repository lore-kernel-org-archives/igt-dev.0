Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311706E43D
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jul 2021 17:32:07 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id b12so1806031plh.10
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jul 2021 10:32:07 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 14 Jul 2021 12:31:41 -0500
Message-Id: <20210714173141.1381686-10-jason@jlekstrand.net>
In-Reply-To: <20210714173141.1381686-1-jason@jlekstrand.net>
References: <20210714173141.1381686-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 9/9] tests/i915/gen9_exec_parse: Expect
 sync_fence_status to succeed
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
Cc: Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

i915 is switching to synchronously parse command buffers and deliver the
error immediately instead of trying to propagate it to the fence.  We
can assume that, if there is an error, it's returned from execbuf.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
---
 tests/i915/gen9_exec_parse.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/i915/gen9_exec_parse.c b/tests/i915/gen9_exec_parse.c
index b35f2cb43..512891873 100644
--- a/tests/i915/gen9_exec_parse.c
+++ b/tests/i915/gen9_exec_parse.c
@@ -72,10 +72,8 @@ __checked_execbuf(int i915, struct drm_i915_gem_execbuffer2 *eb)
 	fence = eb->rsvd2 >> 32;
 
 	sync_fence_wait(fence, -1);
-	err = sync_fence_status(fence);
+	igt_assert(sync_fence_status(fence) >= 0);
 	close(fence);
-	if (err < 0)
-		return err;
 
 	return 0;
 }
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
