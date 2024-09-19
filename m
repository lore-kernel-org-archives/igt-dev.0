Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFDEFCE8D5D
	for <igt-dev@archiver.kernel.org>; Thu, 19 Sep 2024 08:16:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A96010E24A;
	Thu, 19 Sep 2024 08:16:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fpryIpfH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E383110E24A
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2024 08:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726733773; x=1758269773;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Rj9lhvkb5uhaWnFpNtTHyqF3bUr2Y/zyja7lrRxbUcw=;
 b=fpryIpfH7EUpndxA2G095ePZuJCULDom66Uk7yN6RunvgtOhyXOtza0a
 PKgqYZjvdzZsB1+fDk0LSBt0GciYLYtFwtHpxs5ACdOa/iX+phb8LUqEs
 qiVUoEEw3ewYyv26D0I4Udr8BW8r0qCGO0lYTRK0zRZzRuIOdd5rSWWEn
 Emp1c0bfoeHpoV96702aJMxJMZMherrOyJECOoJdfdEk2kSfXjaFKI6uq
 CPQmm014T0i6TzGEGvtMKGauL6DcZPExFhFKT/wXxW2A+VcgPbL06GqTS
 g+NwJB7wN3wEj/AxsJqAUEeJXmlBRP/HYAAiBCJMkljYjmmvUCFSSNNaP g==;
X-CSE-ConnectionGUID: 6vwTDjnzSPiSr7FOfqdGEw==
X-CSE-MsgGUID: 1UpqvtLFQ4mioX2quOVWoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="29422352"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="29422352"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 01:16:12 -0700
X-CSE-ConnectionGUID: dJi4jFCgT+q9Tr1ed0dTfA==
X-CSE-MsgGUID: NuD0dw5aTsyu2Z9DuWACgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="69454958"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.32])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 01:16:10 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t] scripts/test_list: Don't log missing testlist
Date: Thu, 19 Sep 2024 10:16:03 +0200
Message-Id: <20240919081603.523299-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
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

When tests are compiled conditionally and compilation flag is set
to false they have no binaries in the build directory. As testlist
is built from .c source file list, unnecessary warnings about missing
.testlist files are produced.

Avoid this warnings by skipping processing testlists for which binaries
weren't produced.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>
---
 scripts/test_list.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index d050687fe1..40b6b7829b 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -1127,8 +1127,13 @@ class TestList:
 
         """ Return a list of tests as reported by --list-subtests """
         tests = []
+        no_binaries = self.get_not_compiled()
         for name in self.filenames:
-            testlist = re.sub(r"\.c$", ".testlist", name.split('/')[-1])
+            binary = re.sub(r"\.c$", "", name.split('/')[-1])
+            if binary in no_binaries:
+                continue
+
+            testlist = binary + ".testlist"
             fname = os.path.join(self.igt_build_path, "tests", testlist)
 
             if not os.path.isfile(fname):
-- 
2.34.1

