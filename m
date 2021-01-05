Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue,  5 Jan 2021 21:26:05 +0000
Message-Id: <20210105212606.3399854-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] lib: Immediately cancel a spinner for
 an expired timeout
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

If the relative timeout to igt_spin_set_timeout() is in the past,
immediately end the spinner.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2903
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 lib/igt_dummyload.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
index 6ecaf8506..34ad92216 100644
--- a/lib/igt_dummyload.c
+++ b/lib/igt_dummyload.c
@@ -485,10 +485,14 @@ void igt_spin_set_timeout(igt_spin_t *spin, int64_t ns)
 	pthread_attr_t attr;
 	int timerfd;
 
-	igt_assert(ns > 0);
 	if (!spin)
 		return;
 
+	if (ns <= 0) {
+		igt_spin_end(spin);
+		return;
+	}
+
 	igt_assert(spin->timerfd == -1);
 	timerfd = timerfd_create(CLOCK_MONOTONIC, 0);
 	igt_assert(timerfd >= 0);
-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
