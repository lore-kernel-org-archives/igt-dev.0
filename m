Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F22C4829B
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 11:51:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E1410E3BF;
	Fri,  9 Feb 2024 11:51:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HBUQcw0K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCEB710E236
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 11:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707479469; x=1739015469;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=Kbx+CpnIePI09WCWR950yEIxG7d61BB9H0E5QTdoDYo=;
 b=HBUQcw0KHGoEq7tQshmos3v1HKQbR7lFv40TlbNIhvEedcW4rNJ73Jpg
 IpUgj177X24dgQnFT+6RtrdcQ2g3QfyugzoofHkKwe4xMzvxEm3HCdbZr
 G29q9OsLPZepih6mbt/72hCLjf9g2yTurdS+Sw4GRuOHu2byuEyY2e5l8
 fbg+TUWFclBedfjVXeGe2/J1jLeVpszS7+ZwzmjiXZDrEJC2EYZKz0Bao
 3ZAzKdRVpGfwuJMhoUEfk/S6KjwTvKXrFdBUJqsnh65fEvJP19TXr5jfc
 AIgjeG0ks5zyE/5DkzxjVuO2y4hrMe1JyhAM1ioGZIyc9u6dwEq4lezkM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="12063278"
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="12063278"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 03:51:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,256,1701158400"; d="scan'208";a="39358093"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 03:51:08 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.246.44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id DE1AC5804FA
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 03:51:06 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rYPPM-00000001CFZ-3QVJ for igt-dev@lists.freedesktop.org;
 Fri, 09 Feb 2024 12:51:04 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 1/8] scripts/test_list.py: fix a typo on
 default-if-not-excluded
Date: Fri,  9 Feb 2024 12:49:50 +0100
Message-ID: <20240209115101.285319-2-mauro.chehab@linux.intel.com>
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

There is an extra hyphen there.

Currenty, this is harmless, as such config attribut is not
used anymore on current config files.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/test_list.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/test_list.py b/scripts/test_list.py
index eeb452091fbf..69c830ca1539 100644
--- a/scripts/test_list.py
+++ b/scripts/test_list.py
@@ -550,7 +550,7 @@ class TestList:
             if not update:
                 continue
 
-            default_value = update.get("default--if-not-excluded")
+            default_value = update.get("default-if-not-excluded")
             append_value = update.get("append-value-if-not-excluded")
 
             testname = subtest_dict["_summary_"]
-- 
2.43.0

