Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D74D10E36A
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Aug 2023 12:49:02 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 16 Aug 2023 14:48:44 +0200
Message-Id: <7a00aaf44a3493b9afdc14fe3c47af3ba5c11ac0.1692189091.git.karolina.stolarek@intel.com>
In-Reply-To: <cover.1692189091.git.karolina.stolarek@intel.com>
References: <cover.1692189091.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/2] xe/xe_exercise_blt: Improve test
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
List-ID: <igt-dev@lists.freedesktop.org>

Add missing information on the test category. Update and move
the field describing tested functionality.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/xe/xe_exercise_blt.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/xe/xe_exercise_blt.c b/tests/xe/xe_exercise_blt.c
index 6d61889b3..34522c0f8 100644
--- a/tests/xe/xe_exercise_blt.c
+++ b/tests/xe/xe_exercise_blt.c
@@ -14,8 +14,10 @@
 
 /**
  * TEST: xe exercise blt
+ * Category: Software building block
+ * Sub-category: IGT Lib
+ * Functionality: blitter
  * Description: Exercise blitter commands on Xe
- * Feature: blitter
  * Run type: FULL
  * Test category: functionality test
  *
-- 
2.25.1
