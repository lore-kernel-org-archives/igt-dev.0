Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B87EE57D1
	for <igt-dev@archiver.kernel.org>; Wed, 31 Dec 2025 05:55:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C76C10E83B;
	Wed, 31 Dec 2025 05:55:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TYTc9c6H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCF3410E83B
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Dec 2025 05:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767160530; x=1798696530;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CiweF4xxHbche6m8IK8OeNpXn/35BZ1n4/uYHMT+Etw=;
 b=TYTc9c6HhtRHzra7s7b4Zgcb7iBKqgDz95GQGWVCjU5Q6v/t/KA05eZC
 T07NWQiDotwVWHXySG663DXKkYLTgOylXWW3Lt4hQO9r4O2efxowZZGsQ
 K6yhWT5oTsp3Z++U93rvY450PWQmHFm84eBhP1Qy44qotpYTLbl++kjIn
 CrS7Ak9tRje1eOjNojsrWkY8sXoSA0hAarA429iPQ8ltJAKjOEx8N8GKX
 pDwzkb6Ab6sCyjcL2UGUbDyZm2rqJbAGqCQFt/i/W65wE/Rv2YmDuLo4o
 dH3CDam4M9hz6+ZSgkclouvvxLSHLijxcLOA1WzqDY3AEzrQF5sUSHYA/ g==;
X-CSE-ConnectionGUID: 1+icv8XFQ/2hyFcoH4oH6Q==
X-CSE-MsgGUID: 0AEGVFPtRcm+NQkT33lyog==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="72590002"
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; d="scan'208";a="72590002"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2025 21:55:29 -0800
X-CSE-ConnectionGUID: r8TjpImXSBC6rWIBccFaQA==
X-CSE-MsgGUID: PmPmRaKJTlu27AcwwejJqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,191,1763452800"; d="scan'208";a="201119712"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by orviesa009.jf.intel.com with ESMTP; 30 Dec 2025 21:55:29 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: alex.zuo@intel.com, shuicheng.lin@intel.com, stuart.summers@intel.com,
 kamil.konieczny@intel.com, matthew.d.roper@intel.com,
 ravi.kumar.vodapalli@intel.com, zbigniew.kempczynski@intel.com,
 Xin Wang <x.wang@intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH v9 4/5] tests/xe_pat: use debugfs reserved flags
Date: Wed, 31 Dec 2025 05:55:24 +0000
Message-ID: <20251231055525.51524-5-x.wang@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251231055525.51524-1-x.wang@intel.com>
References: <20251231055525.51524-1-x.wang@intel.com>
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
index f003f0046..bcc86cd70 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -180,8 +180,8 @@ static void pat_sanity(int fd)
  */
 static void pat_index_all(int fd)
 {
-	uint16_t dev_id = intel_get_drm_devid(fd);
 	size_t size = xe_get_default_alignment(fd);
+	struct intel_pat_cache pat_sw_config = {};
 	uint32_t vm, bo;
 	uint8_t pat_index;
 
@@ -210,10 +210,12 @@ static void pat_index_all(int fd)
 
 	igt_assert(intel_get_max_pat_index(fd));
 
+	xe_fetch_pat_sw_config_or_skip(fd, &pat_sw_config);
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

