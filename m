Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41305CF58E7
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 08:00:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0352910E7C6;
	Fri, 20 Sep 2024 08:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nUGrjEpx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25C410E7C6
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Sep 2024 08:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726819252; x=1758355252;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4CFBG8tY6s1AXrieeJx7mj1c2f4kVrYtKb1a8UyriRw=;
 b=nUGrjEpxk8GdH/NjjDc1V4ZINZkC+C71cHgkbF/JLviKITAOjQ30pdE7
 W4zkwQZkOp3xuuhdsaDIWyrG7EVGpmNJpfsoL+qxNRe/YnBX7DDaQ5PyY
 GX9/tLMKXUN7XMc1qzGz3tIWFcHk0TUWh9QdwMrjDeHOv1Enf+eR70VGd
 2ng//dh0VGkvtwc6E+mc+/cq14dhG20mCH4//thZtie3d5ogdLa6cOBzp
 k1n0ckiSpxSzE8RcYRj02MJ56ig89bFN8p/kLgL6f5jGAZrNU3IWzQdg8
 ehYIEkpWYAr7o9CeThXvIwP07uxXbg3zkr6KIN9a1KyQajeq6nOhZcaJZ g==;
X-CSE-ConnectionGUID: TgRdWwwISk+Cxkme5MhTbw==
X-CSE-MsgGUID: aVOg3M6fTU2PtfjKZl3VDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25690801"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="25690801"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 01:00:52 -0700
X-CSE-ConnectionGUID: BP9PqZNiSSKiHpg+TScUHQ==
X-CSE-MsgGUID: s5yW+WUQRRiqO4Tf06nQOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; d="scan'208";a="75003614"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by orviesa005-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 01:00:49 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, karthik.b.s@intel.com, vandita.kulkarni@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3 0/2] tests/kms_async_flips: Async flips suspend
 resume test
Date: Fri, 20 Sep 2024 13:30:33 +0530
Message-Id: <20240920080035.633836-1-santhosh.reddy.guddati@intel.com>
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

This patch introduces a new subtest to validate async flips during
suspend and resume cycle.

Santhosh Reddy Guddati (2):
  tests/kms_async_flips: Async flips suspend resume test
  HAX patch do not merge

 tests/intel-ci/fast-feedback.testlist    | 178 +-------------
 tests/intel-ci/xe-fast-feedback.testlist | 284 +----------------------
 tests/kms_async_flips.c                  |  15 ++
 3 files changed, 29 insertions(+), 448 deletions(-)

-- 
2.34.1

