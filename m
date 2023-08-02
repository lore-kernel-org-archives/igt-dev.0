Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (unknown [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1F1A10E580
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Aug 2023 19:43:20 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Thu,  3 Aug 2023 01:03:26 +0530
Message-Id: <20230802193330.3843896-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20230802193330.3843896-1-bhanuprakash.modem@intel.com>
References: <20230802193330.3843896-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V4 3/7] tests/i915/prime_mmap_kms: Add missing
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Add missing documentation for i915 testplan.

Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/prime_mmap_kms.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/prime_mmap_kms.c b/tests/prime_mmap_kms.c
index 1a63be38f..683665752 100644
--- a/tests/prime_mmap_kms.c
+++ b/tests/prime_mmap_kms.c
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


