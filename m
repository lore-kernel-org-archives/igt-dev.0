Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0673D60D08
	for <igt-dev@archiver.kernel.org>; Mon, 18 Nov 2024 23:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB5210E574;
	Mon, 18 Nov 2024 23:36:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RAztSuQv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C8E10E56A
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Nov 2024 23:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731972959; x=1763508959;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Qor/rz+zhJl8ucNnVdsiBtpFdqatd8c7wJgJh3n3K7A=;
 b=RAztSuQvjIqdC8UpzggqTFgxwM7caT2RuQ4JP1tnhN4tSoq5z+IB6Fan
 HuBJtpOdgilVGzPtyoYgefJgfVg1dqgllfKI5vQSmkuyhynB/AaVOM58c
 CA2McSw+Jv+Jz6n/R0VnzFm+LOs4Ry2DkyK9IXLFE7ZPmVzyFSKxkRYUz
 VZDflzCg9bdbmKsTYD9OV411TEvAasgj1+yGk+yRPQCOA1lPfo+Sh4jAL
 7Yx6RzecDuYvQimH/ectKyXoDW/xphy+g+sp6wlTYqHxG8UJGsLB7op+o
 Pot9epMhueg97z16mq+QsNdM7b5RhykDJkZ7baNbVBsYk7ZmLKPOJFC2B g==;
X-CSE-ConnectionGUID: WPaAss7kT4Kfo7eNtPOa5g==
X-CSE-MsgGUID: aC9A3WO/R2qt+SUzRhYzHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="54451254"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="54451254"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:58 -0800
X-CSE-ConnectionGUID: wWy+WenxRJ+lwJJGLDhkAw==
X-CSE-MsgGUID: sPN9ud10TCSvJ3sWSFoM8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="120245250"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 15:35:49 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [RFC PATCH 26/29] drm/xe: Always wait on preempt fences in
 vma_check_userptr
Date: Mon, 18 Nov 2024 15:36:17 -0800
Message-Id: <20241118233620.2373819-27-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118233620.2373819-1-matthew.brost@intel.com>
References: <20241118233620.2373819-1-matthew.brost@intel.com>
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

The assumption only a VM in preempt fence mode has preempt fences
attached is not true, preempt fences can be attached to a dma-resv VM if
user queues are open.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_pt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
index a75667346ab3..1efe17b0b1f8 100644
--- a/drivers/gpu/drm/xe/xe_pt.c
+++ b/drivers/gpu/drm/xe/xe_pt.c
@@ -1231,7 +1231,7 @@ static int vma_check_userptr(struct xe_vm *vm, struct xe_vma *vma,
 			       &vm->userptr.invalidated);
 		spin_unlock(&vm->userptr.invalidated_lock);
 
-		if (xe_vm_in_preempt_fence_mode(vm)) {
+		if (vm->preempt.num_exec_queues) {
 			struct dma_resv_iter cursor;
 			struct dma_fence *fence;
 			long err;
-- 
2.34.1

