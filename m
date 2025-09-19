Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5178CA1013
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 03:17:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40AE110E0F8;
	Fri, 19 Sep 2025 03:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XzdHriWj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F228310E0F8
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 03:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758251870; x=1789787870;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1eJQ0IkbNxh6BEUsgz/z3kej6wiEyOO1GrGaw2iY0IE=;
 b=XzdHriWjzSjJvTgGe0OJ5EIMfPYVcHoGK9FqxyZZkEvLWrtoaCePQ6b8
 6SWf6DZw1JfhejxCquNHysGD0+f5Ht1+uMCwxQLvN+URZyeYN2jVBvN21
 uJdS5lUqdRg9x6KGNIDaWME645uhFZxAb3Yznp5fd0r3jewRJp71gbEuD
 bXLOza/2m3dG5gDuml3vPeO7i9j4C0DRvsetd585iTFMKnwrAegCoXEaP
 nnZyJZiM1shT9I5Tg1GI7z+Rd2gOg6wkpjZEYdBMYuZ5A16+mF9wgnv14
 YLBgCyN/lKuL56ByjXSrHDdlU7RPbxbzexgledcVJdNU5ysUGceLL640U Q==;
X-CSE-ConnectionGUID: Lz6cAGYwTCuxdWpkMeRkQA==
X-CSE-MsgGUID: TPldBmeRT6eGa/2kg41xOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="60526897"
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; d="scan'208";a="60526897"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2025 20:17:49 -0700
X-CSE-ConnectionGUID: BIZB1Va4RbGHiaEHhNW06g==
X-CSE-MsgGUID: TXBrOl8WS9+mJvFFd/vA5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; d="scan'208";a="179988688"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 20:17:48 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t 0/2] tests/kms_setmode: Fix clone mode mismatch by
 preferring eDP mode
Date: Fri, 19 Sep 2025 08:47:34 +0530
Message-ID: <20250919031736.1362484-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

If an eDP connector is present, prefer selecting its default mode for
cloning. Some eDP panels support only high refresh rate (HRR) modes,
which may not be compatible with external displays. To avoid invalid
clone configurations and test failures, we choose the default mode
from the eDP connector when available.

Signed-off-by: Jeevan B <jeevan.b@intel.com>

Jeevan B (2):
  tests/kms_setmode: simplify mode selection by removing goto
  tests/kms_setmode: Fix clone mode mismatch by preferring eDP mode

 tests/kms_setmode.c | 36 ++++++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

-- 
2.43.0

