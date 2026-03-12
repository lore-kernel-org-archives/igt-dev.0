Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAEAFED2FC
	for <igt-dev@archiver.kernel.org>; Thu, 12 Mar 2026 10:22:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93B5D10E1D7;
	Thu, 12 Mar 2026 10:22:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZkgdMl4j";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A56F10E1D7
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Mar 2026 10:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773310924; x=1804846924;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1J/jfAKklFXiZrmCkMOdBh7d9oTt/yUwpK4qs9HXV5U=;
 b=ZkgdMl4jmKmNmBs5j1O4kPGSceFKm4OACpxeIuahBNuC3chQHniT2nMi
 jYZn3FxbFe5nPDoSFQfvG2xA6pTRtdMOt3Eu1pg3njuZ4QyCSk5JgqUH7
 P/kVtZQj9a8Dt2VQE8Xgzmxr86O3VKnmRQ9w7ytk6vGcN2MrDxczg14Es
 A6hIqmYb45DJbTJGxnnFqAf4SMIlhHQFoqa75cGkNC+o5TRc0WPH0bfdT
 l/VjJEkD4sBzk539TPUGZf9CQmlMQGtzvwF0HFb7EQ/WmSjTFyl/Wqc4r
 7MN4sEcFUJhaHGZLEnqnRTmRjTFwwLDMjmT4UI8q2uSb532bBL9oSEceK Q==;
X-CSE-ConnectionGUID: V+oPjWAeSUaUQDOw3n5dlA==
X-CSE-MsgGUID: t2//4bboRu6FeldNLFUoiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74310492"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="74310492"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2026 03:22:04 -0700
X-CSE-ConnectionGUID: gOdKobMdThyGdT5niJhL7A==
X-CSE-MsgGUID: BejVhCGPTaGiflQ9WBfIsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; d="scan'208";a="246181012"
Received: from cml-cometlake-client-platform.iind.intel.com ([10.223.55.11])
 by fmviesa001.fm.intel.com with ESMTP; 12 Mar 2026 03:22:02 -0700
From: Aditya Chauhan <aditya.chauhan@intel.com>
To: ramadevi.gandi@intel.com, himanshu.girotra@intel.com,
 swati2.sharma@intel.com, kamil.konieczny@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH v3 i-g-t 0/2] intel-ci: Add NVL display and core blocklists
Date: Thu, 12 Mar 2026 15:51:59 +0530
Message-Id: <20260312102201.53909-1-aditya.chauhan@intel.com>
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

Changes in v2: Add more descriptive commit messages(Swati Sharma)
Changes in v3: Use correct subject(intel-ci), add more descriptive
reasoning for blocklisted tests and add files 
in alphabetical order (Swati Sharma)

Aditya Chauhan (2):
  intel-ci: Add NVL core blocklist
  intel-ci: Add NVL Display blocklist to meson.build

 tests/intel-ci/meson.build               |  2 +
 tests/intel-ci/xe.nvl.core.blocklist.txt | 69 ++++++++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 tests/intel-ci/xe.nvl.core.blocklist.txt

-- 
2.34.1

