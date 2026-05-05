Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90256CD13DA
	for <igt-dev@archiver.kernel.org>; Tue,  5 May 2026 05:48:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AEAD10E0CF;
	Tue,  5 May 2026 05:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LIiFCgsX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1649C10E0CF
 for <igt-dev@lists.freedesktop.org>; Tue,  5 May 2026 05:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777960071; x=1809496071;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yGnacOCCpYkFZpWlklVSH3MXSz0gb/QEhs8SEyDytgQ=;
 b=LIiFCgsXHj7y24rcTUzFBUkr3BgSkrn7qc6RO+wKA7w1pNu9WovmdbOs
 VHuAuYJM92ciFfa/V4B+4UR0b2eFSJdbVntZQsUcJqhU5uvApqdGZmiWe
 K23JDZLsdNpGgOEDayVmz02yxgwOn/LU9lItIJ2oLa52t0o1E20Rj/ZA7
 +FdjwcQS14qLsQxISCzfHIlnsp0uwp28kiI59GuaL1+Sd3CRv9SPsF9z8
 yihIR10VZPQpmcH6MHUk3ygLc9CgU5/t0kDOftFztESTLWEO1ULg6JjCO
 Glp+1rYE3Kv0efg2YdICJUeb2YRDYLsF2Oy0dXCNtagkLDj+mBeAGBqb6 Q==;
X-CSE-ConnectionGUID: F6XNZKKZT3C28On9/HyAVg==
X-CSE-MsgGUID: /SWGdCvjRQK+FvW+UYtbyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="79013913"
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="79013913"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 22:47:50 -0700
X-CSE-ConnectionGUID: OMz2UEd9TDqmK2J3A8qE2g==
X-CSE-MsgGUID: 1CHpho+US62ih14mATJn4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,217,1770624000"; d="scan'208";a="232579910"
Received: from shekharc-mobl2.iind.intel.com ([10.190.239.16])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2026 22:47:49 -0700
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: shekhar.chauhan@intel.com, ashutosh.dixit@intel.com,
 gustavo.sousa@intel.com
Subject: [PATCH v4 0/2] Wa_14026633728
Date: Tue,  5 May 2026 11:17:39 +0530
Message-ID: <20260505054741.486361-1-shekhar.chauhan@intel.com>
X-Mailer: git-send-email 2.53.0
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

This series introduces Wa_14026633728. For it's introduction, changes
are made in lib/intel_wa to ensure we check from debugfs whether a
workaround is enabled via the KMD or not.

v1: Add workaround patch.
v2: Fix commit title, description and code description.
v3: Check if the wa exists and reuse it, also, fix a warning for C90
rule.
v4: Introduce changes in lib/intel_wa to ensure we are properly checking
the debugfs file for the workaround.

Shekhar Chauhan (2):
  lib/intel_wa: Add workaround check for a wa within debugfs file
  tests/intel/xe_oa: Wa_14026633728

 lib/intel_wa.c      | 40 ++++++++++++++++++++++++++--------------
 tests/intel/xe_oa.c | 12 ++++++++++--
 2 files changed, 36 insertions(+), 16 deletions(-)

-- 
2.53.0

