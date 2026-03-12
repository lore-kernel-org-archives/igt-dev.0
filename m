Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E041FED2E1
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 07:48:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2292810E98C;
	Thu, 12 Mar 2026 07:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WH///4om";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568BA10E98C
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 07:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773301716; x=1804837716;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IAwWf4mtQ8TpVN5WQEjoQn1Pcl6rKTDcxl+4jBu83Q4=;
 b=WH///4om+fcfGrldoohq6zZr2Tyh4aFA+tQiNXw2IwrHQtUjuBXVsBsr
 0ggqA0jVithkJ2H/GUtltKi6nNaXqH6SEMfgZTJGi1HPu38gmmqLnoqSQ
 0oVqOQ0Lqo+jMnHtk7brX5HKEodd52YKuOb/qPiZlt4IyavgQq9X/v05S
 wzvTfrDfi2ixJKxCwCvAArGtP/RfMsrt147Uqc8Raudufwa9qYIoj3jdG
 aN/wiX+dXfo1Dy8rds76vp5Taw87AsvPkI0bpVbZTsz5vduC2tPuy+SMJ
 6Ev1c3JX8Tzek7vL695McDQG3IPENpsnoYaXlv7MUFDGn2pbqm2QzhZOC Q==;
X-CSE-ConnectionGUID: cLhbx18CRaKlOoPm07dM6g==
X-CSE-MsgGUID: c6u6+uDaSIKOKL1IQeaJpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="61962305"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="61962305"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 00:48:35 -0700
X-CSE-ConnectionGUID: IVE6+1QyS26zSds4u6fSnQ==
X-CSE-MsgGUID: L4tHlxxfSzerK1aEzCaz6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; d="scan'208";a="225189258"
Received: from cml-cometlake-client-platform.iind.intel.com ([10.223.55.11])
 by orviesa004.jf.intel.com with ESMTP; 12 Mar 2026 00:48:33 -0700
From: Aditya Chauhan <aditya.chauhan@intel.com>
To: ramadevi.gandi@intel.com, himanshu.girotra@intel.com,
 swati2.sharma@intel.com, igt-dev@lists.freedesktop.org
Subject: [PATCH v2 i-g-t 0/2] tests/intel-ci: Add NVL display and core
 blocklists
Date: Thu, 12 Mar 2026 13:18:30 +0530
Message-Id: <20260312074832.51575-1-aditya.chauhan@intel.com>
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

Patch 1 introduces the xe.nvl.core.blocklist file and registers it
in meson.build to track known failing core tests on NVL.

Patch 2 fixes a missing meson.build entry for the NVL display blocklist
that was added in commit 04db3b26c52b
("intel-ci: Add NVL display blocklist").

Changes in v2: Add more descriptive commit messages(Swati Sharma)

Aditya Chauhan (2):
  tests/intel-ci: Add NVL core blocklist
  tests/ci: Add NVL Display blocklist to meson.build

 tests/intel-ci/meson.build               |  2 +
 tests/intel-ci/xe.nvl.core.blocklist.txt | 69 ++++++++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 tests/intel-ci/xe.nvl.core.blocklist.txt

-- 
2.34.1

