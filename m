Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 273CFEED609
	for <igt-dev@archiver.kernel.org>; Thu, 12 Sep 2024 14:05:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C629910EB91;
	Thu, 12 Sep 2024 14:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TJ4j702M";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110AC10EB91
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Sep 2024 14:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726149934; x=1757685934;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=s73BsGpzSXCQmV3QrjLp1W3iiJfNczhbVh87AV8dxfI=;
 b=TJ4j702MOk8cOkIQ8fUNNpJGsGo0eq3GHw2tIygTvv1kZANR15p6Z/cj
 HxaJ8hjIVbv7N1speYCYTtUNndv0wiPM1f99Uk/HpBXAWSj14A/F0E2x3
 eWkDwNukAipZqGRJ3hctLN0q+dpouNjCFo1cv1VK0OulhoPG8NbEhAalp
 HmVJ+2s6h+VDn7DdFQL1qahioTRC4BHWjfw4Zdt+GeG8syd2nJ4iQ/ioC
 84x2iV99BCaRjaPKJWGjKK0tjDNt+Re5r180pRJX9EDcoFpcgkAlFEyt7
 g76PNOwTUv6sz7fI1AMOJzB9y4hORTU9yOrkoW/T6QM3L2TazUJofmzGm g==;
X-CSE-ConnectionGUID: HJhLUFlYTSmdJkSQLPFx7A==
X-CSE-MsgGUID: HC20iuCgSbmraXcScU7FOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24539100"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="24539100"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 07:04:20 -0700
X-CSE-ConnectionGUID: wdOOyHwjTCu+SZr6M2HBfg==
X-CSE-MsgGUID: Yq+bNmLwQoCIIcjzSk9Xpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="67425351"
Received: from apaszkie-mobl2.apaszkie-mobl2 (HELO localhost)
 ([10.245.244.245])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 07:04:11 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH i-g-t 1/1] scripts/test_list: relax treatment of non-compiled
 tests
Date: Thu, 12 Sep 2024 16:04:01 +0200
Message-ID: <20240912140401.137060-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240912140401.137060-1-kamil.konieczny@linux.intel.com>
References: <20240912140401.137060-1-kamil.konieczny@linux.intel.com>
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

Some tests could be added and compiled only when non-default
meson option is given. It will result in no testlist generated
for such tests but they could appear in our documentation.
Currently we report an error in such case.

Create a way to detect and report that and treat this as feature
and do not report it as an error.  This should allow to relax
processing of chamelium and other new tests.

Also while at this, print error information before actually
exiting with an error code, as previous prints were only
warnings.

Cc: Christoph Manszewski <christoph.manszewski@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Jari Tahvanainen <jari.tahvanainen@intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 scripts/test_list.py | 31 +++++++++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 69c830ca1..322933c26 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -1141,6 +1141,20 @@ class TestList:
 
         return sorted(tests)
 
+    def get_notcompiled(self):
+
+        """ Return a list of tests which were not compiled """
+        no_binaries = []
+        for name in self.filenames:
+            test_basename = re.sub(r"\.c$", "", name.split('/')[-1])
+            fname = os.path.join(self.igt_build_path, "tests", test_basename)
+
+            if not os.path.isfile(fname):
+                print(f"{test_basename}: No binary found, test was not compiled.")
+                no_binaries.append(test_basename)
+
+        return sorted(no_binaries)
+
     #
     # Validation methods
     #
@@ -1177,21 +1191,34 @@ class TestList:
         # Get a list of tests from
         run_subtests = set(self.get_testlist())
 
+        # Get a list of not compiled tests
+        no_binary = set(self.get_notcompiled())
+
         # Compare sets
 
         run_missing = list(sorted(run_subtests - doc_subtests))
         doc_uneeded = list(sorted(doc_subtests - run_subtests))
 
+        """Check if there are (possibly unneeded) documented subtests"""
         if doc_uneeded:
+            un_reported = []
             for test_name in doc_uneeded:
-                print(f"Warning: Documented {test_name} doesn't exist on source files")
+                test_basename = test_name.split('@')[1]
+                if test_basename in no_binary:
+                    if test_basename not in un_reported:
+                        print(f"Info: Documented {test_name} don't have a binary {test_basename}")
+                        un_reported.append(test_basename)
+                else:
+                    print(f"Info: Documented {test_name} doesn't exist on source files")
 
+        """Check for missing documentation"""
         if run_missing:
             for test_name in run_missing:
                 print(f'Warning: Missing documentation for {test_name}')
             print('Please refer: docs/test_documentation.md for more details')
 
-        if doc_uneeded or run_missing:
+        if run_missing:
+            print('Error: Missing tests documentation')
             sys.exit(1)
 
     #
-- 
2.43.0

