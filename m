Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75275E9D418
	for <igt-dev@archiver.kernel.org>; Wed,  4 Feb 2026 16:58:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B8A10E6E9;
	Wed,  4 Feb 2026 16:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aPtiwjYg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 630DD10E6E7
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Feb 2026 16:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770224285; x=1801760285;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JQmCRgzEt+5hLa98U/IbWHVJ3MOQJTlXUn1Acqcu+fo=;
 b=aPtiwjYgq7zVC5daaXt7iezHeuRpnQ6fDcLPO1Pi9rxyBPZKooUkAFp7
 Nqz33Ax7lmKTM8ZS7m9OhujJzzHHzEOeLEVeH2R4QuwRtdxM8CntKz49h
 dtE1mg+QlGVq0/GupOkGPItnm+zzLVPT9xFhS+XLozxPQP7fXCuCiKSIB
 pAbdu1ir/Y7GagZOV4OQKEMP2z4MpQdSb1il4rG80RYHtPzJ7dWAuuzkE
 sBFRUOXDhAI5OOO5O+Qj48Lp9oPgVHOuA4OlCZTThIpOG/zc+hVyjhP5f
 XppHK/Bmd5Gr7DoGMVsF6KPcd/Dst2IS3irLTHeBq9kjHtiuT1k/gfMge Q==;
X-CSE-ConnectionGUID: JGTyY4/HRii2NLw9wOGVTA==
X-CSE-MsgGUID: JzrTn9oWR+mlMbmcnQZmyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71580020"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="71580020"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:57:45 -0800
X-CSE-ConnectionGUID: KPk9OsxGRgOhncq/2Je33A==
X-CSE-MsgGUID: 8kO66vjvTCqY/TlnZh30kA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="210252864"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:57:42 -0800
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, suraj.kandpal@intel.com,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v8 0/9] Add writeback changes for intel-supported formats
Date: Wed,  4 Feb 2026 22:48:09 +0530
Message-ID: <20260204171819.292327-1-sowmiya.s@intel.com>
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

This series introduces validation for writeback functionality
across newly supported formats specific to Intel platforms.
existing functions with limited format support were retained
for compatibility. After validating new formats introduced by
the platform, additional format support was added to the
writeback test suite. Subtests leveraging common framebuffer
creation logic were consolidated and dynamic subtest generation
was implemented to efficiently handle format-specific variations.
Add negative test cases to validate format and mode.Refactored
existing test cases to improve efficiency.Add helper function
to get the default format.

 lib/igt_fb.c          |  39 +++++++-
 lib/igt_fb.h          |   1 +
 tests/kms_writeback.c | 211 +++++++++++++++++++++++++-----------------
 3 files changed, 162 insertions(+), 89 deletions(-)

-- 
2.43.0

