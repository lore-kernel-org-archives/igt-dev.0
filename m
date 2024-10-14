Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F47ED18151
	for <igt-dev@archiver.kernel.org>; Mon, 14 Oct 2024 21:31:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D040E10E4D5;
	Mon, 14 Oct 2024 21:31:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aZImNm01";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E05E10E4D5
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Oct 2024 21:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728941496; x=1760477496;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KRj8tSC6KiQ0CWqVXNrETC+Ixj4m32yCcNGVltO+pXk=;
 b=aZImNm017Xn5Jd70QR0O0zLWtAPRolwi0BLxY6vwK6YgXD+PW426SnDi
 f6dGp/lnbO8B5yqefR9MhpIxiXY9CPROQdzFiZVAGzXIidLsOl8HVwHE1
 UWa6rTWpnzdl7DWVyO4nlXu0Db2j1/R2Cw4x62Ugi4pHCzPjZC171fSHI
 nhbiI4SfFTGhWxPCdcwMT4PAp4LWwcsGUIQxB4EoRzgozgW0tCop20PSg
 bTSG2UonmnDJN0cOpzdNr43G4pNVrXdej/qbnLmemFgK6iDx0GAoi34pF
 EO4swhBoCy0pOLdg6fMB67A4D/i45Z7Ik5pnQ7Ln2H0NN73aByAalP+WO g==;
X-CSE-ConnectionGUID: 0CQnK6HsTieqVYXPt18ioQ==
X-CSE-MsgGUID: 6009WNIdTLyZgn94XoSQoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="31191658"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="31191658"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 14:31:35 -0700
X-CSE-ConnectionGUID: x9UFPtSyS+yA6tNFDaDd5g==
X-CSE-MsgGUID: vI2dfkMQSdW4vf6hpupy4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; d="scan'208";a="82460052"
Received: from dut138lnl.fm.intel.com (HELO jcavitt-DESK.fm.intel.com)
 ([10.105.23.14])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 14:31:35 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com, alex.zuo@intel.com,
 jani.saarinen@intel.com
Subject: [PATCH] tests/intel/xe_exec_reset: Explicitly declare exec
Date: Mon, 14 Oct 2024 21:31:24 +0000
Message-ID: <20241014213124.255668-1-jonathan.cavitt@intel.com>
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

In the gt-reset-stress subtest, we define a drm_xe_exec exec without
declaring any of its variable values.  Explicitly declare exec to equal
an empty struct to prevent any values from being assigned garbage data
during execution.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
CC: Jani Saarinen <jani.saarinen@intel.com>
---
 tests/intel/xe_exec_reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index b5d5f43eab..fdfefa91cc 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -628,7 +628,7 @@ static void submit_jobs(struct gt_thread_data *t)
 			.engine_instance = 0,
 			.gt_id = 0,
 		};
-		struct drm_xe_exec exec;
+		struct drm_xe_exec exec = {};
 		int ret;
 
 		/* GuC IDs can get exhausted */
-- 
2.43.0

