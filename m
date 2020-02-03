Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon,  3 Feb 2020 10:54:01 +0000
Message-Id: <20200203105401.17340-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_eio: Don't mix INVALID_CS and the
 cmdparser
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

Since the cmdparser causes it to discard the batch with INVALID_CS, we
are not being as thorough in our testing on gen9/bcs as we expect.
Furthermore, snb just dies, so don't.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 tests/i915/gem_eio.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
index aa4accc9d..d226d7428 100644
--- a/tests/i915/gem_eio.c
+++ b/tests/i915/gem_eio.c
@@ -187,10 +187,13 @@ static igt_spin_t * __spin_poll(int fd, uint32_t ctx, unsigned long flags)
 		.engine = flags,
 		.flags = (IGT_SPIN_FAST |
 			  IGT_SPIN_NO_PREEMPTION |
-			  IGT_SPIN_INVALID_CS |
 			  IGT_SPIN_FENCE_OUT),
 	};
 
+	if (!gem_has_cmdparser(fd, opts.engine) &&
+	    intel_gen(intel_get_drm_devid(fd)) != 6)
+		opts.flags |= IGT_SPIN_INVALID_CS;
+
 	if (gem_can_store_dword(fd, opts.engine))
 		opts.flags |= IGT_SPIN_POLL_RUN;
 
-- 
2.25.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
