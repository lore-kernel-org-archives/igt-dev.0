Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9316D11378C
 for <igt-dev@lists.freedesktop.org>; Thu, 19 May 2022 12:23:51 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Petri Latvala <petri.latvala@intel.com>
Date: Thu, 19 May 2022 14:23:44 +0200
Message-Id: <20220519122345.386119-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20220519122345.386119-1-mauro.chehab@linux.intel.com>
References: <20220519122345.386119-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/3] benchmarks/gem_syslatency: don't die
 with SIGSEGV
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

Fix the pthread_create() logic for it to properly handle temporary
issues returned with EAGAIN and ensure that thread creation
won't fail, as, if it fails, it will cause a Segmentation fault:

	Received signal SIGSEGV.
	Stack trace:
	 #0 [fatal_sig_handler+0x163]
	 #1 [__sigaction+0x50]
	 #2 [__pthread_clockjoin_ex+0x22]
	 #3 [main+0x346]
	 #4 [__libc_start_call_main+0x80]
	 #5 [__libc_start_main+0x89]
	 #6 [_start+0x25]
	Segmentation fault

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 benchmarks/gem_syslatency.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/benchmarks/gem_syslatency.c b/benchmarks/gem_syslatency.c
index 035ee9346251..4b097e1c9316 100644
--- a/benchmarks/gem_syslatency.c
+++ b/benchmarks/gem_syslatency.c
@@ -351,7 +351,7 @@ int main(int argc, char **argv)
 	bool leak = false;
 	bool interrupts = false;
 	long batch = 0;
-	int n, c;
+	int ret, n, c;
 
 	while ((c = getopt(argc, argv, "r:t:f:bmni1")) != -1) {
 		switch (c) {
@@ -409,8 +409,11 @@ int main(int argc, char **argv)
 			busy[n].sz = batch;
 			busy[n].leak = leak;
 			busy[n].interrupts = interrupts;
-			pthread_create(&busy[n].thread, &attr,
-				       gem_busyspin, &busy[n]);
+			do {
+				ret = pthread_create(&busy[n].thread, &attr,
+						     gem_busyspin, &busy[n]);
+			} while (ret == EAGAIN);
+			igt_assert_f(!ret, "Can't create task on CPU#%d\n", n);
 		}
 	}
 
@@ -420,7 +423,10 @@ int main(int argc, char **argv)
 	for (n = 0; n < ncpus; n++) {
 		igt_mean_init(&wait[n].mean);
 		bind_cpu(&attr, n);
-		pthread_create(&wait[n].thread, &attr, sys_fn, &wait[n]);
+		do {
+			ret = pthread_create(&wait[n].thread, &attr, sys_fn, &wait[n]);
+		} while (ret == EAGAIN);
+		igt_assert_f(!ret, "Can't create task on CPU#%d\n", n);
 	}
 
 	sleep(time);
-- 
2.36.1
