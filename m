Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DCFC83F17
	for <igt-dev@archiver.kernel.org>; Wed, 23 Jul 2025 08:32:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A8210E004;
	Wed, 23 Jul 2025 08:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TWhCTJXc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B942610E004
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Jul 2025 08:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753259524; x=1784795524;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rVXjrXI9vcv4YNjwyk3GPrJYBbHO3NcV/7Gw4nPem5g=;
 b=TWhCTJXcrZv7gMvUsokOjQWO3GxhKXw/ss94GkAoGZQMm4ZjOIPufinx
 d3fmoYPZS3X4dnDqxZAYsOF5Zfo61uM/hkm36AdIDUnhfkvLLGNNsnLof
 EhtpG3yJ0w69UioTjxp6ehcbj3PHGM0I6NhTC8kwc/j8GCsHa2HTaC0oo
 e9iCIINpDaG1b1R2Mvnt2s+jihc1Ad6ht4Sijks8vZ2VaMlk7YzEwlOD5
 EqyJ4XuXhe2NxhFpOe1s+8J/rnJxHhfXFxyZL4NabQJ5b1/bdnqTP3uYC
 UyxP6IG4Xo8m22VUL60RFxDkDsBvmU5JPwtQpQLD81QD0dQFz2vBocn0W A==;
X-CSE-ConnectionGUID: /FK48hLuTaK+b3iaFlYL1w==
X-CSE-MsgGUID: mlqLYpt+RZyT86/3WHmOXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11500"; a="78070329"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="78070329"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 01:32:03 -0700
X-CSE-ConnectionGUID: awW/j2SjQNy+XhejhWxSpQ==
X-CSE-MsgGUID: V1bhEbmoTxGNeHqQiyvh3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; d="scan'208";a="190377112"
Received: from johunt-mobl9.ger.corp.intel.com (HELO localhost)
 ([10.245.245.108])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2025 01:32:01 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Karthik B S <karthik.b.s@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH i-g-t] tests/intel/i915_test_config: Add all core tests
Date: Wed, 23 Jul 2025 10:31:50 +0200
Message-ID: <20250723083150.29838-1-kamil.konieczny@linux.intel.com>
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

Instead of listing tests one by one add all core tests. This
will add two new tests core_debugfs and core_sysfs.

Cc: Karthik B S <karthik.b.s@intel.com>
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/i915_test_config.json | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tests/intel/i915_test_config.json b/tests/intel/i915_test_config.json
index a31e00893..1394d0920 100644
--- a/tests/intel/i915_test_config.json
+++ b/tests/intel/i915_test_config.json
@@ -2,10 +2,7 @@
     "description": "JSON file to be used to parse i915 documentation",
     "name": "Tests for i915 Driver",
     "drivers": [ "i915" ],
-    "files": [ "*.c", "../core_auth.c", "../core_getclient.c",
-               "../core_getstats.c", "../core_getversion.c",
-               "../core_hotunplug.c", "../core_setmaster.c",
-               "../core_setmaster_vs_auth.c",
+    "files": [ "*.c", "../core_*.c",
                "../device_reset.c", "../dmabuf.c",
                "../drm_import_export.c", "../drm_mm.c",
                "../dumb_buffer.c", "../prime_busy.c", "../prime_mmap.c",
-- 
2.50.1

