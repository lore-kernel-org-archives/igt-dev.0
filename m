Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95B2C369BA
	for <igt-dev@archiver.kernel.org>; Tue, 15 Apr 2025 15:58:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659A410E7ED;
	Tue, 15 Apr 2025 15:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K7Kq1H94";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56D110E7EA
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Apr 2025 15:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744732720; x=1776268720;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0q4qK3zjGuno7o942tGS6eP3XopHubjKAGHClHy2GZY=;
 b=K7Kq1H9432V2U9tuWCF5Dd0KalBPAUV8/reb8hBvRaMEueULB7rV6/XL
 kSUSBBjCz0zvmpvUrOkOOrUk2RGfjxr+83nSfaM+BpaEchhQ19VFH95iD
 3k4LNkonQaXpgA9PvOwA+mzvCb6p2+x1JkUqx5p0ThfzYj8H4KDDsYEhm
 /QrW+1u9S/76JaYB0ayS5K72vPhYT3CKgVRhb5LoNtF/sPHex1bqEPywX
 EFwsXY9ldwWYBJeTsdgPmR7FX7Rjc4GZyODDW9XFBg2W30dVwvxZVn8RL
 vAJN+TS3odXLaLfm6Acw9Rye/hiovO3skenrq/jG6HVLtSUKc4H60IWL0 A==;
X-CSE-ConnectionGUID: ukmbxjxkQt2UfguXPjeqJg==
X-CSE-MsgGUID: G7+YVe/8RVGGR5xBUF9PlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="45965014"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="45965014"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 08:58:37 -0700
X-CSE-ConnectionGUID: lH09fchgQNehCudFXsj/ww==
X-CSE-MsgGUID: FQE7Fx2rRsiX5e8DuuVzsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="130135082"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 08:58:35 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v1 0/2] Async flips with tiled modifiers
Date: Tue, 15 Apr 2025 21:21:34 +0530
Message-Id: <20250415155136.2879045-1-santhosh.reddy.guddati@intel.com>
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

Async flips with linear modifiers combination is a corner and not practical to use,
update the existing subtests to use the tiled modifiers.

Santhosh Reddy Guddati (2):
  tests/kms_async_flips: Split subtest to handle linear buffers
    separately
  tests/kms_async_flips: Use tiling modifiers

 tests/kms_async_flips.c | 45 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 43 insertions(+), 2 deletions(-)

-- 
2.34.1

