Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5DCF10E6FD
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Aug 2023 18:55:24 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 12 Aug 2023 00:16:05 +0530
Message-Id: <20230811184655.157060-32-bhanuprakash.modem@intel.com>
In-Reply-To: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
References: <20230811184655.157060-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V6 31/81] tests/kms_3d: Document each subtest for
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

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/kms_3d.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/kms_3d.c b/tests/kms_3d.c
index c7a9d42d2..df0b54b37 100644
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
+ * Driver requirement: any
+ * Functionality: stereoscopic
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 
 IGT_TEST_DESCRIPTION("Tests 3D mode setting.");
 
-- 
2.40.0
