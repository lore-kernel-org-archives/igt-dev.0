Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2361AD10395
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 00:19:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB5D10E03F;
	Fri, 25 Oct 2024 00:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QnH+YRL4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6A410E9B4
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 00:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729815590; x=1761351590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gMdsp6iAjCLaal28yUj5sIGEmUR/I8sK86iZqDCy8Lc=;
 b=QnH+YRL4N47d9GZVcvvzlym51rWxbrjIGzJDo3XeeoGQcBLnl1KSTa1s
 DDFe2MfWD3T6y28QZgtC7IpSEt9E9+gfGylFmbWetqlZA+f4Ilal+755R
 dskQCRJF/AaoZlZWGc6cF1XP6JzYTXFbiizmz/h/SGyHWhcT+D37PdxL/
 iLm7QQ0EEyjxmKE1eQpzB5M2fArf4ImFRXZ3d5nhRqNan6CFb+vGwzqXB
 0+GY40BYFOU1wKlIvRklUq5pxVAA+bfOtI0fprKX2xgr5crnxXb6T76sY
 35GlR1ELiiLMBBjk5JtEj8awWT98UFeF+d4VTRPLBEou/DSiJET2E+uyx w==;
X-CSE-ConnectionGUID: lWeyX2SUSViRPA9c69OEtw==
X-CSE-MsgGUID: 8XrhmUCCTRuMsorS7iyk6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="29584525"
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; d="scan'208";a="29584525"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 17:19:49 -0700
X-CSE-ConnectionGUID: FtpVeekERO60f19D3Wb3xw==
X-CSE-MsgGUID: cPhPF5xVSzexx4Ni7CWGVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,230,1725346800"; d="scan'208";a="80342247"
Received: from fyang16-desk.jf.intel.com ([10.165.21.214])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 17:19:49 -0700
From: fei.yang@intel.com
To: igt-dev@lists.freedesktop.org
Cc: ashutosh.dixit@intel.com, nirmoy.das@intel.com,
 priyanka.dandamudi@intel.com, apoorva.singh@intel.com,
 Fei Yang <fei.yang@intel.com>
Subject: [i-g-t 1/1] tests/intel/xe_exec_fault_mode: wait for the completion
Date: Thu, 24 Oct 2024 17:23:22 -0700
Message-Id: <20241025002322.1422552-2-fei.yang@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241025002322.1422552-1-fei.yang@intel.com>
References: <20241025002322.1422552-1-fei.yang@intel.com>
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

From: Fei Yang <fei.yang@intel.com>

The execution on GPU is out of order, the completion of the
last submission doesn't mean all the jobs are completed. We
need to make sure all the jobs are completed before moving
on to unbinding the buffer, otherwise the test would run
into CAT errors.

Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 tests/intel/xe_exec_fault_mode.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 9cc51b7d3..d416c773b 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -305,7 +305,15 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 		}
 	}
 	if (!(flags & INVALID_FAULT)) {
-		j = flags & INVALIDATE ? n_execs - 1 : 0;
+		/*
+		 * For !RACE cases xe_wait_ufence has already been called in above
+		 * for-loop, we should only wait for the completion of the last
+		 * submission here. For RACE cases we need to wait for all submissions
+		 * to complete because the GuC scheduling can be out of order, the
+		 * completion of the last submission doesn't mean all submission are
+		 * completed.
+		 */
+		j = (flags & INVALIDATE && !(flags & RACE)) ? n_execs - 1 : 0;
 
 		for (i = j; i < n_execs; i++) {
 			int64_t timeout = NSEC_PER_SEC;
-- 
2.25.1

