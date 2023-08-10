Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A6710E501
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 11:12:39 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.17.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 00066580DB2
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 04:12:37 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qU3am-0041lw-01
 for igt-dev@lists.freedesktop.org; Thu, 10 Aug 2023 13:12:36 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 10 Aug 2023 13:12:04 +0200
Message-ID: <20230810111234.960098-4-mauro.chehab@linux.intel.com>
In-Reply-To: <20230810111234.960098-1-mauro.chehab@linux.intel.com>
References: <20230810111234.960098-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 3/3] xe_live_ktest.c: drop the now
 removed tests
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

The device-independent tests were moved out of xe_live_ktest.

Drop the comments as well.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/xe/xe_live_ktest.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/tests/xe/xe_live_ktest.c b/tests/xe/xe_live_ktest.c
index 5088f676b2bf..779ff7efd402 100644
--- a/tests/xe/xe_live_ktest.c
+++ b/tests/xe/xe_live_ktest.c
@@ -18,15 +18,6 @@
  *
  * SUBTEST: migrate
  * Functionality: migrate
- *
- * SUBTEST: pci
- * Functionality: pci
- *
- * SUBTEST: rtp
- * Functionality: rtp
- *
- * SUBTEST: wa
- * Functionality: workarounds
  */
 
 struct kunit_tests {
-- 
2.41.0
