Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 27 Jan 2020 09:07:12 +0000
Message-Id: <20200127090712.2324227-4-chris@chris-wilson.co.uk>
In-Reply-To: <20200127090712.2324227-1-chris@chris-wilson.co.uk>
References: <20200127090712.2324227-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/4] i915/gem_ctx_switch: Reduce runtime
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Reduce the upper timeout for stress tests from 150s to a mere 20s, and
quick tests to 2s.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_ctx_switch.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/tests/i915/gem_ctx_switch.c b/tests/i915/gem_ctx_switch.c
index 6bbd24972..2f94e326f 100644
--- a/tests/i915/gem_ctx_switch.c
+++ b/tests/i915/gem_ctx_switch.c
@@ -364,18 +364,18 @@ igt_main
 				}
 
 				igt_subtest_f("legacy-%s%s", e->name, p->name)
-					single(fd, light, e2, p->flags, 1, 5);
+					single(fd, light, e2, p->flags, 1, 2);
 				igt_subtest_f("legacy-%s-heavy%s",
 					      e->name, p->name)
-					single(fd, heavy, e2, p->flags, 1, 5);
+					single(fd, heavy, e2, p->flags, 1, 2);
 				igt_subtest_f("legacy-%s-forked%s",
 					      e->name, p->name)
 					single(fd, light, e2, p->flags, ncpus,
-					       150);
+					       20);
 				igt_subtest_f("legacy-%s-forked-heavy%s",
 					      e->name, p->name)
 					single(fd, heavy, e2, p->flags, ncpus,
-					       150);
+					       20);
 			}
 		}
 	}
@@ -390,33 +390,33 @@ igt_main
 				}
 
 				igt_subtest_f("%s%s", e2->name, p->name)
-					single(fd, light, e2, p->flags, 1, 5);
+					single(fd, light, e2, p->flags, 1, 2);
 				igt_subtest_f("%s-heavy%s", e2->name, p->name)
-					single(fd, heavy, e2, p->flags, 1, 5);
+					single(fd, heavy, e2, p->flags, 1, 2);
 				igt_subtest_f("%s-forked%s", e2->name, p->name)
 					single(fd, light, e2, p->flags, ncpus,
-					       150);
+					       20);
 				igt_subtest_f("%s-forked-heavy%s",
 					      e2->name, p->name)
 					single(fd, heavy, e2, p->flags, ncpus,
-					       150);
+					       20);
 			}
 		}
 	}
 
 	igt_subtest("all-light")
-		all(fd, light, 0, 5);
+		all(fd, light, 0, 2);
 	igt_subtest("all-heavy")
-		all(fd, heavy, 0, 5);
+		all(fd, heavy, 0, 2);
 
 	igt_subtest_group {
 		igt_fixture {
 			igt_require(gem_has_queues(fd));
 		}
 		igt_subtest("queue-light")
-			all(fd, light, QUEUE, 5);
+			all(fd, light, QUEUE, 2);
 		igt_subtest("queue-heavy")
-			all(fd, heavy, QUEUE, 5);
+			all(fd, heavy, QUEUE, 2);
 	}
 
 	igt_fixture {
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
