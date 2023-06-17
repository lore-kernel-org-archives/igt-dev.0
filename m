Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F320010E09E
 for <igt-dev@lists.freedesktop.org>; Sat, 17 Jun 2023 09:47:46 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.22.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 81885580C63
 for <igt-dev@lists.freedesktop.org>; Sat, 17 Jun 2023 02:47:44 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qASWz-00GFop-2o
 for igt-dev@lists.freedesktop.org; Sat, 17 Jun 2023 11:47:41 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Sat, 17 Jun 2023 11:47:38 +0200
Message-Id: <20230617094739.3874020-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20230617094739.3874020-1-mauro.chehab@linux.intel.com>
References: <20230617094739.3874020-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/xe/xe_module_load: fix a typo at
 the category
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

	Sofware -> Software

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/xe/xe_module_load.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/xe/xe_module_load.c b/tests/xe/xe_module_load.c
index 58e422415fbc..1c2d4a2e2ea3 100644
--- a/tests/xe/xe_module_load.c
+++ b/tests/xe/xe_module_load.c
@@ -5,7 +5,7 @@
 
 /**
  * TEST: Tests the xe module loading
- * Category: Sofware building block
+ * Category: Software building block
  * Sub-category: driver
  * Functionality: module load
  * Test category: functionality test
-- 
2.40.1
