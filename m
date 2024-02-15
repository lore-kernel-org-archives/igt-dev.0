Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA53C48BEB
	for <igt-dev@archiver.kernel.org>; Thu, 15 Feb 2024 10:27:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 472D910E5FD;
	Thu, 15 Feb 2024 10:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ab/jT+I/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D13A10E43D
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 10:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707992852; x=1739528852;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding:sender;
 bh=NC66Y2jfTeNvLDrHvTiNXkgZdKgSVhHMoT4vPqLeyD4=;
 b=ab/jT+I/eC8Mk1GGBFfHo56QaCDCuP0KyQkKozj8ZYeHKmYu74brj0BR
 vgY/xh0InQ9v7hJm+nO9ipjP23HikyDUZpXFtO2f2Ht7K0WtCV2y5Aw3d
 8fben8psUrIk6n3ZBjdnyFmSLsCtYpKN1Sjs4n+D1tI9cA/ErZ8zfXgLp
 ZpVlSz9hkzYjkGHJ2jZToiNsmAut8aEaLrqfNHG9LQq+hbo9nvTrSIUst
 sgHAtWExmmAlFT5oRTZcWZKnI9BuH3Su4RD8yq15jfcNetijgsdvQrs/l
 +h5rNdq013i2OpF3wSOZkZmbRd29u1R2KbhEYfP47F/i0hJKjfLIte4EN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="2199367"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="2199367"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; d="scan'208";a="40981604"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:27:31 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.246.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id EAF60580E8F
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Feb 2024 02:27:30 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1raYxk-00000003JBi-3mTj for igt-dev@lists.freedesktop.org;
 Thu, 15 Feb 2024 11:27:28 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH 13/17] scripts/code_cov_parse_info: warn if branch block is
 not zero
Date: Thu, 15 Feb 2024 11:27:22 +0100
Message-ID: <35ce25939b496dc55998c0a2f40e518fdb33a215.1707992666.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707992666.git.mchehab@kernel.org>
References: <cover.1707992666.git.mchehab@kernel.org>
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

The lcov's info format has a field to be used for report branch
block. This is unused on json format (newer gcc), being always
zero. JSON doesn't contain it, so the parser doesn't support
it to be non-zero anymore. Print a warning if this happens.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/code_cov_parse_info | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/code_cov_parse_info b/scripts/code_cov_parse_info
index 50d10a30d7f9..ea4f64b34d2f 100755
--- a/scripts/code_cov_parse_info
+++ b/scripts/code_cov_parse_info
@@ -519,6 +519,10 @@ sub read_info($)
 			my $branch = $3;
 			my $taken = $4;
 
+			if ($block != 0) {
+				print "Warning: unexpected block $block at line $.\n";
+			}
+
 			my $where = "$ln,$block,$branch";
 
 			$taken = 0 if ($taken eq '-');
-- 
2.43.0

