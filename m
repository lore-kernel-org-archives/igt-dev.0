Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF718EEB576
	for <igt-dev@archiver.kernel.org>; Wed, 31 Dec 2025 23:22:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E405110E9DB;
	Wed, 31 Dec 2025 23:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YkoFdcen";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F04D10E2F3
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Dec 2025 23:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767223316; x=1798759316;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=40E+aeU8Lym4KzW6WlPgK3L81FS7XcQbrM/gLXJmcFE=;
 b=YkoFdcenGylYMqZgFTWoli1NsfG4vqcYq5u9/zXbONSPSnQlTknADvbF
 r/8I4+3/eHzFZZ5y1rRyEcpc9Q0Wry/fwc3Dhd0sNCEYrk6IDdvy0PTOC
 NiWFYJP4IM+MJ+PMEsfmnYrs2LU2iCWut+jO5zG4vUPe71MSzcK1v/K03
 sLvGB6XHCchZyYG8V6gCLde5394jkO2r1U/9AE1z2fVKV0iBz2MQE9oEz
 SxoEOadzOT+VA8JWoG8ZOTViPqRNec6UpVJd3479qSYxZBXtoLPHa1iCL
 bxxX5niBvHzEcBcTt9/gMjztRFRjgwwzSNbdvZMZw584JKIhhA7jCSA9H w==;
X-CSE-ConnectionGUID: lbsyzXXQTiyS6bTqaz69Rw==
X-CSE-MsgGUID: vxXuaEAAT/yBJZsnqlQX7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="67792698"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="67792698"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 15:21:55 -0800
X-CSE-ConnectionGUID: jnoPcDP+SduxqgqcLOwIvQ==
X-CSE-MsgGUID: F/BZTWIFTg+Wd9mS8xB9Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="206572339"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by orviesa005.jf.intel.com with ESMTP; 31 Dec 2025 15:21:56 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>,
	Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v11 4/5] tests/xe_pat: use debugfs reserved flags
Date: Wed, 31 Dec 2025 23:21:51 +0000
Message-ID: <20251231232152.127555-5-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231232152.127555-1-x.wang@intel.com>
References: <20251231232152.127555-1-x.wang@intel.com>
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
index da4234a2c..a7f8ab088 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -160,8 +160,8 @@ static void pat_sanity(int fd)
  */
 static void pat_index_all(int fd)
 {
-	uint16_t dev_id = intel_get_drm_devid(fd);
 	size_t size = xe_get_default_alignment(fd);
+	struct intel_pat_cache pat_sw_config = {};
 	uint32_t vm, bo;
 	uint8_t pat_index;
 
@@ -190,10 +190,12 @@ static void pat_index_all(int fd)
 
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

