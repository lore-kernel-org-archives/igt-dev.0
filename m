Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A03EC5DF97
	for <igt-dev@archiver.kernel.org>; Fri, 21 Aug 2026 20:00:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 634B110F41F;
	Fri, 21 Aug 2026 19:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mu40XCnf";
	dkim-atps=neutral
Received: from mgamail.intel.com (unknown [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF83B10E2DC
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Aug 2026 19:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787340242; x=1818876242;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AeFH5z+Gp1pT2VAYu6+GBv2oIrUipQ/O2M30fr/wsrc=;
 b=Mu40XCnfhdlqcjZnfdJdTXuyM2BC79AT3ZGjfgcbZik65j7ryGEWhSFk
 5UOSlvvnowj9ugx7gIKOXfD78iSjHVQE8P8QSiRRyb2mOL+6suRUi9yy3
 2HXuWPbe1OaZfiblyEtwd0beLvPaSVw9zpR26WrSxw2xmui0vnYsobUuJ
 MjllMTI+rAWm1BvU0YfPfCw4h24RtD8TkdjdgcMay705V3ulou7FoZvPL
 xfzaDIGGDqqfU0U+a6FSpT15ZAlM9O0KlptR/0QOAl3lF4XgU3zbdVNDn
 0HuOUukRBvlTWCGs6FrEfvz5H4AZOmzN60l+e1oetp7VFco4uGSVNHFnv Q==;
X-CSE-ConnectionGUID: niytnaGoTnKgN9OuZiZemg==
X-CSE-MsgGUID: 1feWz+2sQcyAQMK4ZQNsKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="110682214"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="110682214"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 12:23:35 -0700
X-CSE-ConnectionGUID: d2pDZDdOR7K3fBYR9DQ8uw==
X-CSE-MsgGUID: xYFpWCCRR3SoCgVw2cX+rA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="289963498"
Received: from dut4475arls.fm.intel.com ([10.105.10.69])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 12:23:34 -0700
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, rodrigo.vivi@intel.com,
 matthew.brost@intel.com, umesh.nerlige.ramappa@intel.com,
 Michal.Wajdeczko@intel.com, matthew.d.roper@intel.com,
 daniele.ceraolospurio@intel.com, shuicheng.lin@intel.com,
 Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH i-g-t 0/2] Test new debug based configfs changes
Date: Fri, 21 Aug 2026 19:23:31 +0000
Message-ID: <20260821192332.19060-4-stuart.summers@intel.com>
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

This series is meant to test the changes coming in with [1]. There
is a new debug specific configfs group to allow easy addition of
debug-specific configfs entries without worrying about ABI for non-debug
configurations. There are also two new entries tested here,
guc_log_level and guc_log_target.

[1]: https://patchwork.freedesktop.org/series/165879/

Stuart Summers (2):
  tests/intel/xe_configfs: Use the new debug configfs group
  tests/intel/xe_configfs: Add coverage for GuC log configfs entries

 tests/intel/xe_configfs.c | 312 ++++++++++++++++++++++++++++++++------
 1 file changed, 269 insertions(+), 43 deletions(-)

-- 
2.43.0

