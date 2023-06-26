Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38B3210E23B
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jun 2023 16:11:58 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Mon, 26 Jun 2023 21:31:04 +0530
Message-Id: <20230626160106.2632928-3-bhanuprakash.modem@intel.com>
In-Reply-To: <20230626160106.2632928-1-bhanuprakash.modem@intel.com>
References: <20230626160106.2632928-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V3 i-g-t 2/4] tests/intel/prime_mmap_kms: Add missing
 documentation
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, kamil.konieczny@linux.intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Add missing documentation for i915 testplan.

Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/prime_mmap_kms.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/intel/prime_mmap_kms.c b/tests/intel/prime_mmap_kms.c
index 8b127a13c..3c3c2e94f 100644
--- a/tests/intel/prime_mmap_kms.c
+++ b/tests/intel/prime_mmap_kms.c
@@ -37,6 +37,19 @@
 IGT_TEST_DESCRIPTION(
    "Efficiently sharing CPU and GPU buffers");
 
+/**
+ * TEST: prime mmap kms
+ * Category: Infrastructure
+ * Feature: prime
+ * Functionality: memory management
+ * Run type: FULL
+ * Sub-category: DRM
+ * Test category: GEM_Legacy
+ *
+ * SUBTEST: buffer-sharing
+ * Description: Test efficiently sharing CPU and GPU buffers
+ */
+
 /*
  * render_process_t:
  *
-- 
2.40.0


