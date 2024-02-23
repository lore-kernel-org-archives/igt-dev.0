Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30D4C54798
	for <igt-dev@archiver.kernel.org>; Fri, 23 Feb 2024 23:15:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA7210E0C1;
	Fri, 23 Feb 2024 23:15:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XJIqYqAt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B52B10ECEB
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Feb 2024 23:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708730119; x=1740266119;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HC0pJqMTa3TMpDXpX5K1R9HorKbaoSdQxB53JsiXpcg=;
 b=XJIqYqAtpT439hKNkO8sRHMkzaL4UMYezWLRobqH9wqWp1RZRHILQwM8
 5vX6DK6g65UmYsrf6fH4iNmV73sCyZnR1RjByQRDGdJ2JCQjqfCXUCtFa
 XdI9NPqgwXKIIak8e1mHeoPh0ysR5C5c6l3Sav22d5bnnDDUyH1PbZ96l
 Z3UVtm3oVVIxRrLM5heYbS7k5RSF5QbZB91aapgyRgSEn0pVQE5QG1R5Q
 IdAios6BZ7S+bUz/aoTxiEtXbHeknitGgdIYD+KXiM0vjOnTO+UhYgpvB
 +YJ14ghEnrIGvlrsk/68mjkD4vs4ujKGyIIJWsA8fob5u5Psx5SlcPox/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="25545479"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; d="scan'208";a="25545479"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 15:15:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6257151"
Received: from dut-internal-9dd7.jf.intel.com ([10.165.21.194])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 15:15:07 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jonathan.cavitt@intel.com, saurabhg.gupta@intel.com,
 matthew.brost@intel.com
Subject: [PATCH i-g-t 1/2] tests/xe_spin_batch: Correct xe_vm_bind_async usage
Date: Fri, 23 Feb 2024 15:04:06 -0800
Message-Id: <20240223230407.1712361-2-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240223230407.1712361-1-jonathan.cavitt@intel.com>
References: <20240223230407.1712361-1-jonathan.cavitt@intel.com>
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

The third parameter of xe_vm_bind_async is the exec_queue id, not the gt
id.  Set it to 0 in the preempter, as there should not be an exec_queue
at the time of execution.

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
---
 tests/intel/xe_spin_batch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
index c183063507..faf569baf8 100644
--- a/tests/intel/xe_spin_batch.c
+++ b/tests/intel/xe_spin_batch.c
@@ -198,7 +198,7 @@ static void preempter(int fd, struct drm_xe_engine_class_instance *hwe)
 			  vram_if_possible(fd, hwe->gt_id),
 			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 
-	xe_vm_bind_async(fd, vm, hwe->gt_id, bo, 0, addr, bo_size, &sync, 1);
+	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, &sync, 1);
 	data = xe_bo_map(fd, bo, bo_size);
 	store_dword_batch(data, addr, value);
 
-- 
2.25.1

