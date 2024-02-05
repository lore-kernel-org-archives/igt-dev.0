Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA87C4828D
	for <igt-dev@archiver.kernel.org>; Mon,  5 Feb 2024 06:08:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93E3D10E4B2;
	Mon,  5 Feb 2024 06:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RC/siqhZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270E910E4B2
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Feb 2024 06:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707113305; x=1738649305;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bU6qhc2jySXhVcKNxT+YA7+3EK1aC7xB4fXXJUfaj8I=;
 b=RC/siqhZCDcVD1wNb2NAvzt7koYZcPSCpKHLP34oLQrWPcDS1gYkb+4l
 UZngmI/fTH9TEHeZUrTiWxK/8yjBjmWuf2b8mUz40x/0z8vNUkJy0l0Xi
 l2eEV7mKDdMrn8o/bAhWO1fWEr7BvukVEMzGO+KDsPPdmkV2l7/D5D4f3
 VFzxZd/iIqXI4YhZ2z8XyhlBdhuG1UnmD+Q+ksfc97aaO0I72vMLPoGqf
 wcTS609lJymWuKgv+yv+byMbBjhGmDRHmPBWzdj/RApo1/jss7AEYpSwU
 UWCrH9XvHZyEop2MAFhbF+4pgDXXENwg7hTFFy5DHczF1DzbtkOorh1J4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="394879722"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; d="scan'208";a="394879722"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2024 22:08:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="953715"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa008.jf.intel.com with ESMTP; 04 Feb 2024 22:08:24 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com
Subject: [PATCH i-g-t] lib: Add ARL-S PCI ID for perf tests
Date: Mon,  5 Feb 2024 11:31:39 +0530
Message-Id: <20240205060139.3643855-1-chaitanya.kumar.borah@intel.com>
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

Enable perf tests on ARL-S

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 lib/i915_pciids_local.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/i915_pciids_local.h b/lib/i915_pciids_local.h
index a0ca29ee7..0043b0cd9 100644
--- a/lib/i915_pciids_local.h
+++ b/lib/i915_pciids_local.h
@@ -10,7 +10,8 @@
 /* MTL perf */
 #ifndef INTEL_MTL_M_IDS
 #define INTEL_MTL_M_IDS(info) \
-	INTEL_VGA_DEVICE(0x7D60, info)
+	INTEL_VGA_DEVICE(0x7D60, info), \
+	INTEL_VGA_DEVICE(0x7D67, info)
 #endif
 
 #ifndef INTEL_MTL_P_GT2_IDS
-- 
2.25.1

