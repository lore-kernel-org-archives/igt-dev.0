Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698EBC7883E
	for <igt-dev@archiver.kernel.org>; Fri, 20 Sep 2024 13:24:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A7510E0D9;
	Fri, 20 Sep 2024 13:24:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l/z6jVj9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3504610E0D9
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Sep 2024 13:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726838682; x=1758374682;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XvKpdKfXvs/w0sMUuF4Onm8Ng6JzYbNcrJ6d943tSoc=;
 b=l/z6jVj9JOubD03j0wbFNsyJ3kGs5VYWh/u6+5WJcYQR/E/zsfgq7Qne
 E3Bim6yGUdGgetbvNyTvs0iorVx3h6NYa+SOX/bi++3O1ppNiGOcZyXCN
 KQS82IijEXTh2zP6DQIunw/Ry2g/9PlZlkqJSY3g+VFkgQeclEvdzPS0T
 kj3Jye/Xpw/aZPCVZgDmnaO3BaswJNiG9yv/7JPHcCsP7dx8QrEJuayRh
 8V9KHdOuP8203KdLyOmQ/qD5dyWZqVJ9zh+tDMmh1JV9vOjx2UqV1rW3Z
 MZoeD3cO+pukdrJAkPoErcUw7fvQ6CCL8wPYOcABiNmASkg8yglvpC4hq A==;
X-CSE-ConnectionGUID: 2ThYcDNQTSSMPcKNfivF5w==
X-CSE-MsgGUID: 93YfRLdrSgCGt8RG31/WLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="29627836"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="29627836"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 06:24:42 -0700
X-CSE-ConnectionGUID: Wj8UeYqeR6GAwYmQAh4xgQ==
X-CSE-MsgGUID: aBWXahGcR8mVhpPP+0VEZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="71140374"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO dgrzegor-mobl2..)
 ([10.245.246.164])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 06:24:40 -0700
From: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t] lib/gpu_cmds: Correct number of threads in CFE_STATE
 instruction
Date: Fri, 20 Sep 2024 15:24:25 +0200
Message-Id: <20240920132425.226069-1-dominik.grzegorzek@intel.com>
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

