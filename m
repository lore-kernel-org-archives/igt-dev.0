Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA290C83F2F
	for <igt-dev@archiver.kernel.org>; Thu, 29 Aug 2024 14:46:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E94C10E6D3;
	Thu, 29 Aug 2024 14:46:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UdvUoK6A";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9383110E6D4
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Aug 2024 14:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724942814; x=1756478814;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IBuF8elDoIet8usgyhtsONtPAG5hB8VrpQ3dT1onjMY=;
 b=UdvUoK6AAqzrtCSDhzxxz+Ujww68Y43lgI3/xUSykAp4wG9qK8XwGDLD
 mM5RR8KyWV1AWjn+SdU+nVGn+tV4YRpckOddF0YIwHonCUuv8BOEDsxcZ
 bjjDDCbdLn+EsWTNVf0A96COoifg7D6wzkH+U+RVm9DH2NB0pYlO3crkE
 QDoJlual+dXElO57ns0EhY2MNFFujraBHxRUl59CqaeMjcTS/4x1JMZHu
 FhfYpkHU+XFR4yyiXIOcgcgMc6+Zu28A3p3DRfsqa5PfQy6p6toEqBFjk
 Pceg/mZwaNTA15CQ8wRbTfkPrKLd8wrTBXxiEfVmcEO7XqCXDwqPq+BWa Q==;
X-CSE-ConnectionGUID: 5YCKb9LbSZqfo9IY9htCQQ==
X-CSE-MsgGUID: 1U/MJ8DXSSy1y4tfMYx8Gg==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="34947712"
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="34947712"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 07:46:54 -0700
X-CSE-ConnectionGUID: nBUQG817T72IzMUdSwDfSA==
X-CSE-MsgGUID: /QVj54LORleTGKlwTnp5yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,185,1719903600"; d="scan'208";a="64304187"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.237])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 07:46:51 -0700
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
Subject: [PATCH i-g-t v5 12/17] scripts/igt_doc: Add '--exclude-files'
 parameter
Date: Thu, 29 Aug 2024 16:45:42 +0200
Message-Id: <20240829144547.105371-13-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829144547.105371-1-christoph.manszewski@intel.com>
References: <20240829144547.105371-1-christoph.manszewski@intel.com>
MIME-Version: 1.0
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

Make it possible to exclude files using '--exclude-files' parameter.
Merge excluded files passed with that parameter with files excluded from the
test config '.json' files. Align the behavior of the '--files' parameter
to also merge with files included from the config.

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
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

