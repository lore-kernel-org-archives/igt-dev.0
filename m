Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3BE10E3B1
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 06:40:12 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Date: Wed, 17 May 2023 12:02:59 +0530
Message-Id: <20230517063323.4146387-58-bhanuprakash.modem@intel.com>
In-Reply-To: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
References: <20230517063323.4146387-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t V2 57/81] tests/kms_panel_fitting: Document each
 subtest for testplan
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org, mchehab@kernel.org
List-ID: <igt-dev@lists.freedesktop.org>

Add documentation for all kms tests which is used by IGT testplan
documentation.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_panel_fitting.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/kms_panel_fitting.c b/tests/kms_panel_fitting.c
index 97ef1ae48..1d0bcb4e0 100644
--- a/tests/kms_panel_fitting.c
+++ b/tests/kms_panel_fitting.c
@@ -26,6 +26,27 @@
 #include <limits.h>
 #include <math.h>
 #include <sys/stat.h>
+/**
+ * TEST: kms panel fitting
+ * Category: Display
+ * Description: Test display panel fitting
+ *
+ * SUBTEST: atomic-fastset
+ * Description: Tests panel fitting usages with atomic fastset.
+ * Driver requirement: any
+ * Functionality: eDP, panel_fitting
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: legacy
+ * Description: Tests panel fitting usages with legacy style commit.
+ * Driver requirement: any
+ * Functionality: eDP, panel_fitting
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 
 IGT_TEST_DESCRIPTION("Test display panel fitting");
 
-- 
2.40.0


