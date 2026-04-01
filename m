Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBD110FCAE8
	for <igt-dev@archiver.kernel.org>; Wed,  1 Apr 2026 22:32:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58C210ECFA;
	Wed,  1 Apr 2026 22:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VXZlIbP9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59B910ECFA
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Apr 2026 22:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775082741; x=1806618741;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=K+mBTi1rcEUwmFoziohZslWhKwndeBKijElYejdlD9U=;
 b=VXZlIbP9ypdvXpfpYcdKlKEEcWasUS8XElJlV3uv0XQi9f77HldSQ+TV
 TZ1BnbruDMolnXnuB4Yy46/9sy900J2wwIP3obZPlk8Nto47Y6NwMffJP
 AjEtwX6ii3rotW7+FerO0ZyzD2MBdvHfgHehn4t2+M9JpU29EIppY3x8x
 ccrA8efofQQDWWrR3GMrXvlJXChGXK42nxRYFRencox0p9RmOBEodGhAW
 0cbrfY7S8BCfC5fvgD2EZh1NY9BaKIJ8PqytvFKSeTdcjYr8MWVEyHdkG
 tfSu31Vk3TquYOpd1hBykTuUo/kMFhC+xWpi5s8hsgOwuehtkG9wg/khI g==;
X-CSE-ConnectionGUID: 5sBye1CpRBaYT7OxBPRS/Q==
X-CSE-MsgGUID: owvTGb72Ta2sfT742dWa/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="75173230"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; d="scan'208";a="75173230"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 15:32:20 -0700
X-CSE-ConnectionGUID: rRPreCEXSRi7ebwRglxoFA==
X-CSE-MsgGUID: MifBOt+yTlGE8aM8fW8AWg==
X-ExtLoop1: 1
Received: from orsosgc001.jf.intel.com ([10.88.27.185])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2026 15:32:21 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_oa: Use MAP_FAILED for mmap failures
Date: Wed,  1 Apr 2026 15:32:15 -0700
Message-ID: <20260401223215.111418-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.48.1
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

Detect mmap failure using MAP_FAILED instead of NULL.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 tests/intel/xe_oa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_oa.c b/tests/intel/xe_oa.c
index 387f29535e..9444f70cd6 100644
--- a/tests/intel/xe_oa.c
+++ b/tests/intel/xe_oa.c
@@ -4367,7 +4367,7 @@ static void *map_oa_buffer(u32 *size)
 {
 	void *vaddr = mmap(0, default_oa_buffer_size, PROT_READ, MAP_PRIVATE, stream_fd, 0);
 
-	igt_assert(vaddr != NULL);
+	igt_assert(vaddr != MAP_FAILED);
 	*size = default_oa_buffer_size;
 	return vaddr;
 }
-- 
2.48.1

