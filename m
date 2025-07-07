Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D224C8303C
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 09:41:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8E310E337;
	Mon,  7 Jul 2025 09:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T+8LffUa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68CCD10E337
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jul 2025 09:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751881310; x=1783417310;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qFV4FEy0UsgK5QL8yZYrChEJNRX41Tjk2qTll9viPMA=;
 b=T+8LffUammdpIFDRQSUGVGuwpR15NUgwIE5WgM05PGVEyROXWEg9qmMy
 WLsOnrjlBdHaGAoI/pkDlerEQ6d9oIVjlJBdNIZ0jgGByJHnEYthrT2DE
 R3/tJFvuQLBTmELQ3FOp3D+Jf/CbNHWawyKVS4SiMg5qTaUY3UtE2R1P9
 E61KrsKEfg1Df1XsOzKwg0hBGUY/rSG0HxCTryaC2hOhewYjO9YEfvYS3
 ROJpvJGdTnHkroc3sGnHrXhSpxXuPzEuViGZZQC2jGNxPDZpqj/dILX5x
 4S57PPHfUxNntiyMamZaCtF7oVxXzR4yz6HwlBeOIJ2CkQ9vGizckcY/u A==;
X-CSE-ConnectionGUID: uwKExj/LSquFE695dJItWg==
X-CSE-MsgGUID: PrvnjqaTQ+ajHJ0KIcPeiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="65550828"
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="65550828"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 02:41:50 -0700
X-CSE-ConnectionGUID: bG7AcEOhQYqx041ejNirVA==
X-CSE-MsgGUID: lQtmTb9rR1awTcVGw1jljA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,293,1744095600"; d="scan'208";a="155297649"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.67])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 02:41:49 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t v2 1/5] intel-ci: rename i915 blocklists
Date: Mon,  7 Jul 2025 11:41:14 +0200
Message-ID: <20250707094118.84046-2-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250707094118.84046-1-kamil.konieczny@linux.intel.com>
References: <20250707094118.84046-1-kamil.konieczny@linux.intel.com>
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

Unify naming with Xe blocklists so blocklists for i915 will have
i915 prefix in names.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel-ci/README                                | 12 ++++++------
 ...st-pre-merge.txt => i915.blocklist-pre-merge.txt} |  5 +++--
 tests/intel-ci/{blacklist.txt => i915.blocklist.txt} |  0
 tests/intel-ci/meson.build                           |  4 ++--
 tests/intel/i915_test_config.json                    |  2 +-
 tests/intel/kms_test_config.json                     |  2 +-
 6 files changed, 13 insertions(+), 12 deletions(-)
 rename tests/intel-ci/{blacklist-pre-merge.txt => i915.blocklist-pre-merge.txt} (97%)
 rename tests/intel-ci/{blacklist.txt => i915.blocklist.txt} (100%)

diff --git a/tests/intel-ci/README b/tests/intel-ci/README
index 07b32b54a..5ef2ee2d1 100644
--- a/tests/intel-ci/README
+++ b/tests/intel-ci/README
@@ -30,16 +30,16 @@ considered to mean that the kernel is not obviously broken.
 The results of CI runs on drm-tip and various other kernel trees can
 be found in https://intel-gfx-ci.01.org/CI/
 
-=============
-blacklist.txt
-=============
+==================
+i915.blocklist.txt
+==================
 
 This file contains regular expressions (one per line) for tests that
 are not to be executed in full suite test rounds.
 
-=======================
-blacklist-pre-merge.txt
-=======================
+============================
+i915.blocklist-pre-merge.txt
+============================
 
 This file contains regular expressions (one per line) for tests that
 are not to be executed in pre-merge full suite test rounds.
diff --git a/tests/intel-ci/blacklist-pre-merge.txt b/tests/intel-ci/i915.blocklist-pre-merge.txt
similarity index 97%
rename from tests/intel-ci/blacklist-pre-merge.txt
rename to tests/intel-ci/i915.blocklist-pre-merge.txt
index 0a1315aae..bee4a856f 100644
--- a/tests/intel-ci/blacklist-pre-merge.txt
+++ b/tests/intel-ci/i915.blocklist-pre-merge.txt
@@ -23,7 +23,7 @@ igt@kms_pm_rpm@universal-planes(-dpms)?
 # it is harder to predictably exercise the cache from userspace.
 #
 # Until these 8 tests are replaced with a kernel selftest and removed from IGT,
-# let's blacklist them for pre-merge testing as they are responsible for a
+# let's blocklist them for pre-merge testing as they are responsible for a
 # significant portion of our execution time:
 #
 # - shard-skl: 0.1% (~15 seconds)
@@ -96,7 +96,8 @@ igt@gem_tiled_wc
 # This test is doing nothing more than waiting for the driver to be suspended
 # before issueing a modeset. However, it never failed while testing for this
 # in the past year, so we probably just want to drop the amount of rounds to
-# reduce the runtime, but let's just blacklist it in pre-merge for now:
+# reduce the runtime, but let's just blocklist it in pre-merge for now:
+
 #
 # - shard-skl: 1% (~2.5 minute)
 # - shard-kbl: 0.9% (~1 minute)
diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/i915.blocklist.txt
similarity index 100%
rename from tests/intel-ci/blacklist.txt
rename to tests/intel-ci/i915.blocklist.txt
diff --git a/tests/intel-ci/meson.build b/tests/intel-ci/meson.build
index 4aacb479d..d18170402 100644
--- a/tests/intel-ci/meson.build
+++ b/tests/intel-ci/meson.build
@@ -2,8 +2,8 @@
 
 intelci_files = [
   'README',
-  'blacklist.txt',
-  'blacklist-pre-merge.txt',
+  'i915.blocklist.txt',
+  'i915.blocklist-pre-merge.txt',
   'chamelium-only.testlist',
   'fast-feedback.testlist',
   'fast-feedback-chamelium-only.testlist',
diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
index e53f9400b..da871f493 100644
--- a/tests/intel/i915_test_config.json
+++ b/tests/intel/i915_test_config.json
@@ -28,7 +28,7 @@
                         { "i915 BAT": "../intel-ci/fast-feedback.testlist" }
                     ],
                     "exclude": [
-                        { "all": "../intel-ci/blacklist.txt" }
+                        { "all": "../intel-ci/i915.blocklist.txt" }
                     ]
                 },
                 "order": [
diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
index 0b6fc36e8..fc8766279 100644
--- a/tests/intel/kms_test_config.json
+++ b/tests/intel/kms_test_config.json
@@ -21,7 +21,7 @@
                         { "Xe BAT chamelium": "../intel-ci/xe-fast-feedback-chamelium-only.testlist" }
                     ],
                     "exclude": [
-                        { "i915 BAT, i915 BAT chamelium, i915 chamelium, i915 FULL": "../intel-ci/blacklist.txt" },
+                        { "i915 BAT, i915 BAT chamelium, i915 chamelium, i915 FULL": "../intel-ci/i915.blocklist.txt" },
                             { "Xe BAT, Xe BAT chamelium, Xe FULL": "../intel-ci/xe.blocklist.txt" }
                     ]
                 }
-- 
2.49.0

