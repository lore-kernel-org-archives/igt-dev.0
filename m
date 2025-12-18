Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B36D6E2B1
	for <igt-dev@archiver.kernel.org>; Thu, 18 Dec 2025 17:07:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5E810E427;
	Thu, 18 Dec 2025 17:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E3a6xXrw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515D410E427
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Dec 2025 17:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766077664; x=1797613664;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Bje50W/GOeNnsudIgBVASrej6OSUsz5F5jIkcy5t4nE=;
 b=E3a6xXrw1cASdtOlUYEpNWqzdmDjCXnrdnF1GJ0qUW18715yLqF2LKnx
 P7ZiSMzPZnRi3m5kq/xKYXFPSuVxlqB0Mud4cKDJ7HtzaL+gDL6lxOlf8
 GP771c7EA+5Pfv4NwW8ICuLOgnRq6a0i8M9SjkQjeQvhFPeswcfawEQd8
 b0ar5x/Rq6+8ztzhH/RvdD8LGO1pz6ngRVe418uiwaQeEQG1U9pOZOv+o
 6yiktQKN0D81DyfZYwapwXTr5ctIkPaadh9g63534oDW0UljqLk28CtTW
 wYvWbW5kb+848OmOrKX7LwCbBzneg3M6mdFHqw0ZLxhrKQnNgbBTLh8MF A==;
X-CSE-ConnectionGUID: 0Q668eAwTQGB71dSaqjiNg==
X-CSE-MsgGUID: 5a2th55kSgqr+fMUU4tjqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="78674430"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="78674430"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 09:07:44 -0800
X-CSE-ConnectionGUID: XiDNVLUqSjKILlIex+eqPQ==
X-CSE-MsgGUID: CSSYdG88QQamVKdZS7w9xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; d="scan'208";a="229307080"
Received: from tmistat.igk.intel.com ([10.91.214.42])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2025 09:07:42 -0800
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Himanshu Girotra <himanshu.girotra@intel.com>
Subject: [PATCH i-g-t] intel-ci: Add xe.wcl.core.blocklist.txt
Date: Thu, 18 Dec 2025 17:54:56 +0000
Message-Id: <20251218175456.65275-1-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.25.1
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

Add blocklist for WCL platform. Taking into account similarities between
PTL and WCL make WCL blocklist a symbolic link to PTL blocklist.

Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Himanshu Girotra <himanshu.girotra@intel.com>
---
 tests/intel-ci/meson.build               | 1 +
 tests/intel-ci/xe.wcl.core.blocklist.txt | 1 +
 tests/intel/xe_test_config.json          | 1 +
 3 files changed, 3 insertions(+)
 create mode 120000 tests/intel-ci/xe.wcl.core.blocklist.txt

diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index 906bf5351..cf0023c63 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -29,6 +29,7 @@ intelci_files = [
   'xe-sriov-vf.blocklist.txt',
   'xe.sriov-vm.blocklist.txt',
   'xe-sriov-vm.blocklist.txt',
+  'xe.wcl.core.blocklist.txt',
 ]
 
 if meson.version().version_compare('<1.3.0')
diff --git a/tests/intel-ci/xe.wcl.core.blocklist.txt b/tests/intel-ci/xe.wcl.core.blocklist.txt
new file mode 120000
index 000000000..433bbb006
--- /dev/null
+++ b/tests/intel-ci/xe.wcl.core.blocklist.txt
@@ -0,0 +1 @@
+xe.ptl.core.blocklist.txt
\ No newline at end of file
diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
index 65e685470..74c1eedcb 100644
--- a/tests/intel/xe_test_config.json
+++ b/tests/intel/xe_test_config.json
@@ -80,6 +80,7 @@
 			{ "LNL": "../intel-ci/xe.lnl.core.blocklist.txt" },
 			{ "BMG": "../intel-ci/xe.bmg.core.blocklist.txt" },
 			{ "PTL": "../intel-ci/xe.ptl.core.blocklist.txt" },
+			{ "WCL": "../intel-ci/xe.wcl.core.blocklist.txt" },
 			{ "all": "../intel-ci/xe.blocklist.txt" }
 		    ]
 		}
-- 
2.25.1

