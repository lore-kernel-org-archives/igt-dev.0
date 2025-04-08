Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C080AC3600C
	for <igt-dev@archiver.kernel.org>; Tue,  8 Apr 2025 04:34:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4E110E113;
	Tue,  8 Apr 2025 04:34:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k4h2rP1j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5F9D10E113
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Apr 2025 04:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744086870; x=1775622870;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CLNFJWWgkUqn44uDkm18hGlJBLl/NAEfGuJTSUt6psE=;
 b=k4h2rP1jMoDMPr1V9O4YojlZXQ+vKds0T6U9GzRSwGRlegowqqU+ln6J
 rQVxqh3zcpJxUFoazUwUhU+MH5W+TcLkzLORksPzlit6DnXMR/cPF+pnj
 gMAByQ7j0RIIurSiJZzUnVNwtbVqZr6a4C1QxMQBeTAvP7xPvJZt8YJGk
 cDxzcTxknMraWQ5DcrgjG8X8mTtXjhB4TfLLAANeDXmvko9MveOrx87cx
 K1yo15Np/2mC2fi4qPKA8Brutbg+SDnK5tAf/K0VqX02wN39T8CZaFL90
 EkLLwDC/Met2JuM9out87c/Fjih3XfnbDpdhAj/+vebUX46L/JTFS18Zt Q==;
X-CSE-ConnectionGUID: Wq+NrvLjRXeGprbGYN2NTQ==
X-CSE-MsgGUID: buHCTaovQ0CrJ+h8xXakeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="63044284"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="63044284"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 21:34:30 -0700
X-CSE-ConnectionGUID: 0XV2LFSvTwu9eAZ1AJehOQ==
X-CSE-MsgGUID: 6klt/akwTLyEQyTYLCNweg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; d="scan'208";a="132278232"
Received: from gsd-build.iind.intel.com ([10.190.229.173])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2025 21:34:29 -0700
From: Sobin Thomas <sobin.thomas@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dominik.karol.piatkowski@intel.com,
	kamil.konieczny@intel.com
Subject: [PATCH v4 i-g-t 0/1] tests/intel/xe_sysfs_scheduler: Add invalid
 string test for engine sysfs properties
Date: Tue,  8 Apr 2025 04:18:47 +0000
Message-Id: <20250408041848.2264963-1-sobin.thomas@intel.com>
X-Mailer: git-send-email 2.34.1
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

This test validates that invalid string inputs are correctly rejected
by engine sysfs write. It ensures that the property values remain
unchanged when invalid inputs with large strings are provided.

Sobin Thomas (1):
  tests/intel/xe_sysfs_scheduler: Add invalid string test for engine
    sysfs properties

 tests/intel/xe_sysfs_scheduler.c | 98 ++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
-- 
2.34.1

