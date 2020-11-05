Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu,  5 Nov 2020 00:21:23 +0000
Message-Id: <20201105002124.37888-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] i915/gem_exec_whisper: Reopen existing
 device
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

Reopen the existing device, rather than relying on the filtering in
drm_open_driver().

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_exec_whisper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/i915/gem_exec_whisper.c b/tests/i915/gem_exec_whisper.c
index 9acf6c306..b63d791d1 100644
--- a/tests/i915/gem_exec_whisper.c
+++ b/tests/i915/gem_exec_whisper.c
@@ -87,12 +87,12 @@ struct hang {
 	int fd;
 };
 
-static void init_hang(struct hang *h)
+static void init_hang(struct hang *h, int fd)
 {
 	uint32_t *batch;
 	int i, gen;
 
-	h->fd = drm_open_driver(DRIVER_INTEL);
+	h->fd = gem_reopen_driver(fd);
 	igt_allow_hang(h->fd, 0, 0);
 
 	gen = intel_gen(intel_get_drm_devid(h->fd));
@@ -224,7 +224,7 @@ static void whisper(int fd, unsigned engine, unsigned flags)
 		igt_require(gem_has_queues(fd));
 
 	if (flags & HANG)
-		init_hang(&hang);
+		init_hang(&hang, fd);
 
 	nchild = 1;
 	if (flags & FORKED)
@@ -304,7 +304,7 @@ static void whisper(int fd, unsigned engine, unsigned flags)
 		}
 		if (flags & FDS) {
 			for (n = 0; n < 64; n++)
-				fds[n] = drm_open_driver(DRIVER_INTEL);
+				fds[n] = gem_reopen_driver(fd);
 		}
 
 		memset(batches, 0, sizeof(batches));
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
