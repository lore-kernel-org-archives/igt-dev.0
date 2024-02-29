Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B64C54798
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 19:41:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30FF710E48C;
	Thu, 29 Feb 2024 19:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NAEWXkEV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1C810E5E6
 for <IGT-Dev@lists.freedesktop.org>; Thu, 29 Feb 2024 19:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709235691; x=1740771691;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KDUAoL0l535IYBpuO67lF1MkIIl1xxug5k/YQ+RNK+o=;
 b=NAEWXkEVS31wsFw3dXEh9kx4lv6/3S6C4i29QPQ/Nrcyx8Zmnaf3FzZy
 jdwDgDZPNb60MtRgWe/rBEOK1XLWZd0iAboypXNxHSSlMrBrzCI2ubs+L
 qPcbvXsa4LVWULvvl0PSR39NF8MPbaFuh2VccRQnBWgUwq02a/ArRsdsN
 oyQ46JCDpLzevnDec+J7Q0oBatDVrg23jEKwRyRC7Ifnj3MMv2KxK0mn/
 gwmlzZWFsLuxqtF9BZ+iOGzqrDANqZv1iYOB56GOpOc6yY+DusblsC4Dd
 5+DpUzegbwzB/XItbIq2JlYUhSSbd+eVlvCwdFGoJN8y33mYteMth9esE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3909343"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3909343"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 11:41:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7821348"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa007.fm.intel.com with ESMTP; 29 Feb 2024 11:41:29 -0800
From: John.C.Harrison@Intel.com
To: IGT-Dev@Lists.FreeDesktop.Org
Cc: John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH i-g-t v2 0/2] More updates for MTL workarounds
Date: Thu, 29 Feb 2024 11:39:28 -0800
Message-ID: <20240229193930.2933130-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Upate another test to not fail when a MTL workaround is enabled. Also
go back and add the w/a number to a previous one.

v2: Fix broken email address in from of first patch (review feedback
from Kamil)

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (2):
  tests/intel/gem_spin_batch: Skip compute engines on MTL due to w/a
  tests/intel/gem_exec_schedule: Add w/a tag to prior update for MTL
    RCS/CCS w/a

 tests/intel/gem_exec_schedule.c |  1 +
 tests/intel/gem_spin_batch.c    | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

-- 
2.43.0

