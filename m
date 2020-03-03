Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 241DF6E97A
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Mar 2020 22:38:15 +0000 (UTC)
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Date: Tue,  3 Mar 2020 14:38:08 -0800
Message-Id: <20200303223813.3866-2-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20200303223813.3866-1-umesh.nerlige.ramappa@intel.com>
References: <20200303223813.3866-1-umesh.nerlige.ramappa@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/6] test/perf: Drop caches when closing
 perf stream
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
To: igt-dev@lists.freedesktop.org, Lionel G Landwerlin <lionel.g.landwerlin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Running ./build/tests/perf will run all the perf subtests in a sequence.
When running tests in a sequence, subsequent tests may not run with a
clean slate. For resources that are lazily released, drop caches in
__perf_close.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 tests/perf.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/perf.c b/tests/perf.c
index 5e818030..189c6aa1 100644
--- a/tests/perf.c
+++ b/tests/perf.c
@@ -244,6 +244,12 @@ __perf_close(int fd)
 		close(pm_fd);
 		pm_fd = -1;
 	}
+
+	/* When running tests in a sequence, subsequent tests may not run with a
+	 * clean slate. For resources that are lazily released, cleanup here.
+	 */
+	if (drm_fd >= 0 && !getgid() && !getuid())
+		gem_quiescent_gpu(drm_fd);
 }
 
 static int
@@ -3993,7 +3999,6 @@ test_rc6_disable(void)
 	igt_assert_eq(n_events_end - n_events_start, 0);
 
 	__perf_close(stream_fd);
-	gem_quiescent_gpu(drm_fd);
 
 	n_events_start = rc6_residency_ms();
 	nanosleep(&(struct timespec){ .tv_sec = 1, .tv_nsec = 0 }, NULL);
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
