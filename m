Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84436D149E8
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 19:51:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F03A10EB7C;
	Fri, 25 Oct 2024 19:51:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aRnQsgQ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6C410E0D9
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 19:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729885914; x=1761421914;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+yWN5sRpwWkddiW7E7zlxwx1NwX4CVgBHhGP8pxD5bw=;
 b=aRnQsgQ/VLvZ/qMMeMNP4KR/kvFS45Qia/DTvO6u+zh8RXV8nM+GpvRS
 9QKhIedImdweRKyzriJFNm5Si2FUaZy2ACzzLIVPwwA1o/CPhlHwPeK3o
 ROrOKxtykKvt8tM7o48srK2Ud8ZX+rmfuyik//89iM0VGeFiyZ+apC/3V
 KvGcyzkUJ0uRwbWj0+yxEOhLBPaFBDfDeONJ35V1X/scMdngQLHV5D7qI
 vI16EE41jP3pvBiddagLjatkzVeB9NP3s+uTr8pT3oGmJ38qiv3PUZk6P
 xCkP8dg3SAVh20c0u+uDzwE1XzSav5r0ckGtFqxrlhcMYbcqQjEGBXD8b w==;
X-CSE-ConnectionGUID: QokQ/B+ASVawDD+Gh5BgkQ==
X-CSE-MsgGUID: SvTAIDWtS8mJ2BD0cVD+tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="47028013"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="47028013"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 12:51:53 -0700
X-CSE-ConnectionGUID: 8W/uaouATGG+xJHpl0FxtQ==
X-CSE-MsgGUID: roSJVvucRleAP24Rlew/iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="81163028"
Received: from fyang16-desk.jf.intel.com ([10.165.21.214])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 12:51:53 -0700
From: fei.yang@intel.com
To: igt-dev@lists.freedesktop.org
Cc: Fei Yang <fei.yang@intel.com>
Subject: [i-g-t 0/1] xe_exec_threads: wait for all submissions to complete
Date: Fri, 25 Oct 2024 12:55:26 -0700
Message-Id: <20241025195527.1451640-1-fei.yang@intel.com>
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

From: Fei Yang <fei.yang@intel.com>

In test_compute_mode, there is an one second sleep waiting for all
the submissions to complete, but that is not reliable especially
on pre-si platforms where the GPU could be a lot slower. Instead we
should wait for the ufence to make sure the GPU is inactive before
unbinding the BO.

Signed-off-by: Fei Yang <fei.yang@intel.com>

Fei Yang (1):
  tests/intel/xe_exec_threads: wait for all submissions to complete

 tests/intel/xe_exec_threads.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

-- 
2.25.1

