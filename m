Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E65FC35FFC
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 13:59:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E4B10E57A;
	Tue, 25 Mar 2025 13:59:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YPcWRVs3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC57510E57A
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 13:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742911190; x=1774447190;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TYIpIzDYrHR+Ap10RVH54J+gyqtIU04w+X0jLH/G2o4=;
 b=YPcWRVs3jOBFXsx7N0nwAKFLszR1rG5vZUX68gLnEJisPB1nIXogpYT9
 LvGE1NnrUKBon5u9eXur4A2QaL34dpiJ75vMu2V1j1LiP3RvP3tG9dBrN
 zP00F9oXM1wQk02QnanPRX9MF3nwMHsfH4/kma/MApe916d+adRxTOruY
 yWHTOtNZTNh7Bp/ADUiT4Gku33GMhXjo49W9y/+GeuOOgWfxTpENOK4Cc
 QbnEG8wWe1Nfv/N14C7Ky+ImUPBg/PUcsB1zePFh0CMO8ExU/H3hM+b1C
 n5pHvmMzMUIWB2Uvgy3cE3UTp2FMXNxUL1Tzk/izoo8/3VnsrzZIO9TJR A==;
X-CSE-ConnectionGUID: sYVfHn0+SCCdLI/Uh0O2Hw==
X-CSE-MsgGUID: tzgBdNyrRVuhxKjsFaGSBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="54805310"
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="54805310"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 06:59:49 -0700
X-CSE-ConnectionGUID: CjuBpYw5SJaEgjzNJFgH/w==
X-CSE-MsgGUID: r/raNjJXTBK5ntIPqZZBwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,275,1736841600"; d="scan'208";a="124902198"
Received: from unknown (HELO priyanka.iind.intel.com) ([10.190.216.153])
 by orviesa007.jf.intel.com with ESMTP; 25 Mar 2025 06:59:49 -0700
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, francois.dugast@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] lib/intel_compute.c : Increase WMTP loop count
Date: Tue, 25 Mar 2025 19:28:17 +0530
Message-Id: <20250325135817.198133-1-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.34.1
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Preemption is not happening and getting failed at the check for long
kernel with current WMTP loop count. So, increasing the loop count.

v2: Increase loop count to 2000000 to avoid sporadic failures.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 lib/intel_compute.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 28149db53..9dbb38709 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -52,7 +52,7 @@
  * WMTP - Walker Mid Thread Preemption
  */
 #define TGP_long_kernel_loop_count		10
-#define WMTP_long_kernel_loop_count		1000000
+#define WMTP_long_kernel_loop_count		2000000
 
 struct bo_dict_entry {
 	uint64_t addr;
-- 
2.34.1

