Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 12 May 2020 17:20:45 +0100
Message-Id: <20200512162046.674703-2-chris@chris-wilson.co.uk>
In-Reply-To: <20200512162046.674703-1-chris@chris-wilson.co.uk>
References: <20200512162046.674703-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/3] i915/gem_eio: Drop redundant "health
 check"
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
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

After triggering the reset, we would ping the engines with a no-op. But
we already validate the reset, so this would seem superfluous.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_eio.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
index e0d8390f6..6cec7cd4a 100644
--- a/tests/i915/gem_eio.c
+++ b/tests/i915/gem_eio.c
@@ -72,16 +72,6 @@ static void trigger_reset(int fd)
 
 	/* The forced reset should be immediate */
 	igt_assert_lte(igt_seconds_elapsed(&ts), 2);
-
-	/* And just check the gpu is indeed running again */
-	igt_kmsg(KMSG_DEBUG "Checking that the GPU recovered\n");
-	gem_test_engine(fd, ALL_ENGINES);
-
-	igt_debugfs_dump(fd, "i915_engine_info");
-	igt_drop_caches_set(fd, DROP_ACTIVE);
-
-	/* We expect the health check to be quick! */
-	igt_assert_lte(igt_seconds_elapsed(&ts), 10);
 }
 
 static void manual_hang(int drm_fd)
-- 
2.26.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
