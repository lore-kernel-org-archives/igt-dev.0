Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AACAC0219D
	for <igt-dev@archiver.kernel.org>; Thu, 13 Feb 2025 08:36:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5E510EA21;
	Thu, 13 Feb 2025 08:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WOA7UEEW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19D310EA21
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2025 08:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739435787; x=1770971787;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jVlY1NWlmmCiYkTyh89BIdBGmqSaNsOBRoHxVbtoSPI=;
 b=WOA7UEEWyj2OcdXmg1wcGPOmttlypBcutieeDs6mAmpNnLgJRzFAU00l
 c6k9Pdc+MF/U+5wHS/y0df4/SH9iIeuMh5B4V6LmNXXYoIv2U5HpVY46w
 mNz7SHwYoBL1JULx6pgLS6HwPuWfm6jGtfXXwyg+yzPAnDAjLQb6CekZT
 N3bRseobCDuQwRzt3tc8AjyPWe3MMUOURQkEe2P+GzsLRpIA5o50ej8Qm
 TLrpFyjcz8WfHR9r16TZJQm69IP/+DZq8okXIOVvfXaTL64R7ThKJvmkY
 S7ruZl6DFiIIuuQgJ3r6/AqCCc//cW+HruTTWJzof9Hs+i6C3mtANC3wO g==;
X-CSE-ConnectionGUID: 0gbO+ehARQiGgnuat4/X+Q==
X-CSE-MsgGUID: RXRQaA0lTnqDSolD55fxDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="43893951"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="43893951"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 00:36:26 -0800
X-CSE-ConnectionGUID: 5sZBiC2rSPGQFJ/cTm6MaA==
X-CSE-MsgGUID: 9Ho4RBpGRaSPUWnL2RarDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="113035835"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa006.jf.intel.com with ESMTP; 13 Feb 2025 00:36:24 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/intel/kms_flip_scaled_crc: Add more logs to
 skips/failure
Date: Thu, 13 Feb 2025 14:11:51 +0530
Message-Id: <20250213084151.705298-1-pranay.samala@intel.com>
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

Having some logs for test failures or skips would
make debugging much easier.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_flip_scaled_crc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
index 7dc07bc83..439723eea 100644
--- a/tests/intel/kms_flip_scaled_crc.c
+++ b/tests/intel/kms_flip_scaled_crc.c
@@ -709,6 +709,8 @@ static drmModeModeInfoPtr find_mode(data_t *data, igt_output_t *output)
 		}
 	}
 
+	if (!modetoset)
+		igt_info("Unable to find the required mode.\n");
 	return modetoset;
 }
 
-- 
2.34.1

