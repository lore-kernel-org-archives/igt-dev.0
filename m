Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F40AC41513
	for <igt-dev@archiver.kernel.org>; Tue, 28 May 2024 05:49:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B96410FB4A;
	Tue, 28 May 2024 05:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z1yOiIFA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21AE710FB4A
 for <igt-dev@lists.freedesktop.org>; Tue, 28 May 2024 05:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716875384; x=1748411384;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aoN6OL9vgK6Hyrp8ZLa9RGqc9jLG8jsRysRK+UcQ3Pg=;
 b=Z1yOiIFAT+LCPm1RvmLGW5fPVaS8ltK0/crOPMiOVviZZ3xkO4+YNyAu
 3VWzhOWgDtG396EEOvwhgt52Jgj2eFs3EM4Rdel8EXeOmPP/1yEwrC2s/
 69Mz/XARBnnQsVgP84bClFbNto0gatMrU5hcrrNrws5hxHfnwly9uhwX5
 Cl1b739mIcq0/uQJqH99qd/NmFWjrhahWqTS+RTOFfG55WOaK3MSjskUo
 TLHZgkyjVF6p07LGVCbggdzoG1GVIHx1DqnhwB/OyDwxTfJkzgpwQGu/d
 8kl6NKO6flCSyVEcYem16jxOwRNnb5kAnr04SGtJoJeFoqWa2fsufbFDi A==;
X-CSE-ConnectionGUID: 2OP9FNcRR5aU9Op9LmC71g==
X-CSE-MsgGUID: InVNke1tTO+W8BxU5dVcrA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24615872"
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="24615872"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 22:49:43 -0700
X-CSE-ConnectionGUID: 1W6tnm7GTK+daSc6qgyhqQ==
X-CSE-MsgGUID: +4wcQ8tESneXXyEby9cdWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,194,1712646000"; d="scan'208";a="66165855"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 22:49:42 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 0/5] Enable fbdev tests on XE
Date: Tue, 28 May 2024 11:12:18 +0530
Message-ID: <20240528054223.2945356-1-bhanuprakash.modem@intel.com>
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

Enable fbdev tests on XE.

Bhanuprakash Modem (5):
  tests/fbdev: Fix fd closure
  tests/fbdev: Add testplan documentation
  tests/intel/kms_test_config: Add fbdev tests to testplan
  tests/intel-ci/xe: Drop fbdev tests from blocklist
  tests/intel-ci/xe: Add fbdev tests to XE BAT

 tests/fbdev.c                            | 41 +++++++++++++++++++++++-
 tests/intel-ci/xe-fast-feedback.testlist |  6 ++++
 tests/intel-ci/xe.blocklist.txt          |  1 -
 tests/intel/kms_test_config.json         |  2 +-
 4 files changed, 47 insertions(+), 3 deletions(-)

-- 
2.43.2

