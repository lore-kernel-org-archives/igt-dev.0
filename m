Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CDFAC04FFE
	for <igt-dev@archiver.kernel.org>; Fri, 12 Apr 2024 09:15:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A58A10F53F;
	Fri, 12 Apr 2024 09:15:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VTQVbdAI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06CB10F537
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Apr 2024 09:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712913326; x=1744449326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pG8DV5LgKE3NHvCwqJdG30pbXe4pCuQQnQboN873jtU=;
 b=VTQVbdAIcou/quIiqnX09ud1uDHTAaLYRVbZOKLMycs5u7IykIRa1U1V
 G6VtIo7bR7qM2J5+eapOeQp6BLWhIAfdKBNEs1AIOL2fgmPh0jgzBk+uf
 ppo0ZJ12qUhPrDwTGxz69sgDwhx+1l+z1YxHBLQAaiRIPwP64CFng3Nxh
 aSL/yBa8LK0wY5YD850a50ttMS9VwVReCQ4jeRvaaSZ2D2d8jIY9s7tIX
 t2XsMgfJsVVfluz1xB4Jfzt9b3pGkH0kk4EwiFFbRwNuHYChvOosul/iY
 KiJaVMSGRakVVaZYxFmwm5X4A9xx7uXmJ8+hOMekPtPp2e+xg59ds9DW/ w==;
X-CSE-ConnectionGUID: bNwDISO4Sz6R104UOKX3gQ==
X-CSE-MsgGUID: CNxI9vDrSNmceid1YXcf/Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="12146417"
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="12146417"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:15:19 -0700
X-CSE-ConnectionGUID: aLKd8+aoQniPgifrs8ER6Q==
X-CSE-MsgGUID: SbFP7qnPRSKspf1Ez5UoHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,195,1708416000"; d="scan'208";a="21165136"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 02:15:18 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH i-g-t 3/4] tests/intel/xe_exec_atomic: Use new vm bind flag
Date: Fri, 12 Apr 2024 11:01:16 +0200
Message-ID: <20240412090117.32727-4-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240412090117.32727-1-nirmoy.das@intel.com>
References: <20240412090117.32727-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Organization: Intel Deutschland GmbH, Registered Address: Am Campeon 10,
 85579 Neubiberg, Germany,
 Commercial Register: Amtsgericht Muenchen HRB 186928 
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

Use new vm bind flag to probe device atomics support.

Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
---
 tests/intel/xe_exec_atomic.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
index d9790da78..1ec149ca1 100644
--- a/tests/intel/xe_exec_atomic.c
+++ b/tests/intel/xe_exec_atomic.c
@@ -85,7 +85,8 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 
 	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
 	bind_engine = xe_bind_exec_queue_create(fd, vm, 0);
-	xe_vm_bind_async(fd, vm, bind_engine, bo, 0, addr, bo_size, &sync, 1);
+	xe_vm_bind_async_flags(fd, vm, bind_engine, bo, 0, addr, bo_size,
+			       &sync, 1, DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS);
 	data = xe_bo_mmap_ext(fd, bo, bo_size, PROT_READ|PROT_WRITE);
 	data->data = value;
 
@@ -112,9 +113,10 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 
 static bool has_atomics(int fd, uint32_t region)
 {
-	/* System memory atomics on dGPU is not functional as of now */
-	if (region == system_memory(fd) && xe_has_vram(fd))
-		return false;
+	struct drm_xe_query_config *config = xe_config(fd);
+
+	if (region == system_memory(fd))
+		return !!config->info[DRM_XE_QUERY_CONFIG_VA_BITS];
 
 	return true;
 }
-- 
2.42.0

