Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC96C83F17
	for <igt-dev@archiver.kernel.org>; Wed, 23 Jul 2025 10:15:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 334F610E138;
	Wed, 23 Jul 2025 10:15:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LEAI2QGO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91DB210E138
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jul 2025 10:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753265735; x=1784801735;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jZi8JueA1kjXJ8X/6IGxHaKf2kIHOgPZ+B8cswZvJbs=;
 b=LEAI2QGOElH1MBKC6vAEewnDalVBmHtCHbOxd5ZZxB3zIC5I/CLeD7Tl
 cGrWNNSd9lelF6cfzDPZmIq+5A/ql50vOhPtXVMc/832We1MvKv0tjle8
 EZPsW3lt9YnxpveD5IjTMY82VeD5OGaJRGrrcH+UIHxBsoZwq7JmFHigW
 u9W1E1mnrxa1kcTMruy7guD/+fQMdjDPGjCnUYfouQCUi47PQ/qYz6zKg
 1TEXYsQh+o4A7c8LEbhrXVQQ/in8zuUw1bvXOcjX4ekBLgls6ZngSvtIt
 hVOYNSMcHW3zchhnN3BTa7TG4kpTOxQKVtSiQyzy3x0UNB1YysND15/VZ w==;
X-CSE-ConnectionGUID: VBZUPOPuR/OGkKMlkUURDQ==
X-CSE-MsgGUID: QK1LaqkuRBS30aKqrGv2Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="65803630"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="65803630"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 03:15:35 -0700
X-CSE-ConnectionGUID: U2g/qSBgTfmMxzxvtz+tHw==
X-CSE-MsgGUID: H5vkIn+1QLCWTFK/A3nWDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="159458758"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 03:15:32 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] kms_debugfs: Add missing free()
Date: Wed, 23 Jul 2025 12:15:19 +0200
Message-ID: <20250723101519.29940-1-peter.senna@linux.intel.com>
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

Commit ebe65a923a2b ("tests: Add kms_debugfs") introduced a new test.
Unfortunately that commit missed a call to free(display) during the
cleanup.

Fixes: ebe65a923a2b ("tests: Add kms_debugfs")
Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 tests/kms_debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/kms_debugfs.c b/tests/kms_debugfs.c
index 75ef15353..25134e941 100644
--- a/tests/kms_debugfs.c
+++ b/tests/kms_debugfs.c
@@ -129,6 +129,7 @@ igt_main
 
 	igt_fixture {
 		igt_display_fini(display);
+		free(display);
 		close(debugfs);
 		drm_close_driver(fd);
 	}
-- 
2.43.0

