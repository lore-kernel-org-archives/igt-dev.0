Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03262CCD1A3
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 11:31:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5B6010E1D0;
	Wed, 18 Sep 2024 11:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XcYvpfWp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7596810E1D0
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 11:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726659083; x=1758195083;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AjGWgAeBjcZCMXpuHk4gZLB4zgmVtIeH1u7FT+nKRwU=;
 b=XcYvpfWpUd3BB8ykfRmSfL+gE8DoUDSR3kEt/OjM+LKqgONozTTQnI38
 txw/e31VKzYj5zFxbI+fwEDhAmnBP31kDkuLLVURsd/XahTfaTqmOMw47
 US50VQoMUHG12lfu6SwomuDbXiPQjw+iC9PoFdHKT3z11EhbF82NfUnNE
 kI1i9s2i52g2mthccwGdSL6ze9D/szmcYRMPnHCSbt6LUQttbnkNlxuxa
 p7nQLqkx/+64zdLsLsHHTZCHOh3OQCWsJ1ox8bNmpRfP5pI81g5aNbNsu
 TcwdRK0HczGK00Lf0ZH8l5V47VXg09UNk7Z72/mRciKsgcwtzomyhlLQx w==;
X-CSE-ConnectionGUID: 1pEIj73TSZ+nqjmYFUmgpw==
X-CSE-MsgGUID: 7WUD/O1wRfqQvK4C/7TCKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="28470102"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="28470102"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 04:31:23 -0700
X-CSE-ConnectionGUID: 136KMuU1RK2BJCIBXEH+mg==
X-CSE-MsgGUID: hUbgE1XqQfaXQeL3POAlzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="106972686"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.218])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 04:31:18 -0700
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
 Jan Sokolowski <jan.sokolowski@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>,
 Jari Tahvanainen <jari.tahvanainen@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH i-g-t v7 11/16] scripts/test_list: Relax treatment of
 non-compiled tests
Date: Wed, 18 Sep 2024 13:30:12 +0200
Message-Id: <20240918113017.144687-12-christoph.manszewski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918113017.144687-1-christoph.manszewski@intel.com>
References: <20240918113017.144687-1-christoph.manszewski@intel.com>
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

From: Kamil Konieczny <kamil.konieczny@linux.intel.com>

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
Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 scripts/test_list.py | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index 69c830ca1..d050687fe 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -1141,6 +1141,19 @@ class TestList:
 
         return sorted(tests)
 
+    def get_not_compiled(self):
+
+        """ Return a list of tests which were not compiled """
+        no_binaries = []
+        for name in self.filenames:
+            test_basename = re.sub(r"\.c$", "", name.split('/')[-1])
+            fname = os.path.join(self.igt_build_path, "tests", test_basename)
+
+            if not os.path.isfile(fname):
+                no_binaries.append(test_basename)
+
+        return sorted(no_binaries)
+
     #
     # Validation methods
     #
@@ -1177,21 +1190,24 @@ class TestList:
         # Get a list of tests from
         run_subtests = set(self.get_testlist())
 
+        not_compiled = set(self.get_not_compiled())
+        for test_basename in not_compiled:
+            print(f"INFO: Found documentation for '{test_basename}' but no binary")
+
         # Compare sets
 
         run_missing = list(sorted(run_subtests - doc_subtests))
         doc_uneeded = list(sorted(doc_subtests - run_subtests))
+        doc_uneeded_build = [t for t in doc_uneeded if t.split('@')[1] not in not_compiled]
 
-        if doc_uneeded:
-            for test_name in doc_uneeded:
-                print(f"Warning: Documented {test_name} doesn't exist on source files")
-
-        if run_missing:
+        if doc_uneeded_build or run_missing:
             for test_name in run_missing:
-                print(f'Warning: Missing documentation for {test_name}')
-            print('Please refer: docs/test_documentation.md for more details')
+                print(f'ERROR: Missing documentation for {test_name}')
 
-        if doc_uneeded or run_missing:
+            for test_name in doc_uneeded_build:
+                print(f'ERROR: Unneeded documentation for {test_name}')
+
+            print('Please refer: docs/test_documentation.md for more details')
             sys.exit(1)
 
     #
-- 
2.34.1

