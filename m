Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13E910E1C2
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Nov 2023 12:39:31 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.249.140.150])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id AFD1C580D61
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Nov 2023 04:32:24 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.96.2)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1r8Jjq-000PqA-1u
 for igt-dev@lists.freedesktop.org; Wed, 29 Nov 2023 13:32:22 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed, 29 Nov 2023 13:25:34 +0100
Message-ID: <20231129123221.98948-2-mauro.chehab@linux.intel.com>
In-Reply-To: <20231129123221.98948-1-mauro.chehab@linux.intel.com>
References: <20231129123221.98948-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] igt_doc: Add driver name list at JSON
 configuration
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

Add an optional field at JSON configuration to allow specifying
driver name(s).

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 3954e883ada3..7e0e45ca3732 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -289,6 +289,11 @@ class TestList:
             cfg_path = "./"
             driver_name = main_name
 
+        if "drivers" in self.config:
+            self.drivers = self.config["drivers"]
+        else:
+            self.drivers = [driver_name]
+
         if sources_path:
             cfg_path = os.path.realpath(sources_path) + "/"
 
-- 
2.42.0
