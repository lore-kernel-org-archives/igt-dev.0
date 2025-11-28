Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC721CFD376
	for <igt-dev@archiver.kernel.org>; Fri, 28 Nov 2025 04:38:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C84C10E0D7;
	Fri, 28 Nov 2025 04:38:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NvCmNaZm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 814F110E0D7
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Nov 2025 04:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764304723; x=1795840723;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PgOegvTwW7qQO3uJA2QMdMBoHO3GzKLe4SVYOl8xAbs=;
 b=NvCmNaZm+40c+cg5YyUafib1sj7dqSuUidx3IDlw6L7Jjc2OdpCCEIYW
 xHdRFhjuMgIBhw/U/qwhacrcsXL47S9x65Y5XAEZ+29498au2zG3AwoWX
 HBlzc1geC40o2sLgOxIfsgu10E0fUW7D2o2IP6EffDn7wAy0y26r7BklC
 RZYPXtajN4D5k0u1bnvJutt3UzNdXfzOg69CHbx1jafNudjcA8Ycm7IgY
 QWkVybqs6rdxmkMB433jaGFxWoWfG7BAH77snQe/bf51Jf607uGivC1YW
 UGyxmKRdNBD8EzCAlS/XVA+JCW/hr6iDc7PQzWRbb9RzBGEY4UiFJZXNO w==;
X-CSE-ConnectionGUID: FfG+Q+2GQ/q4eExYQCcadg==
X-CSE-MsgGUID: 3aLyhGE+RFyxHVcm1NJccQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="70200650"
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="70200650"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 20:38:42 -0800
X-CSE-ConnectionGUID: ebHRhP2yTOe7zDDebLKtUA==
X-CSE-MsgGUID: CiIVafa+RAaeLEBwNCMTaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,232,1758610800"; d="scan'208";a="197852066"
Received: from dut6245dg2frd.fm.intel.com ([10.80.55.42])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 20:38:42 -0800
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nishit.sharma@intel.com, kamil.konieczny@intel.com,
 Sobin Thomas <sobin.thomas@intel.com>
Subject: [PATCH i-g-t v1 0/1] tests/intel/xe_exec_system_allocator: Added 64k
 alignment support
Date: Fri, 28 Nov 2025 04:38:31 +0000
Message-ID: <20251128043832.322810-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.51.0
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

The original test for madvise split vm only supported 4 KB alignment,
which failed certain hardware such as PVC that required 64 KB page
alignment. The test has been updated to include support for 64 KB
page alignment.

Sobin Thomas (1):
  tests/intel/xe_exec_system_allocator: Added 64k alignment support

 tests/intel/xe_exec_system_allocator.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

-- 
2.51.0

