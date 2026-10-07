Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDFECA6007
	for <igt-dev@archiver.kernel.org>; Wed,  7 Oct 2026 18:58:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAFF210E668;
	Wed,  7 Oct 2026 18:58:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AMO2nSpe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEEC110E661
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Oct 2026 18:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791399458; x=1822935458;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zgBjVRhGxfg7pBGP5abLsBBGUVzxoFOLGwgDEmLWQko=;
 b=AMO2nSpeT85Yo9EuMeSVDQeaGTC+Ev/ehGcqbVLXtVWzBg5RUGFrXCaz
 Ocgj4aAjuazPdMtVFQQIEv3FEjmYGXXmdjzV8Ep+GewXnlgWT/LkHpd+w
 ceYsLzhBJAdkfa6VyCRNbvmo0wAqOqFxRH0rcbkWu/g7fWNQBNM512Kzn
 84SAsK4eKfDjf5e0FOtqUsuP3tHqcKkWyjdwG0GXuDNTAogjwMt2sToUZ
 vnEA/FXd1puDEek8LbM9reqsATPlD1HDF1WLgXynvTXENZicQWp9yvOvV
 NA86Fmwo8Cedbkv/9NW7UxaSZhpKSRT6eHA/uPhwKq0GCzhckZVHD3jo8 Q==;
X-CSE-ConnectionGUID: e3CfEzh8Rr+1MU9xmKd+QQ==
X-CSE-MsgGUID: xm3CSBAnQlu7hx3psUFdlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="73879"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="73879"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2026 11:57:38 -0700
X-CSE-ConnectionGUID: Gs6L7DTdQIKkBgc5QxCYCQ==
X-CSE-MsgGUID: 6PjvtoCTQ9+rAGI3x5bALg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; d="scan'208";a="306983861"
Received: from aalteres-desk1.fm.intel.com ([10.121.64.173])
 by orviesa002.jf.intel.com with ESMTP; 07 Oct 2026 11:57:37 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Julia Filipchuk <julia.filipchuk@intel.com>
Subject: [PATCH i-g-t 1/1] intel-ci: remove pxp from NVL blocklist
Date: Wed,  7 Oct 2026 11:57:34 -0700
Message-ID: <20261007185736.3460247-2-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.43.0
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

We plan to added GSC FW with PXP support for NVL-S now.
However, it was still in the block list so let's remove this.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel-ci/xe.nvl.core.blocklist.txt | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/tests/intel-ci/xe.nvl.core.blocklist.txt b/tests/intel-ci/xe.nvl.core.blocklist.txt
index 7de332352..17d34b99b 100644
--- a/tests/intel-ci/xe.nvl.core.blocklist.txt
+++ b/tests/intel-ci/xe.nvl.core.blocklist.txt
@@ -63,15 +63,10 @@ igt@xe_compute@eu-busy-10s
 #     balancing, which NVL does not expose.
 #   - xe_oa@oa-tlb-invalidate: OA TLB invalidation test relies
 #     on a specific OA unit configuration not present on NVL.
-#   - xe_pxp@.*: PXP (Protected Xe Path) content protection
-#     requires a TEE (Trusted Execution Environment) and
-#     associated firmware, which NVL does not support.
 ##################################################################
 igt@xe_exec_balancer@.*
-igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add
 igt@xe_huc_copy@huc_copy
 igt@xe_oa@oa-tlb-invalidate
-igt@xe_pxp@.*
 ##################################################################
 # Valid skip: test applicable only for i2c capable systems
 ##################################################################

base-commit: 23f88758399c4e526aab1db26f35208faea9816a
-- 
2.43.0

