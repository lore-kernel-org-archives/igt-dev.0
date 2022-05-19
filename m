Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F80D10FCF5
 for <igt-dev@lists.freedesktop.org>; Thu, 19 May 2022 12:23:51 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Petri Latvala <petri.latvala@intel.com>
Date: Thu, 19 May 2022 14:23:43 +0200
Message-Id: <20220519122345.386119-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20220519122345.386119-1-mauro.chehab@linux.intel.com>
References: <20220519122345.386119-1-mauro.chehab@linux.intel.com>
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
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

This test is expected to run under a certain time defined by a command
line parameter (by default, 2s).

In order to achive the specified time, the baseline() function tries to
estimate the value of a counter that will get the minimal amount of
interaction to wait for > 0.1s.

However, currently, the baseline estimation is broken, returning a too high
number, as it is measuring the memcpy() time, instead of actually measuring
each loop's interaction.

Due to that, a default test without passing any command line parameter
would take more than 1.5 years to output the first benchmark data!

Fix it by using the same logic that it is inside run() at the baseline
time estimation.

On ADL-P, before this patch, baseline would return 399242693. After
it, it now return 20 - meaning an interval of about 120 ms, which
should be good enough to ensure that the tests won't take too long.

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
