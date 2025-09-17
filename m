Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D664CAC598
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 08:51:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 519D210E43A;
	Wed, 17 Sep 2025 08:51:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NExpRWLk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DA6110E195
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 08:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758099087; x=1789635087;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O1IrkltmaeRUE+W4eC1usYC3ILecJzwrOZSFxndosAs=;
 b=NExpRWLk3YXQlFVkfzGNZbtZM8vgdCHUni5MH3QNo7a5Rl8yUFknuUQ6
 vwiir7SNPQrZ96iuuNpZ0xS4XUljEtcGL/oLsZoDZQGeFGgnrasEI9lSj
 jSbCFYUICbhqnPaNF7xVqqi+JcP8OgqUtsDGUodvBDK0BThn6p3Abu0uw
 hV0XYFdJB/tmNdkImwxfiyFQLZ0R0Ur2ELffFIpwf5apaAor8OH+dnqNH
 rNBgjhpdR7zszKHVIP2+VoJNS5QmKxqoeAJ1eI+GUGyimayTYIE7JmJ/q
 l90RnKNwAhhEpvSaDHPqBkbRlS1D9hOABSS3hkkZDDaQOiwYWSgSfCqCk g==;
X-CSE-ConnectionGUID: WqR4l2YgRZe2/ZH5foMJ4w==
X-CSE-MsgGUID: ODZuRZbQT2ah6W7qqIdkLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="71761654"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="71761654"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 01:51:27 -0700
X-CSE-ConnectionGUID: ZjYrUsHSShKZz34Bm7HLIw==
X-CSE-MsgGUID: 24JIfTJtQMGXS4icEOFQSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="212337894"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 01:51:25 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v2] tests/intel/kms_mmap_write_crc: lower rounds in simulation
Date: Wed, 17 Sep 2025 14:28:18 +0530
Message-Id: <20250917085818.376666-1-swati2.sharma@intel.com>
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

Reduce iterations from 10 to 5 when running in simulation to
shorten runtime without loss of coverage.

v2: embed conditional logic inside macro (Ramanaidu)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_mmap_write_crc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/kms_mmap_write_crc.c b/tests/intel/kms_mmap_write_crc.c
index ddc5ed63e..74ba70edd 100644
--- a/tests/intel/kms_mmap_write_crc.c
+++ b/tests/intel/kms_mmap_write_crc.c
@@ -55,7 +55,7 @@
 IGT_TEST_DESCRIPTION(
    "Use the display CRC support to validate mmap write to an already uncached future scanout buffer.");
 
-#define ROUNDS 10
+#define ROUNDS (igt_run_in_simulation() ? 5 : 10)
 
 typedef struct {
 	int drm_fd;
-- 
2.25.1

