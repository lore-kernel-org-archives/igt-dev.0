Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C991BC8303C
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 19:21:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DE1210E33C;
	Mon,  7 Jul 2025 19:21:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gzytGRTH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA0110E33C
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jul 2025 19:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751916119; x=1783452119;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=edxuBHt5FhjYjqhrzYImKF9BE6fxnDzs3ZiRy/hvx3g=;
 b=gzytGRTHYIIdHp5Yeu0EuCZZvY7WvcDgoeeT9/N0aWajKS9ZB6IRCrVD
 rgIsM9fjJ3CXYBPkLj0srxNvEbkaKJy6T9QmXS/Vv15xUqVfbt3yvIdic
 T8a5bDURyeR99PozDy1tUafi7l9JsaI3IIE1mmzDNPrHi8yi7DpgsiF8z
 GxiiUNH+nD2EDayiV0J3V8Kotjmv3tUeNqxKw2bdu98F+b8rI2AUCLPnj
 gmh8e18ZHHYDdTK+MJwdLuyZScExXsB9rcY7wxGroFunHBbbSTcLSiQea
 0xNTFbnJyKuu32ouIq64op8KXJScJFf9XCURxB6JaNQUhCl7ebaXvBW6l A==;
X-CSE-ConnectionGUID: KUgKqbj1QNeAG95JpVPCiA==
X-CSE-MsgGUID: NeARAWkZS4GMwjJkYBz4Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="57818592"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="57818592"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 12:21:58 -0700
X-CSE-ConnectionGUID: PxuOcdsOQTm9Tc67GXKx7w==
X-CSE-MsgGUID: Glrs5VgjQkycmFDH4YdR1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="154913747"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 12:21:56 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1] tests/intel-ci: Add unsupported downscaling tests to
 blacklist
Date: Tue,  8 Jul 2025 00:52:09 +0530
Message-ID: <20250707192209.783141-1-ramanaidu.naladala@intel.com>
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

Adds the scaling test to the blacklist due to failures when
the maximum downscale factor exceeds the 3.0 limit in either
direction.

Bspec: 50441

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/intel-ci/blacklist.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index 6c91f1a70..bb4b8dfec 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -84,6 +84,11 @@ igt@gem_exec_alignment@pi-shared
 ###############################################
 igt@kms_frontbuffer_tracking@.*drrs.*
 ###############################################
+# Maximum downscale must be less than 3.0 in
+# each direction
+###############################################
+igt@kms_plane_scaling@.*downscale-factor-0-25.*
+###############################################
 # Tends to generate invalid configurations
 # using CCS planes or configurations that
 # exceed HW capabilities resulting in sporadic
-- 
2.43.0

