Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF09CAC59A
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 22:33:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35A9A10E231;
	Fri, 19 Sep 2025 22:33:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N1OX7w1/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 911BA10E231
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 22:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758321189; x=1789857189;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CokMsVYwLur2jPAiIm6+lNeksGNpuA1F6bKEFug3h1k=;
 b=N1OX7w1//CwF/QJT52vk/RmblpP5mRZesuxbjDQs7Nal2jpX3hbPJaN+
 kYWBE2hCmTdlIgwki869CB+IpqKTDTioQ4mYmGU82TezW+bOCKuUh4rfR
 9IxPUw+cPEyun8IvYxdHZVATtP+gBGSMkfW9kSSG2Qiy2LQOR/F3SBaV/
 d2ITxPcngMGRrpqv4g2/gbM3ghwSeUIWwA5eI/njPJbX438SN+nBwwhft
 bO3faPSft/ZMg0fLCShTodVEQeQt2fLCLhMKMnbOIDKz5kDG0cqlOU7Ww
 shmYpW3DxlGU7j8w7/Kbus8FtmCIPvQwln1xxrp9v8vuQelNKuYkcQSx8 w==;
X-CSE-ConnectionGUID: 3/qjQeZASB+VrqgTEgEGAw==
X-CSE-MsgGUID: lcbuHXkQTa2UG4oqxmWHYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="64310249"
X-IronPort-AV: E=Sophos;i="6.18,279,1751266800"; d="scan'208";a="64310249"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2025 15:33:08 -0700
X-CSE-ConnectionGUID: uc175+iJQ+aMAz+GOTuOrg==
X-CSE-MsgGUID: 57Ldfz2OTja2EEt2XtUnrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,279,1751266800"; d="scan'208";a="175755001"
Received: from danielcm-desk1.jf.intel.com ([10.88.27.146])
 by orviesa007.jf.intel.com with ESMTP; 19 Sep 2025 15:33:07 -0700
From: Daniel Charles <daniel.charles@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Daniel Charles <daniel.charles@intel.com>
Subject: [PATCH] tests/intel/xe_exec_reset: expect error or complete on
 CAT_ERROR
Date: Fri, 19 Sep 2025 15:28:36 -0700
Message-ID: <20250919222836.82407-1-daniel.charles@intel.com>
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

when running cm job, it could be that after the fence is checked, a
CAT_ERROR will throw an error in the same way as GT_RESET does.

Signed-off-by: Daniel Charles <daniel.charles@intel.com>
---
 tests/intel/xe_exec_reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
index 7ae53c679..73c5c7e20 100644
--- a/tests/intel/xe_exec_reset.c
+++ b/tests/intel/xe_exec_reset.c
@@ -433,7 +433,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
 
 		err = __xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
 				       exec_queues[i % n_exec_queues], &timeout);
-		if (flags & GT_RESET)
+		if (flags & GT_RESET || flags & CAT_ERROR)
 			/* exec races with reset: may return -EIO or complete */
 			igt_assert(err == -EIO || !err);
 		else
-- 
2.43.0

