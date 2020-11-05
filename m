Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu,  5 Nov 2020 00:21:24 +0000
Message-Id: <20201105002124.37888-2-chris@chris-wilson.co.uk>
In-Reply-To: <20201105002124.37888-1-chris@chris-wilson.co.uk>
References: <20201105002124.37888-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] i915/gem_ctx_thrash: Reopen the same
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

Use gem_reopen_driver() to always reopen the same device without relying
on the filtering in drm_open_driver().

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_ctx_thrash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_ctx_thrash.c b/tests/i915/gem_ctx_thrash.c
index d32619d5d..d9ddd6689 100644
--- a/tests/i915/gem_ctx_thrash.c
+++ b/tests/i915/gem_ctx_thrash.c
@@ -250,7 +250,7 @@ static void processes(void)
 	fds = malloc(num_ctx * sizeof(int));
 	igt_assert(fds);
 	for (unsigned n = 0; n < num_ctx; n++) {
-		fds[n] = drm_open_driver(DRIVER_INTEL);
+		fds[n] = gem_reopen_driver(fd);
 		if (fds[n] == -1) {
 			int err = errno;
 			for (unsigned i = n; i--; )
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
