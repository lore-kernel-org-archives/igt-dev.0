Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D3E10E177
 for <igt-dev@lists.freedesktop.org>; Mon, 15 May 2023 08:23:34 +0000 (UTC)
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 15 May 2023 13:46:42 +0530
Message-Id: <20230515081720.3713293-42-bhanuprakash.modem@intel.com>
In-Reply-To: <20230515081720.3713293-1-bhanuprakash.modem@intel.com>
References: <20230515081720.3713293-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [i-g-t 41/79] tests/kms_cursor_edge_walk: Document each
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
 tests/kms_cursor_edge_walk.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/tests/kms_cursor_edge_walk.c b/tests/kms_cursor_edge_walk.c
index 5f423a18f..24b1c42e1 100644
--- a/tests/kms_cursor_edge_walk.c
+++ b/tests/kms_cursor_edge_walk.c
@@ -28,6 +28,32 @@
 #include <stdbool.h>
 #include <stdio.h>
 #include <string.h>
+/**
+ * TEST: kms cursor edge walk
+ * Category: Display
+ * Description: Exercise CHV pipe C cursor fail
+ *
+ * SUBTEST: %s-%s
+ * Description: Checking cursor size %arg[1] by walking %arg[2] of screen
+ * Driver requirement: any
+ * Functionality: cursor
+ * Mega feature: General Display Features
+ * Run type: FULL
+ * Test category: functionality test
+ *
+ * arg[1]:
+ *
+ * @128x128:          128x128
+ * @256x256:          256x256
+ * @64x64:            64x64
+ *
+ * arg[2]:
+ *
+ * @left-edge:        Left edge
+ * @right-edge:       Right edge
+ * @top-bottom:       Top to bottom
+ * @top-edge:         Top edge
+ */
 
 IGT_TEST_DESCRIPTION("Exercise CHV pipe C cursor fail");
 
-- 
2.40.0
