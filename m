Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D01C2D0D0
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 11:40:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ED0210E400;
	Mon, 24 Jun 2024 11:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ewzGOqKg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEC0910E400
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jun 2024 11:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719229221; x=1750765221;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lAoObsAhMFw19Zz902L/vBwLoi+MtoAWAkcu+YG3JVY=;
 b=ewzGOqKg0wuym1El6HA2W8tRnHbnO3h/VZAkGRHINaPnsjZwSxGeRO0w
 6qSIcTYAVGqPrkzVZ7H1B8GvDidyK1UwsD+XRx4LKbVJtqAalJrriveBd
 SGWvCNLPmFIca9uoJLLUV0sT9sxmGrsRFTyx1fWI+Ra9BU8a+PVZ5UrrE
 O7kR0UofwdtL6AUtZaA4T01RsmXSK6jlzVAGj6QbkpalTbzfbgOakFUmV
 /T8W1frOBzQAV162hWpuQwctJcoIL5l0f7FWhScN8HVRS51k0CapCxIhh
 crHnt7w9ENyiCo8Bg4oLJxL++HL5DRf4cq2aoB3uqaLLXb0zAyQvU3zBR A==;
X-CSE-ConnectionGUID: DlhIv5WqTBClgA0kjSxPSw==
X-CSE-MsgGUID: Qr1HLWoCQ3206rSf4HOQLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="41609140"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="41609140"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 04:40:21 -0700
X-CSE-ConnectionGUID: hbS7z9zXSPmvyrFEJLHLog==
X-CSE-MsgGUID: ZVHcwJqMSYS2cJJjb0Nx5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="43157293"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO
 dpiatkow-mobl1.mshome.net) ([10.245.246.196])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 04:40:19 -0700
From: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Karol Piatkowski <dominik.karol.piatkowski@intel.com>
Subject: [PATCH i-g-t 1/1] lib/gpu_cmds: Fix hardcoded buffer size
Date: Mon, 24 Jun 2024 13:39:49 +0200
Message-Id: <20240624113949.6846-2-dominik.karol.piatkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240624113949.6846-1-dominik.karol.piatkowski@intel.com>
References: <20240624113949.6846-1-dominik.karol.piatkowski@intel.com>
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
---
 lib/gpu_cmds.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index 378fa9166..4f2781e7c 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -566,13 +566,13 @@ gen8_emit_state_base_address(struct intel_bb *ibb)
 	/* general state buffer size */
 	intel_bb_out(ibb, 0xfffff000 | 1);
 	/* dynamic state buffer size */
-	intel_bb_out(ibb, 1 << 12 | 1);
+	intel_bb_out(ibb, ibb->size | 1);
 	/* indirect object buffer size */
 	intel_bb_out(ibb, 0xfffff000 | 1);
 	/* instruction buffer size, must set modify enable bit, otherwise it may
 	 * result in GPU hang
 	 */
-	intel_bb_out(ibb, 1 << 12 | 1);
+	intel_bb_out(ibb, ibb->size | 1);
 }
 
 void
@@ -610,13 +610,13 @@ gen9_emit_state_base_address(struct intel_bb *ibb)
 	/* general state buffer size */
 	intel_bb_out(ibb, 0xfffff000 | 1);
 	/* dynamic state buffer size */
-	intel_bb_out(ibb, 1 << 12 | 1);
+	intel_bb_out(ibb, ibb->size | 1);
 	/* indirect object buffer size */
 	intel_bb_out(ibb, 0xfffff000 | 1);
 	/* intruction buffer size, must set modify enable bit, otherwise it may
 	 * result in GPU hang
 	 */
-	intel_bb_out(ibb, 1 << 12 | 1);
+	intel_bb_out(ibb, ibb->size | 1);
 
 	/* Bindless surface state base address */
 	intel_bb_out(ibb, 0 | BASE_ADDRESS_MODIFY);
@@ -1026,14 +1026,14 @@ xehp_emit_state_base_address(struct intel_bb *ibb)
 	/* general state buffer size */
 	intel_bb_out(ibb, 0xfffff000 | 1);                          //dw12
 	/* dynamic state buffer size */
-	intel_bb_out(ibb, 1 << 12 | 1);                             //dw13
+	intel_bb_out(ibb, ibb->size | 1);                           //dw13
 	/* indirect object buffer size */
 	if (intel_graphics_ver(ibb->devid) >= IP_VER(20, 0))	    //dw14
 		intel_bb_out(ibb, 0);
 	else
 		intel_bb_out(ibb, 0xfffff000 | 1);
 	/* intruction buffer size */
-	intel_bb_out(ibb, 1 << 12 | 1);                             //dw15
+	intel_bb_out(ibb, ibb->size | 1);                           //dw15
 
 	/* Bindless surface state base address */
 	intel_bb_out(ibb, 0 | BASE_ADDRESS_MODIFY);                 //dw16
-- 
2.34.1

