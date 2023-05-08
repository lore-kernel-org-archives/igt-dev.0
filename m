Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E46310E281
 for <igt-dev@lists.freedesktop.org>; Mon,  8 May 2023 12:41:23 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.13.145])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 17A9458091C
 for <igt-dev@lists.freedesktop.org>; Mon,  8 May 2023 05:41:21 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pw0B5-004c6D-04
 for igt-dev@lists.freedesktop.org; Mon, 08 May 2023 14:41:19 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  8 May 2023 14:41:12 +0200
Message-Id: <20230508124116.1099603-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20230508124116.1099603-1-mauro.chehab@linux.intel.com>
References: <20230508124116.1099603-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 2/6] scripts/test_list.py: add support to
 exclude files
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

Specially when using wildcards, it is interesting to have a
way to exclude some files. This is needed to support some kms
helper functions that, instead of being part of the IGT library,
are stored inside the tests sub-directories.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index e68a4cb3df71..7153b06df015 100755
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -208,6 +208,7 @@ class TestList:
 
     {
         "files": [ "tests/driver/*.c" ],
+        "exclude_files": [ "tests/driver/*-helper.c" ],
         "fields": {
             "Category": {
                 "Sub-category": {
@@ -302,10 +303,19 @@ class TestList:
             has_implemented = False
             if not self.filenames:
                 self.filenames = []
+                exclude_files = []
                 files = self.config["files"]
+                exclude_file_glob = self.config.get("exclude_files", [])
+                for cfg_file in exclude_file_glob:
+                    cfg_file = os.path.realpath(os.path.dirname(config_fname)) + "/" + cfg_file
+                    for fname in glob.glob(cfg_file):
+                        exclude_files.append(fname)
+
                 for cfg_file in files:
                     cfg_file = os.path.realpath(os.path.dirname(config_fname)) + "/" + cfg_file
                     for fname in glob.glob(cfg_file):
+                        if fname in exclude_files:
+                            continue
                         self.filenames.append(fname)
                         has_implemented = True
             else:
-- 
2.40.1
