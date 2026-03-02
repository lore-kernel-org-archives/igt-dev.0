Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FABE9B359
	for <igt-dev@archiver.kernel.org>; Mon,  2 Mar 2026 10:22:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700AA10E47D;
	Mon,  2 Mar 2026 10:22:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R10Nk+Bh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43C310E47D
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Mar 2026 10:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772446921; x=1803982921;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MVbPnZBAb7QTkoL1iWzQoDlQjjSOWXl4uOCzw7Myo5s=;
 b=R10Nk+Bh5bk5NG1Ob0oyTlIgBFV1R01w0czQ7FyvthVYKktdGnzTdIWw
 eA69rA5nrK+sfakowighyc5YbTDcbG38E+ElCcsoKR7hXaM7YX6uHIjUN
 AX7fojsi31W7MeGXuZLhOOz9m2FHvEVAFHYArUo1xC0M40+o253KAdrDC
 OkRsmZgz588l+Www8HEKSjPEzHCMme+sOteACtKb9P3m1dXvSnLdDJkNn
 Cs5b6jlcF5OGWeyrQJ3zR2vYSdq71jZCrsDsAEz1eOXKPgnabYE4HC/WS
 WJOZzexkpWBw3Lcz0YSWRKo+cspe2X0i/pocubO+0AEHZqvB9oq6yjAAA g==;
X-CSE-ConnectionGUID: wVGrfdTSQj2S8vm/5jHdPg==
X-CSE-MsgGUID: hsuIkjc+SlK49AQQFeqo7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="84917523"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="84917523"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 02:22:01 -0800
X-CSE-ConnectionGUID: VtAqvMaWTHOqaera7Q/P7g==
X-CSE-MsgGUID: qH+Ik03ASxmTSQv07x9PkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; d="scan'208";a="214844311"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 02:21:58 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, kamil.konieczny@intel.com, kunal1.joshi@intel.com,
 karol.krol@intel.com, ryszard.knop@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v4 2/5] intel-ci: Rename chamelium-only testlist to i915
 specific
Date: Mon,  2 Mar 2026 15:49:23 +0530
Message-ID: <20260302101926.3015380-3-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260302101926.3015380-1-mohammed.bilal@intel.com>
References: <20260302101926.3015380-1-mohammed.bilal@intel.com>
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

Rename chamelium-only.testlist to i915.chamelium-only.testlist.

v3:
-Use move-fix-add approach (Kamil)

v4:
-Restructure move-fix-add approach (Kamil)
-Rename run-type labels(Swati)

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 .../{chamelium-only.testlist => i915.chamelium-only.testlist} | 0
 tests/intel-ci/meson.build                                    | 2 +-
 tests/intel/kms_test_config.json                              | 4 ++--
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename tests/intel-ci/{chamelium-only.testlist => i915.chamelium-only.testlist} (100%)

diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
similarity index 100%
rename from tests/intel-ci/chamelium-only.testlist
rename to tests/intel-ci/i915.chamelium-only.testlist
diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index cf0023c63..1a13dd52a 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -2,7 +2,7 @@
 
 intelci_files = [
   'README',
-  'chamelium-only.testlist',
+  'i915.chamelium-only.testlist',
   'fast-feedback.testlist',
   'fast-feedback-chamelium-only.testlist',
   'i915.blocklist.txt',
diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
index 61a70a9bb..4ed6e5405 100644
--- a/tests/intel/kms_test_config.json
+++ b/tests/intel/kms_test_config.json
@@ -15,13 +15,13 @@
                     "include": [
                         { "i915 BAT": "../intel-ci/i915.fast-feedback.testlist" },
                         { "i915 BAT chamelium": "../intel-ci/i915.fast-feedback-chamelium-only.testlist" },
-                        { "i915 chamelium": "../intel-ci/chamelium-only.testlist" },
+                        { "i915 FULL chamelium": "../intel-ci/i915.chamelium-only.testlist" },
 
                         { "Xe BAT": "../intel-ci/xe.fast-feedback.testlist" },
                         { "Xe BAT chamelium": "../intel-ci/xe.fast-feedback-chamelium-only.testlist" }
                     ],
                     "exclude": [
-                        { "i915 BAT, i915 BAT chamelium, i915 chamelium, i915 FULL": "../intel-ci/i915.blocklist.txt" },
+                        { "i915 BAT, i915 BAT chamelium, i915 FULL chamelium, i915 FULL": "../intel-ci/i915.blocklist.txt" },
                             { "Xe BAT, Xe BAT chamelium, Xe FULL": "../intel-ci/xe.blocklist.txt" }
                     ]
                 }
-- 
2.48.1

