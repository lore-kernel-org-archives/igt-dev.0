Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1103AC3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 14:39:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05C210E991;
	Thu,  1 Aug 2024 14:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q77Pwj2X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7333610E991
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 14:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722523145; x=1754059145;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HbtkHNo/wgefAyyUBJh5ZF5MxLebO6q3jcBOwlFeNHc=;
 b=Q77Pwj2XVHSln3dwN+N/N19NKl9j1x6jWVcDt0KHeIkwFO6aKtYPfchN
 Mtfu53ZtQcgWnMo1ghtScEqqZyNwqzEomycSHUfAmd6AbgEXgQvIMHcKv
 ztk8q++O6GGMroIB4pQ9bpxFCNv932iT06HSxJbxdViEuOYvxur//Mvmg
 HindwoUSxybmwFbOqvAhHV5Knrfgz1EE54+pe1zBlLaYDhzNKyTxbZwqS
 XyIoJUx5iEOwVAJweQJH0th2dktJSmt7bXuyfQQpRDRjAoXeJfvcKLcuD
 9SRwEfXiAwd2oyL46xf+HFCpbfose92pvHBRacLWkyzE8Gizmg7TbdK3w g==;
X-CSE-ConnectionGUID: Tb3g4pOdQqKsDZZobK5FnQ==
X-CSE-MsgGUID: 9gLDUH42QU+RB1R3psaLyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="24343675"
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="24343675"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 07:38:56 -0700
X-CSE-ConnectionGUID: /2VLVHLkQcqVub2CSsttPw==
X-CSE-MsgGUID: oxare0VLT5W/96rprvVbTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,254,1716274800"; d="scan'208";a="59872692"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.96.225])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Aug 2024 07:38:55 -0700
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: riana.tauro@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, jonathan.cavitt@intel.com,
 lukasz.laguna@intel.com, jakub1.kolakowski@intel.com
Subject: [PATCH v2 i-g-t 0/3] Add sysfs node checks for gt_freq and
 pm_residency tests
Date: Thu,  1 Aug 2024 16:38:45 +0200
Message-Id: <20240801143848.509164-1-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
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

This patch series introduces necessary node checks to ensure that tests
are only executed when specific sysfs nodes are present. This prevents
test failures on Virtual Function (VF) devices where these nodes might
be missing.

v2: Use "node" instead of "attribute" for more accuracy

Marcin Bernatowicz (3):
  lib/igt_sysfs: Add xe_sysfs_gt_has_node to check node existence
  tests/intel/xe_gt_freq: Skip test if 'freq0' node is missing
  tests/intel/xe_pm_residency: Skip test if 'gtidle' node is missing

 lib/igt_sysfs.c               | 26 ++++++++++++++++++++++++++
 lib/igt_sysfs.h               |  1 +
 tests/intel/xe_gt_freq.c      |  1 +
 tests/intel/xe_pm_residency.c |  2 ++
 4 files changed, 30 insertions(+)

-- 
2.31.1

