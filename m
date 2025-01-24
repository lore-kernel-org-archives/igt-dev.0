Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288B9C02181
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jan 2025 12:05:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C303610E002;
	Fri, 24 Jan 2025 12:05:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iOugbOmI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B07E10E002
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2025 12:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737720314; x=1769256314;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HkU7hjwqK8O56+EVyqjxgbJ8AnmDYc1dNLEmugCc8r8=;
 b=iOugbOmI2ftZFjprr3kJpgOnpStAQctUFUFOKzkSz3e9hhVef9ReFMNL
 rJrtxmOGeXrPaLCqTfe4H7BB/HcoJ5WjLlrdfMd06oltp4wGdydiCeJOt
 7Ycx4cf3QTh3eksY9jqhdEMHkIp9o9YKIXkhICFYq3SJaiUBl8epg2MLX
 jGqlcR1ryTb/frZOt5BWMkM6mvJ9ZSvDUS39zNYP24XVGKsNcFKq1aMHt
 a5YDEeBcjlbzweYVw+1sHIu2nFfB0oX+aQV+Eh8AUhaE02Z81f0gSzSCl
 gKlmIlr8fkmmZACEeRIM0xIoIsnf3jXXwFpVmyOmMzmHeMsganqyvyd5E A==;
X-CSE-ConnectionGUID: ZJZa5P3pQZCbhoMW3tG35Q==
X-CSE-MsgGUID: txgMtlgbTY+czgKvdnxM6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11325"; a="63603909"
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="63603909"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 04:05:14 -0800
X-CSE-ConnectionGUID: tmmGPVAWTWOq5YXOzE08xQ==
X-CSE-MsgGUID: coSCZ1XdSLCORBDQpuTkuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; d="scan'208";a="138624976"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 04:05:12 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, jeevan.b@intel.com, kunal1.joshi@intel.com,
 ramanaidu.naladala@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v6 0/1] RFC tests/intel/kms_frontbuffer_tracking:
 Introduce plane-fbc-dr test
Date: Fri, 24 Jan 2025 17:33:34 +0530
Message-Id: <20250124120335.379855-1-santhosh.reddy.guddati@intel.com>
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

Use the FP_DAMAGE_CLIPS property of the plane for non psr modes
and fill the damaged rectangles on the plane with framebuffer
coordinates and verify that fbc dirty ctl is enabled

Santhosh Reddy Guddati (1):
  tests/intel/kms_dirty_fbc: Add kms_dirty_fbc test for DIRTYFB ioctl
    with fbc

 tests/intel/kms_fbc_dirty_rect.c | 348 +++++++++++++++++++++++++++++++
 tests/meson.build                |   1 +
 2 files changed, 349 insertions(+)
 create mode 100644 tests/intel/kms_fbc_dirty_rect.c

-- 
2.34.1

