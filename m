Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA16F10E16F
 for <igt-dev@lists.freedesktop.org>; Fri,  6 May 2022 14:24:16 +0000 (UTC)
From: sinjan.kumar@intel.com
To: igt-dev@lists.freedesktop.org, sai.gowtham.ch@intel.com,
 kamil.konieczny@linux.intel.com, arjun.melkaveri@intel.com,
 ramadevi.gandi@intel.com, priyanka.dandamudi@intel.com
Date: Fri,  6 May 2022 19:54:45 +0530
Message-Id: <20220506142445.2068263-1-sinjan.kumar@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH] tests/i915/gem_exec_balancer: Add busy subtest
 description
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

Add busy subtest description

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Sinjan Kumar <sinjan.kumar@intel.com>
---
 tests/i915/gem_exec_balancer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
index 857d0085..c68a50e7 100644
--- a/tests/i915/gem_exec_balancer.c
+++ b/tests/i915/gem_exec_balancer.c
@@ -3301,6 +3301,9 @@ igt_main
 	igt_subtest("indices")
 		indices(i915);
 
+	igt_describe("Test for validating engine busyness by checking"
+		     " read-write event through GEM_BUSY IOCTL");
+
 	igt_subtest("busy")
 		busy(i915);
 
-- 
2.25.1
