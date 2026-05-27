Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2AB9CD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 27 May 2026 21:01:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB6710E2A6;
	Wed, 27 May 2026 21:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PjBxJthF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4FE810E34E
 for <igt-dev@lists.freedesktop.org>; Wed, 27 May 2026 21:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779915655; x=1811451655;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9NExBCBGcZvw0yA+bXxbEyc6I+quSPjiY53418ydScI=;
 b=PjBxJthFWw/poJkUBUbKqLWzgMzDmJRHu5vM97pGVl5w5an8QGgdFrlA
 fQ38KhXM1DO3aV3OrfZB7rXAwUuUCIVipDsZ/6ryac+t/vQQqLYq5Ncxk
 LL0MiqZ73ZtHL86ocTrrJOppuryfp+7FfOVZgsSt0wRwOsIYvgHML7Lzh
 rARhKwiniF1VtFT3b/Lm7EHBCbs6H7gPnX4kp2kCFgfrnFEzkN560yEPf
 Nnn5keOuemAVsqfdRRKR//ABMlfrklahIoCs5opobYOwgq7tNdZuf5LOz
 fSq5L6Vy2WyqMTubgfS9LEgNV+d+FP1c9OSIVAPG5FtI73X33P7rX+rJk w==;
X-CSE-ConnectionGUID: yXT60IIIQIuWd3MyrPE4ZA==
X-CSE-MsgGUID: 9/MBup1NQgmW5bTSZUg7xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="80869904"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="80869904"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2026 14:00:54 -0700
X-CSE-ConnectionGUID: iM/Jzd9nR9K6trnT4/kh9A==
X-CSE-MsgGUID: Era8oil8QQWeXzh1W8+nRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; d="scan'208";a="244172209"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by fmviesa004.fm.intel.com with ESMTP; 27 May 2026 14:00:54 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jia.yao@intel.com, x.wang@intel.com, kamil.konieczny@linux.intel.com,
 Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH i-g-t 1/2] intel-ci: Add pat-index-auto to Xe BAT testlist
Date: Wed, 27 May 2026 21:00:51 +0000
Message-ID: <20260527210052.161768-2-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527210052.161768-1-zongyao.bai@intel.com>
References: <20260527210052.161768-1-zongyao.bai@intel.com>
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

Add igt@xe_pat@pat-index-auto to xe.fast-feedback.testlist so that
the new dynamic PAT index subtest is included in Xe BAT runs.

Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 tests/intel-ci/xe.fast-feedback.testlist | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel-ci/xe.fast-feedback.testlist b/tests/intel-ci/xe.fast-feedback.testlist
index acff025fa..6851c1f49 100644
--- a/tests/intel-ci/xe.fast-feedback.testlist
+++ b/tests/intel-ci/xe.fast-feedback.testlist
@@ -211,6 +211,7 @@ igt@xe_pat@pat-index-xelp
 igt@xe_pat@pat-index-xehpc
 igt@xe_pat@pat-index-xelpg
 igt@xe_pat@pat-index-xe2
+igt@xe_pat@pat-index-auto
 igt@xe_waitfence@abstime
 igt@xe_waitfence@engine
 igt@xe_waitfence@reltime
-- 
2.43.0

