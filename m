Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0BE10E6BC
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Apr 2023 07:26:11 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 18 Apr 2023 09:25:33 +0200
Message-Id: <20230418072535.14946-9-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230418072535.14946-1-zbigniew.kempczynski@intel.com>
References: <20230418072535.14946-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 08/10] tests/xe-fast-feedback: Add
 xe_intel_bb test to BAT
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

Verifies intel-bb integration with xe.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel-ci/xe-fast-feedback.testlist | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 5db27c6345..019804b579 100644
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
2.34.1
