Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD22C54E5D
	for <igt-dev@archiver.kernel.org>; Mon, 18 Mar 2024 08:47:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D4E10F4BE;
	Mon, 18 Mar 2024 08:47:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G/1xLtBb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2FCE10F4BE
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Mar 2024 08:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710751624; x=1742287624;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=j6Yq0A5Tm+6GCmS23+WgRzSr+FnD4HR/3xFtz/ltalU=;
 b=G/1xLtBbzKnbnwcfvbuaZF2fRyID/JkTNbCbryOzqPwZYdwvOXRnmQJW
 kebyiLYTU9sqq3dxi/+S+GUUREzq/ghHwgrsjI4rXgXe6Z8l1HfE+84ia
 kV9i3o4uMv0Qp/29DWCmqj6jSA+FYMpf1MthpbTFNiqNdQht5PpF36NRb
 XUa5ujrD2P7C9ImOpcm+oeuCpgQxKw2M1D5YFJ4plz8tO7Le4GcBNn9ci
 at8MSbJouTCpQCjIdxXDTdHL8bUdF9QE7pUsSUwtt+Savba19V6t0SZXh
 0t1fI69e9lBn9t4g9xzg3mqLM1375GWPC6SuXYEjJ1L0G7/zpFJDyrNLs w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5412200"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; 
   d="scan'208";a="5412200"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 01:46:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="13787363"
Received: from rahul-super-server.iind.intel.com ([10.145.169.156])
 by orviesa006.jf.intel.com with ESMTP; 18 Mar 2024 01:46:45 -0700
From: janga.rahul.kumar@intel.com
To: igt-dev@lists.freedesktop.org, ramadevi.gandi@intel.com,
 janga.rahul.kumar@intel.com
Cc: nirmoy.das@intel.com
Subject: [PATCH i-g-t] lib/intel_compute: Add documentation of global
 workgroup size
Date: Mon, 18 Mar 2024 14:22:27 +0530
Message-Id: <20240318085227.2624098-1-janga.rahul.kumar@intel.com>
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

From: Janga Rahul Kumar <janga.rahul.kumar@intel.com>

Global workgroup size is calculated based on local X/Y/Z maximum
and thread group id X dimension.

Cc: Nirmoy Das <nirmoy.das@intel.com>
Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
---
 lib/intel_compute.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 9d3b97efe..72025a481 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -1243,15 +1243,19 @@ static void xe2lpg_compute_exec_compute(uint32_t *addr_bo_buffer_batch,
 	addr_bo_buffer_batch[b++] = offset_indirect_data_start;
 	addr_bo_buffer_batch[b++] = 0xbe040000;
 	addr_bo_buffer_batch[b++] = 0xffffffff;
-	addr_bo_buffer_batch[b++] = 0x000003ff;
+	addr_bo_buffer_batch[b++] = 0x000003ff; // Local X/Y/Z Dimension
 
 	if (threadgroup_preemption)
-		addr_bo_buffer_batch[b++] = 0x00200000; // Global workgroup size
+		/*
+		 * Create multiple threadgroups using higher gloabl workgroup size
+		 * Global Workgroup size = Local X * Thread Group X +  Local Y * Thread Group Y + Local Z * Thread Group Z
+		 */
+		addr_bo_buffer_batch[b++] = 0x00200000; // Thread Group ID X Dimension
 	else
 		addr_bo_buffer_batch[b++] = 0x00000002;
 
-	addr_bo_buffer_batch[b++] = 0x00000001;
-	addr_bo_buffer_batch[b++] = 0x00000001;
+	addr_bo_buffer_batch[b++] = 0x00000001; // Thread Group ID Y Dimension
+	addr_bo_buffer_batch[b++] = 0x00000001; // Thread Group ID Z Dimension
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
 	addr_bo_buffer_batch[b++] = 0x00000000;
-- 
2.25.1

