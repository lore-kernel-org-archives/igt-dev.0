Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43505C54E68
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 11:28:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4CE10E15E;
	Thu, 21 Mar 2024 11:28:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="amZ+vYvQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9848610E15E
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 11:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711020514; x=1742556514;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LZfYlTsWUKIo+A4tKAdtxCCeBfh8YFPS9ekTZlI+5Lo=;
 b=amZ+vYvQ3biSpFLkBUzyo1tR0EiMd4mWH44gwYdh/zuPxeDExyaad4bS
 JZFq99rhyEw1TU/XE3jnRZlTa+ZjAzv3r3Xsz5W2/acWhYZ0v/iLoLJJh
 DKO/LopQS+bONIKdVUT01/4MZpMHWNxvM5c3GV51/Rq2Gqxcbx/OZoU5k
 dx2tHAeyH6yLF+nImI+C7j7U/w1ZaTIOQjjcydUFx3tQqUdT8gWH6U6xS
 XteyRjWPZpJVrsPln1pi3O3nxdddj2PBOewNUUa+/kvindB9GMwwLeES0
 svAhAv+6GnnemH3W0RgEmvoSXT+7EwJ2EjZA9VySPhWvOQGBNUdIM0mKD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="17140065"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="17140065"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 04:28:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; d="scan'208";a="15119373"
Received: from gfx2.iind.intel.com ([10.145.169.154])
 by orviesa008.jf.intel.com with ESMTP; 21 Mar 2024 04:28:33 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 sai.gowtham.ch@intel.com
Subject: [PATCH i-g-t 0/3] tests/intel/xe_exec_compute_mode: Test to validate
 LR mode
Date: Thu, 21 Mar 2024 16:57:35 +0530
Message-Id: <20240321112738.8703-1-sai.gowtham.ch@intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

This Patch series involves below changes:
1. Updating xe_spin structure with exec_sync In LR mode it can be used as a GPU address
   when sync is passed via exec IOCTL.
2. Adding support in xe_spin to store/write ctx timestamps.
3. Test to Validate LR mode for 30's.

Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>

Sai Gowtham Ch (3):
  lib/xe/xe_spin: Update xe_spin with exec_sync
  lib/xe/xe_spin: Add support to store/write timestamp
  tests/intel/xe_exec_compute_mode: Test to validate LR mode

 lib/xe/xe_spin.c                   | 12 +++++
 lib/xe/xe_spin.h                   |  3 ++
 tests/intel/xe_exec_compute_mode.c | 81 ++++++++++++++++++++++++++++++
 3 files changed, 96 insertions(+)

-- 
2.39.1

