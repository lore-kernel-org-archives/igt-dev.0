Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A48510E27E
 for <igt-dev@lists.freedesktop.org>; Mon,  8 May 2023 12:41:23 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.13.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id EAB1A580DA3
 for <igt-dev@lists.freedesktop.org>; Mon,  8 May 2023 05:41:20 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pw0B5-004c6G-06
 for igt-dev@lists.freedesktop.org; Mon, 08 May 2023 14:41:19 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  8 May 2023 14:41:13 +0200
Message-Id: <20230508124116.1099603-4-mauro.chehab@linux.intel.com>
In-Reply-To: <20230508124116.1099603-1-mauro.chehab@linux.intel.com>
References: <20230508124116.1099603-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 3/6] scripts/test_list.py: fix some hints
 pointed by Ruff
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

There are some places where the wrong logic was used to check
for dict members, causing those warnings on Ruff:

	E713 [*] Test for membership should be `not in`

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 7153b06df015..21767870b1c1 100755
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -689,7 +689,7 @@ class TestList:
             marker = 0
             for cur_level in range(0, len(fields_order)):  # pylint: disable=C0200
                 field = fields_order[cur_level]
-                if not "level" in self.props[field]["_properties_"]:
+                if "level" not in self.props[field]["_properties_"]:
                     continue
                 if field in fields:
                     if old_fields[cur_level] != fields[field]:
@@ -698,9 +698,9 @@ class TestList:
 
             # print hierarchy
             for i in range(cur_level, len(fields_order)):
-                if not "level" in self.props[fields_order[i]]["_properties_"]:
+                if "level" not in self.props[fields_order[i]]["_properties_"]:
                     continue
-                if not fields_order[i] in fields:
+                if fields_order[i] not in fields:
                     continue
 
                 if marker >= len(level_markers):
@@ -728,7 +728,7 @@ class TestList:
             # Store current values
             for i in range(cur_level, len(fields_order)):
                 field = fields_order[i]
-                if not "level" in self.props[field]["_properties_"]:
+                if "level" not in self.props[field]["_properties_"]:
                     continue
                 if field in fields:
                     old_fields[i] = fields[field]
-- 
2.40.1
