Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857F510EEFE
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Apr 2022 09:49:18 +0000 (UTC)
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 kamil.konieczny@linux.intel.com
Date: Fri, 29 Apr 2022 15:18:14 +0530
Message-Id: <20220429094815.18013-2-sai.gowtham.ch@intel.com>
In-Reply-To: <20220429094815.18013-1-sai.gowtham.ch@intel.com>
References: <20220429094815.18013-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] i915/gem_partial_pwrite_pread: Add
 subtests description
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Add description to all the available subtests.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/gem_partial_pwrite_pread.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/i915/gem_partial_pwrite_pread.c b/tests/i915/gem_partial_pwrite_pread.c
index 4f81d34b..474149d4 100644
--- a/tests/i915/gem_partial_pwrite_pread.c
+++ b/tests/i915/gem_partial_pwrite_pread.c
@@ -280,12 +280,18 @@ static void do_tests(data_t *data, int cache_level, const char *suffix)
 			gem_set_caching(data->drm_fd, scratch_buf->handle, cache_level);
 	}
 
+	igt_describe_f("Verify if pread is consistent while accessing partial cachelines "
+		       "with %s caching level", cache_level == -1 ? "default" : suffix+1);
 	igt_subtest_f("reads%s", suffix)
 		test_partial_reads(data);
 
+	igt_describe_f("Verify if pwrite is consistent while accessing partial cachelines "
+		       "with %s caching level", cache_level == -1 ? "default" : suffix+1);
 	igt_subtest_f("write%s", suffix)
 		test_partial_writes(data);
 
+	igt_describe_f("Verify if both pread, pwrite are consistent while accessing partial "
+		       "cachelines with %s caching level", cache_level == -1 ? "default" : suffix+1);
 	igt_subtest_f("writes-after-reads%s", suffix)
 		test_partial_read_writes(data);
 }
-- 
2.35.1
