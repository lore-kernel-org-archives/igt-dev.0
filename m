Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F210C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 12:14:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E172D10F2B7;
	Thu, 25 Apr 2024 12:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d43TeQPO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F90F11A3F1
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 12:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714047241; x=1745583241;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y9l86oItXEldyBGQs7lzmcr78GIThgdpXw6i7pMkjoY=;
 b=d43TeQPOjfN56GxQlSt877eMtKQPaScSWlsC0fCtoDfe7sN3W/r6j7Za
 IuxKNgCbMLXO0SLTww439O70oRJSgE9+ZXoD4TQe17i3vpjEXxQcsH1N2
 Ui5pYA/Fc9LkIzaCUDdTB9+diqF30C1x4lks/RlVPl1S6AkgPfSLLoRYS
 WwKRQGe36h5/Hktk/XCgX+MVXxwPMdn8ON8EIbO+d8i+qHqpa5g+E4A6i
 bVUpHMIGbK0qJwrzxtMt7Ofc6wtP0dJ03cVZZIXG+uxxjFUo2un6T1RMr
 pJfVqz6rF1x97i4oLOfToVjQj70YbIDiqlpKIR958GpqUjUcyFdmOcxup w==;
X-CSE-ConnectionGUID: u4pCjeQZSXe3mh1+JtTErQ==
X-CSE-MsgGUID: rH94+6GFRIKTtRNWsHU2yA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="35121652"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="35121652"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 05:14:01 -0700
X-CSE-ConnectionGUID: UNCEkSXZSeqOCXgQEUBnoQ==
X-CSE-MsgGUID: T6e5ygT3SB+lj86i0pYR3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="25115372"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 dgrzegor-mobl2..) ([10.245.244.171])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 05:13:59 -0700
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Subject: [PATCH i-g-t] lib/gpu_cmds: be ready to use xe2 gpgpu fill on newer
 platforms
Date: Thu, 25 Apr 2024 14:13:37 +0200
Message-Id: <20240425121337.433948-1-dominik.grzegorzek@intel.com>
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

Doing xe2 gpgpu pipeline implementation we mostly taken into account
possibility of reusing the implementation for future platforms.
But not everywhere. Make it common.

Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
---
 lib/gpu_cmds.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index f37e725e7..40522d58e 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -1030,7 +1030,7 @@ xehp_emit_state_base_address(struct intel_bb *ibb)
 	intel_bb_out(ibb, 0);
 
 	/* stateless data port */
-	tmp = intel_graphics_ver(ibb->devid) == IP_VER(20, 0) ? 0 : BASE_ADDRESS_MODIFY;
+	tmp = intel_graphics_ver(ibb->devid) >= IP_VER(20, 0) ? 0 : BASE_ADDRESS_MODIFY;
 	intel_bb_out(ibb, 0 | tmp);                  //dw3
 
 	/* surface */
@@ -1056,7 +1056,7 @@ xehp_emit_state_base_address(struct intel_bb *ibb)
 	/* dynamic state buffer size */
 	intel_bb_out(ibb, 1 << 12 | 1);                             //dw13
 	/* indirect object buffer size */
-	if (intel_graphics_ver(ibb->devid) == IP_VER(20, 0))	    //dw14
+	if (intel_graphics_ver(ibb->devid) >= IP_VER(20, 0))	    //dw14
 		intel_bb_out(ibb, 0);
 	else
 		intel_bb_out(ibb, 0xfffff000 | 1);
-- 
2.34.1

