Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5011C48297
	for <igt-dev@archiver.kernel.org>; Mon, 12 Feb 2024 15:06:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4392A10E7D6;
	Mon, 12 Feb 2024 15:06:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GsHcGxma";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3AFC10E7E4
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Feb 2024 15:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707750411; x=1739286411;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+TRPTd/OtrlIiqRD2VMlG9IF3li1L/Z97aMbqCiOvNo=;
 b=GsHcGxma+I4JELL0DvtP38AKgWjIUxCaQa1bkOkf17s4SONh8nwtkbVv
 W4gtVh+WFkJ6jnbOSErrtfzPV5ZlaoGAMRx60uMFGoMGlEiktPJrdBs6u
 h+T+qOdJto5bDXgeUvfvD0aKfU5dNGlpHWF5G1SgHqVaIQ7d68XSFx2G0
 NhyBy6x+ii/nGnqAIUcexzYTV+U0JvCac3fQrPK5/A4jV/+QM2Yzc/mI6
 /RQrAraSo0SCDvG90xYipaj0kuBsIR0lW3xxr+9PmU3UjSx69qwS5vlM5
 LMJZyJki0ye/nZX4R7cHlBggN26ahodFcp1K718t/RgDasbLNF040ALAI Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1611876"
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; 
   d="scan'208";a="1611876"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa113.fm.intel.com with ESMTP; 12 Feb 2024 07:06:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,264,1705392000"; d="scan'208";a="33684665"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 07:06:49 -0800
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t] benchmarks/kms_vblank: Add XE support
Date: Mon, 12 Feb 2024 20:31:13 +0530
Message-ID: <20240212150113.736295-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add support for XE driver.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 benchmarks/kms_vblank.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/benchmarks/kms_vblank.c b/benchmarks/kms_vblank.c
index f32cc9e32..8668bacab 100644
--- a/benchmarks/kms_vblank.c
+++ b/benchmarks/kms_vblank.c
@@ -161,7 +161,7 @@ int main(int argc, char **argv)
 		}
 	}
 
-	fd = drm_open_driver(DRIVER_INTEL);
+	fd = drm_open_driver(DRIVER_INTEL | DRIVER_XE);
 	if (!crtc0_active(fd)) {
 		fprintf(stderr, "CRTC/pipe 0 not active\n");
 		return 77;
-- 
2.43.0

