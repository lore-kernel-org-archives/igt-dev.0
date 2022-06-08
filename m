Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70ECD10E4F0
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jun 2022 05:55:41 +0000 (UTC)
From: sinjan.kumar@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 kamil.konieczny@linux.intel.com, janga.rahul.kumar@intel.com,
 ramadevi.gandi@intel.com, priyanka.dandamudi@intel.com,
 sinjan.kumar@intel.com
Date: Wed,  8 Jun 2022 11:25:07 +0530
Message-Id: <20220608055508.339194-2-sinjan.kumar@intel.com>
In-Reply-To: <20220608055508.339194-1-sinjan.kumar@intel.com>
References: <20220608055508.339194-1-sinjan.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/2] i915/gem_exec_fair: Add subtests description
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

add subtest description

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Signed-off-by: Sinjan Kumar <sinjan.kumar@intel.com>
---
 tests/i915/gem_exec_fair.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/i915/gem_exec_fair.c b/tests/i915/gem_exec_fair.c
index 935f9c4a..f856be1d 100644
--- a/tests/i915/gem_exec_fair.c
+++ b/tests/i915/gem_exec_fair.c
@@ -1351,8 +1351,15 @@ igt_main
 		}
 	}
 
+        igt_describe("Test forks N independent clients and put an equal "
+                     "amount of work in client and asserts that all of "
+                     "them finishes within the given timeline.");
 	igt_subtest("basic-deadline")
 		deadline(i915, &cfg, 2, 0);
+        igt_describe("Test forks N independent clients and put an equal "
+                     "amount of work in client and asserts that all of "
+                     "them finishes within the given timeline "
+                     "when task priority is also set.");
 	igt_subtest("deadline-prio")
 		deadline(i915, &cfg, 2, DL_PRIO);
 
-- 
2.25.1
