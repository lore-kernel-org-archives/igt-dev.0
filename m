Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71CAF46C69
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 18:43:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA3810E29C;
	Mon,  6 Apr 2026 18:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RM7erdlt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB93610E29C
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 18:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775500948; x=1807036948;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QmBHsbuTq9leFgoy9nkI/0TIGaJ80Ueu18Ub/3HRvSg=;
 b=RM7erdltgrdjpa2QRZ4MyUlSf8pFXo/FKYvXDq0iWFfEgObT5i0lXEs8
 /u7cjxaSLYZkLN7mxv4B3TVRCR2soH0HuPoyMfgZa4yVcpIBmqvqGR+st
 A3Dnx0ihMlFWs7AF/RCPLqRXFVUqIDoygy/YLfH1ykzfxmCl+uTFAl7wV
 GNOCHveUNHmlkqsdq9S1M4OXth3OAT+jDMUfVUgzrR0FgVVWTRVMrAWuX
 vQwasqpLRlsUWPUi9Ua59PvAOHUoavYmQQIM/tbhBBHv9cvoNOUmWXUq5
 LAh1QbMxR9l+v2nMW5ASDqBYMzUKWRhWsZK71SIRwa1lCCyWFmIEl9Ea/ A==;
X-CSE-ConnectionGUID: EOS89TDmSFOsOl/x6l3nqw==
X-CSE-MsgGUID: T8y8PceeSJWilQ7TsXmGag==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80342962"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="80342962"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 11:42:27 -0700
X-CSE-ConnectionGUID: NEXI6vieTWu/i3ObdS1KMg==
X-CSE-MsgGUID: BonU9obURHG1Usq28IctHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="225193399"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.192])
 by fmviesa008.fm.intel.com with ESMTP; 06 Apr 2026 11:42:27 -0700
From: Brian Nguyen <brian3.nguyen@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: x.wang@intel.com,
	Brian Nguyen <brian3.nguyen@intel.com>
Subject: [PATCH 0/4] tests/xe: Add xe_page_reclaim test suite
Date: Mon,  6 Apr 2026 18:42:27 +0000
Message-ID: <20260406184226.1294486-6-brian3.nguyen@intel.com>
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

Page Reclamation is a Xe3p feature that optimizes TLB invalidations
by targeting only the specific physical pages being unmapped, rather than
issuing a full PPC flush. With Page Reclamation, the driver maintains a
Page Reclaim List (PRL), on the backing pages of a VMA range, which is
passed into the hardware, limiting the flush to only the affected pages.

PRL supports up to 512 entries and beyond that results in a fallback to
full TLB invalidation, and invalidating the PRL. The page reclamation test
cases validate different combinations of the possible VMA ranges.

The primary source of validation of these cases is derived from the
gt_stats in debugfs to confirm the proper PRL generation.

Brian Nguyen (4):
  tests/xe: Add page reclaim test
  tests/xe: Add random page reclaim subtest
  tests/xe: Add transient display PRL skip
  tests/xe: Add large VMA range tests for better coverage

 tests/intel/xe_page_reclaim.c | 826 ++++++++++++++++++++++++++++++++++
 tests/meson.build             |   1 +
 2 files changed, 827 insertions(+)
 create mode 100644 tests/intel/xe_page_reclaim.c

-- 
2.43.0

