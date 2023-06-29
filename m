Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA4A10E3F6
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jun 2023 14:56:54 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 29 Jun 2023 20:18:50 +0530
Message-Id: <20230629144910.3055377-62-bhanuprakash.modem@intel.com>
In-Reply-To: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
References: <20230629144910.3055377-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [V5 i-g-t 61/81] tests/kms_plane_cursor: Document each
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
List-ID: <igt-dev@lists.freedesktop.org>

Add documentation for all kms tests which is used by IGT testplan
documentation.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_plane_cursor.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index a7acb18e1..bf217fbcb 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -21,6 +21,36 @@
  */
 
 #include "igt.h"
+/**
+ * TEST: kms plane cursor
+ * Category: Display
+ * Description: Tests cursor interactions with primary and overlay planes.
+ *
+ * SUBTEST: overlay
+ * Description: Tests atomic cursor positioning on primary plane and overlay plane
+ * Driver requirement: any
+ * Functionality: cursor, plane
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: primary
+ * Description: Tests atomic cursor positioning on primary plane
+ * Driver requirement: any
+ * Functionality: cursor, plane
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * SUBTEST: viewport
+ * Description: Tests atomic cursor positioning on primary plane and overlay plane
+ *              with buffer larger than viewport used for display
+ * Driver requirement: any
+ * Functionality: cursor, plane
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ */
 
 /*
  * This file tests cursor interactions with primary and overlay planes.
-- 
2.40.0
