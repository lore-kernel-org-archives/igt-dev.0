Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CFA6EA29
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Jun 2021 17:39:42 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id i34so13688522pgl.9
 for <igt-dev@lists.freedesktop.org>; Wed, 09 Jun 2021 10:39:42 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed,  9 Jun 2021 12:38:41 -0500
Message-Id: <20210609173903.249112-22-jason@jlekstrand.net>
In-Reply-To: <20210609173632.248880-1-jason@jlekstrand.net>
References: <20210609173632.248880-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 71/93] lib/i915: Use for_each_physical_ring
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

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
---
 lib/i915/gem_submission.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
index bd4bbb3e..1abc73ec 100644
--- a/lib/i915/gem_submission.c
+++ b/lib/i915/gem_submission.c
@@ -33,6 +33,7 @@
 #include "i915/gem.h"
 #include "i915/gem_create.h"
 #include "i915/gem_engine_topology.h"
+#include "i915/gem_ring.h"
 #include "i915/gem_submission.h"
 
 #include "igt_core.h"
@@ -200,10 +201,8 @@ void gem_test_engine(int i915, unsigned int engine)
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
@@ -382,11 +381,9 @@ unsigned int gem_submission_measure(int i915, unsigned int engine)
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
