Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 848AF10E6F8
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 18:55:02 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 12 Aug 2023 00:15:52 +0530
Message-Id: <20230811184655.157060-19-bhanuprakash.modem@intel.com>
In-Reply-To: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V6 18/81] tests/i915/kms_fbcon_fbt: Document each
 subtest for testplan
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nidhi Gupta <nidhi1.gupta@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Add documentation for all kms tests which is used by IGT testplan
documentation.

V2: - Update functionality

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Nidhi Gupta <nidhi1.gupta@intel.com>
---
 tests/i915/kms_fbcon_fbt.c | 42 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/tests/i915/kms_fbcon_fbt.c b/tests/i915/kms_fbcon_fbt.c
index 71c5285f1..e25d29fe4 100644
--- a/tests/i915/kms_fbcon_fbt.c
+++ b/tests/i915/kms_fbcon_fbt.c
@@ -32,6 +32,48 @@
 #include <sys/stat.h>
 #include <fcntl.h>
 
+/**
+ * TEST: kms fbcon fbt
+ * Category: Display
+ * Description: Test the relationship between fbcon and the frontbuffer tracking
+ *              infrastructure.
+ *
+ * SUBTEST: fbc
+ * Description: Test the relationship between fbcon and the frontbuffer tracking
+ *              infrastructure with fbc enabled.
+ * Driver requirement: any
+ * Functionality: fbc, fbcon, fbt
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: fbc-suspend
+ * Description: Suspend test to validate  the relationship between fbcon and the
+ *              frontbuffer tracking infrastructure with fbc enabled.
+ * Driver requirement: any
+ * Functionality: fbc, fbcon, fbt, suspend
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: psr
+ * Description: Test the relationship between fbcon and the frontbuffer tracking
+ *              infrastructure with psr enabled.
+ * Driver requirement: any
+ * Functionality: fbcon, fbt, psr
+ * Mega feature: PSR
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: psr-suspend
+ * Description: Suspend test to validate the relationship between fbcon and the
+ *              frontbuffer tracking infrastructure with psr enabled.
+ * Driver requirement: any
+ * Functionality: fbcon, fbt, psr, suspend
+ * Mega feature: PSR
+ * Run type: FULL
+ * Test category: functionality test
+ */
 
 IGT_TEST_DESCRIPTION("Test the relationship between fbcon and the frontbuffer "
 		     "tracking infrastructure.");
-- 
2.40.0
