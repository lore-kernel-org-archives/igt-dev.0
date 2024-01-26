Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FADCC47422
	for <igt-dev@archiver.kernel.org>; Fri, 26 Jan 2024 12:40:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC02310F9F9;
	Fri, 26 Jan 2024 12:40:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E13710F9EE
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jan 2024 12:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706272828; x=1737808828;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=BZD9v3Y4xl4btntGHYQCL6rYmomx6hDpR1XUB8Doxpw=;
 b=Eo5tL79uBo77uCtmy4iOgsAlMsrQijRwsO2+tEWszXzRNsQx2In7wzPb
 EPhx0C0uYKiaiiyzsTs7K2FUm6Xie2pR0evvzHX+3H8sFjL81Q7rjXSjy
 BM9V7cBePeL9eue/vIeZHB2AeockgV9Aw+RcmfxU/T2+/YX4b5dp2DEYf
 LthWVfsUJ6Tm0yURr/arLioaqzct2ANnLkJlj/4tFf0KHJ8F/8DCE85jC
 GFDvS9twR5DJO6hsdMpEDNEGmGE1jn4RhJpEC8OY/swhBK5jFLlTA6UZI
 LrNC4trQiAgq4+k/USCC1Pl/GGSE+x4rivrBAcZ2itchuiYehDoHen1f0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="2328910"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2328910"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 04:40:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="821121699"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="821121699"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 04:40:25 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.246.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 0D179580E13
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jan 2024 04:40:25 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rTLVO-0000000BKaC-3cBZ for igt-dev@lists.freedesktop.org;
 Fri, 26 Jan 2024 13:40:22 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/3] scripts/igt_doc.py: don't be verbose when creating
 testlists
Date: Fri, 26 Jan 2024 13:37:29 +0100
Message-ID: <20240126124021.2700482-4-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126124021.2700482-1-mauro.chehab@linux.intel.com>
References: <20240126124021.2700482-1-mauro.chehab@linux.intel.com>
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

As this target is part of meson, suppress outputs, except when
there are errors or warnings.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/igt_doc.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index b66eefe799e9..6a1cfc2b5a56 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -198,6 +198,8 @@ class IntelciTestlist:
         if not os.path.exists(directory):
             os.makedirs(directory)
 
+        files_written = False
+
         for driver, gpus in self.testlists.items():
             driver_path = os.path.join(directory, driver)
             try:
@@ -225,14 +227,18 @@ class IntelciTestlist:
                         testlist = re.sub(r"_+", "_", testlist)
 
                     if not subtests:
-                        print(f"Warning: empty testlist: {testlist}")
+                        sys.stderr.write(f"Warning: empty testlist: {testlist}\n")
                         continue
 
                     fname = os.path.join(dname, testlist) + ".testlist"
                     with open(fname, 'w', encoding='utf8') as handler:
                         for sub in sorted(subtests):
                             handler.write (f"{sub}\n")
-                        print(f"{fname} created.")
+
+                    files_written = True
+
+        if not files_written:
+            sys.stderr.write("Warning: No Intel CI test files created!")
 
 def main():
     """
-- 
2.43.0

