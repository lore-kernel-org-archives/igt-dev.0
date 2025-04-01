Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3232C36014
	for <igt-dev@archiver.kernel.org>; Tue,  1 Apr 2025 09:07:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A7A10E523;
	Tue,  1 Apr 2025 09:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YaGo5Sox";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 298E110E523
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Apr 2025 09:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743498465; x=1775034465;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aAUiHj+ybRHVlbM19LdWtx4vwpNo4xKzxiay+SHFPrM=;
 b=YaGo5SoxPkwO6IyySsVb0/QWc74PrNUIkz/REVi7U3cWwV6ooHKnpd+D
 BzehGC5bUeFQP0ngfTlfSBANrsuI6nLItg5A1h3aAxVuZJPK5Jnc7GKh7
 UY9p4S240I9mDjvLxSyNJexB2i6ZZfvCr6VmFEK4STCbwgdzd936y2iHR
 kiJBxOxCJKHR/R22gqiFhoGoQ7J6ZljPzfxUffWHt9ZWzV88lO6RiuSPI
 4MrI0gSxaoBxijkFvMAAX9IAuSncY+IprCSUrpqsscvZw9/qLboQzt8Br
 5nUJUzjCb9qHDVhAOeFt407Bn6DQF3ADRqf/oHXemh+ayfnh3tzgR7FgA Q==;
X-CSE-ConnectionGUID: XXcId6t4STCq4nIfHTI/FA==
X-CSE-MsgGUID: ysTWTe+GSjCaYbvGufvU1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="62345866"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="62345866"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 02:07:44 -0700
X-CSE-ConnectionGUID: 7NPsAB2ZQzGCfeZdsoSNZw==
X-CSE-MsgGUID: oW6aptaETHmXi5L2K9Dolg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; d="scan'208";a="131539952"
Received: from artdev273.igk.intel.com ([172.28.176.8])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 02:07:42 -0700
From: Jan Sokolowski <jan.sokolowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jan Sokolowski <jan.sokolowski@intel.com>,
 Katarzyna Piecielska <katarzyna.piecielska@intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t v2 0/2] Fault variations of tests
Date: Tue,  1 Apr 2025 09:06:49 +0000
Message-Id: <20250401090651.298768-1-jan.sokolowski@intel.com>
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

This is a series of patches introducing fault variations, that is,
tests are accessing the memory via debugfd, by creating
a vm in FAULT_MODE.

Signed-off-by:Jan Sokolowski <jan.sokolowski@intel.com>
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
Cc: Christoph Manszewski <christoph.manszewski@intel.com>

---

v2: Added documentation descriptions to -faultable tests

---

Dominik Grzegorzek (2):
  tests/xe_eudebug: Implement faultable variations of some testcases
  tests/xe_eudebug_online: Implement faultable variations of some
    testcases

 tests/intel/xe_eudebug.c        | 96 ++++++++++++++++++++++++++-------
 tests/intel/xe_eudebug_online.c | 26 ++++++++-
 2 files changed, 102 insertions(+), 20 deletions(-)

-- 
2.34.1

