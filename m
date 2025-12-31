Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BC9EE645A
	for <igt-dev@archiver.kernel.org>; Wed, 31 Dec 2025 20:20:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A70E10E412;
	Wed, 31 Dec 2025 20:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eEC0VEy6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBAB10E073
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Dec 2025 20:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767212413; x=1798748413;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xxu34r0iKenCYP7G2njZNp9Q+1L59W66RP7p/YlY26o=;
 b=eEC0VEy6UrZH1P4E1OsF9p5eyF5+aVbm7c0zpmuEGwsj9P71xMX04CNX
 PpUBHMe+ZCsb7HktnV01yMfAOSX+LmSsMC9U44s98ttYs5cU0YiIOboww
 AuA6KunqbGWUhnEApyUulsJwDGs0XvFB14QZ2Flj+M3Dyht2+RrZm9Jcx
 +wFCjp+YKVDT/MLNDxcd4PlqRyf0osKY5LLNttWy/0VZ0PF+ixce57KIN
 pnPFDIy+GCU9eN+EXvBRY6sQROH1qZFOHTvaKMberXXq7nEpnG0tVhWfV
 1NWnaWLoyMc+h1DOcJC8awQvC/RIPOHDBfbJL+spmRWcOdC1Kb9J6vwz5 A==;
X-CSE-ConnectionGUID: qniQg+noQzO7CEsN7bCPvA==
X-CSE-MsgGUID: KfYCm+pVS/Gt82VJl5CKCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68844912"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="68844912"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 12:20:13 -0800
X-CSE-ConnectionGUID: UM0f7qUsT7eBot0AGqhsyQ==
X-CSE-MsgGUID: HG6rbEE5SfeSHLN3rEVTiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="224998662"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by fmviesa002.fm.intel.com with ESMTP; 31 Dec 2025 12:20:12 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v10 4/5] tests/xe_pat: use debugfs reserved flags
Date: Wed, 31 Dec 2025 20:20:09 +0000
Message-ID: <20251231202010.115619-5-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231202010.115619-1-x.wang@intel.com>
References: <20251231202010.115619-1-x.wang@intel.com>
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

Stop hard-coding a reserved PAT index range for Xe2+. Instead,
parse the PAT software configuration via xe_get_pat_sw_config()
and use entries[].rsvd to decide which indices should be rejected
by the kernel.
This keeps the test aligned with kernel PAT layouts across
platforms and future changes.

CC: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Xin Wang <x.wang@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 tests/intel/xe_pat.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index cb2159aca..d9fcaa284 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -161,8 +161,8 @@ static void pat_sanity(int fd)
  */
 static void pat_index_all(int fd)
 {
-	uint16_t dev_id = intel_get_drm_devid(fd);
 	size_t size = xe_get_default_alignment(fd);
+	struct intel_pat_cache pat_sw_config = {};
 	uint32_t vm, bo;
 	uint8_t pat_index;
 
@@ -191,10 +191,12 @@ static void pat_index_all(int fd)
 
 	igt_assert(intel_get_max_pat_index(fd));
 
+	xe_fetch_pat_sw_config(fd, &pat_sw_config);
+
 	for (pat_index = 0; pat_index <= intel_get_max_pat_index(fd);
 	     pat_index++) {
-		if (intel_get_device_info(dev_id)->graphics_ver >= 20 &&
-		    pat_index >= 16 && pat_index <= 19) { /* hw reserved */
+
+		if (pat_sw_config.entries[pat_index].rsvd) {
 			igt_assert_eq(__xe_vm_bind(fd, vm, 0, bo, 0, 0x40000,
 						   size, DRM_XE_VM_BIND_OP_MAP, 0, NULL, 0, 0,
 						   pat_index, 0),
-- 
2.43.0

