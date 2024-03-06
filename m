Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97EEC5475B
	for <igt-dev@archiver.kernel.org>; Wed,  6 Mar 2024 06:54:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48FB110E22F;
	Wed,  6 Mar 2024 06:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TkPOEw29";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7430F10E22F
 for <igt-dev@lists.freedesktop.org>; Wed,  6 Mar 2024 06:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709708043; x=1741244043;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding:sender;
 bh=N4h36pagQJ3atRzsDRTDf5cdpfwM0fHorvGfOk1huho=;
 b=TkPOEw29FZmL1vvLAyvmxCdY7aR/x8N6+9ojidt8mKRFL3knmokRbo+g
 JixBYs0QLSAbOW5caOoYFWdt2neRSLJBW37yZiesuG3PSmvM0oe0pfGw4
 6WInrw8vl0mT3WmNG8ebKj8N2g7JbNC1LU1F+rcZ0Be16cVlsAyJwqCpq
 q9MFGEK/FOjDZJqHe899COGvRYFbiAsCOA2mBFMHsY4tz0a38i/eR45Dq
 WTzSScflPnU1WMHBTNRUaZ8cVNnBio35jzNNkEj8lSC1hLlWcDBaua8+M
 +yLStdulrLYvN7Umo6+17hYWcKZfysQcstdbDvMNQrks5Lt4eT/lJY3g8 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4167874"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="4167874"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 22:54:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; d="scan'208";a="40538895"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 22:54:02 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 7E7D0580DA0
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Mar 2024 22:54:02 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rhlA8-00000003GuA-2NcB for igt-dev@lists.freedesktop.org;
 Wed, 06 Mar 2024 07:54:00 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] scripts/igt_doc.py: store igt test names in lowercase
Date: Wed,  6 Mar 2024 07:53:58 +0100
Message-ID: <20240306065358.779956-1-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.43.2
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

IGT runner is case insensitive, so, for machine, it doesn't matter.

Yet, as dictionaries are case sensitive, better to place the tests
on a canonical form, e. g. in lower case.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/igt_doc.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/igt_doc.py b/scripts/igt_doc.py
index 1cb8e617abca..fa2c2c7ca146 100755
--- a/scripts/igt_doc.py
+++ b/scripts/igt_doc.py
@@ -98,6 +98,7 @@ class IgtTestList(TestList):
             tests_per_list[driver] = {}
 
         for subname, subtest in subtest_dict.items():
+            subname = subname.lower()
             run_types = subtest.get("Run type", "other").lower()
 
             run_type_dict = self._get_run_type_drivers(run_types)
-- 
2.43.2

