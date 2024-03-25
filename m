Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9DFBC54E64
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 21:27:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DFDE10EA89;
	Mon, 25 Mar 2024 21:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="It+6xIfP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB6210EA99
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 21:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711402027; x=1742938027;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NsSZy6VowY7c0yU95ulg9SCLgeg8w591QAud/3XiFWA=;
 b=It+6xIfPEa2Yd7YPnVWMi/fXj8P4zoMcoOXUbjjEhKpO4Ggk1NEqc7C2
 nUnYrazdlxssuA/3w1gwHa8x+wi7EikrM7FLGQra1juNT5zGGo2PX4Y6U
 edIucIwfJw6ivIeHIiug9R3bYtw++ydTiXt1LOP3bQVeRT5KJ7LpIqT8f
 YmdB2Yh9FQU4ES9GW2Xve2BAtOS84hofBbbvPm/LS5dGEBhtNl2hnV16J
 2Hjgopzffq3F1XjD4iH0lAYhdJowSnGLpE6/E9hxKvTawvk+0EP5ShKkL
 cI10cXBnDdIbWR8H2QXvr8Z7qLVYuo+16+Ck/QAwyC0oqoSm5WH3NLjgo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="17064340"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="17064340"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 14:27:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="15712873"
Received: from jrandhaw-desk.jf.intel.com ([10.24.12.119])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 14:27:07 -0700
From: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, oak.zeng@intel.com,
 jonathan.cavitt@intel.com, matthew.auld@intel.com,
 kamil.konieczny@linux.intel.com,
 Jagmeet Randhawa <jagmeet.randhawa@intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_vm: Fix WB caching PAT index for
 coherency mode
Date: Mon, 25 Mar 2024 14:27:00 -0700
Message-Id: <20240325212700.127810-2-jagmeet.randhawa@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240325212700.127810-1-jagmeet.randhawa@intel.com>
References: <20240325212700.127810-1-jagmeet.randhawa@intel.com>
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

Resolve a coherency conflict by setting the
correct PAT index for WB caching with
intel_get_pat_idx_wb(fd), addressing the
mismatch between the default "XE_COH_NONE"
coherency mode and DRM_XE_GEM_CPU_CACHING_WB.
This conflict occurs for VLK:54352.

Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Oak Zeng <oak.zeng@intel.com>
Signed-off-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
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

