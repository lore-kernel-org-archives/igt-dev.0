Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F30C28B20
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 06:28:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B87D710E6C3;
	Wed,  2 Apr 2025 06:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ca5QX314";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A553810E6C3
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Apr 2025 06:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743575326; x=1775111326;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WXX67B9Vef2OLINR4JUgOAcc6BRH8I/HNmyK8xoYqb4=;
 b=Ca5QX314oAj9HBleYAC6yvhL3P/oTwksRGTiZ2YVcAgA8HeRixFMvkb0
 N6jqhg9HHWTmBwpOxvHEdYaEP0sbnavJEWDUQsplsKmj46uqDb1GsFKjB
 R/x7sVw+ofm+3EpwTh6CE7CmydIyzrkjDVi+ZVKiuzG7DDm/dJ6ul3vhE
 FrG7E60csF3pLpSj5FgyJz0xC/8o0Vyk4pc2wvC+MjePMoLFEYNhOx/mK
 J/R+Hvj/Rmcl35GAdNiCB/7J6bFXmCSVVgeltwxETiKfByvFDQoPNk4T0
 sfb50hd1X/JPKA6afBGCSnu1JTropOoOZd45f+Cmx86ywTf2DGcLEPafv Q==;
X-CSE-ConnectionGUID: 7XqgxHRURp+8kR2EEreRIA==
X-CSE-MsgGUID: B4gbXKvOSMuFFlbzwkMITQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44805914"
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; d="scan'208";a="44805914"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 23:28:45 -0700
X-CSE-ConnectionGUID: /f5Ps7RrSnKjs5fh3cv5SA==
X-CSE-MsgGUID: z0CU0SYPQymzk9nq2Ilwow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; d="scan'208";a="126492627"
Received: from unknown (HELO pgurram-desk.iind.intel.com) ([10.190.238.70])
 by orviesa010.jf.intel.com with ESMTP; 01 Apr 2025 23:28:45 -0700
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH i-g-t 0/4] Added benchmark test cases for xe
Date: Wed,  2 Apr 2025 12:07:19 +0530
Message-Id: <20250402063723.660112-1-pravalika.gurram@intel.com>
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


Pravalika Gurram (4):
  benchmarks: Measure BLT performance
  benchmark: Measure allocation time for objects
  benchmarks: create xe_exec_ctx
  xe_exec_nop: create xe_exec_nop

 benchmarks/meson.build   |   4 +
 benchmarks/xe_blt.c      | 369 +++++++++++++++++++++++++++++++++++++++
 benchmarks/xe_create.c   | 233 ++++++++++++++++++++++++
 benchmarks/xe_exec_ctx.c | 332 +++++++++++++++++++++++++++++++++++
 benchmarks/xe_exec_nop.c | 221 +++++++++++++++++++++++
 5 files changed, 1159 insertions(+)
 create mode 100644 benchmarks/xe_blt.c
 create mode 100644 benchmarks/xe_create.c
 create mode 100644 benchmarks/xe_exec_ctx.c
 create mode 100644 benchmarks/xe_exec_nop.c

-- 
2.34.1

