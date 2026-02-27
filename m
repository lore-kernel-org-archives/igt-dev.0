Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6D9FEFB54
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 14:27:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B029C10E190;
	Fri, 27 Feb 2026 14:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jfzVvzRt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C2310E190
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 14:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772202427; x=1803738427;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tDCJJvpwy+PGGOSaXu1SkAiyDISo/Z5GdXYst3FAatQ=;
 b=jfzVvzRtO5zKRy+p1gtfp8q62Z1o4paGp40ElXTyZYMu6ogIx9YrA/rA
 Yw1vaEjANVZLM2wAfNzQS4MyGlKeBN44hAOBtLzS7DDxmhxj4RasG1hO6
 KNg9puW9ev4cDvchEd9GIpupU90/r6egkM+pKkDYB19AHXOC/fCNtp8Xn
 0te7DP+HnFk8TJhY70U/UCIGASk/N2wVF+ai26fwRV9AdHD6F7IA/uw/l
 8NtvvKdQGVa5TCT8OHCybqwWwLU1m+B6RPXki0g1ZxQKut6lx4IPyexom
 +SSf6Cb58Bp8YTeyHTX0iN+NfWDS0ecPevaHDt9YL+Ur4u7tgF58w1CQi A==;
X-CSE-ConnectionGUID: ul9bQ4gXSjW5Tx5e9A1xzA==
X-CSE-MsgGUID: qi3wPdgNTPiPf7PuXCho/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="73157023"
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="73157023"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 06:27:07 -0800
X-CSE-ConnectionGUID: VDaoP7VGSS2W7IQn8GmR7Q==
X-CSE-MsgGUID: BY5jLQAWTAWpXq32ilM1QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,314,1763452800"; d="scan'208";a="214757264"
Received: from art-dev-395.igk.intel.com ([10.211.135.233])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 06:27:05 -0800
From: Jan Maslak <jan.maslak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: maciej.patelczyk@intel.com,
	Jan Maslak <jan.maslak@intel.com>
Subject: [PATCH 0/1] tests/intel/xe_eudebug: Add basic-vm-bind-ufence-no-ack
 test
Date: Fri, 27 Feb 2026 15:26:37 +0100
Message-Id: <20260227142638.3264013-1-jan.maslak@intel.com>
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

Jan Maslak (1):
  tests/intel/xe_eudebug: Add basic-vm-bind-ufence-no-ack test

 tests/intel/xe_eudebug.c | 144 +++++++++++++++++++++++++++++++++------
 1 file changed, 124 insertions(+), 20 deletions(-)

-- 
2.34.1

