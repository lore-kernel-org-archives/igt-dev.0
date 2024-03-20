Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA4EC54E58
	for <igt-dev@archiver.kernel.org>; Wed, 20 Mar 2024 15:55:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FE5210FD9D;
	Wed, 20 Mar 2024 15:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hsiPf8xd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B88C10FD9D
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Mar 2024 15:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710950125; x=1742486125;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4aSxn23eqFWYjF0VBlZ/KTdYt5zPEGgCNmjW45YigIk=;
 b=hsiPf8xdITGS1Lymly72F2IJ4u2kxM1ORcrNJO2cxl4o8pg9eMzgF4uT
 RMplpn3yGH4vPZ5b355i/Yn0qL0c5aQ1yucpulRbm6CqYayv4FpFdBylL
 oJnOjg+PzYFHGh66rNalBgTQIuepdUCQY6gJxna8Q9WbT3us6s/dK53sP
 l+w5t2Re6O1/YQ54kFodEUEKEU1C+IveEsq+dZlzYoxWPJnJNQK7WAKy1
 Vww6yIp6va2GxFAV+KPHXmdzmDn5Mh4g+YMxI8Op8PWisEEU+vYvkmIj8
 MTrhZJ5SRUxV4YWYVtAPDgTTGPcjxQI6FsEx/dPkTKSYUaBN6v1VMOGq1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5821255"
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; 
   d="scan'208";a="5821255"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2024 08:55:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,140,1708416000"; d="scan'208";a="14590080"
Received: from gfx2.iind.intel.com ([10.145.169.154])
 by orviesa006.jf.intel.com with ESMTP; 20 Mar 2024 08:55:24 -0700
From: sai.gowtham.ch@intel.com
To: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 sai.gowtham.ch@intel.com
Subject: [PATCH i-g-t 0/3] tests/intel/xe_exec_compute_mode: Test to
Date: Wed, 20 Mar 2024 21:24:27 +0530
Message-Id: <20240320155430.11877-1-sai.gowtham.ch@intel.com>
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
  lib/xe/xe_spin: Add support to store/write ctx time
  tests/intel/xe_exec_compute_mode: Test to validate LR mode

 lib/xe/xe_spin.c                   | 12 +++++
 lib/xe/xe_spin.h                   |  3 ++
 tests/intel/xe_exec_compute_mode.c | 80 ++++++++++++++++++++++++++++++
 3 files changed, 95 insertions(+)

-- 
2.39.1

