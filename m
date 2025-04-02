Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E279C28B20
	for <igt-dev@archiver.kernel.org>; Wed,  2 Apr 2025 16:32:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B0B10E857;
	Wed,  2 Apr 2025 16:32:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rmkz7Coq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E444210E856
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Apr 2025 16:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743611544; x=1775147544;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2gOusSiZtfT9gzbEd+QvpHJg+nZESoN57BIj+I2ZVj0=;
 b=Rmkz7CoqS8xvnGlBD7rXtSUi5fGRkxkdpuW/VQshftveLfARgNwGaIl0
 KfzTSuGDpX3qg2tXCcMWh+jwJR3VOZeAhoxAK8lE09WQnHdVc+/ahosH6
 WWcV6Y/8/HX8E+7x8CGlGlg6tj40Txg1NuxK5K8y80g5mc+uaZj5rjV3R
 xIbzQh96Q52/1DU8zcg6f3yTu4hbhALea3d+PSobfy7/Wgr3/wGof/fqu
 aGq+FaU7yBfPayz1igez5Y4+AiGnuzO1Zy5NFcvRm9ofGnaJz/NlyLdbK
 sC7qiM7PRlAzKsJBt+x1e7AC/V7pTNaz5gPoR6uX3ygS78dEhUGWA/zKi Q==;
X-CSE-ConnectionGUID: Xz2X3G5GS5WTZs8+KZCTEA==
X-CSE-MsgGUID: wNbvbf7QRnqLlfBQD8EIaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11392"; a="44884986"
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="44884986"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2025 09:32:15 -0700
X-CSE-ConnectionGUID: dkdye9w+Qmmx4EDMc3nlbA==
X-CSE-MsgGUID: oj7JdAYGSa2hCnad0OdC+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,182,1739865600"; d="scan'208";a="126508863"
Received: from unknown (HELO pgurram-desk.iind.intel.com) ([10.190.238.70])
 by orviesa009.jf.intel.com with ESMTP; 02 Apr 2025 09:32:15 -0700
From: Pravalika Gurram <pravalika.gurram@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Pravalika Gurram <pravalika.gurram@intel.com>
Subject: [PATCH i-g-t 0/4] Added benchmark test cases for xe
Date: Wed,  2 Apr 2025 22:10:47 +0530
Message-Id: <20250402164051.671184-1-pravalika.gurram@intel.com>
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

