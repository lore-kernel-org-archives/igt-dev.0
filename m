Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFAC810E5AC
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Sep 2023 09:26:34 +0000 (UTC)
From: Katarzyna Dec <katarzyna.dec@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  6 Sep 2023 09:23:37 +0000
Message-Id: <20230906092337.79673-4-katarzyna.dec@intel.com>
In-Reply-To: <20230906092337.79673-1-katarzyna.dec@intel.com>
References: <20230906092337.79673-1-katarzyna.dec@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 3/3] scripts/test_list.py: enforce
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

If they won't be filled, compilation will break.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 4cd976c8d..f467f534f 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -1027,7 +1027,7 @@ class TestList:
         if run_missing:
             for test_name in run_missing:
                 print(f'Warning: Missing documentation for {test_name}')
-        if doc_uneeded or run_missing:
+        if doc_uneeded or run_missing or missing_mandatory_fields:
             sys.exit(1)
 
     #
-- 
2.34.1
