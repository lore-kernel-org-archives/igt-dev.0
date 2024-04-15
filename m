Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73585C4345F
	for <igt-dev@archiver.kernel.org>; Mon, 15 Apr 2024 14:49:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FFE611263E;
	Mon, 15 Apr 2024 14:49:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nXgyEbvA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE4E11263E
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Apr 2024 14:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713192573; x=1744728573;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Shmwne4zPcb9Us7QmySCu2IADJ4SFiMZadTAwV8Pmok=;
 b=nXgyEbvAX0wm79YoNeG/ip/+Fu1yRrBgWbkqZDQInQhtXKdBv7O5tkQf
 YKihGdH5K9U1ciy+v+mKqV5It9HLT93Kd6mUGI6oo5Mw8vSEuZESxbOAI
 07UVz6SZVmb/vnK/Bx1aU0j9M4abJAje8aS/qIv0jSA1vbFhCIyjhAnsg
 ol4i+Ou/TAmx7gtCKjVKswk2VFaCuX3jPu2k28S7IDGncmMJUQGQ4nGCl
 XYuDsiS2RlNT4rkrB3YgMNSnxK/fx9RvesOUFEWIPwOomL3Ripb3XV81z
 64CFrR0wxKYdzE6AmiAf1IvimJPta7kuz+PxMC4SbARLF1vEN18fZRfEg A==;
X-CSE-ConnectionGUID: 3Bqb6uZmQJyqRVqnypRgSA==
X-CSE-MsgGUID: xB59O+aETneJ4NGc0H2gJw==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="19735086"
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="19735086"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 07:49:33 -0700
X-CSE-ConnectionGUID: +KO1/vJsSXSQLXD9rsF6Yg==
X-CSE-MsgGUID: Mfif+e2STWmAy3lo2xL7eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,203,1708416000"; d="scan'208";a="26580065"
Received: from nirmoyda-desk.igk.intel.com ([10.102.138.190])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2024 07:49:31 -0700
From: Nirmoy Das <nirmoy.das@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nirmoy Das <nirmoy.das@intel.com>
Subject: [PATCH i-g-t v3 3/4] tests/intel/xe_exec_atomic: Use new vm bind flag
Date: Mon, 15 Apr 2024 16:35:27 +0200
Message-ID: <20240415143528.4107-4-nirmoy.das@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240415143528.4107-1-nirmoy.das@intel.com>
References: <20240415143528.4107-1-nirmoy.das@intel.com>
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
 tests/intel/xe_exec_atomic.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_exec_atomic.c b/tests/intel/xe_exec_atomic.c
index d9790da78..458539335 100644
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
 
@@ -112,8 +113,11 @@ static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instanc
 
 static bool has_atomics(int fd, uint32_t region)
 {
-	/* System memory atomics on dGPU is not functional as of now */
-	if (region == system_memory(fd) && xe_has_vram(fd))
+	struct drm_xe_query_config *config = xe_config(fd);
+
+	if (region == system_memory(fd) &&
+	    !(config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
+	     DRM_XE_QUERY_CONFIG_FLAG_HAS_DEV_ATOMIC_ON_SMEM))
 		return false;
 
 	return true;
-- 
2.42.0

