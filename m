Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147BDC27C4F
	for <igt-dev@archiver.kernel.org>; Wed, 26 Jun 2024 06:31:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8589010E086;
	Wed, 26 Jun 2024 06:31:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DWYACJbl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E322810E086
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jun 2024 06:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719383473; x=1750919473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=65tQRsKljjNKHXYZPPUDiIAR42rbrLi6oEa+ZMVlkqY=;
 b=DWYACJblJqLLts2+yvAqBk8lGFYT6uefoF/VcWz7dr5gD1RIDpL83IPq
 8RlvMC08q4ciSBAnuQV0HOLhUli4hA1qoRLKZt3c3LvZmrt+xsT4cLCbS
 Jm5UIOv3kNWNDouvIk53jjmJbwG3R6siUi2YH8UOusXYIHisbgEu4soNw
 fWXWMbWZ85bshxdq51TijeehbF8k4LMamdQvOkw+hYzG9/WY2tKom99vJ
 VV261bLMNiwkKMC2qNDyoFMvmXiNPLCVqeiIMg2Ieej6IVE0MwJ//9mxl
 w+V95nvWBJkw7YDqvbpEUCxYIxSFTRzDS3sudyRCGhkz3eGh7uzg9O9pm w==;
X-CSE-ConnectionGUID: M9mMRmh5RYWtEuVntEGCNA==
X-CSE-MsgGUID: bsPMw1HtT5KB7ea81fCmMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="16583003"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="16583003"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 23:31:13 -0700
X-CSE-ConnectionGUID: /4+doEuaR0al6+jvIiBoGA==
X-CSE-MsgGUID: FLhp/MBDTl2kVEA0wtRhqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208";a="43768221"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.70])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 23:31:11 -0700
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>,
 Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t 1/2] lib/gpu_cmds: Fix hardcoded buffer size
Date: Wed, 26 Jun 2024 08:30:17 +0200
Message-Id: <20240626063018.2931-2-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240626063018.2931-1-dominik.karol.piatkowski@intel.com>
References: <20240626063018.2931-1-dominik.karol.piatkowski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This patch enables buffers larger than one page to be successfully
submitted, allowing for large shader execution.
Based on the find by Dominik Grzegorzek.

Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@intel.com>
Reviewed-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 lib/gpu_cmds.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index 378fa9166..2a502505e 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -566,13 +566,13 @@ gen8_emit_state_base_address(struct intel_bb *ibb)
 	/* general state buffer size */
 	intel_bb_out(ibb, 0xfffff000 | 1);
 	/* dynamic state buffer size */
-	intel_bb_out(ibb, 1 << 12 | 1);
+	intel_bb_out(ibb, ALIGN(ibb->size, 1 << 12) | 1);
 	/* indirect object buffer size */
 	intel_bb_out(ibb, 0xfffff000 | 1);
 	/* instruction buffer size, must set modify enable bit, otherwise it may
 	 * result in GPU hang
 	 */
-	intel_bb_out(ibb, 1 << 12 | 1);
+	intel_bb_out(ibb, ALIGN(ibb->size, 1 << 12) | 1);
 }
 
 void
@@ -610,13 +610,13 @@ gen9_emit_state_base_address(struct intel_bb *ibb)
 	/* general state buffer size */
 	intel_bb_out(ibb, 0xfffff000 | 1);
 	/* dynamic state buffer size */
-	intel_bb_out(ibb, 1 << 12 | 1);
+	intel_bb_out(ibb, ALIGN(ibb->size, 1 << 12) | 1);
 	/* indirect object buffer size */
 	intel_bb_out(ibb, 0xfffff000 | 1);
 	/* intruction buffer size, must set modify enable bit, otherwise it may
 	 * result in GPU hang
 	 */
-	intel_bb_out(ibb, 1 << 12 | 1);
+	intel_bb_out(ibb, ALIGN(ibb->size, 1 << 12) | 1);
 
 	/* Bindless surface state base address */
 	intel_bb_out(ibb, 0 | BASE_ADDRESS_MODIFY);
@@ -1026,14 +1026,14 @@ xehp_emit_state_base_address(struct intel_bb *ibb)
 	/* general state buffer size */
 	intel_bb_out(ibb, 0xfffff000 | 1);                          //dw12
 	/* dynamic state buffer size */
-	intel_bb_out(ibb, 1 << 12 | 1);                             //dw13
+	intel_bb_out(ibb, ALIGN(ibb->size, 1 << 12) | 1);           //dw13
 	/* indirect object buffer size */
 	if (intel_graphics_ver(ibb->devid) >= IP_VER(20, 0))	    //dw14
 		intel_bb_out(ibb, 0);
 	else
 		intel_bb_out(ibb, 0xfffff000 | 1);
 	/* intruction buffer size */
-	intel_bb_out(ibb, 1 << 12 | 1);                             //dw15
+	intel_bb_out(ibb, ALIGN(ibb->size, 1 << 12) | 1);           //dw15
 
 	/* Bindless surface state base address */
 	intel_bb_out(ibb, 0 | BASE_ADDRESS_MODIFY);                 //dw16
-- 
2.34.1

