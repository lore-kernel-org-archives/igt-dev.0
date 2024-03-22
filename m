Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89785C54E64
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 23:09:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DEF8112887;
	Fri, 22 Mar 2024 23:09:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bk5MF2+6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB2C112887
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 23:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711148955; x=1742684955;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vKpkabkwMZ69MxrCX0AqaOav11LWrIdtwb1626HbtsU=;
 b=bk5MF2+6vORNyZNLxr6qMGTSZgd7WEplSYrXBcFjNCZEpGEknD2KeOB7
 Il5w1ZeNytlNBTUgc8ffEMY/bR3u1ag0Anj93AfN9F2ostxU0D+x3tmxr
 lq2o8DtMS9tsXOZfZFTRe6TYePihpFEa0dr6NtTCU10DsfCnXO4uvCthR
 MTiCKmhQh+77fpo94CHwTJiv/GracfO7SRRhMkM1fawQ9KJqAdrg8xu6n
 6LEqZZAXEXJLTXyOUBJvrc5nuni/p3kI1q5YF/xvrdDvnUtIF+icdDMEJ
 p5Ot2/7Nd/vEgefiW5vycGnH0TXVS30Qw7YQkynkSxnISVdPUAGr2kceN w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6339216"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="6339216"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 16:09:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="19538665"
Received: from jrandhaw-desk.jf.intel.com ([10.24.12.119])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 16:09:14 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, oak.zeng@intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH] Fix WB caching PAT index for coherency mode
Date: Fri, 22 Mar 2024 16:09:06 -0700
Message-Id: <3f2c5a052be93e68e44d203f164dbcc36941e34b.1711148627.git.jagmeet.randhawa@intel.com>
X-Mailer: git-send-email 2.25.1
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

By default "coh_mode" is "XE_COH_NONE" and
"cpu_caching" is set to "DRM_XE_GEM_CPU_CACHING_WB"
because write back (WB) caching requires
a valid coherence mode, and "coh_mode" is set to
"XE_COH_NONE" there is no coherence leading to this
contradiction. So to address this issue, we set the
pat_index with intel_get_pat_idx_wb(fd);
---
 tests/intel/xe_vm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
index 7c061c497..1f458174d 100644
--- a/tests/intel/xe_vm.c
+++ b/tests/intel/xe_vm.c
@@ -1789,6 +1789,7 @@ static void bind_flag_invalid(int fd)
 	bind.bind.range = bo_size;
 	bind.bind.addr = addr;
 	bind.bind.op = DRM_XE_VM_BIND_OP_MAP;
+	bind.bind.pat_index = intel_get_pat_idx_wb(fd);
 	bind.num_syncs = 1;
 	bind.syncs = (uintptr_t)sync;
 
-- 
2.25.1

