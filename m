Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10AEA10E746
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Dec 2023 14:40:56 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.246.34.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id CA932580DCB
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Dec 2023 06:40:54 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1rAt53-000dAC-01
 for igt-dev@lists.freedesktop.org; Wed, 06 Dec 2023 15:40:53 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Dec 2023 15:39:37 +0100
Message-ID: <20231206144051.150420-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20231206144051.150420-1-mauro.chehab@linux.intel.com>
References: <20231206144051.150420-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/3] tests/intel/xe_live_ktest: document
 live kunit tests
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

Such tests were missing a description, as reported at build time:

	Warning: igt@xe_live_ktest@bo Description documentation is missing
	Warning: igt@xe_live_ktest@dmabuf Description documentation is missing
	Warning: igt@xe_live_ktest@migrate Description documentation is missing

Document what they are meant to do.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel/xe_live_ktest.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/intel/xe_live_ktest.c b/tests/intel/xe_live_ktest.c
index fe7b2e69f49b..7170a017c6b0 100644
--- a/tests/intel/xe_live_ktest.c
+++ b/tests/intel/xe_live_ktest.c
@@ -10,12 +10,19 @@
  * Test category: functionality test
  *
  * SUBTEST: bo
+ * Description:
+ *	Kernel dynamic selftests to check if GPU buffer objects are
+ *	being handled properly.
  * Functionality: bo
  *
  * SUBTEST: dmabuf
+ * Description: Kernel dynamic selftests for dmabuf functionality.
  * Functionality: dmabuf
  *
  * SUBTEST: migrate
+ * Description:
+ *	Kernel dynamic selftests to check if page table migrations
+ *	are working properly.
  * Functionality: migrate
  */
 
-- 
2.43.0
