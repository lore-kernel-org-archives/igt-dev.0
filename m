Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4CD10E182
 for <igt-dev@lists.freedesktop.org>; Mon, 15 May 2023 08:24:15 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 15 May 2023 13:47:01 +0530
Message-Id: <20230515081720.3713293-61-bhanuprakash.modem@intel.com>
In-Reply-To: <20230515081720.3713293-1-bhanuprakash.modem@intel.com>
References: <20230515081720.3713293-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 60/79] tests/kms_plane_cursor: Document each
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
index 59b105c60..760ee7cf5 100644
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
