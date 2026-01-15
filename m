Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6A8BD41149
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 09:22:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6873E10E70D;
	Thu, 15 Jan 2026 09:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lGOCs9+H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE1010E70D
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 09:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768468929; x=1800004929;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NFBU7eH1TQapvzAlG0yih0fJJpAGgxDGKiDu2sk7KHc=;
 b=lGOCs9+HxFoIBw46wt3AX284LMLFWlmp00CZmR5VcEp0X+jwPaGoKKqk
 +27e/Hiqms83Rh7X/9cG6KpAffFd6/IkYVf4s+wyCEZR6gjIPIBX0Nbs6
 wLPR10W0f2ctBmCJDTFP2Vi1c2p0BZi5E2YAyuR1enSP27Wkg3xwxzrGS
 +ag5uiNtW/O0ZE2xKM+Y1FtvM8t9svGjDDWY9TmR1CGuxTk5Cbp3JNMJb
 2OYAVRO4ESod1n4lJ2wQTmNu7mfsnAKbNQdNY1j11Z5mMigqLLlAsDrbc
 XVNqSfjn+qw9avKi0sPx8GUczvvgrgA5ge82gyJgobEMebSEI41xANwcj w==;
X-CSE-ConnectionGUID: gQl3YbTMRiOcUxUu8brTkg==
X-CSE-MsgGUID: 78OT9XZ+SFiu31lVQZntUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="92442600"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="92442600"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 01:22:09 -0800
X-CSE-ConnectionGUID: eOv6qyTnSR63ieyePFBvhw==
X-CSE-MsgGUID: RMv37a+/Q1ir0omUqPnkhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; d="scan'208";a="204936258"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.244.208])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 01:22:08 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 =?UTF-8?q?Jan=20Ma=C5=9Blak?= <jan.maslak@intel.com>
Subject: [PATCH i-g-t 2/2] lib/intel_device_info: Add missing flatccs flag for
 NVL-S
Date: Thu, 15 Jan 2026 10:21:58 +0100
Message-ID: <20260115092155.114781-6-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260115092155.114781-4-zbigniew.kempczynski@intel.com>
References: <20260115092155.114781-4-zbigniew.kempczynski@intel.com>
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

Tests (render/blitter) which uses compressed buffer require flatccs
flag defined in intel-device-info.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Jan Maślak <jan.maslak@intel.com>
---
 lib/intel_device_info.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/intel_device_info.c b/lib/intel_device_info.c
index 20147479a8..89fa6788f5 100644
--- a/lib/intel_device_info.c
+++ b/lib/intel_device_info.c
@@ -545,6 +545,7 @@ static const struct intel_device_info intel_novalake_s_info = {
 	.display_ver = 35,
 	.has_4tile = true,
 	.has_oam = true,
+	.has_flatccs = true,
 	.is_novalake_s = true,
 	.codename = "novalake_s",
 	.cmds_info = &xe2_cmds_info,
-- 
2.43.0

