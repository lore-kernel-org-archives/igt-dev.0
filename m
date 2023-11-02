Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF6310E85A
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Nov 2023 11:43:00 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.249.131.127])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 1A955580D74
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Nov 2023 04:43:00 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96.1)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qyW6D-001FHb-2O
 for igt-dev@lists.freedesktop.org; Thu, 02 Nov 2023 12:42:57 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  2 Nov 2023 12:42:56 +0100
Message-ID: <20231102114256.297063-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2] intel/intel_hwmon.c: Fix test
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

The test documentation is incomplete, causing warnings:

Warning: igt@intel_hwmon@hwmon-read Category documentation is missing
Warning: igt@intel_hwmon@hwmon-read Functionality documentation is missing
Warning: igt@intel_hwmon@hwmon-read Sub-category documentation is missing
Warning: igt@intel_hwmon@hwmon-write Category documentation is missing
Warning: igt@intel_hwmon@hwmon-write Functionality documentation is missing
Warning: igt@intel_hwmon@hwmon-write Sub-category documentation is missing

Reported-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Badal Nilawar <badal.nilawar@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel/intel_hwmon.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tests/intel/intel_hwmon.c b/tests/intel/intel_hwmon.c
index 1cc9cd399c85..c3e5033d52ff 100644
--- a/tests/intel/intel_hwmon.c
+++ b/tests/intel/intel_hwmon.c
@@ -11,7 +11,9 @@
 /**
  * TEST: intel hwmon
  * Description: Tests for intel hwmon
- * Feature: hwmon
+ * Category: Software Building Block
+ * Sub-category: RAS
+ * Functionality: hwmon
  * Run type: FULL
  * Test category: functionality
  *
-- 
2.41.0
