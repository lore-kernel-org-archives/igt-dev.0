Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C80DCCFA18
	for <igt-dev@archiver.kernel.org>; Thu, 26 Sep 2024 04:17:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8AA510E28C;
	Thu, 26 Sep 2024 04:17:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NoiEu5ZF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D19E810E124
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Sep 2024 04:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727324221; x=1758860221;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=p9ECFhRCmMxuB/LzG90f2aHO2bber8OB9jQmtb45RoI=;
 b=NoiEu5ZFJKEMVgoz8zCnZvF+mTPueEsehAbTAqvWj4/wytiZGy87nHcP
 MvIk6NifB1szkUGQn8GuN04rgIKhxs7wF6UvAXlr3bUnmlmLbZ4Ypc6Tg
 zKxUYcEnl0oLQMVQYsnWeuAYQP7KThhBinrPtPyuEV5XNxcRRmdsvP2ua
 2rWp1JTaO3cOWJdYriSadIrbS4ZBNpqx4xjvrHMW2mOa13PxCSKtVmjwA
 Wp/XQFGX6aheB4b8agSMr+R2P3JiNOSKyZmtBP3abFyFtMpOAMBzqCRCS
 utRbiquM/Wk1VrFiglN7AbeLobiAibis8IJb6mnb9JCtwc1V2C1QW6lm3 w==;
X-CSE-ConnectionGUID: XkQCLTIxT3mfKmVHnzwslg==
X-CSE-MsgGUID: /sHWmUHlSei6+4hrNYQFWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26554157"
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; d="scan'208";a="26554157"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 21:17:01 -0700
X-CSE-ConnectionGUID: HHrp5aD4QqGnWOKcrjwf/Q==
X-CSE-MsgGUID: C4G1by3gT9CPa/iCFNqkFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,259,1719903600"; d="scan'208";a="76773009"
Received: from ldmartin-desk2.corp.intel.com (HELO ldmartin-desk2.lan)
 ([10.125.111.164])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 21:17:00 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [CI i-g-t 2/5] lib/igt_gt: Make igt_open_forcewake_handle()
 xe-compatible
Date: Wed, 25 Sep 2024 23:16:48 -0500
Message-ID: <20240926041651.412396-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240926041651.412396-1-lucas.demarchi@intel.com>
References: <20240926041651.412396-1-lucas.demarchi@intel.com>
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

xe uses a different file to hold forcewake. Make
igt_open_forcewake_handle() compatible.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_gt.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index b043e2d41..0cc3ee131 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -501,9 +501,17 @@ void igt_stop_hang_helper(void)
  */
 int igt_open_forcewake_handle(int fd)
 {
+	const char *fn;
+
 	if (getenv("IGT_NO_FORCEWAKE"))
 		return -1;
-	return igt_debugfs_open(fd, "i915_forcewake_user", O_RDONLY);
+
+	if (is_xe_device(fd))
+		fn = "forcewake_all";
+	else
+		fn = "i915_forcewake_user";
+
+	return igt_debugfs_open(fd, fn, O_RDONLY);
 }
 
 #if defined(__x86_64__) || defined(__i386__)
-- 
2.46.1

