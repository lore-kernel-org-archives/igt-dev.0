Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F03D65C78
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 16:12:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5AC10E82D;
	Wed, 17 Dec 2025 16:12:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lcTCMGq9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0AC10E82D
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 16:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765987949; x=1797523949;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VN4FocVHqH4UVIIK/l3h/oxAw7UIEUZVnF4XwmxJUkY=;
 b=lcTCMGq98Fv7r2eqzfGOM525yv+neuhtqK+0txKsvjtJfYrCAPobtq3T
 2mhoObVAZPhlnLIiDN1ecLU4jm4AP2+2QxA3Zj3f/YawL6wwjm3ETpVyZ
 f+sZgtFNldnpL69/dp/dmygEhFinjgMuMXqWKgv8sg/7wIUauueIS6Tle
 LUVZiMwpmPigmF4/xwKkJMHeo+1aFjNXLbx9sYh9DM7CDmV5Z1N5D71mA
 hzXyODV2ZUh9XZTHDpzamE2qkHvro1xgthn5YdNlvIcMc+dFcW8gMKCRa
 RBSFrVqlx/jeT8unu1RKvEawYhuEF26Cwg74FYH+nQJ5PFUdkA7Lu+xQG g==;
X-CSE-ConnectionGUID: /NQU1F+AQP+WcfUwEWuG3w==
X-CSE-MsgGUID: 1lbn5AqaSiasIKcwyFv7+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="93403114"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="93403114"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 08:12:28 -0800
X-CSE-ConnectionGUID: TO0LIERjT7eEamtga7If0g==
X-CSE-MsgGUID: qcGA/nSgRGCy19fHUk3X5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="198104360"
Received: from tmistat.igk.intel.com ([10.91.214.42])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 08:12:28 -0800
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] tests/intel/xe_test_config: Add SR-IOV VF FULL testlist
Date: Wed, 17 Dec 2025 16:59:29 +0000
Message-Id: <20251217165929.49760-1-jakub1.kolakowski@intel.com>
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

Currently we have BAT testlist for VF runs and both BAT and FULL for VM
runs. Add missing FULL testlist for VF runs.

Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_test_config.json | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/intel/xe_test_config.json b/tests/intel/xe_test_config.json
index 65e685470..4d76fbe0f 100644
--- a/tests/intel/xe_test_config.json
+++ b/tests/intel/xe_test_config.json
@@ -11,13 +11,13 @@
                 "default-testlist": "FULL",
                 "update-from-file": {
                     "exclude-type": "regex-ignorecase",
-                    "append-value-if-not-excluded": "Xe FULL, Xe FULL VM",
+                    "append-value-if-not-excluded": "Xe FULL, Xe FULL VF, Xe FULL VM",
                     "include": [
                         { "Xe BAT, Xe BAT VF, Xe BAT VM": "../intel-ci/xe.fast-feedback.testlist" }
                     ],
                     "exclude": [
-                        { "Xe BAT, Xe BAT VF, Xe BAT VM, Xe FULL, Xe FULL VM": "../intel-ci/xe.blocklist.txt" },
-                        { "Xe BAT VF": "../intel-ci/xe.sriov-vf.blocklist.txt"},
+                        { "Xe BAT, Xe BAT VF, Xe BAT VM, Xe FULL, Xe FULL VF, Xe FULL VM": "../intel-ci/xe.blocklist.txt" },
+                        { "Xe BAT VF, Xe FULL VF": "../intel-ci/xe.sriov-vf.blocklist.txt"},
                         { "Xe BAT VM, Xe FULL VM": "../intel-ci/xe.sriov-vm.blocklist.txt"}
                     ]
                 },
-- 
2.25.1

