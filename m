Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Date: Wed,  4 Mar 2020 09:29:01 +0000
Message-Id: <20200304092901.2347-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/i915/query: Do not assert engine info
 rsvd being zero
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
Cc: Intel-gfx@lists.freedesktop.org, Brian Welty <brian.welty@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

These are not input fields and i915 currently leaves them untouched.

In the spirit of trusting the query as the authoritative source of
information, stop asserting these output only reserved fields are zero.

This should prevent the test from auto-failing if we extend the data in
the future.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Brian Welty <brian.welty@intel.com>
---
 tests/i915/i915_query.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tests/i915/i915_query.c b/tests/i915/i915_query.c
index 71807425fbc4..e7c6fc91e32b 100644
--- a/tests/i915/i915_query.c
+++ b/tests/i915/i915_query.c
@@ -690,11 +690,6 @@ static void engines(int fd)
 			  engine->flags,
 			  engine->capabilities);
 
-		/* MBZ fields. */
-		igt_assert_eq(engine->rsvd0, 0);
-		igt_assert_eq(engine->rsvd1[0], 0);
-		igt_assert_eq(engine->rsvd1[1], 0);
-
 		switch (engine->engine.engine_class) {
 		case I915_ENGINE_CLASS_RENDER:
 			/* Will be tested later. */
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
