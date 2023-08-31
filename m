Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB3E10E187
 for <igt-dev@lists.freedesktop.org>; Thu, 31 Aug 2023 15:05:14 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Thu, 31 Aug 2023 20:26:18 +0530
Message-Id: <20230831145622.1158622-4-bhanuprakash.modem@intel.com>
In-Reply-To: <20230831145622.1158622-1-bhanuprakash.modem@intel.com>
References: <20230831145622.1158622-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V5 3/7] tests/i915/prime_mmap_kms: Add missing
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
To: igt-dev@lists.freedesktop.org, mauro.chehab@linux.intel.com
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


