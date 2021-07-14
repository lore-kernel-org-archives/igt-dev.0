Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C316E235
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Jul 2021 17:39:02 +0000 (UTC)
From: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Date: Wed, 14 Jul 2021 17:38:59 +0000
Message-ID: <230a51b2c1554090b637bc8145f2b55f@intel.com>
References: <20210714173141.1381686-1-jason@jlekstrand.net>
 <20210714173141.1381686-10-jason@jlekstrand.net>
In-Reply-To: <20210714173141.1381686-10-jason@jlekstrand.net>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 9/9] tests/i915/gen9_exec_parse: Expect
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
To: Jason Ekstrand <jason@jlekstrand.net>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

What is expected from myside? Should these email's I received go to a different person?

Lakshmi.
-----Original Message-----
From: Jason Ekstrand <jason@jlekstrand.net> 
Sent: Wednesday, July 14, 2021 10:32 AM
To: igt-dev@lists.freedesktop.org
Cc: Jason Ekstrand <jason@jlekstrand.net>; Vudum, Lakshminarayana <lakshminarayana.vudum@intel.com>
Subject: [PATCH i-g-t 9/9] tests/i915/gen9_exec_parse: Expect sync_fence_status to succeed

i915 is switching to synchronously parse command buffers and deliver the error immediately instead of trying to propagate it to the fence.  We can assume that, if there is an error, it's returned from execbuf.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Cc: Lakshminarayana Vudum <lakshminarayana.vudum@intel.com>
---
 tests/i915/gen9_exec_parse.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/i915/gen9_exec_parse.c b/tests/i915/gen9_exec_parse.c index b35f2cb43..512891873 100644
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
