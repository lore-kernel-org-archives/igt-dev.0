Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8982C77B7C
	for <igt-dev@archiver.kernel.org>; Thu,  3 Jul 2025 06:30:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E1F10E7C7;
	Thu,  3 Jul 2025 06:30:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cgt7KM5B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA2E10E7C5
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jul 2025 06:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751524240; x=1783060240;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LVLM/t4SLt0pytIUamVHrRoz9dJNCFJFgOURD+1ZKAA=;
 b=Cgt7KM5BKDmehgdv+hLzBuFvgA/u0GOgto9WhuEzAPqmAPeBPV6YV392
 2UQ3nhh96ahg+7tOuzC0lXYDqI37oRrSHCSDOGkIOykKerRxfZg3AJu2U
 ZAvE3KBa+vBdQ6P4itWjnmiyJVziaoAL76MPYr+dIO1zb7FX8u5ExbUIz
 Ogs7bD9EJO16vtF//gZY39oeSS7zrvcGzDyuIXTsWRH0J7c6wCtGqfmBd
 FbPQVabVXwpfnX+ADExhgC8WT16YbCnJNUB3EokJdnjpPOOOyJoiHdOqx
 qrAtwPKvFNISutWPBOfkGONWGBcUh0knnxj047lLyD8eVfo8iNKX/9Vms w==;
X-CSE-ConnectionGUID: LtlgQmNbRyi+P+eNU6f/JA==
X-CSE-MsgGUID: 7b4+LhDLRRGbhfODZ/LFyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64886365"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="64886365"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 23:30:40 -0700
X-CSE-ConnectionGUID: fyZhzXz/RcqPf6ynpZvh1Q==
X-CSE-MsgGUID: CJDgocybS9imzJRrGlGtsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; d="scan'208";a="154635794"
Received: from savramon-mobl1 (HELO localhost) ([10.245.244.83])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 23:30:39 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t 1/3] lib/intel_mocs: fix wb mocs entry for MTL
Date: Thu,  3 Jul 2025 08:30:34 +0200
Message-ID: <20250703063032.553963-6-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250703063032.553963-5-zbigniew.kempczynski@intel.com>
References: <20250703063032.553963-5-zbigniew.kempczynski@intel.com>
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

Likely there was some typo when adding mocs for MTL. Valid
entry for WB is equal 1, not 10.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 lib/intel_mocs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/intel_mocs.c b/lib/intel_mocs.c
index 5698c6cca0..e0c33c31c0 100644
--- a/lib/intel_mocs.c
+++ b/lib/intel_mocs.c
@@ -29,7 +29,7 @@ static void get_mocs_index(int fd, struct drm_intel_mocs_index *mocs)
 		mocs->defer_to_pat_index = 0;
 	} else if (IS_METEORLAKE(devid)) {
 		mocs->uc_index = 5;
-		mocs->wb_index = 10;
+		mocs->wb_index = 1;
 	} else if (IS_DG2(devid)) {
 		mocs->uc_index = 1;
 		mocs->wb_index = 3;
-- 
2.43.0

