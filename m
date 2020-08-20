Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 20 Aug 2020 19:26:40 +0100
Message-Id: <20200820182640.65842-4-chris@chris-wilson.co.uk>
In-Reply-To: <20200820182640.65842-1-chris@chris-wilson.co.uk>
References: <20200820182640.65842-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/4] i915/gem_exec_alignment: 32b printf
 cleanups
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
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

PRIu64 to the rescue!

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_exec_alignment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_exec_alignment.c b/tests/i915/gem_exec_alignment.c
index 17a14bef4..7bbd2a8fc 100644
--- a/tests/i915/gem_exec_alignment.c
+++ b/tests/i915/gem_exec_alignment.c
@@ -204,7 +204,7 @@ naughty_child(int i915, int link, uint32_t shared, unsigned int flags)
 	execbuf.buffer_count =
 		create_batch(i915, obj, execbuf.buffer_count, count, flags);
 	gem_execbuf(i915, &execbuf);
-	igt_debug("Created %lu buffers ready for delay\n", count);
+	igt_debug("Created %"PRIu64" buffers ready for delay\n", count);
 
 	/* Calibrate a long execbuf() */
 	memset(&tv, 0, sizeof(tv));
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
