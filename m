Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D2310E00D
 for <igt-dev@lists.freedesktop.org>; Tue, 31 May 2022 06:52:17 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Petri Latvala <petri.latvala@intel.com>
Date: Tue, 31 May 2022 08:52:09 +0200
Message-Id: <20220531065211.233242-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20220531065211.233242-1-mauro.chehab@linux.intel.com>
References: <20220531065211.233242-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/3] benchmarks/gem_blt: fix baseline
 estimation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: sai.gowtham.ch@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

This test is expected to run under a certain time defined by a command
line parameter (by default, 2s).

In order to achive the specified time, the baseline() function tries to
estimate the value of a counter that will get the minimal amount of
interaction to wait for > 0.1s.

However, currently, the baseline estimation is broken, returning a too big
number, as it is measuring the memcpy() time, instead of actually
gem_execbuf().

Due to that, a default test without passing any command line parameter
would take more than 1.5 years to output the first benchmark data!

Fix it by using the same logic that it is inside run() at the baseline
time estimation.

Before this patch, baseline could return 399242693. After
it, it now return 20. That means an interval of about 120 ms at the
code which runs a gem_execbuf() loop,  which should be good enough to
ensure that the tests won't take too long, and will approximately match
the time specified by the excecution parameter '-t'.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 benchmarks/gem_blt.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/benchmarks/gem_blt.c b/benchmarks/gem_blt.c
index 424ce8e75913..bd8264b4e896 100644
--- a/benchmarks/gem_blt.c
+++ b/benchmarks/gem_blt.c
@@ -57,29 +57,21 @@ elapsed(const struct timespec *start, const struct timespec *end)
 	return (end->tv_sec - start->tv_sec) + 1e-9*(end->tv_nsec - start->tv_nsec);
 }
 
-static int baseline(uint64_t bytes, int milliseconds)
+static int baseline(int fd, struct drm_i915_gem_execbuffer2 execbuf, int milliseconds)
 {
 	struct timespec start, end;
-	const int size = 64*1024*1024;
 	int count = 0;
-	void *mem;
-
-	mem = malloc(size);
-	if (mem == NULL)
-		return 1;
 
 	clock_gettime(CLOCK_MONOTONIC, &start);
 	do {
-		memset(mem, count, size);
+		gem_execbuf(fd, &execbuf);
 		count++;
 		clock_gettime(CLOCK_MONOTONIC, &end);
-		if (elapsed(&start, &end) > 0.1)
+		if (elapsed(&start, &end) > (milliseconds / 1000.))
 			break;
 	} while (1);
 
-	free(mem);
-
-	return ceil(1e-3*milliseconds/elapsed(&start, &end) * count * size / bytes);
+	return count;
 }
 
 static int gem_linear_blt(int fd,
@@ -260,7 +252,7 @@ static int run(int object, int batch, int time, int reps, int ncpus, unsigned fl
 		execbuf.flags |= I915_EXEC_NO_RELOC;
 
 	/* Guess how many loops we need for 0.1s */
-	count = baseline((uint64_t)object * batch, 100) / ncpus;
+	count = baseline(fd, execbuf, 100) / ncpus;
 	if (flags & SYNC) {
 		time *= count / 2;
 		count = 1;
-- 
2.36.1
