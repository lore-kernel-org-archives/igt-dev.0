Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7543989ADC
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Jun 2021 05:16:59 +0000 (UTC)
From: sai.krishna.kuchi@intel.com
Date: Tue, 15 Jun 2021 10:46:55 +0530
Message-Id: <20210615051655.6348-1-sai.krishna.kuchi@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_caching: Added description for all
 subtests
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

From: Kuchi, Sai Krishna <sai.krishna.kuchi@intel.com>

Added description for all subtests

Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>

Signed-off-by: Kuchi, Sai Krishna <sai.krishna.kuchi@intel.com>
---
 tests/i915/gem_caching.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/i915/gem_caching.c b/tests/i915/gem_caching.c
index d5d15f387..6959e2d07 100644
--- a/tests/i915/gem_caching.c
+++ b/tests/i915/gem_caching.c
@@ -173,6 +173,7 @@ igt_main
 					       32, 0, I915_TILING_NONE, 0);
 	}
 
+	igt_describe("Checking the reads for random size of buffer");
 	igt_subtest("reads") {
 		igt_require(flags & TEST_READ);
 
@@ -201,6 +202,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Checking the writes for random size of buffer");
 	igt_subtest("writes") {
 		igt_require(flags & TEST_WRITE);
 
@@ -246,6 +248,7 @@ igt_main
 		}
 	}
 
+	igt_describe("Checking the writes after reads for random size of buffer");
 	igt_subtest("read-writes") {
 		igt_require((flags & TEST_BOTH) == TEST_BOTH);
 
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
