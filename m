Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A13D4757
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Aug 2022 12:51:09 +0000 (UTC)
From: Ryszard Knop <ryszard.knop@intel.com>
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
Date: Tue,  9 Aug 2022 14:50:21 +0200
Message-Id: <20220809125037.1231032-3-ryszard.knop@intel.com>
In-Reply-To: <20220809125037.1231032-1-ryszard.knop@intel.com>
References: <20220809125037.1231032-1-ryszard.knop@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 02/19] assembler: Remove unused headers
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

Using CLion's automated code inspection, most unused includes were found
and removed. Some warnings remain as CLion is unable to track code usage
across certain attributes, but the vast majority of unneeded headers are
now gone.

Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
---
 assembler/brw_disasm.c  | 3 ---
 assembler/brw_eu_util.c | 1 -
 assembler/disasm-main.c | 1 -
 assembler/gen8_disasm.c | 3 ---
 4 files changed, 8 deletions(-)

diff --git a/assembler/brw_disasm.c b/assembler/brw_disasm.c
index 4dec829f..a804c655 100644
--- a/assembler/brw_disasm.c
+++ b/assembler/brw_disasm.c
@@ -21,10 +21,7 @@
  */
 
 #include <stdio.h>
-#include <stdlib.h>
 #include <string.h>
-#include <getopt.h>
-#include <unistd.h>
 #include <stdarg.h>
 
 #include "brw_compat.h"
diff --git a/assembler/brw_eu_util.c b/assembler/brw_eu_util.c
index f9126abf..2014b093 100644
--- a/assembler/brw_eu_util.c
+++ b/assembler/brw_eu_util.c
@@ -30,7 +30,6 @@
   */
 
 
-#include "brw_context.h"
 #include "brw_defines.h"
 #include "brw_eu.h"
 
diff --git a/assembler/disasm-main.c b/assembler/disasm-main.c
index b3655568..a5969bbb 100644
--- a/assembler/disasm-main.c
+++ b/assembler/disasm-main.c
@@ -24,7 +24,6 @@
 #include <stdlib.h>
 #include <string.h>
 #include <getopt.h>
-#include <unistd.h>
 
 #include "gen4asm.h"
 #include "brw_eu.h"
diff --git a/assembler/gen8_disasm.c b/assembler/gen8_disasm.c
index 99b062ea..8ffe947a 100644
--- a/assembler/gen8_disasm.c
+++ b/assembler/gen8_disasm.c
@@ -21,10 +21,7 @@
  */
 
 #include <stdio.h>
-#include <stdlib.h>
 #include <string.h>
-#include <getopt.h>
-#include <unistd.h>
 #include <stdarg.h>
 
 #include "brw_context.h"
-- 
2.37.1
