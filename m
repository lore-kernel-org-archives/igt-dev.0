Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB983C02198
	for <igt-dev@archiver.kernel.org>; Sat,  8 Feb 2025 06:25:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5695110E05C;
	Sat,  8 Feb 2025 06:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dawExBSd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8439710E05C
 for <igt-dev@lists.freedesktop.org>; Sat,  8 Feb 2025 06:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738995848; x=1770531848;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RofTxDEDmGIodZKjayB8rM7OO3DbnP3P1v8uKmnjpKc=;
 b=dawExBSdwNS5+qAfXpfJ9ZNhtYUTUmGEL/hWq+xO9uF1ReW6XdpEvtHu
 LUnoQN4wznAeqSq2mH3Z/9WuWKgTyAz+jOQAxqyBDmH59zRLmM51gOfkD
 bMPfkGMW5KoWLoMQ1CovaaJnnfk9KWSYbqqNug4mytn3SD2A4iVVxyy7g
 77fvV11cF6kKcx04kwKjoWghzpyVzwE2lwNyeb2MOPRO4jPJ7aW3xA5ye
 7C2reQEQUYp+34//9ZHeY347iDgdjZyyjburNhAyyl9THlkKCCWtuCDZo
 b640nB+FasxbzLMU6IcdQkLhXu2+zaVXa+8MaBfJN1UK3leb2BYTa0zJP Q==;
X-CSE-ConnectionGUID: 9zqkCY/3QtK1/+hYcEs6nQ==
X-CSE-MsgGUID: IxS4On9NQTmW6XD58JWPtw==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="43300909"
X-IronPort-AV: E=Sophos;i="6.13,269,1732608000"; d="scan'208";a="43300909"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 22:24:07 -0800
X-CSE-ConnectionGUID: 52poIP5TSiWR0MpXlLouMw==
X-CSE-MsgGUID: YctmmtUJRFqDs+WzHnOiTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111559652"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 22:24:05 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vinod.govindapillai@intel.com, jeevan.b@intel.com, kunal1.joshi@intel.com,
 ramanaidu.naladala@intel.com, swati2.sharma@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v8 0/1] RFC tests/intel/kms_frontbuffer_tracking:
 Introduce plane-fbc-dr test
Date: Sat,  8 Feb 2025 11:51:32 +0530
Message-Id: <20250208062133.844786-1-santhosh.reddy.guddati@intel.com>
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

 tests/intel/kms_fbc_dirty_rect.c | 645 +++++++++++++++++++++++++++++++
 tests/meson.build                |   1 +
 2 files changed, 646 insertions(+)
 create mode 100644 tests/intel/kms_fbc_dirty_rect.c

-- 
2.34.1

