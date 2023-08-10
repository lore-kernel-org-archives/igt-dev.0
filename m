Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C09610E4C3
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 06:48:23 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.17.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 310E5580DA5
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Aug 2023 23:48:22 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qTzT2-0034dZ-0i
 for igt-dev@lists.freedesktop.org; Thu, 10 Aug 2023 08:48:20 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 10 Aug 2023 08:48:16 +0200
Message-ID: <20230810064816.732794-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20230810064816.732794-1-mauro.chehab@linux.intel.com>
References: <20230810064816.732794-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/2] xe-fast-feedback.testlist: drop
 device-independent kunit tests
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

Those are executed at build time, and were removed from
xe_live_ktest. So, drop them from the testlist.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel-ci/xe-fast-feedback.testlist | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index f7c6b62f5f08..7f171868ba7b 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -250,7 +250,4 @@ igt@core_hotunplug@unbind-rebind
 # Run KUnit tests at the end
 igt@xe_live_ktest@bo
 igt@xe_live_ktest@dmabuf
-igt@xe_live_ktest@pci
-igt@xe_live_ktest@rtp
 igt@xe_live_ktest@migrate
-igt@xe_live_ktest@wa
-- 
2.41.0
