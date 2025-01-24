Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49459C0218D
	for <igt-dev@archiver.kernel.org>; Fri, 24 Jan 2025 11:53:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C9F10E96F;
	Fri, 24 Jan 2025 11:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TmKWVVMF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C320C10E96F
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jan 2025 11:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737719628; x=1769255628;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SWQnrkqNIkh+beSuL9p7hwx5BM1LcwjKwo704fZhRxM=;
 b=TmKWVVMF1dig7OYdfwaphmFmlaKxXtQP9Uml0q/LlGxfZnw7OO0AyMhf
 zcrIBYYp/E6qqCTWLiJ3ubPKmzFUdlIWgxucQl0nIFgEeuUi2flonm7mP
 6BYtusRHb6Xk2e0M5MfcS6RH5osb93KsIuuOretHmHG7wFPYsvmsew9j8
 hIrWWH/0qXUS+SOoAcKpZDz01NM4f2dyouzlue8nr4Qb970QwzqfRDwvc
 px/PauiTgCo/qtIXcYptxlWk9bblUvu4HzQnd4AODY0zzO22VIC1orcjO
 57t1Jnk5WhqGTce300wnCd0nmUT147DG6gYI2+kFRkoU05xjOG/eqxo7Z Q==;
X-CSE-ConnectionGUID: 3KLwnQpHQLCN6RBi7TDo9Q==
X-CSE-MsgGUID: LEhj/08eRd++kv5I09946w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38350741"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="38350741"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 03:53:48 -0800
X-CSE-ConnectionGUID: Y4aq84gpR3S76Zx+DGnoHg==
X-CSE-MsgGUID: GmQDw2xiRiqOAhyeHdkrVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108176663"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2025 03:53:45 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, jeevan.b@intel.com, kunal1.joshi@intel.com,
 ramanaidu.naladala@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v5 0/1] RFC tests/intel/kms_frontbuffer_tracking:
 Introduce plane-fbc-dr test
Date: Fri, 24 Jan 2025 17:22:10 +0530
Message-Id: <20250124115211.379469-1-santhosh.reddy.guddati@intel.com>
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
coordinates and verify that fbc dirty ctl is enabled.

Santhosh Reddy Guddati (1):
  tests/intel/kms_dirty_fbc: Add kms_dirty_fbc test for DIRTYFB ioctl
    with fbc

 tests/intel/kms_fbc_dirty_rect.c | 348 +++++++++++++++++++++++++++++++
 tests/meson.build                |   1 +
 2 files changed, 349 insertions(+)
 create mode 100644 tests/intel/kms_fbc_dirty_rect.c

-- 
2.34.1

