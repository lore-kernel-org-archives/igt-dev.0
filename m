Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A4AC79FA1
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 07:15:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEADE10E39C;
	Fri, 11 Sep 2026 07:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n90JRuiS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22BF110E39C
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 07:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789110858; x=1820646858;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m35hwmlgP4ivdSfVtmEROMR3Fk4TQk7cZR/BuFVE6fI=;
 b=n90JRuiSNnIhHidskq/Eq2AKC51sxiyoKUIo8tdQcXAX6C8FmjlUyRpd
 A9DXjVIyuRSNdBNOFGwkMV6GON/ex84bX1xVCory8G/XNC6EXxbfWGHbz
 d2HeMzHqZhSgN67GXMdC8fedMunsfx+u7elriVXWCkHXS9KudyRDl7n5G
 W6cW/uhOIFtkCc5MJ3yccYpEbT4TdgerQZKFoHLCzRbKZqBZk+fMtZdO0
 lxIufrsZYRbg+QxCk+48kpwqPkz3Rqgy+vQrM7JLbCZzlgSK1p0A3RiMd
 S+BXHkGX/ZPXIXWK47GGDQ3/LR9Sen6obdi9UOCpDhcqMyHHj+8rYdVwL g==;
X-CSE-ConnectionGUID: tEzvf9KvR/u1CQ4bo5mmFQ==
X-CSE-MsgGUID: iTe4fLZERJWka1AxNWjqNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="115112136"
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="115112136"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 00:14:17 -0700
X-CSE-ConnectionGUID: QBuDFnNJQTugk3gO12ubCg==
X-CSE-MsgGUID: jeM1+er6T9aZk9PaLqI+9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,96,1787036400"; d="scan'208";a="275989633"
Received: from dut1231bmgfrd.igk.intel.com ([10.211.177.56])
 by orviesa005.jf.intel.com with ESMTP; 11 Sep 2026 00:14:16 -0700
From: shivtej.eknath.patil@intel.com
To: igt-dev@lists.freedesktop.org, kamil.konieczny@intel.com,
 nishit.sharma@intel.com, smitha.balasubramanyam@intel.com
Cc: Shivtej Patil <shivtej.eknath.patil@intel.com>
Subject: [PATCH v6 0/3] xe_device_sysfs coverage updates
Date: Fri, 11 Sep 2026 07:13:30 +0000
Message-ID: <20260911071409.56112-1-shivtej.eknath.patil@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Shivtej Patil <shivtej.eknath.patil@intel.com>

Add coverage for xe_device_sysfs sysfs interfaces by introducing
helpers for vram_d3cold_threshold and extending xe_pm with subtests
that validate the corresponding sysfs attributes.
 
The series covers:
- vram_d3cold_threshold show/store interfaces
- lb_fan_control_version show interface
- lb_voltage_regulator_version show interface
- auto_link_downgrade_capable show interface
- auto_link_downgrade_status show interface
 
Changes since v5:
- Move xe.pm.d3cold.testlist updates into a separate intel-ci patch.
- Fix indentation of newly added subtests in xe_pm.
- Fix indentation of igt_fixture() inside igt_main().
- Remove trailing whitespace reported by checkpatch.
- Add commit description for the intel-ci patch.

Shivtej Patil (3):
  lib/igt_sysfs: add vram d3cold threshold helpers
  tests/intel/xe_pm: add coverage for xe_device_sysfs
  intel-ci: add xe_pm sysfs coverage subtests

 lib/igt_sysfs.c                      |  50 ++++++++
 lib/igt_sysfs.h                      |   3 +
 tests/intel-ci/xe.pm.d3cold.testlist |   6 +
 tests/intel/xe_pm.c                  | 176 ++++++++++++++++++++++-----
 4 files changed, 204 insertions(+), 31 deletions(-)

-- 
2.43.0

