Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC59510E25F
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Aug 2023 16:56:42 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue, 15 Aug 2023 22:17:25 +0530
Message-Id: <20230815164815.320904-32-bhanuprakash.modem@intel.com>
In-Reply-To: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
References: <20230815164815.320904-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V7 31/81] tests/kms_3d: Document each subtest for
 testplan
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

V2: - Driver requirement: s/any/i915, xe/

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_3d.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/kms_3d.c b/tests/kms_3d.c
index c7a9d42d2..617f870c6 100644
--- a/tests/kms_3d.c
+++ b/tests/kms_3d.c
@@ -24,6 +24,19 @@
 
 #include "igt.h"
 #include "xe/xe_query.h"
+/**
+ * TEST: kms 3d
+ * Category: Display
+ * Description: Tests 3D mode setting.
+ *
+ * SUBTEST:
+ * Description: Tests 3D mode setting.
+ * Driver requirement: i915, xe
+ * Functionality: stereoscopic
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 
 IGT_TEST_DESCRIPTION("Tests 3D mode setting.");
 
-- 
2.40.0
