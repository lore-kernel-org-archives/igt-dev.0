Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4C6CD128A
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 17:14:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E2810ED4A;
	Wed, 10 Apr 2024 17:14:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hbncPRRm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB5B910ED47
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 17:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712769280; x=1744305280;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7w999hcNzl22z+eXCXbws0cLyO5yKQW/PbmRBfpnzhI=;
 b=hbncPRRm3H4ctZlSABIk9QOyDFo9K++xAKBuJuIg2QI0T5egF7+okg9g
 4N0YfmY0p+9rzxZmoKoR8ofGoOo9VSvi49SriORPL1dmr9FuCeRlOMm3K
 VXmoUnVeWoWYAbAz0pIB9moCYiWa1TznN0Dc4d4x9QR9sy2JoBmZkQapS
 d9LXc1M+vyfdg3mWGzxCcCRBShkECiJ6CEW1FUchftBf1LyhT+5jHZBWB
 F2Y0qH8ey84RqgOGyYbS51be8AEXnhaxje+GAT3dtbXY8IMuq3zvcRaWg
 mkW71DTXzMnuvJHEDXXAzF5v6udESxOfuyD2+ComGOZ/0lRex65VVQDph g==;
X-CSE-ConnectionGUID: 2PTt6YcaTWeQn6CiEfDQ+g==
X-CSE-MsgGUID: ieex2/iZRYmd9phHVoQyNA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="11927860"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="11927860"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 10:14:39 -0700
X-CSE-ConnectionGUID: cbIlPQqeT0K8juCMANauKA==
X-CSE-MsgGUID: mbZcH45/RvGvseKSZkeViA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20586340"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 10:14:39 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH i-g-t 2/2] tests/intel/xe_exec_atomic: Use new vm bind flag
Date: Wed, 10 Apr 2024 19:00:41 +0200
Message-ID: <20240410170041.24963-2-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240410170041.24963-1-nirmoy.das@intel.com>
References: <20240410170041.24963-1-nirmoy.das@intel.com>
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
 tests/intel/xe_exec_atomic.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
index d9790da78..051f47a09 100644
--- a/tests/intel/xe_exec_atomic.c
+++ b/tests/intel/xe_exec_atomic.c
@@ -8,6 +8,7 @@
 
 #include "igt.h"
 #include "lib/igt_syncobj.h"
+#include "lib/intel_pat.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe_drm.h"
@@ -85,7 +86,8 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 
 	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
 	bind_engine = xe_bind_exec_queue_create(fd, vm, 0);
-	xe_vm_bind_async(fd, vm, bind_engine, bo, 0, addr, bo_size, &sync, 1);
+	xe_vm_bind_async_flags(fd, vm, bind_engine, bo, 0, addr, bo_size,
+			       &sync, 1, DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS);
 	data = xe_bo_mmap_ext(fd, bo, bo_size, PROT_READ|PROT_WRITE);
 	data->data = value;
 
@@ -112,11 +114,21 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 
 static bool has_atomics(int fd, uint32_t region)
 {
-	/* System memory atomics on dGPU is not functional as of now */
-	if (region == system_memory(fd) && xe_has_vram(fd))
-		return false;
+	uint32_t vm;
+	size_t size = xe_bb_size(fd, 4096);
+	uint32_t bo = 0;
+	int ret;
+
+	vm = xe_vm_create(fd, 0, 0);
+	bo = xe_bo_create(fd, vm, size, region, 0);
+	ret = __xe_vm_bind(fd, vm, 0, bo, 0, 0x40000, size,
+			   DRM_XE_VM_BIND_OP_MAP,
+			   DRM_XE_VM_BIND_FLAG_DEVICE_ATOMICS, NULL, 0, 0,
+			   DEFAULT_PAT_INDEX, 0);
+	gem_close(fd, bo);
+	xe_vm_destroy(fd, vm);
 
-	return true;
+	return ret != -EINVAL;
 }
 
 igt_main
-- 
2.42.0

