Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA50E7717D
	for <igt-dev@archiver.kernel.org>; Wed, 11 Dec 2024 19:18:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A56A10EBF6;
	Wed, 11 Dec 2024 19:18:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LGjVKigg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777E310EBF6
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Dec 2024 19:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733944679; x=1765480679;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a3MSj1aS4WYWu4yoL2R8w87aJQh8hGcQyVVo4XzVkuo=;
 b=LGjVKiggdk8f98AvlM8acVMj5b+PpSff3VtIo6oogsedYKkPDKAvdACo
 yLXM/AtRs6Z9KmCvID/8rTM3RpWnpidQ9WuIBs1NSiJ7VUomtcc+RqLS2
 PZ2OADB6ZahustopBeonmkFsFizyj2FnSpjAbB+VueiLi23X7gPKGPZL0
 QkirtMZSmsDz6l3en5Ua5Vubro6bgjMactPDlNUpgmNge0O3yUeia4JG9
 2I4MxWGXL0VyxE8w1CnRyyJ3FHOTxYwwQQ8FtSg1AIRisxm/+aoB/1TEM
 wMxnvgaxuIhoHlmZ3S5dN+MeJtPNd6gYP9GR9YOpp2mNdfolSCU4A6fb7 A==;
X-CSE-ConnectionGUID: /SJcWaedQN22l4JFpDs/sQ==
X-CSE-MsgGUID: usfMrxNwQb28kdN8/jdPBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11283"; a="38027325"
X-IronPort-AV: E=Sophos;i="6.12,226,1728975600"; d="scan'208";a="38027325"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 11:17:59 -0800
X-CSE-ConnectionGUID: 7rz42aMZRvG0vC9Kwsj+jg==
X-CSE-MsgGUID: HDqBmZo+RWy47EvLZq0O9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="126883712"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.245.246.37])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2024 11:17:57 -0800
From: Christoph Manszewski <christoph.manszewski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Dominik=20Karol=20Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@intel.com>, 
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 Christoph Manszewski <christoph.manszewski@intel.com>
Subject: [PATCH i-g-t 1/2] tests/xe_eudebug: Set NEEDS_VISIBLE_VRAM for
 'create_bind_list'
Date: Wed, 11 Dec 2024 20:17:40 +0100
Message-Id: <20241211191741.36973-1-christoph.manszewski@intel.com>
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

The 'create_bind_list' function supports custom bo placement. Some subtests
like 'basic-vm-access' can request vram placement and use xe_bo_map
without setting the 'NEEDS_VISIBLE_VRAM' flag, which can result in a
segmentation fault. Enable the 'NEEDS_VISIBLE_VRAM' flag by default, since
the 'xe_bo_map' igt funtion unsets it automatically for non vram backed
bos.

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
---
 tests/intel/xe_eudebug.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index 39db16457..22b0da658 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -241,7 +241,8 @@ static union buf_id *vm_create_objects(int fd, uint32_t bo_placement, uint32_t v
 
 	for (i = 0; i < n; i++) {
 		if (bo_placement) {
-			bo[i].fd = xe_bo_create(fd, vm, size, bo_placement, 0);
+			bo[i].fd = xe_bo_create(fd, vm, size, bo_placement,
+						DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 			igt_assert(bo[i].fd);
 		} else {
 			bo[i].userptr = aligned_alloc(PAGE_SIZE, size);
-- 
2.34.1

