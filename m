Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502F0C48297
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 11:51:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5CA10E5C8;
	Fri,  9 Feb 2024 11:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K5gOwrgl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9A210E3BF
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 11:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707479469; x=1739015469;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=0hqA6Lkeqddsm0jI040hUGgeCM0RJLWOsfy4YVSOydg=;
 b=K5gOwrglnDlKG1V5veSm/3xI+h2dfDIkWtqbb/qJMmSuKftjhENIS6sT
 hD2cgX7m1rJ/fl49eQe0BLemU53sWB9+UebFdqRdziAdT0xWNybxLNokt
 GVu3bIP/6geK9YzaDL84OE7WuXkZqSafJKCQNaMBS9sd8XQ52Zl+s30V3
 7pqVVNLi03rZ4efTz+CQixlxcYoG5GKq/cy8n/Bh1hTUpGZHyVyBlVzcR
 2NUT7tqVlXE0QCVBg1REGtBYOQwHgyPIekIVOvf+23/ViW/Qyb0bqtrx4
 fMyjCqNLBA2WufxpuWCNnU+ZQKISFgsRb/j3wqHmPsRAcrFSuKN2sNWc9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="12063279"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="12063279"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 03:51:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="39358095"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 03:51:08 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.246.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id DF237580DE8
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 03:51:06 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rYPPM-00000001CFf-3ZPc for igt-dev@lists.freedesktop.org;
 Fri, 09 Feb 2024 12:51:04 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 3/8] scripts/igt_doc.py: handle empty run_type
Date: Fri,  9 Feb 2024 12:49:52 +0100
Message-ID: <20240209115101.285319-4-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209115101.285319-1-mauro.chehab@linux.intel.com>
References: <20240209115101.285319-1-mauro.chehab@linux.intel.com>
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

If run_type is not set, change it to "other".

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/igt_doc.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index a6cbeee067fe..8a10db13081c 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -85,6 +85,9 @@ class IgtTestList(TestList):
                     tests_per_list[driver] = {}
 
                 for run_type in run_type_set:
+                    if not run_type:
+                        run_type = "other"
+
                     if run_type not in tests_per_list[driver]:
                         tests_per_list[driver][run_type] = {}
 
@@ -108,6 +111,10 @@ class IgtTestList(TestList):
         for driver, run_types in tests_per_list.items():
             testlists[driver] = {}
             for run_type, subnames in run_types.items():
+
+                if not run_type:
+                    run_type = "other"
+
                 for subname, gpus in subnames.items():
                     if not gpu_set:
                         gpu = "default"
-- 
2.43.0

