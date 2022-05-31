Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41B5310E050
 for <igt-dev@lists.freedesktop.org>; Tue, 31 May 2022 06:52:25 +0000 (UTC)
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org,
	Petri Latvala <petri.latvala@intel.com>
Date: Tue, 31 May 2022 08:52:10 +0200
Message-Id: <20220531065211.233242-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20220531065211.233242-1-mauro.chehab@linux.intel.com>
References: <20220531065211.233242-1-mauro.chehab@linux.intel.com>
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
Cc: sai.gowtham.ch@intel.com
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
