Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA2BEEB573
	for <igt-dev@archiver.kernel.org>; Wed, 31 Dec 2025 23:21:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD59B10E2F3;
	Wed, 31 Dec 2025 23:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fGk1mb5H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733CA10E2F3
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Dec 2025 23:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767223315; x=1798759315;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bdCHUNeYf6DB5We7aJ3h4mG91cfzZ/7vcmAkOrihnYY=;
 b=fGk1mb5HASF+MMJ+TShgZphsxhrq4INA1+CuEQeun/PxGi4VZ8ixr9W6
 CbWpZ7JJxv6+5GxhLs56Rux02dNEKcHCrUKWR7UtDdkI6xF7eQFpk9xps
 ehEojlU+Ucn7Qgc/N7qLrTd3NRXWIbYQaJa3UuhUBAgp38S5s5SVrm2NT
 WqW4NaEH8M2ndTMigOxeg3ajkbfy62a3pwwHPfq1b1MwS5en3Pdc4IY2e
 +TEJ3JCFzbkHNAK1g5MAgvgH0S7yR7+91bcWS1mk8oWwm0nJVNSX53D+p
 NQa0kampTKzy1jXfboyxFcEdF9p7T9klJIbVVHms8PTs8I6J2C6MbQfox Q==;
X-CSE-ConnectionGUID: LWMEbz/ATfOq1ovxJN+7/A==
X-CSE-MsgGUID: N4kVqQmiQTi4qUegcy2kWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="67792694"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="67792694"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2025 15:21:55 -0800
X-CSE-ConnectionGUID: Fl6bwPFaT5KBezTZWNNKtg==
X-CSE-MsgGUID: fCty7lLGTdCMijPSm5/xVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; d="scan'208";a="206572327"
Received: from dut6304bmgfrd.fm.intel.com ([10.36.21.42])
 by orviesa005.jf.intel.com with ESMTP; 31 Dec 2025 15:21:55 -0800
From: Xin Wang <x.wang@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Xin Wang <x.wang@intel.com>
Subject: [PATCH v11 0/5] tests/intel/xe_pat: add helper funtion to read PAT
 table
Date: Wed, 31 Dec 2025 23:21:47 +0000
Message-ID: <20251231232152.127555-1-x.wang@intel.com>
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

Xin Wang (5):
  lib/intel_pat: add pat_sw_config debugfs parser
  include/linux_scaffold: add FIELD_GET() bitfield helper
  tests/xe_pat: add pat-sanity subtest for debugfs vs getters
  tests/xe_pat: use debugfs reserved flags
  intel-ci: add xe_pat pat-sanity

 include/linux_scaffold.h                 |  6 ++
 lib/intel_pat.c                          | 94 ++++++++++++++++++++++--
 lib/intel_pat.h                          | 20 +++++
 tests/intel-ci/xe.fast-feedback.testlist |  1 +
 tests/intel/xe_pat.c                     | 87 +++++++++++++++++++++-
 5 files changed, 197 insertions(+), 11 deletions(-)

-- 
2.43.0

