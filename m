Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1451062884
	for <igt-dev@archiver.kernel.org>; Wed, 11 Mar 2026 12:26:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E120410E8DA;
	Wed, 11 Mar 2026 12:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="liUSbZn/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32E8110E116
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Mar 2026 12:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773231971; x=1804767971;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZGMGm10BwiZMQoMmIwJoO3A5+24etwbpSDOfy3H6thc=;
 b=liUSbZn/7fd+n1VLRpHGaPBjJGt0McGkKNwovcKDFiPAUsNtmehRWAlv
 Xyt1VxnKyRrp90vn/4xV1jWvCiVDVptrl4BnmPYeDYNicL37UuxsvqtGb
 CBWU83C1ZjTUC8r4AGeh6PW/nbn0iLoIRawcWFobawGGMlSmJsHgNj9aW
 pheGPlUOVTXqbSEiPqJFrVFaOdOTaIDUkfqQRf+yTPDHFVB4usab5Ojat
 7ET0iKhUDqw+YIZzZI5mjczPQTDZniUXiy0mcwVkIGGvAZo3hY6xZ8X/p
 lNbzOqdlx/r/v+WVdKTCnwYKUYO0a5SiPTI1B22dmxPCI9URDFLrP3iUQ w==;
X-CSE-ConnectionGUID: 6CC/rQXqQ6ecBuZMnuko6Q==
X-CSE-MsgGUID: BDWA+E0oRl2PG/qCkLAQDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74335530"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="74335530"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 05:26:09 -0700
X-CSE-ConnectionGUID: L/PmpAXITxGVBZe8XIPJ8g==
X-CSE-MsgGUID: q+RPYuKVRGGUY3K3IZhN6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="225148286"
Received: from cml-cometlake-client-platform.iind.intel.com ([10.223.55.11])
 by fmviesa005.fm.intel.com with ESMTP; 11 Mar 2026 05:26:07 -0700
From: aditya.chauhan@intel.com
To: ramadevi.gandi@intel.com, himanshu.girotra@intel.com,
 swati2.sharma@intel.com, igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 0/2] tests/intel-ci: Add NVL display and core blocklists
Date: Wed, 11 Mar 2026 17:56:04 +0530
Message-Id: <20260311122606.42223-1-aditya.chauhan@intel.com>
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

From: Aditya Chauhan <aditya.chauhan@intel.com>

This series adds blocklist files for the NVL platform under intel-ci.

Patch 1 introduces the xe.nvl.core.blocklist file and registers it
in meson.build to track known failing core tests on NVL.

Patch 2 fixes a missing meson.build entry for the NVL display blocklist
that was added in commit 04db3b26c52b
("intel-ci: Add NVL display blocklist").

Aditya Chauhan (2):
  tests/intel-ci: Add NVL core blocklist
  tests/ci: Add NVL Display blocklist to meson.build

 tests/intel-ci/meson.build               |  2 +
 tests/intel-ci/xe.nvl.core.blocklist.txt | 69 ++++++++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 tests/intel-ci/xe.nvl.core.blocklist.txt

-- 
2.34.1

