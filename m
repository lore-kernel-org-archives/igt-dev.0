Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 296BCC982D2
	for <igt-dev@archiver.kernel.org>; Thu, 17 Sep 2026 19:10:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B5610F0A1;
	Thu, 17 Sep 2026 19:10:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VSUPR4T+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E0A10F08B
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Sep 2026 19:09:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789672171; x=1821208171;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7ho0Dydbo523YF0An9r0OYknn4MbBk9ybOH0VPdy86Y=;
 b=VSUPR4T+v+R4isKQtXPqqehSHWSJoF/g8A1ttQuZuGOwhTkBMQA3go6Z
 MZgBU0TnP7YeFnN8Mvww8D/tABiDyBYHCdJYgzj9RNXk7mcdGQ2VvZaRy
 LHFGUD4EJ74mktc8Juy2dZYZAfG+gV3Q0aE8iFu/0Xu6+fzlpN5so2deT
 8oZ7RSRfGK47OjMwN0x0JmxsI80/sobilOGctHghFTbfG+SwclYfPZxuG
 Qcqey5g0pq51dyG+px9iXryoZ+ssmP0910NaS3moUlF+/bo5VSZKiSkl8
 a33yA0y+dOPVZviCGRZu8WFeCYCKErX8hUr6svSNrDByvrmOWDBxJ25L1 Q==;
X-CSE-ConnectionGUID: mbLIOAkxR+iKHAJ5e2trkQ==
X-CSE-MsgGUID: sMBpuT9ATv2skOmrUXdHWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="639282"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="639282"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2026 12:09:31 -0700
X-CSE-ConnectionGUID: 5lpLEBqOTCKqvdqDi8aFsQ==
X-CSE-MsgGUID: tO/C45WEQVyMPmF/qE1gMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270271225"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by fmviesa010-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 12:09:28 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t,
 v5 0/3] tests/kms_color: Add support for background color testing.
Date: Fri, 18 Sep 2026 00:48:32 +0530
Message-Id: <20260917191835.977425-1-swati2.sharma@intel.com>
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

This is resend of patchset from
https://patchwork.freedesktop.org/series/167119/
with dropped first patch for drm-uapi, as it was merged, for testing on
new kernel 7.3.0-rc3.

v5: fix memcpy assertion failure in kms_atomic (Swati)
v4: resend of kms_color changes (Kamil)
v3: sync with most recent drm-next uapi change, fixed subject
    in second patch (removed dot from end), removed one non-needed
    empty line from last patch (Kamil)

Maarten Lankhorst (2):
  lib/igt_kms: Add support for the BACKGROUND_COLOR property
  tests/kms_color: Add background-color subtest to test the
    BACKGROUND_COLOR property

Swati Sharma (1):
  tests/kms_atomic: skip BACKGROUND_COLOR in CRTC state checks

 lib/igt_kms.c      |  6 ++++
 lib/igt_kms.h      |  1 +
 tests/kms_atomic.c |  3 +-
 tests/kms_color.c  | 71 ++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 80 insertions(+), 1 deletion(-)

-- 
2.25.1

