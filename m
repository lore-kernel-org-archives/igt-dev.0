Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBD5C9EC88
	for <igt-dev@archiver.kernel.org>; Mon, 12 Jan 2026 13:01:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D5A10E3C8;
	Mon, 12 Jan 2026 13:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="id8KGH3X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE7210E3C8
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Jan 2026 13:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768222860; x=1799758860;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SvkeLU7D8x6VypMAUu2VElrwBFtdYo8zJiPDZy/Mrqo=;
 b=id8KGH3XAp4/sBNcmMqngpEtEXojnyK1fV5UV8k9moPVxc42fAFtDTuO
 dpI1jZCytP+8GyUaemud/vhIJmp+QiRSTOYrSoCinq609v2he5PQxRd29
 Hjl06nZEBmhqyIJ4qZh/ma/oyfeH52P4XuWZMpAorHy1W2avRArQKWhpb
 0lTSEVM3/YX/w0ofmiqaV/X8hCt75/Xc3E1RFNoD8s7FhwRfRUiXDJ4cR
 3cv1Q5/EZpI6B+Z9Eiq3QYAJAIn82bpxPDcQGygwSJJG1wi5G/XKuVWAG
 7VBmbMH1oLCcUEWbaK1PhMY8zJ+rwgYc3rqmMvNlRHgDAc1NYue4cerac Q==;
X-CSE-ConnectionGUID: 1wokVmJ3RL+8fm5hNEiQzQ==
X-CSE-MsgGUID: 3eeFZSD/R3KwTQRb9rVMeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69545564"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="69545564"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:00:55 -0800
X-CSE-ConnectionGUID: mbRACkD4SMeYKW5mwaLBDg==
X-CSE-MsgGUID: PWy+reQ2TpyDwZ5mCPO2zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="204095022"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 mkuoppal-desk.home.arpa) ([10.245.246.240])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 05:00:53 -0800
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: christoph.manszewski@intel.com, dominik.karol.piatkowski@intel.com,
 maciej.patelczyk@intel.com, jan.maslak@intel.com,
 zbigniew.kempczynski@intel.com,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: [PATCH i-g-t 13/21] tests/xe_eudebug: Adapt vm-bind-clear* subtests
 to debug data
Date: Mon, 12 Jan 2026 14:59:59 +0200
Message-ID: <20260112130008.1649357-14-mika.kuoppala@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112130008.1649357-1-mika.kuoppala@linux.intel.com>
References: <20260112130008.1649357-1-mika.kuoppala@linux.intel.com>
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

From: Christoph Manszewski <christoph.manszewski@intel.com>

EU debug no longer relays events for VM_BIND_OP_[MAP|UNMAP] operations.
Instead it reports newly added 'VM_BIND_OP_DEBUG_DATA_[ADD|REMOVE]'
operations through the event interface. Convert the vm-bind-clear*
subtests by appending the newly added ops to each regular map/unmap
operation.

Signed-off-by: Christoph Manszewski <christoph.manszewski@intel.com>
Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 tests/intel/xe_eudebug.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/tests/intel/xe_eudebug.c b/tests/intel/xe_eudebug.c
index fed9a47405..3cd1f61f7b 100644
--- a/tests/intel/xe_eudebug.c
+++ b/tests/intel/xe_eudebug.c
@@ -2030,8 +2030,10 @@ static void *vm_bind_clear_thread(void *data)
 		clean_bo = xe_bo_create(c->fd, vm, bo_size, priv->region,
 					DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		memset(fence_data, 0, sizeof(*fence_data));
-		xe_eudebug_client_vm_bind_flags(c, vm, clean_bo, 0, clean_offset, bo_size,
-						0, &uf_sync, 1, 0);
+		xe_eudebug_client_vm_bind_map_with_debug_data(c, vm, clean_offset, bo_size,
+							      clean_bo, 0, NULL,
+							      DRM_XE_VM_BIND_DEBUG_DATA_PSEUDO_MODULE_AREA,
+							      0, &uf_sync, 1);
 		xe_wait_ufence(c->fd, fence_data, uf_sync.timeline_value, 0,
 			       XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * NSEC_PER_SEC);
 
@@ -2039,8 +2041,10 @@ static void *vm_bind_clear_thread(void *data)
 		batch_bo = xe_bo_create(c->fd, vm, bo_size, priv->region,
 					DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
 		memset(fence_data, 0, sizeof(*fence_data));
-		xe_eudebug_client_vm_bind_flags(c, vm, batch_bo, 0, batch_offset, bo_size,
-						0, &uf_sync, 1, 0);
+		xe_eudebug_client_vm_bind_map_with_debug_data(c, vm, batch_offset, bo_size,
+							      batch_bo, 0, NULL,
+							      DRM_XE_VM_BIND_DEBUG_DATA_PSEUDO_MODULE_AREA,
+							      0, &uf_sync, 1);
 		xe_wait_ufence(c->fd, fence_data, uf_sync.timeline_value, 0,
 			       XE_EUDEBUG_DEFAULT_TIMEOUT_SEC * NSEC_PER_SEC);
 
@@ -2077,10 +2081,10 @@ static void *vm_bind_clear_thread(void *data)
 		xe_eudebug_client_exec_queue_destroy(c, &eq_create);
 		munmap(map, bo_size);
 
-		xe_eudebug_client_vm_unbind(c, vm, 0, batch_offset, bo_size);
+		xe_eudebug_client_vm_bind_unmap_with_debug_data(c, vm, batch_offset, bo_size);
 		gem_close(c->fd, batch_bo);
 
-		xe_eudebug_client_vm_unbind(c, vm, 0, clean_offset, bo_size);
+		xe_eudebug_client_vm_bind_unmap_with_debug_data(c, vm, clean_offset, bo_size);
 		gem_close(c->fd, clean_bo);
 
 		count++;
-- 
2.43.0

