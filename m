Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D00BC54788
	for <igt-dev@archiver.kernel.org>; Thu, 22 Feb 2024 11:47:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E34510E8ED;
	Thu, 22 Feb 2024 11:47:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LrM1EIkN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A475D10E6BE
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2024 11:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708602469; x=1740138469;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding:sender;
 bh=qnJHPqq+3XpJH7JGtp1vz/6u301fkfChvxlzbegLOeA=;
 b=LrM1EIkNDGTngmkkH/0toDQHyH03cYp1YxKyYqlIPr1/STaWuxJaTvT1
 bCFO/xADPHYqRcNTinEZN0ykdsFaXBYV51gLNbXphCYYbpU3iWdRnQnqg
 QWH71Nv9wMkNCYFeuglZZ5XAELODGrT5DZi8YQmCAsmKO+nrP5aEatY0m
 lneuwYXZmeS3WBZ1Exxr+QzkIpSO20KEwzQZo/S4ovxgwWJpQUC8hVe1J
 l1HgMEu/eGQ7PrANg9u+4Bge4hSpa8Op49rst57jnnBL/QxCge5kUIeXf
 bCcRIdNh8OKAas+G21ApfvsNLrxnPTv9urIAi2ysgBi/6MznMdLDo+KKQ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2706323"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="2706323"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 03:47:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="36304241"
Received: from linux.intel.com ([10.54.29.200])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 03:47:48 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 40F40580DF2
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2024 03:47:47 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rd7YH-00000000p2j-0vJ4 for igt-dev@lists.freedesktop.org;
 Thu, 22 Feb 2024 12:47:45 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 0/4] Additional fixes for IntelCI testlist generation
Date: Thu, 22 Feb 2024 12:45:24 +0100
Message-ID: <20240222114741.196042-1-mauro.chehab@linux.intel.com>
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

Address 4 issues at testlist generation:
- trivial case of not naving gpus is not handled properly;
- the fixes for the most complex case were incomplete;
- don't consider "all" value (used for blocklists only) to be
  a gpu type;
- joining testlists from multiple json filesis not doing right, as it
  doesn't cover the case properly when GPU sets are different.

Mauro Carvalho Chehab (4):
  scripts/igt_doc.py: fix intelci testlist generation for complex cases
  scripts/igt_doc.py: ignore "all" when producing testlists
  scripts/igt_doc.py: fix trivial case handling
  scripts/igt_doc.py: fix intelci testlist join logic

 scripts/igt_doc.py | 85 ++++++++++++++++++++++++++--------------------
 1 file changed, 48 insertions(+), 37 deletions(-)

-- 
2.43.2

