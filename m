Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D896E947
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Oct 2021 10:18:48 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Date: Thu, 28 Oct 2021 12:18:17 +0200
Message-Id: <20211028101819.17967-2-kamil.konieczny@linux.intel.com>
In-Reply-To: <20211028101819.17967-1-kamil.konieczny@linux.intel.com>
References: <20211028101819.17967-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] tests/gem_sync: Change duplicate
 subtest names
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

For legacy rings add "legacy-" prefix to subtest names to avoid
duplicates.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/gem_sync.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c
index 6cb00c40..0093ca25 100644
--- a/tests/i915/gem_sync.c
+++ b/tests/i915/gem_sync.c
@@ -1205,7 +1205,7 @@ igt_main
 
 	/* Legacy for selecting rings. */
 	for_each_test(t, individual) {
-		igt_subtest_with_dynamic_f("%s", t->name) {
+		igt_subtest_with_dynamic_f("legacy-%s", t->name) {
 			for (const struct intel_execution_ring *l = intel_execution_rings; l->name; l++) {
 				igt_dynamic_f("%s", l->name) {
 					t->func(fd, intel_ctx_0(fd), eb_ring(l),
-- 
2.30.2
