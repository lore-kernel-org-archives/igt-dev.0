Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F3C810E056
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Apr 2023 06:39:39 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 20 Apr 2023 08:39:06 +0200
Message-Id: <20230420063908.66568-9-zbigniew.kempczynski@intel.com>
In-Reply-To: <20230420063908.66568-1-zbigniew.kempczynski@intel.com>
References: <20230420063908.66568-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 08/10] tests/xe-fast-feedback: Add
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
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
v2: sort alphabetically (Kamil)
---
 tests/intel-ci/xe-fast-feedback.testlist | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 5db27c6345..0be02bf5b4 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -106,6 +106,24 @@ igt@xe_guc_pc@freq_range_idle
 igt@xe_guc_pc@rc6_on_idle
 igt@xe_guc_pc@rc0_on_exec
 igt@xe_huc_copy@huc_copy
+igt@xe_intel_bb@add-remove-objects
+igt@xe_intel_bb@bb-with-allocator
+igt@xe_intel_bb@blit-reloc
+igt@xe_intel_bb@blit-simple
+igt@xe_intel_bb@create-in-region
+igt@xe_intel_bb@delta-check
+igt@xe_intel_bb@destroy-bb
+igt@xe_intel_bb@full-batch
+igt@xe_intel_bb@intel-bb-blit-none
+igt@xe_intel_bb@intel-bb-blit-x
+igt@xe_intel_bb@intel-bb-blit-y
+igt@xe_intel_bb@lot-of-buffers
+igt@xe_intel_bb@offset-control
+igt@xe_intel_bb@purge-bb
+igt@xe_intel_bb@render
+igt@xe_intel_bb@reset-bb
+igt@xe_intel_bb@simple-bb
+igt@xe_intel_bb@simple-bb-ctx
 igt@xe_mmap@system
 igt@xe_mmap@vram
 igt@xe_mmap@vram-system
-- 
2.34.1
