Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74801CD5BC9
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 03:44:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0184010E63F;
	Wed, 27 May 2026 03:44:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XPZqRqsT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6CC10E63F
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 03:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779853431; x=1811389431;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mS8F83vYuFOQvGo0rodhOdJEKiE2k/6KpRw+HXM1slg=;
 b=XPZqRqsTYjG0ZwvS46YEbcz3aXguqcgoRIJT3Nqcs6tXMs0XhJQY2tSq
 NPiYjtPHf7zl8xYxLIvVJAwgM3WXP4pVrvInN0t99Hqf66qI56PtkNq56
 +0QbrLxH1xQZUnRz9xI55IFXpoKvWoFEz92DIvnXJNyU91mrnAaYmy/wN
 /AfAVKYV2qKeyfXMiP7N+NCa8fu7cuz38t8zzCNOj40WmXk2mX2zlAoq2
 S8b8WvwJ4t8ulzZfTzK20RQclKKrOJYaNfr+gy8VBh+YFDZs2EBbyEaVk
 59nj8UGyXgoBDkld1dnw267FxIDGey7UIraaeVkJD3JUL+qzyuzOnA5r+ g==;
X-CSE-ConnectionGUID: KTm8+yTjTTqQ84X5DadNNA==
X-CSE-MsgGUID: yL9QielfRzK5Zjg786FJsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="91782327"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="91782327"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 20:43:50 -0700
X-CSE-ConnectionGUID: 2Sx6Gz3wSVa+YPS3y5SkNg==
X-CSE-MsgGUID: 7YGVke52TemCyfXto0pX2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; d="scan'208";a="235748993"
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2026 20:43:46 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: gustavo.sousa@intel.com,
	ngai-mint.kwan@intel.com
Subject: [PATCH i-g-t] lib/intel_wa: Return false for non-root users
Date: Tue, 26 May 2026 20:43:42 -0700
Message-ID: <20260527034342.1952153-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.54.0
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

Under some circurmstancs debugfs reads are initiated by non-root users. In
these cases, just return false rather than asserting that debugfs could not
be read.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/intel_wa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/intel_wa.c b/lib/intel_wa.c
index a16ea62a4c..2d0d664f3c 100644
--- a/lib/intel_wa.c
+++ b/lib/intel_wa.c
@@ -47,6 +47,10 @@ bool igt_has_intel_wa(int drm_fd, const char *check_wa)
 	unsigned int xe;
 	char name[256];
 
+	/* If we are not root, we can't read debugfs, just return false */
+	if (getuid() != 0)
+		return false;
+
 	debugfs_fd = igt_debugfs_dir(drm_fd);
 	igt_assert(debugfs_fd >= 0);
 
-- 
2.54.0

