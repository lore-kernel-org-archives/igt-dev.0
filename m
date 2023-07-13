Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB0310E61D
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jul 2023 07:51:01 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.27.144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 2CA64580DD4
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jul 2023 00:51:00 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qJr6I-0044Tu-0X
 for igt-dev@lists.freedesktop.org; Thu, 13 Jul 2023 09:50:58 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 13 Jul 2023 09:50:50 +0200
Message-Id: <20230713075054.970457-11-mauro.chehab@linux.intel.com>
In-Reply-To: <20230713075054.970457-1-mauro.chehab@linux.intel.com>
References: <20230713075054.970457-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 10/14] scripts/test_list.py: add a check
 before deleting properties
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

If the config file doesn't have empty _properties_, the current
logic causes an error. Well, if one is passing a dictionary via
config_dict, it may end using a simplified dict without any
_properties_ on it.

Add an extra check to avoid an error.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 27434a6d7471..a9b0dffaf8d5 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -325,7 +325,8 @@ class TestList:
                 if sublevel_count[level - 1] == 1:
                     del item["_properties_"]["level"]
                     del item["_properties_"]["sublevel"]
-        del self.props["_properties_"]
+        if "_properties_" in self.props:
+            del self.props["_properties_"]
 
         has_implemented = False
         if not self.filenames:
-- 
2.40.1
