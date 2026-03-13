Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085B4105F78C
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 12:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B457410EB91;
	Fri, 13 Mar 2026 12:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k9AXArAi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9F8A10EB91
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 12:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773405311; x=1804941311;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=35Y6spRULZ67fQPWMb4MJIIeQweb02uYPdOQlEeepDw=;
 b=k9AXArAiRqPdllTUpFBtGqqCjk6B/OfNeCBfo26pzpiW2SgvFGpIYgjD
 tPEajLsRBIfDZu5b9P5V5UqDYvEB0opfwgt7dEIWpdAU1dI3iwwVagmE+
 CMrKGineDCvN3Ub4IiLw/0zjR8cXcdw49WzGVVkugdmiq7fDs/+mDwFLG
 UFJkz25F5lcMchv89vNYd710+hdgps5QzaXxAwrHmX0tA255hWJb60BaV
 tDQ0DfdW3aWcLr/JWeLEpWBjZWu7MOM4pjDEsZ+aHkNpsIi7TWKLYmU1v
 NAvTm2IDe+i0iL49chphmsNRoG9d9mU6e02A9RfXATcTwqwmoitm1haiI g==;
X-CSE-ConnectionGUID: zF19O9mQQCuZnf32bLqnvg==
X-CSE-MsgGUID: XbnukSX4ROecA5KKUmBJ+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="97121040"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="97121040"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2026 05:35:02 -0700
X-CSE-ConnectionGUID: PPyYoA0pTHiDmJS8cJxQtQ==
X-CSE-MsgGUID: t/s4+yYqSRej98S3uHaZmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; d="scan'208";a="225608828"
Received: from cml-cometlake-client-platform.iind.intel.com ([10.223.55.11])
 by orviesa004.jf.intel.com with ESMTP; 13 Mar 2026 05:35:00 -0700
From: Aditya Chauhan <aditya.chauhan@intel.com>
To: ramadevi.gandi@intel.com, himanshu.girotra@intel.com,
 swati2.sharma@intel.com, kamil.konieczny@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH v4 i-g-t 0/2] intel-ci: Add NVL display and core blocklists
Date: Fri, 13 Mar 2026 18:04:57 +0530
Message-Id: <20260313123459.64815-1-aditya.chauhan@intel.com>
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

This series adds blocklist files for the NVL platform under intel-ci.

Patch 1 introduces xe.nvl.core.blocklist.txt with NVL-specific core
test exclusions and registers it in meson.build.

Patch 2 adds the previously missing meson.build entry for the NVL
display blocklist introduced in commit 04db3b26c52b
("intel-ci: Add NVL display blocklist").

v2: Make commit message more descriptive (Swati Sharma)
v3:
 - Use correct subject (intel-ci) (Swati Sharma)
 - Add blocklist in alphabetical order in meson.build (Swati Sharma)
v4: Make comments more explanatory (Swati Sharma)

This series is a continuation of the series sent earlier with 
slightly different title
https://patchwork.freedesktop.org/series/163030/

Aditya Chauhan (2):
  intel-ci: Add NVL core blocklist
  intel-ci: Add NVL Display blocklist to meson.build

 tests/intel-ci/meson.build               |  2 +
 tests/intel-ci/xe.nvl.core.blocklist.txt | 97 ++++++++++++++++++++++++
 2 files changed, 99 insertions(+)
 create mode 100644 tests/intel-ci/xe.nvl.core.blocklist.txt

-- 
2.34.1

