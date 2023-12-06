Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E1910E744
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Dec 2023 14:40:55 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.246.34.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id C18D7580D2D
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Dec 2023 06:40:54 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1rAt53-000dAF-05
 for igt-dev@lists.freedesktop.org; Wed, 06 Dec 2023 15:40:53 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Dec 2023 15:39:38 +0100
Message-ID: <20231206144051.150420-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20231206144051.150420-1-mauro.chehab@linux.intel.com>
References: <20231206144051.150420-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/3] tests/xe_sysfs_defaults: add a
 description for engine-defaults
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

Description for such subtest is missing, cleaning up this warning:

	Warning: igt@xe_sysfs_defaults@engine-defaults Description documentation is missing

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel/xe_sysfs_defaults.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_sysfs_defaults.c b/tests/intel/xe_sysfs_defaults.c
index a1cbfb11d7dd..4a6b3ba6dcd7 100644
--- a/tests/intel/xe_sysfs_defaults.c
+++ b/tests/intel/xe_sysfs_defaults.c
@@ -10,6 +10,7 @@
  * Sub-category: sysman
  * Test category: functionality test
  * SUBTEST: engine-defaults
+ * Description: check if the sysfs engine .defaults node has all values.
  */
 
 #include <dirent.h>
-- 
2.43.0
