Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 27 Jan 2020 09:07:11 +0000
Message-Id: <20200127090712.2324227-3-chris@chris-wilson.co.uk>
In-Reply-To: <20200127090712.2324227-1-chris@chris-wilson.co.uk>
References: <20200127090712.2324227-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/4] i915/gem_ctx_create: Reduce runtime
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
 tests/i915/gem_ctx_create.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tests/i915/gem_ctx_create.c b/tests/i915/gem_ctx_create.c
index 83da05690..d9a820e21 100644
--- a/tests/i915/gem_ctx_create.c
+++ b/tests/i915/gem_ctx_create.c
@@ -566,16 +566,16 @@ igt_main
 		maximum(fd, ncpus, CHECK_RAM | CHECK_SWAP);
 
 	igt_subtest("basic-files")
-		files(fd, 5, 1);
+		files(fd, 2, 1);
 	igt_subtest("files")
-		files(fd, 150, 1);
+		files(fd, 20, 1);
 	igt_subtest("forked-files")
-		files(fd, 150, ncpus);
+		files(fd, 20, ncpus);
 
 	igt_subtest("active-all")
-		active(fd, ALL_ENGINES, 120, 1);
+		active(fd, ALL_ENGINES, 20, 1);
 	igt_subtest("forked-active-all")
-		active(fd, ALL_ENGINES, 120, ncpus);
+		active(fd, ALL_ENGINES, 20, ncpus);
 
 	for (const struct intel_execution_engine *e = intel_execution_engines;
 	     e->name; e++) {
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
