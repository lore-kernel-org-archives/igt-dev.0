Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 216AB10E36B
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Aug 2023 12:49:00 +0000 (UTC)
From: Karolina Stolarek <karolina.stolarek@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 16 Aug 2023 14:48:43 +0200
Message-Id: <106cf862b90925948fad35143d3ec527e9feb3f5.1692189091.git.karolina.stolarek@intel.com>
In-Reply-To: <cover.1692189091.git.karolina.stolarek@intel.com>
References: <cover.1692189091.git.karolina.stolarek@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/xe_ccs: Improve test documentation
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

Add missing information on the test category and tested functionality.

Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/xe/xe_ccs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/xe/xe_ccs.c b/tests/xe/xe_ccs.c
index 1dbfccf6b..a3c6c46d1 100644
--- a/tests/xe/xe_ccs.c
+++ b/tests/xe/xe_ccs.c
@@ -18,6 +18,9 @@
 #include "xe/xe_util.h"
 /**
  * TEST: xe ccs
+ * Category: Software building block
+ * Sub-category: IGT Lib
+ * Functionality: blitter
  * Description: Exercise gen12 blitter with and without flatccs compression on Xe
  * Run type: FULL
  *
-- 
2.25.1
