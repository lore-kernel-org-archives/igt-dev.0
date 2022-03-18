Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5260410EA21
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Mar 2022 16:05:09 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 18 Mar 2022 17:04:45 +0100
Message-Id: <20220318160445.27986-3-kamil.konieczny@linux.intel.com>
In-Reply-To: <20220318160445.27986-1-kamil.konieczny@linux.intel.com>
References: <20220318160445.27986-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] i915/gem_ctx_create: lower time of
 active subtest
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

Active subtest check for old context reclaim in driver and
repeat this for each engine for 20 seconds. On old gpu gens
there are low number of engines so it runs in reasonable time,
but on new ones it can take as long as over 800s. Lower total
time taken by running it for only one engine from each class.
Choose engine to run at random so every egnine will be tested in
long run on CI.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/gem_ctx_create.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_ctx_create.c b/tests/i915/gem_ctx_create.c
index 44846652..df71227e 100644
--- a/tests/i915/gem_ctx_create.c
+++ b/tests/i915/gem_ctx_create.c
@@ -618,7 +618,7 @@ igt_main
 		active(fd, &cfg, NULL, 20, ncpus);
 
 	igt_subtest_with_dynamic("active") {
-		for_each_ctx_cfg_engine(fd, &cfg, e) {
+		for_one_random_ctx_cfg_engine(fd, &cfg, e) {
 			igt_dynamic_f("%s", e->name)
 				active(fd, &cfg, e, 20, 1);
 		}
-- 
2.32.0
