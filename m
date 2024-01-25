Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D16C47258
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 10:57:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E2D110E870;
	Thu, 25 Jan 2024 10:57:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB7AA10E870
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 10:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706180233; x=1737716233;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sKQjz/ulYNPusVec6TtW92KimEFotEqn8JSjcNRnqx8=;
 b=MjDrPR+h7POt5DdfWR5Gl6AlAJCK1uaETtBxHs6z6fGf+vBhvRsGP56L
 ulng/PeF2fZTyUKatW6Q8M5PbSuNZ2gUaRFd7YB0SO1kW6b4xz4ztgebl
 Oxw9OdcZ8S/qswB5ZneCVzcMJoQgz4zTht21doD8QJTj8CESLKMxKKIO8
 800oJsrc/gZjMBoI/3olyJ6kiBxoZ4VeOdw6wbbMk4k2hgEtxOro4DzaX
 sX+ohMSshiX/VegSC64s+UONVYG8uk21MLdMDnHwUN+YIjVY+WM8a6Y5y
 Vv1TLZ39FvbODpWC70myxy73D6UuiGWIF9lf/V4auxXoS+2pi0frmLhbe Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="433283698"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="433283698"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 02:57:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2365559"
Received: from cdeburca-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.15.173])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 02:57:11 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 4/7] benchmarks/gem_wsim: use xe_bb_size() helper
Date: Thu, 25 Jan 2024 10:56:42 +0000
Message-ID: <20240125105646.313561-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125105646.313561-1-matthew.auld@intel.com>
References: <20240125105646.313561-1-matthew.auld@intel.com>
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

No need to open code this anymore.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 benchmarks/gem_wsim.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 955b6799e..b11225b28 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -1743,8 +1743,7 @@ xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
 	struct dep_entry *dep;
 	int i;
 
-	w->bb_size = ALIGN(PAGE_SIZE + xe_cs_prefetch_size(fd),
-			   xe_get_default_alignment(fd));
+	w->bb_size = xe_bb_size(fd, PAGE_SIZE);
 	w->bb_handle = xe_bo_create(fd, vm->id, w->bb_size,
 				    vram_if_possible(fd, eq->hwe_list[0].gt_id),
 				    DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
-- 
2.43.0

