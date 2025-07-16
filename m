Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66F7EC83F22
	for <igt-dev@archiver.kernel.org>; Wed, 16 Jul 2025 10:23:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083F810E26F;
	Wed, 16 Jul 2025 10:23:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EOXjrSaT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16DC110E26F
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jul 2025 10:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752661405; x=1784197405;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=30b2uV7RGrnX6vL+WV+LpkWqCt89ebGFNKPjBuT8y3I=;
 b=EOXjrSaTVj4HUClpTFrHeBQI+9kCnPqtGhCuML39p94JFe9EYwCrXn7Q
 I+mHt469N8gLDl6JQXYrCNphRJz3o34tY+4q8u8CCJMVNW4uYpd/csAlx
 bpppHQfpD0pNPOO/vN7DQXSgYMzacWsBTqEaZoNnC1G3hMgq0IcKsPnAe
 Is6IQxOVrRper60RArGxWsdbmStMKNLDS3W623Ro3/Tp3frGexaN+gp+I
 oIUWLbHggB59Q3+ESym7a6wcvl6lSs5Mkeqyhnl2EVeb6aVHHm5HqS5pp
 JgEeD4tcR3leox1oLWYb7bAGhbaAjx4To6d+2Qxcmr+jCID8i2ArIC+tX Q==;
X-CSE-ConnectionGUID: kjV8gihXTgiPTZu0U6Cb6Q==
X-CSE-MsgGUID: tftGqWxASBOhP8z/UDcAXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54871944"
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="54871944"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 03:23:25 -0700
X-CSE-ConnectionGUID: yDuFR2ktRlStA6fCGp6aZA==
X-CSE-MsgGUID: gb82ij5WQi+l72CgzdWBDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,315,1744095600"; d="scan'208";a="157560005"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.133])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2025 03:23:24 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH i-g-t] tests/intel/*test_config: Fix i915 blocklists rename
Date: Wed, 16 Jul 2025 12:23:15 +0200
Message-ID: <20250716102315.48051-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.50.1
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

I missed few more places for i915 blocklists rename, last ones
are in i915|kms json files. This was found when compiling after
reverting two last symlinks patches:
70f2cf0d6 ("intel-ci: Add symlinks for old i915 testlists")
f778072a5 ("intel-ci: Add symlinks for old i915 blocklists")

where scripts/test_list.py reports 'FileNotFoundError'

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Reported-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
Fixes: 8d8ecb94f673 ("intel-ci: rename i915 blocklists")
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/i915_test_config.json | 2 +-
 tests/intel/kms_test_config.json  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
index 7cfcad532..a31e00893 100644
--- a/tests/intel/i915_test_config.json
+++ b/tests/intel/i915_test_config.json
@@ -87,7 +87,7 @@
                 "update-from-file": {
                     "include-type": "regex-ignorecase",
                     "include": [
-                        { "all": "../intel-ci/blacklist.txt" }
+                        { "all": "../intel-ci/i915.blocklist.txt" }
                     ]
                 }
             }
diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
index 362298e0d..4fab26275 100644
--- a/tests/intel/kms_test_config.json
+++ b/tests/intel/kms_test_config.json
@@ -61,7 +61,7 @@
 			{ "LNL": "../intel-ci/xe.lnl.display.blocklist.txt" },
 			{ "BMG": "../intel-ci/xe.bmg.display.blocklist.txt" },
 			{ "LNL, BMG": "../intel-ci/xe.blocklist.txt" },
-			{ "ADLP, ADLS, DG2, MTL": "../intel-ci/blacklist.txt" }
+			{ "ADLP, ADLS, DG2, MTL": "../intel-ci/i915.blocklist.txt" }
 		    ]
 		}
 	    }
-- 
2.50.1

