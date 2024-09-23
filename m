Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0B9CF9C6F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Sep 2024 07:46:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92A3D10E3A0;
	Mon, 23 Sep 2024 07:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SXgmWMqc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1175A10E39F
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Sep 2024 07:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727077616; x=1758613616;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0HSwxtBmLd2VDJnGuTGDtzp5TlUvZNO3nQIUkG2oDac=;
 b=SXgmWMqcXBsTc4UxQsqAeuGOR6JdKaRnL35LfWhxgCNHiYK2cQ7d6PHn
 cyZrm/KmJQLR73JmOHnqC+lMmBpdtqsKfw+DTzi+JUUOX3PFK2zJ5DiBC
 Jp78aoBud606WEpAVRXsV2A5/a8TGxZCBPRAqUoHeL0lnDTsrcnXUsGdP
 4JuYNuIPXGJ9pvvp/J5PnRBN4R6YdpwrRndSzugo1Dvf59CJD9oagm0Lv
 bDiDoqg5o7ehbLPMxZecHKH0UFhbGvMe3Fb4heQUrDtEz4bktsXWG+hZf
 ySzK9ifj1yYDmPmUaeJAXGX5/3Y5ZTOxZGI7TwsEwv8W9p4ku5UySIXRj Q==;
X-CSE-ConnectionGUID: iIKKiSRERQOB6/Bkh+4itg==
X-CSE-MsgGUID: qDwVCcEJTw2a3FpdriuV1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="26166214"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="26166214"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 00:46:55 -0700
X-CSE-ConnectionGUID: SwAmtMxzTa2TRS190cwMYQ==
X-CSE-MsgGUID: zYL4FOdAQ6Sko5Zh+oX+wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; d="scan'208";a="75541826"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO dgrzegor-mobl2..)
 ([10.245.246.83])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 00:46:53 -0700
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 1/2] lib/gpu_cmds: Correct number of threads in
 CFE_STATE instruction
Date: Mon, 23 Sep 2024 09:46:39 +0200
Message-Id: <20240923074640.13141-1-dominik.grzegorzek@intel.com>
X-Mailer: git-send-email 2.34.1
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

Since xe2 there was a change in CFE_STATE instruction format.
Field describing maximal number of threads now has type of u16,
not u16-1 as it used to have.

Reported-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/gpu_cmds.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/gpu_cmds.c b/lib/gpu_cmds.c
index c44b24c79..2638e3791 100644
--- a/lib/gpu_cmds.c
+++ b/lib/gpu_cmds.c
@@ -992,6 +992,7 @@ void
 xehp_emit_cfe_state(struct intel_bb *ibb, uint32_t threads)
 {
 	bool dfeud = CFE_CAN_DISABLE_FUSED_EU_DISPATCH(ibb->devid);
+	bool u16minus1 = intel_graphics_ver(ibb->devid) < IP_VER(20, 0);
 
 	intel_bb_out(ibb, XEHP_CFE_STATE | (6 - 2));
 
@@ -1001,7 +1002,8 @@ xehp_emit_cfe_state(struct intel_bb *ibb, uint32_t threads)
 
 #define _LEGACY_MODE (1 << 6)
 	/* number of threads & urb entries */
-	intel_bb_out(ibb, (max_t(threads, threads, 64) - 1) << 16 | (dfeud ? _LEGACY_MODE : 0));
+	threads = max_t(threads, threads, 64);
+	intel_bb_out(ibb, (u16minus1 ? threads - 1 : threads) << 16 | (dfeud ? _LEGACY_MODE : 0));
 
 	intel_bb_out(ibb, 0);
 	intel_bb_out(ibb, 0);
-- 
2.34.1

