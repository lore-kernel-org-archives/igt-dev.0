Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B2CEEF326
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 08:41:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6E110EB96;
	Thu,  5 Mar 2026 08:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SvuuESFh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C8B10EB96
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 08:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772700114; x=1804236114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+q8DD8Jncb6yLaCwhGlRBtNxnarJ/Cu5iFfNPPVtytY=;
 b=SvuuESFhdLd5FpcrNRW3wEifq8Ln/Kkv4sV/7t6hCAWmMNFyYcqrKmR0
 jYJWkphVy3QK47kGEd8DKaiTWZsrYJNEGTOc3cYfLUFsV5SvqNES2VMqS
 FylXziWeRMlif58jCzl3S5p/IQCHCmhLGWtbinD0T1RG1rT8AbSXIQ/u7
 a8LgDD2Tw8AcYi5fsGki+5cZ3iuWJLvpzhrlpel8X8nUdBttgrWaSdWeA
 +ATFBTi1YNynBW+LcSs0tlRCZKh+dQeYEpNrar7URPUvGosGskAwbqwyc
 GsXcRUwnY132jgeFui8+bPj/F6r32EiVNf0lI3uwyMZ1Ib2DucKxvlJ1V g==;
X-CSE-ConnectionGUID: zPgTxrX8TCqeU0/P9Cpf+Q==
X-CSE-MsgGUID: oSXiS+UMRAehh3yL5r73FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77624270"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="77624270"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 00:41:54 -0800
X-CSE-ConnectionGUID: vgKW1neeSCCe6mzv+qVxhA==
X-CSE-MsgGUID: WL9K/XwFScuOeYrW3nQUpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="214673619"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 00:41:52 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, kamil.konieczny@intel.com, ryszard.knop@intel.com,
 karol.krol@intel.com, Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH v5 3/6] intel-ci: Remove i915 *-random chamelium tests
Date: Thu,  5 Mar 2026 14:09:03 +0530
Message-ID: <20260305083906.3098168-4-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260305083906.3098168-1-mohammed.bilal@intel.com>
References: <20260305083906.3098168-1-mohammed.bilal@intel.com>
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

Comment out non-deterministic random-plane and random configuration tests
that produce inconsistent results across runs, impacting test stability
and CI reliability.

v2:
- Comment out random-plane test (Kunal)

v3:
-Use move-fix-add approach (Kamil)

v4:
-Restructure move-fix-add approach (Kamil)

v5:
-Update commit message (Kamil)
-Split commit (Swati)

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/intel-ci/i915.chamelium-only.testlist | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/intel-ci/i915.chamelium-only.testlist b/tests/intel-ci/i915.chamelium-only.testlist
index 9adace28c..6ab9029a4 100644
--- a/tests/intel-ci/i915.chamelium-only.testlist
+++ b/tests/intel-ci/i915.chamelium-only.testlist
@@ -33,11 +33,13 @@ igt@kms_chamelium_frames@dp-crc-single
 igt@kms_chamelium_frames@dp-frame-dump
 igt@kms_chamelium_frames@hdmi-aspect-ratio
 igt@kms_chamelium_frames@hdmi-cmp-planar-formats
-igt@kms_chamelium_frames@hdmi-cmp-planes-random
+# Tests are exhaustive and pick random configurations
+# removed tests as results are non-deterministic on each run
+#igt@kms_chamelium_frames@hdmi-cmp-planes-random
+#igt@kms_chamelium_frames@hdmi-crc-planes-random
 igt@kms_chamelium_frames@hdmi-crc-fast
 igt@kms_chamelium_frames@hdmi-crc-multiple
 igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats
-igt@kms_chamelium_frames@hdmi-crc-planes-random
 igt@kms_chamelium_frames@hdmi-crc-single
 igt@kms_chamelium_frames@hdmi-frame-dump
 igt@kms_chamelium_frames@vga-frame-dump
-- 
2.48.1

