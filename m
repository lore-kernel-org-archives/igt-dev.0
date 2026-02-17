Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07398E68153
	for <igt-dev@archiver.kernel.org>; Tue, 17 Feb 2026 09:20:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B021510E4AC;
	Tue, 17 Feb 2026 09:20:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WSTo8d04";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48E1010E4AC
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Feb 2026 09:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771320044; x=1802856044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ie48/sPW4Fc2Y+5P6dzTYIadXJ7aS9zBpsSNrpJsnaI=;
 b=WSTo8d04PZ9r4Ojh/9FM3B3n/TCkmveGFx+eJupRhaa64ORAq0CLBMSz
 3iXFtr9Z++Lx+mVIMYE2X78RKpRcfgMk2KfFaGrlqS8KT1lCXwO9hTCIC
 U/0wdKjrQSmQwITjU4QV8P0Pz0GPUJof0JqfOmhJtpJHm+/bNQV8KQ5q0
 Qj5v8hZHSqBJv13sNXa5dwNUvfl/4JdeKaEQ5xXS7of8V5TI8Ac4YYbHV
 f/mARlgZRBtA+iTtaofzc/QJxA67K4a8ItMBrcfJDqR4lkEulQSZhI361
 dwrsiEMACHdvYAc5U2bhvFN8hNlG5FjhQ5i2yIh7qS8A0H1dmVdqgrC92 g==;
X-CSE-ConnectionGUID: i20EgK66SgWbYnyIdXWGTA==
X-CSE-MsgGUID: kK4zIiGTQeqdRXjDp8hdjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72558918"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="72558918"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 01:20:44 -0800
X-CSE-ConnectionGUID: We6++LbISeu6Pm9/Fnj3EA==
X-CSE-MsgGUID: 6YBxSuGRTbeXuuuxvozmIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; d="scan'208";a="212744455"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 01:20:41 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, kunal1.joshi@intel.com, karthik.b.s@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v3 1/3] intel-ci: Remove chamelium testlist symlinks
Date: Tue, 17 Feb 2026 14:48:36 +0530
Message-ID: <20260217091838.2508942-2-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260217091838.2508942-1-mohammed.bilal@intel.com>
References: <20260217091838.2508942-1-mohammed.bilal@intel.com>
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

Remove symlinks before splitting into driver-specific testlists.

v2:
-Remove symlinks first before renaming (Kamil)

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/intel-ci/i915.chamelium-only.testlist | 1 -
 tests/intel-ci/xe.chamelium-only.testlist   | 1 -
 2 files changed, 2 deletions(-)
 delete mode 120000 tests/intel-ci/i915.chamelium-only.testlist
 delete mode 120000 tests/intel-ci/xe.chamelium-only.testlist

diff --git a/tests/intel-ci/i915.chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
deleted file mode 120000
index d7c492973..000000000
--- a/tests/intel-ci/i915.chamelium-only.testlist
+++ /dev/null
@@ -1 +0,0 @@
-chamelium-only.testlist
\ No newline at end of file
diff --git a/tests/intel-ci/xe.chamelium-only.testlist b/tests/intel-ci/xe.chamelium-only.testlist
deleted file mode 120000
index d7c492973..000000000
--- a/tests/intel-ci/xe.chamelium-only.testlist
+++ /dev/null
@@ -1 +0,0 @@
-chamelium-only.testlist
\ No newline at end of file
-- 
2.48.1

