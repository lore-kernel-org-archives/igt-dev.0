Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 15 Apr 2020 15:39:00 +0100
Message-Id: <20200415143900.2927491-1-chris@chris-wilson.co.uk>
In-Reply-To: <20200414190509.2868509-1-chris@chris-wilson.co.uk>
References: <20200414190509.2868509-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib: Use read() for timerfd timeout
 detection
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

The poll() is proving unreliable, where our tests timeout without the
spinner being terminated. Let's try a blocking read instead!

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/1676
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
---
 lib/igt_dummyload.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
index 99ca84ad8..ae0fb9378 100644
--- a/lib/igt_dummyload.c
+++ b/lib/igt_dummyload.c
@@ -399,14 +399,14 @@ igt_spin_factory(int fd, const struct igt_spin_factory *opts)
 static void *timer_thread(void *data)
 {
 	igt_spin_t *spin = data;
-	struct pollfd pfd = {
-		.fd = spin->timerfd,
-		.events = POLLIN,
-	};
+	uint64_t overruns = 0;
 
-	if (poll(&pfd, 1, -1) >= 0)
-		igt_spin_end(spin);
+	/* Wait until we see the timer fire, or we get cancelled */
+	do {
+		read(spin->timerfd, &overruns, sizeof(overruns));
+	} while (!overruns);
 
+	igt_spin_end(spin);
 	return NULL;
 }
 
-- 
2.26.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
