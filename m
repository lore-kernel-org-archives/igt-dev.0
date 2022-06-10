Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F62E11A116
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jun 2022 05:49:10 +0000 (UTC)
From: sinjan.kumar@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 kamil.konieczny@linux.intel.com, janga.rahul.kumar@intel.com,
 ramadevi.gandi@intel.com, priyanka.dandamudi@intel.com,
 sinjan.kumar@intel.com
Date: Fri, 10 Jun 2022 11:18:33 +0530
Message-Id: <20220610054834.469387-2-sinjan.kumar@intel.com>
In-Reply-To: <20220610054834.469387-1-sinjan.kumar@intel.com>
References: <20220610054834.469387-1-sinjan.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/2] i915/gem_exec_await: Add subtests description
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

From: Sinjan Kumar <sinjan.kumar@intel.com>

Add subtest description for the following subtest
1. wide-all
2. wide-context

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Signed-off-by: Sinjan Kumar <sinjan.kumar@intel.com>
---
 tests/i915/gem_exec_await.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/i915/gem_exec_await.c b/tests/i915/gem_exec_await.c
index 4935cf39..dc8d0255 100644
--- a/tests/i915/gem_exec_await.c
+++ b/tests/i915/gem_exec_await.c
@@ -276,9 +276,13 @@ igt_main
 		igt_fork_hang_detector(device);
 	}
 
+        igt_describe("Test to catch GPU hang by executing batch buffer "
+                     "in a loop for the given timeout period.");
 	igt_subtest("wide-all")
 		wide(device, ctx, ring_size, TIMEOUT, 0);
 
+        igt_describe("Test to catch GPU hang by creating context and executing "
+                     "batch buffer in a loop for the given timeout period.");
 	igt_subtest("wide-contexts") {
 		gem_require_contexts(device);
 		wide(device, ctx, ring_size, TIMEOUT, CONTEXTS);
-- 
2.25.1
