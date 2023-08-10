Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC66410E513
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 12:34:07 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.17.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 8F99F580AFF
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Aug 2023 05:34:06 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qU4rc-0044FO-22
 for igt-dev@lists.freedesktop.org; Thu, 10 Aug 2023 14:34:04 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 10 Aug 2023 14:32:31 +0200
Message-ID: <20230810123402.969597-4-mauro.chehab@linux.intel.com>
In-Reply-To: <20230810123402.969597-1-mauro.chehab@linux.intel.com>
References: <20230810123402.969597-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/3] [RFC] scripts/test_list.py: enforce
 mandatory fields to be filled
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

If they won't be filled, compilation will break.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index c23d6d735edf..d52cf23a18ad 100755
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -1000,7 +1000,7 @@ class TestList:
         if run_missing:
             for test_name in run_missing:
                 print(f'Warning: Missing documentation for {test_name}')
-        if doc_uneeded or run_missing:
+        if doc_uneeded or run_missing or missing_mandatory_fields:
             sys.exit(1)
 
     #
-- 
2.41.0
