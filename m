Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C320C89FC0
 for <igt-dev@lists.freedesktop.org>; Sun, 13 Dec 2020 11:58:53 +0000 (UTC)
From: apoorva1.singh@intel.com
Date: Sun, 13 Dec 2020 17:31:22 +0530
Message-Id: <20201213120122.296925-1-apoorva1.singh@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_request_retire: Add subtest
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

Add description for the subtest

Signed-off-by: Apoorva Singh <apoorva1.singh@intel.com>
Cc: Melkaveri, Arjun <arjun.melkaveri@intel.com>
---
 tests/i915/gem_request_retire.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/i915/gem_request_retire.c b/tests/i915/gem_request_retire.c
index c23ddfb7..23b7e40b 100644
--- a/tests/i915/gem_request_retire.c
+++ b/tests/i915/gem_request_retire.c
@@ -102,6 +102,9 @@ igt_main
 		gem_require_contexts(fd);
 	}
 
+	igt_describe("Verify the integrity of a bo being operated from multiple bb "
+	       "(submitted from different contexts and on different rings) even after "
+	       "contexts corresponding to few of the bb are destroyed");
 	igt_subtest("retire-vma-not-inactive")
 		test_retire_vma_not_inactive(fd);
 }
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
