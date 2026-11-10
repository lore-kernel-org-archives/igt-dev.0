Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF9E606A31C
	for <igt-dev@archiver.kernel.org>; Tue, 10 Nov 2026 10:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jY8bMk9Z
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF8910E482;
	Tue, 10 Nov 2026 10:57:55 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B2F10EFB2
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2026 10:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794308197; x=1825844197;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RB2PlwFfcebOnPNJTMv+LrVZm5tdxk/DQwL3L38EFts=;
 b=jY8bMk9ZHliZw2e2ZnpxD6uQggucfCC+/0j8MSLhKpB9xFt/1yK7IPdy
 PFAlFwg9VdJh/z2brmKEX8af+ZEDQivodKW7SuW4GbGMNyyqPBV85xQG0
 gaOTp4RpL/MPqAjo32O7i4F6adyqjuovEjaluisL4+az6U3tkayrnARMC
 b7I8gGy8HdwITRB6uuQQav9vm9XGN/E9wvuiTOWy2xjohWly+0rL6cTWW
 KGAwdTc+SaDJ+/remusPUpMAujnEUhz1PchUlHfHtNRzYJds4/DNfE+UN
 LavT85NL5Px7lvL5wyQwvZd+AEM9vQuP87HYp6Ivppdm8N2pnKVAdsS9/ g==;
X-CSE-ConnectionGUID: XT55ZJmZRwalg3qK2oZYnA==
X-CSE-MsgGUID: L6Sg2WxDRz6dkrXLtTtfHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3085123"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3085123"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 02:56:37 -0800
X-CSE-ConnectionGUID: 426RkKlyTqih9IgIcqypkQ==
X-CSE-MsgGUID: f+WsJJAcTcKGaLIeK5V3mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8290552"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 02:56:33 -0800
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, kamil.konieczny@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH] intel-ci: Block cold-reset-wedged test
Date: Tue, 10 Nov 2026 16:11:16 +0530
Message-ID: <20261110104115.1734778-2-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

cold-reset-wedged is only supported on CRI, so block it on the other
xe platforms.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel-ci/xe.bmg.core.blocklist.txt | 2 ++
 tests/intel-ci/xe.lnl.core.blocklist.txt | 2 ++
 tests/intel-ci/xe.nvl.core.blocklist.txt | 2 ++
 tests/intel-ci/xe.ptl.core.blocklist.txt | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/tests/intel-ci/xe.bmg.core.blocklist.txt b/tests/intel-ci/xe.bmg.core.blocklist.txt
index f83b544cb..e7b57558b 100644
--- a/tests/intel-ci/xe.bmg.core.blocklist.txt
+++ b/tests/intel-ci/xe.bmg.core.blocklist.txt
@@ -78,3 +78,5 @@ igt@xe_pm@d3hot-i2c
 ##################################################################
 igt@.*multi.queue.*
 ##################################################################
+igt@xe_wedged@cold-reset-wedged
+##################################################################
diff --git a/tests/intel-ci/xe.lnl.core.blocklist.txt b/tests/intel-ci/xe.lnl.core.blocklist.txt
index 88115ec22..970c88932 100644
--- a/tests/intel-ci/xe.lnl.core.blocklist.txt
+++ b/tests/intel-ci/xe.lnl.core.blocklist.txt
@@ -106,3 +106,5 @@ igt@xe_pm@d3hot-i2c
 ##################################################################
 igt@.*multi.queue.*
 ##################################################################
+igt@xe_wedged@cold-reset-wedged
+##################################################################
diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
index 7de332352..b960c15cc 100644
--- a/tests/intel-ci/xe.nvl.core.blocklist.txt
+++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
@@ -107,3 +107,5 @@ igt@xe_exec_sip@.*
 igt@xe_exec_sip_eudebug@.*
 igt@xe_live_ktest@xe_eudebug
 ##################################################################
+igt@xe_wedged@cold-reset-wedged
+##################################################################
diff --git a/tests/intel-ci/xe.ptl.core.blocklist.txt b/tests/intel-ci/xe.ptl.core.blocklist.txt
index 9716e6071..e2284bdfe 100644
--- a/tests/intel-ci/xe.ptl.core.blocklist.txt
+++ b/tests/intel-ci/xe.ptl.core.blocklist.txt
@@ -86,3 +86,5 @@ igt@.*survivability.*
 ##################################################################
 igt@.*multi.queue.*
 ##################################################################
+igt@xe_wedged@cold-reset-wedged
+##################################################################
-- 
2.43.0

