Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F6AF10E515
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jun 2023 16:37:02 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.22.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 779B4580C9B
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jun 2023 09:36:23 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1q9pxN-00Frno-0z
 for igt-dev@lists.freedesktop.org; Thu, 15 Jun 2023 18:36:21 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 15 Jun 2023 18:36:18 +0200
Message-Id: <20230615163618.3781725-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] RFC: FAKE xe_live_ktest change to test
 Intel CI
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

Don't merge it. This is just a test.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/xe/xe_live_ktest.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/xe/xe_live_ktest.c b/tests/xe/xe_live_ktest.c
index 7dcf679069b8..8491fa9d57ce 100644
--- a/tests/xe/xe_live_ktest.c
+++ b/tests/xe/xe_live_ktest.c
@@ -1,6 +1,8 @@
 #include "igt.h"
 #include "igt_kmod.h"
 
+// FAKE change to force IGT runs on Xe.
+
 /**
  * TEST: Xe driver live kunit tests
  * Description: Xe driver live dmabuf unit tests
-- 
2.40.1
