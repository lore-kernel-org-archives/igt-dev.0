Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 198F110E35E
 for <igt-dev@lists.freedesktop.org>; Tue,  9 May 2023 09:07:43 +0000 (UTC)
Received: from linux.intel.com (ksebasti-mobl.ger.corp.intel.com
 [10.252.18.159])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 2195F580D7D
 for <igt-dev@lists.freedesktop.org>; Tue,  9 May 2023 02:07:42 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1pwJJs-004rJY-0b
 for igt-dev@lists.freedesktop.org; Tue, 09 May 2023 11:07:40 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Tue,  9 May 2023 11:07:34 +0200
Message-Id: <20230509090738.1157939-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20230509090738.1157939-1-mauro.chehab@linux.intel.com>
References: <20230509090738.1157939-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v3 2/6] scripts/test_list.py: add support to
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
