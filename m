Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9432710E18E
 for <igt-dev@lists.freedesktop.org>; Mon, 15 May 2023 08:24:18 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 15 May 2023 13:47:11 +0530
Message-Id: <20230515081720.3713293-71-bhanuprakash.modem@intel.com>
In-Reply-To: <20230515081720.3713293-1-bhanuprakash.modem@intel.com>
References: <20230515081720.3713293-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 70/79] tests/kms_selftest: Document each subtest
 for testplan
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

Add documentation for all kms tests which is used by IGT testplan
documentation.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_selftest.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/kms_selftest.c b/tests/kms_selftest.c
index abc4bfe98..1052d1f32 100644
--- a/tests/kms_selftest.c
+++ b/tests/kms_selftest.c
@@ -23,6 +23,19 @@
 
 #include "igt.h"
 #include "igt_kmod.h"
+/**
+ * TEST: kms selftest
+ * Category: Display
+ * Description: Basic sanity check of KMS selftests.
+ *
+ * SUBTEST: all-tests
+ * Description: Basic sanity check of KMS selftests.
+ * Driver requirement: any
+ * Functionality: kms_core
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 
 IGT_TEST_DESCRIPTION("Basic sanity check of KMS selftests.");
 
-- 
2.40.0
