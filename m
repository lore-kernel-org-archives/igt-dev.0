Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949E2C48BF1
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 10:27:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC38A10E5E1;
	Thu, 15 Feb 2024 10:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CTvW9CmB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290F110E57A
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 10:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707992852; x=1739528852;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding:sender;
 bh=3avOJg5LRLFTvDfCz9JGnTN9kbCJFJ3Ineey6uV0l+c=;
 b=CTvW9CmBfYCPk1gd43HrBzaw4ICuvKXQZp8eyerFBnwSj7G/7VYOGIJB
 vEAM+vUkgUJV5PxOr0/7Jqu3UcQYXdu4UEjxDafyjkz2DV9ixT7f6ZBrW
 TVHQRDJEkEPKbe8BXt+vmKXYkOr2LzqumcP1yRLlFf+971VdpstUM+LSz
 js4VySPavM+Jh3VTwuNluQLWPOP8LDqvOvy2ioMt/8RT31Xqbk5zzMnZT
 3cuxBcOS8kYVPSwE7oQLm2+lAyMyYIU/dSMdWNJYbH6pqnInGsVouePdl
 55lf39Ir0rO2e+9zjE6chqtAA3SYKobUq2zjXT0NQfFPIC+9P98dIHuNQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="5038593"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="5038593"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="3480343"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:31 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.246.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id BD33D580DEA
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 02:27:30 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1raYxk-00000003JAy-2zwt for igt-dev@lists.freedesktop.org;
 Thu, 15 Feb 2024 11:27:28 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 00/17] Improve code_cov_parse_info tool
Date: Thu, 15 Feb 2024 11:27:09 +0100
Message-ID: <cover.1707992666.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.43.0
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

Add support for:
- handling JSON output format from gcov;
- use an enhanced JSON format;
- add a tool to help analyzing branch coverage;
- allow generating and reading compressed .info files;
- improve filtering logic;
- add support for Intel Xe driver default filter list;
- several fixes.

Mauro Carvalho Chehab (17):
  scripts/code_cov_parse_info: Silent some messages by default
  scripts/code_cov_parse_info: do some renames to make it more coherent
  scripts/code_cov_parse_info: better handle include regexes
  scripts/code_cov_parse_info: add support for filtering Xe driver data
  scripts/code_cov_parse_info: add a tool to analyze branch coverage
  scripts/code_cov_parse_info: prepare $all_branch to get function data
  scripts/code_cov_parse_info: use numberic sort for line numbers
  scripts/code_cov_parse_info: make parse_info_data more generic
  scripts/code_cov_parse_info: stop recording/writing too old fields
  scripts/code_cov_parse_info: add support for parsing JSON files
  scripts/code_cov_parse_info: add an internal JSON format
  scripts/code_cov_parse_info: add support for compressed files
  scripts/code_cov_parse_info: warn if branch block is not zero
  scripts/code_cov_parse_info: better handle branch filtering
  scripts/code_cov_parse_info: add support for filtering branches
  scripts/code_cov_parse_info: fix files statistics
  scripts/code_cov_parse_info: better check if source file exists

 scripts/code_cov_parse_info | 881 +++++++++++++++++++++++++++++++-----
 1 file changed, 768 insertions(+), 113 deletions(-)

-- 
2.43.0


