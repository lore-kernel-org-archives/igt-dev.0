Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5016F10E7EB
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Apr 2023 16:49:39 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 18 Apr 2023 22:14:24 +0530
Message-Id: <20230418164501.1687266-9-bhanuprakash.modem@intel.com>
In-Reply-To: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
References: <20230418164501.1687266-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 08/45] tests/xe-fast-feedback: Add xe_intel_bb
 test to BAT
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

From: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

Verifies intel-bb integration with xe.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 5db27c634..019804b57 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,6 +1,24 @@
 # Should be the first test
 igt@xe_module_load@load
 
+igt@xe_intel_bb@reset-bb
+igt@xe_intel_bb@purge-bb
+igt@xe_intel_bb@simple-bb
+igt@xe_intel_bb@simple-bb-ctx
+igt@xe_intel_bb@bb-with-allocator
+igt@xe_intel_bb@lot-of-buffers
+igt@xe_intel_bb@add-remove-objects
+igt@xe_intel_bb@destroy-bb
+igt@xe_intel_bb@create-in-region
+igt@xe_intel_bb@blit-simple
+igt@xe_intel_bb@blit-reloc
+igt@xe_intel_bb@intel-bb-blit-none
+igt@xe_intel_bb@intel-bb-blit-x
+igt@xe_intel_bb@intel-bb-blit-y
+igt@xe_intel_bb@offset-control
+igt@xe_intel_bb@delta-check
+igt@xe_intel_bb@full-batch
+igt@xe_intel_bb@render
 igt@xe_compute@compute-square
 igt@xe_debugfs@base
 igt@xe_debugfs@gt
-- 
2.40.0
