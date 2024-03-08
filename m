Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E810C5475B
	for <igt-dev@archiver.kernel.org>; Fri,  8 Mar 2024 10:09:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31D3C10F93D;
	Fri,  8 Mar 2024 10:09:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eo9nPlxf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C7410EA1B
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2024 10:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709892578; x=1741428578;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=BBh1OtXh7v9NYhs7DOC7mFSR9/SuxBF5Axqm3tsrAz8=;
 b=Eo9nPlxfQmrVcE4Nyu9jQUAhO8d6R/0CjKv/CYy7EUzuNxdcMCMa+ZYM
 duJZxqGZKOs9KxLNhmzdqXEnzJqjipmv9oMrUcFHYutK/KKjwR7nScK6T
 PSw/CH0mUkNVD0ZCk091U9BeS4saGxdT1u6dfZXOMPu5qiz96rXbFsi41
 cthMv9g81g8/BjdvNF8P4ZMMs7Kqz2wesAe4l9BEmgDfpr9W8gvoccy20
 tQLgHpoL7nX7L4KUEKhMhFE/VlJsbgpSLmi+JGVWHxMMERPFd7r6P7K+D
 c4NICEeH5vpvdGAV5tsR86R7B5+HhW9BgaT7G+VnbyBhU8kFfL8HKIbpW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4465411"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="4465411"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 02:09:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; d="scan'208";a="14900004"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 02:09:37 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.185])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id EECF4580E6A
 for <igt-dev@lists.freedesktop.org>; Fri,  8 Mar 2024 02:09:36 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1riXAV-00000003pHu-02zp for igt-dev@lists.freedesktop.org;
 Fri, 08 Mar 2024 11:09:35 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/3] scripts/xls_to_doc.py: remove some dead code
Date: Fri,  8 Mar 2024 11:07:43 +0100
Message-ID: <20240308100933.912014-3-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240308100933.912014-1-mauro.chehab@linux.intel.com>
References: <20240308100933.912014-1-mauro.chehab@linux.intel.com>
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

There are two functions there that aren't unused.

Drop the dead code.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/xls_to_doc.py | 41 -----------------------------------------
 1 file changed, 41 deletions(-)

diff --git a/scripts/xls_to_doc.py b/scripts/xls_to_doc.py
index 60ad8225d71d..91440ac6291f 100755
--- a/scripts/xls_to_doc.py
+++ b/scripts/xls_to_doc.py
@@ -70,47 +70,6 @@ class FillTests(TestList):
 
         dic[field] = value
 
-    def read_testlist(self, filename):
-        if re.match("^xe", filename):
-            return
-        name = re.sub(r"(.*/)?(.*)\.testlist$", r"\2", filename)
-        if name == "fast-feedback":
-            name = "BAT"
-        elif name == "eu-debugger-fast-feedback":
-            name = "BAT eudebugger"
-        elif name == "fast-feedback-extras-for-simulator":
-            name = "BAT simulator"
-        elif name == "fast-feedback_suspend":
-            name = "suspend"
-
-        name = re.sub(r"eu-debugger", "eudebugger ", name)
-        name = re.sub(r"\bbat\b", "BAT", name)
-        name = re.sub(r"[._\-]", " ", name)
-
-        with open(filename, 'r', newline = '', encoding = 'utf8') as fp:
-            for line in fp:
-                match = re.match(r"^\s*(igt@[^\s\@]+)(\S*)\#?", line)
-                if match:
-                    testname = match.group(1)
-                    subtest = match.group(2)
-                    if testname not in self.tests:
-                        self.tests[testname] = {}
-                        self.tests[testname]["properties"] ={}
-                        self.tests[testname]["subtests"] = {}
-                    if subtest not in self.tests[testname]["subtests"]:
-                        self.tests[testname]["subtests"][subtest] = {}
-                    self.add_field(self.tests[testname]["subtests"][subtest], "Run type", name)
-
-    def get_testlists(self, path):
-        # Create a dictionary with filenames
-
-        regex = re.compile(r".*\.testlist")
-
-        for root,d_names,f_names in os.walk(path):          # pylint: disable=W0612
-            for filename in f_names:
-                if regex.match(filename):
-                    self.read_testlist(os.path.join(root, filename))
-
     def process_spreadsheet_sheet(self, sheet):
 
         column_list=[]
-- 
2.43.2

