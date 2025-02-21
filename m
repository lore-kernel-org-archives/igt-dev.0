Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397E3C021B2
	for <igt-dev@archiver.kernel.org>; Fri, 21 Feb 2025 00:26:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB86310E9FF;
	Fri, 21 Feb 2025 00:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LGUWWnik";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E0A10E9F9
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Feb 2025 00:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740097575; x=1771633575;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=B2BTyPPnpDkGPljdeLBVEzUf6phcgbHmqGFyPs2gbb0=;
 b=LGUWWnikvET0nIl6DosZgXIIBY1zi6NiCM3en3afV2yOQ8xDXLWqKnNO
 U1h5Jc3AE4nfy4NukyHDdEHRpQWyQEtuodrbr5Soo4ymogNR19ZlfirO+
 u4HvHh+mf7dAOPCCrnb7o6RoBQX0BRJCc4cepHgg8VsiZQwWxTfpxT8T7
 m8TnmrsbpSyoOI2zwCzrMCMeONHSNPY5y07uwRbVJLaQJ59irQRA8hBZ1
 K2LnWwlKREqcfqLjgDhRFCsPt6oZrWlgGXpYPM/KwHtC5PcxVQFEBU9nj
 S4+OfiQBaKN5fgvo3D/sFUHncKdakjjUbZgJdqB0QjUnnC5AMcGKewTGv w==;
X-CSE-ConnectionGUID: 3WZ4B0jFStKuItjwfGQr/g==
X-CSE-MsgGUID: tZIVQgbOS6eo6jvdMkTpNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="44548837"
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="44548837"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 16:26:15 -0800
X-CSE-ConnectionGUID: JfxYClxhSrG9LE9rtyxkJg==
X-CSE-MsgGUID: PpyRiNgvQ4CMqpbsUyIqUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; d="scan'208";a="115408277"
Received: from szeng-desk.jf.intel.com ([10.165.21.160])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 16:26:14 -0800
From: Oak Zeng <oak.zeng@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Thomas.Hellstrom@linux.intel.com, matthew.brost@intel.com,
 kamil.konieczny@intel.com, zbigniew.kempczynski@intel.com,
 ashutosh.dixit@intel.com, juha-pekka.heikkila@intel.com,
 rodrigo.vivi@intel.com
Subject: [i-g-t v4 0/4] xe: Test scratch page under fault mode
Date: Thu, 20 Feb 2025 19:41:58 -0500
Message-Id: <20250221004202.369505-1-oak.zeng@intel.com>
X-Mailer: git-send-email 2.26.3
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

This series intoduces a subtest for Xe to test scratch page under fault
mode.

It also includes some helper functions to make the test easier.

Today most of igt tests use one single function to perform multiple
subtests. flags are used to control the behavior of the test. While
this is a good way to write efficient tests, it also makes the test
difficult to maintain, especially when we add more and more subtests
into single test function.

This patch series introduces some helper functions with which we can
write more readable tests. This is illustrated in patch 4 of this series.

Note the intention of this patch series is not to replace the existing
igt tests, but to provide an alternative way to write simple tests.

Bommu Krishnaiah (1):
  lib/xe/xe_util: Introduce helper functions

Oak Zeng (3):
  lib/xe: Fix a comment error
  tests/intel/xe_vm: Exclude invalid_flags tests from LNL and BMG
  tests/intel/xe_exec_fault_mode: Test scratch page under fault mode

 lib/xe/xe_ioctl.c                |   2 +-
 lib/xe/xe_util.c                 | 228 +++++++++++++++++++++++++++++++
 lib/xe/xe_util.h                 |  39 ++++++
 tests/intel/xe_exec_fault_mode.c |  69 ++++++++++
 tests/intel/xe_vm.c              |  47 +++++--
 5 files changed, 369 insertions(+), 16 deletions(-)

-- 
2.26.3

