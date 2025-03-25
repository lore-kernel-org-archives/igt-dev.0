Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47FCC36008
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 05:30:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA3610E047;
	Tue, 25 Mar 2025 05:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G3knAs+R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9831010E047
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 05:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742880633; x=1774416633;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6UxQ2yBpSI0gwA/NXk+Zufdakm/1BaPcOfgSu9o+qG8=;
 b=G3knAs+RNjKjmLUXAfLy5Kvv4gPLN1Fld3SGhhfHd79jQ1zu98OAx2fQ
 5rais1eEyKp+Kc9sDIEVX5a9VaPC7mD+O0ahsEIt6NYRAZR4ITxyFlwW/
 gnXifo1hgmZ0F5cRRn5dDxXZRLB/I8yAy0u2kCFvo4e4WfrulkhVurEEe
 w7/rfH6fnNCu7HCTl4sjVrYwUcv+b8rfMgzq/aHjSmk1aNwukGZ10N6kO
 YjQvapUwplK9DH0VppBnd2iD37aLkldkfILrtI3pRG2JDlPllJ/CWEJaS
 nTBhyxE/aQVmhRBCyhHYdUz30uRc7x3LXNSKNCaoyW33jeKs5/YGokNC9 g==;
X-CSE-ConnectionGUID: gmO6j6xJRsm4Yy05e161XA==
X-CSE-MsgGUID: Fnc063ENS26ZzYVqZvV6rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="55491092"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="55491092"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 22:30:33 -0700
X-CSE-ConnectionGUID: bH9SfOx9QLm3pn8E1fuB/A==
X-CSE-MsgGUID: I8YxnCZJS5ydG6j3W3EIxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="155170093"
Received: from unknown (HELO priyanka.iind.intel.com) ([10.190.216.153])
 by orviesa002.jf.intel.com with ESMTP; 24 Mar 2025 22:30:31 -0700
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, francois.dugast@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] lib/intel_compute.c : Increase WMTP loop count
Date: Tue, 25 Mar 2025 10:59:01 +0530
Message-Id: <20250325052901.195938-1-priyanka.dandamudi@intel.com>
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

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 lib/intel_compute.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index 28149db53..76d435794 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -52,7 +52,7 @@
  * WMTP - Walker Mid Thread Preemption
  */
 #define TGP_long_kernel_loop_count		10
-#define WMTP_long_kernel_loop_count		1000000
+#define WMTP_long_kernel_loop_count		1500000
 
 struct bo_dict_entry {
 	uint64_t addr;
-- 
2.34.1

