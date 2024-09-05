Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA499CD5BA1
	for <igt-dev@archiver.kernel.org>; Thu,  5 Sep 2024 09:29:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E75610E819;
	Thu,  5 Sep 2024 09:29:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="glFGa6KW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA92D10E81A
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Sep 2024 09:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725528555; x=1757064555;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SiOW8ve06Ch/9MQib6P9MAp05zd9M6X+OcvOlSuC/+I=;
 b=glFGa6KWoxrf9lB5vtJh5VROW3MVL/Wkx8PMi3vDAEc6lkKFQ93BzD5A
 AKR7MYyrRi0rqHOstBqu6HUGsDszB56dOUW4CZc57aWUpLQdu4Ob9eCpg
 PEK4dWXvbV+YqZWg5SsFZzBDw8VD3rSr/OlvyFPc/4TtfUE+OrxcVwOS9
 OkmNHW8wdlrgDuZ9pZEmE9WI18z7nz/MVF4yEhwSxdw17Yx3nk+YC+hMk
 BnhHlt1LCykXp64tzCy4skBINi9FUjJ9gH58qvTi20yGcJWI0IjgGJcYb
 MqdDcEAmg7fb6R5bBEJ/njIuXxDStfWMYtO5ZNK6fzy05sQU33TZDrbeD Q==;
X-CSE-ConnectionGUID: dXyEGN+DS8ykztQRlHncZg==
X-CSE-MsgGUID: lBU2hx/ISreD7wb68iW0iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="35590303"
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="35590303"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 02:29:15 -0700
X-CSE-ConnectionGUID: k1r6OsKRQFCS1EfPQN0cQA==
X-CSE-MsgGUID: CA7JKEXdRCKKKuuDZ7stRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,204,1719903600"; d="scan'208";a="65404963"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.144])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Sep 2024 02:29:11 -0700
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Maciej Patelczyk <maciej.patelczyk@intel.com>,
 =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Pawel Sikora <pawel.sikora@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Kolanupaka Naveena <kolanupaka.naveena@intel.com>,
 Mika Kuoppala <mika.kuoppala@intel.com>,
 Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v6 12/17] scripts/igt_doc: Add '--exclude-files'
 parameter
Date: Thu,  5 Sep 2024 11:28:07 +0200
Message-Id: <20240905092812.94553-13-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240905092812.94553-1-christoph.manszewski@intel.com>
References: <20240905092812.94553-1-christoph.manszewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Currently the doc scripts relies on a static list of files passed
through the respective '<config>.json' file for generating
documentation. This results in a compilation error when we exclude some
tests from building since the doc script notices documentation generated
for missing binaries.

Make it possible to dynamically exclude files from doc generation using
'--exclude-files' parameter. Merge excluded files passed with that parameter
with files excluded from the test config '.json' files. Align the behavior
of the '--files' parameter to also merge with files included from the config.

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 scripts/igt_doc.py   |  3 +++
 scripts/test_list.py | 47 +++++++++++++++++++++++++-------------------
 2 files changed, 30 insertions(+), 20 deletions(-)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index fa2c2c7ca..9b7317feb 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -313,6 +313,8 @@ def main():
                         help="Generate testlists for Intel CI integration at the INTELCI_TESTLIST directory.")
     parser.add_argument('--files', nargs='+',
                         help="File name(s) to be processed")
+    parser.add_argument('--exclude-files', nargs='+',
+                        help="File name(s) to ignore")
 
     parse_args = parser.parse_args()
 
@@ -325,6 +327,7 @@ def main():
         tests = IgtTestList(config_fname = config,
                             include_plan = parse_args.include_plan,
                             file_list = parse_args.files,
+                            exclude_file_list = parse_args.exclude_files,
                             igt_build_path = parse_args.igt_build_path)
 
         if parse_args.filter_field:
diff --git a/scripts/test_list.py b/scripts/test_list.py
index 69c830ca1..4fe209e5a 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -250,7 +250,7 @@ class TestList:
                  config_dict = None, sources_path = None,
                  test_tag = "TEST", subtest_tag = "SUBTESTS?",
                  main_name = "igt", planned_name = "planned",
-                 subtest_separator = "@"):
+                 subtest_separator = "@", exclude_file_list = None):
         self.doc = {}
         self.test_number = 0
         self.config = None
@@ -368,28 +368,35 @@ class TestList:
         if "_properties_" in self.props:
             del self.props["_properties_"]
 
-        has_implemented = False
+        if not exclude_file_list:
+            exclude_file_list = []
+        else:
+            exclude_file_list = [os.path.normpath(f) for f in exclude_file_list]
+
+        exclude_file_glob = self.config.get("exclude_files", [])
+        for cfg_file in exclude_file_glob:
+            cfg_file = cfg_path + cfg_file
+            for fname in glob.glob(cfg_file):
+                exclude_file_list.append(fname)
+
         if not self.filenames:
             self.filenames = []
-            exclude_files = []
-            files = self.config["files"]
-            exclude_file_glob = self.config.get("exclude_files", [])
-            for cfg_file in exclude_file_glob:
-                cfg_file = cfg_path + cfg_file
-                for fname in glob.glob(cfg_file):
-                    exclude_files.append(fname)
-
-            for cfg_file in files:
-                cfg_file = cfg_path + cfg_file
-                for fname in glob.glob(cfg_file):
-                    if fname in exclude_files:
-                        continue
-                    self.filenames.append(fname)
-                    has_implemented = True
         else:
-            for cfg_file in self.filenames:
-                if cfg_file:
-                    has_implemented = True
+            self.filenames = [os.path.normpath(f) for f in self.filenames]
+
+        files = self.config["files"]
+        for cfg_file in files:
+            cfg_file = cfg_path + cfg_file
+            for fname in glob.glob(cfg_file):
+                if fname in exclude_file_list:
+                    continue
+                self.filenames.append(fname)
+
+        has_implemented = False
+        for cfg_file in self.filenames:
+            if cfg_file:
+                has_implemented = True
+                break
 
         has_planned = False
         if include_plan and "planning_files" in self.config:
-- 
2.34.1

