Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB926E03A
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Dec 2020 17:05:55 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Tue,  8 Dec 2020 22:37:40 +0530
Message-Id: <20201208170740.274016-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_partial_pwrite_pread: Add subtests
 description
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
To: igt-dev@lists.freedesktop.org, arjun.melkaveri@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

From: Apoorva Singh <apoorva1.singh@intel.com>

Add description for all subtests

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/i915/gem_partial_pwrite_pread.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/i915/gem_partial_pwrite_pread.c b/tests/i915/gem_partial_pwrite_pread.c
index 72c33539..00353ec7 100644
--- a/tests/i915/gem_partial_pwrite_pread.c
+++ b/tests/i915/gem_partial_pwrite_pread.c
@@ -265,12 +265,18 @@ static void do_tests(data_t *data, int cache_level, const char *suffix)
 			gem_set_caching(data->drm_fd, scratch_buf->handle, cache_level);
 	}
 
+	igt_describe_f("Verify that pread is consistent while accessing partial cachelines with "
+	       "%s caching level", cache_level == -1 ? "default" : suffix+1);
 	igt_subtest_f("reads%s", suffix)
 		test_partial_reads(data);
 
+	igt_describe_f("Verify that pwrite is consistent while accessing partial cachelines with "
+	       "%s caching level", cache_level == -1 ? "default" : suffix+1);
 	igt_subtest_f("write%s", suffix)
 		test_partial_writes(data);
 
+	igt_describe_f("Verify that pread followed by pwrite are both consistent while accessing partial "
+	       "cachelines with %s caching level", cache_level == -1 ? "default" : suffix+1);
 	igt_subtest_f("writes-after-reads%s", suffix)
 		test_partial_read_writes(data);
 }
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
