Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240876EAD4
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Apr 2021 19:13:32 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id w8so13239435pfn.9
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Apr 2021 12:13:32 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 15 Apr 2021 14:11:37 -0500
Message-Id: <20210415191145.2137858-67-jason@jlekstrand.net>
In-Reply-To: <20210415191145.2137858-1-jason@jlekstrand.net>
References: <20210415191145.2137858-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 66/74] lib/i915: Use for_each_physical_ring
 for submission tests
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

This does make the assumption that ctx0 has the default set of engines
but, now that we've converted everything to intel_ctx_t, this assumption
should be ok.
---
 lib/i915/gem_submission.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
index 051f9d04..c13dfdce 100644
--- a/lib/i915/gem_submission.c
+++ b/lib/i915/gem_submission.c
@@ -32,6 +32,7 @@
 
 #include "i915/gem.h"
 #include "i915/gem_engine_topology.h"
+#include "i915/gem_ring.h"
 #include "i915/gem_submission.h"
 
 #include "igt_core.h"
@@ -199,10 +200,8 @@ void gem_test_engine(int i915, unsigned int engine)
 	gem_write(i915, obj.handle, 0, &bbe, sizeof(bbe));
 
 	if (engine == ALL_ENGINES) {
-		const struct intel_execution_engine2 *e2;
-
-		__for_each_physical_engine(i915, e2) {
-			execbuf.flags = e2->flags;
+		for_each_physical_ring(e, i915) {
+			execbuf.flags = eb_ring(e);
 			gem_execbuf(i915, &execbuf);
 		}
 	} else {
@@ -381,11 +380,9 @@ unsigned int gem_submission_measure(int i915, unsigned int engine)
 		fcntl(i915, F_SETFL, fcntl(i915, F_GETFL) | O_NONBLOCK);
 
 	if (engine == ALL_ENGINES) {
-		struct intel_execution_engine2 *e;
-
 		size = -1;
-		__for_each_physical_engine(i915, e) {
-			unsigned int this =  __measure_ringsize(i915, e->flags);
+		for_each_physical_ring(e, i915) {
+			unsigned int this =  __measure_ringsize(i915, eb_ring(e));
 			if (this < size)
 				size = this;
 		}
-- 
2.31.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
