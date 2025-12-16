Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66D7D5CC89
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 09:16:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AB810E782;
	Tue, 16 Dec 2025 09:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OeZEqhxF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C645910E782
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 09:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765876578; x=1797412578;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T+WEcnvz9DR2V6lOLUbhaKFlwEr9yIp069gTpAfgZH8=;
 b=OeZEqhxFvsoSEJJz5XOXbyeHEYm6RWau1ZD2KiD5/VKBkGzUKjJc+VOQ
 f+sQ4wr+e4X9fOxbkTp+Y5S8jIGsFIsKy7/+mEyCHyRR2ymwOGQr+y2ZR
 1M//U4zQM5a/Dbrokskh3EX4Btv8rscnjYDZVvU8fj9q6qVzwqg+OIr69
 4HNS3P334UogbuHz9e95metFwFlzt84/zq9ZMDLkPQ76n+B4yv/eXbdYo
 kk+gsHIbgKJkc7TivR7uxZ3f2Y2+IaK/rRTFVKl0p4w8jlUpgbG/qb7L4
 PRFKDDtXhfwBwNffN8gD1wTr7v8BzCXyf9233q3xWz7KU5BA+m/5NeQgB w==;
X-CSE-ConnectionGUID: U+G0lrDRQwiLWokrN0tLKQ==
X-CSE-MsgGUID: cKdub/xNTIKQhs70OGF4WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="55359306"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="55359306"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 01:16:17 -0800
X-CSE-ConnectionGUID: kM/Cbt13QU215sSlNGrG7A==
X-CSE-MsgGUID: qsdMhQAdT1CkKaGzDArsqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; d="scan'208";a="203073398"
Received: from bilal-nuc7i7bnh.iind.intel.com ([10.190.239.45])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 01:16:16 -0800
From: Mohammed Bilal <mohammed.bilal@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: sameer.lattannavar@intel.com, karthik.b.s@intel.com,
 Mohammed Bilal <mohammed.bilal@intel.com>
Subject: [PATCH i-g-t] tests/intel-ci/chamelium-only.testlist: Enable
 additional Chamelium tests
Date: Tue, 16 Dec 2025 14:44:33 +0530
Message-ID: <20251216091433.1245664-1-mohammed.bilal@intel.com>
X-Mailer: git-send-email 2.48.1
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

Enable additional Chamelium tests, including hibernate-related
subtests and random plane comparison tests.

Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
---
 tests/intel-ci/chamelium-only.testlist | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
index 99d2f2409..50cba517a 100644
--- a/tests/intel-ci/chamelium-only.testlist
+++ b/tests/intel-ci/chamelium-only.testlist
@@ -67,3 +67,10 @@ igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode
 igt@kms_chamelium_hpd@vga-hpd-without-ddc
 igt@kms_chamelium_sharpness_filter@filter-basic
 igt@kms_tiled_display@basic-test-pattern-with-chamelium
+igt@kms_chamelium_edid@dp-edid-change-during-hibernate
+igt@kms_chamelium_edid@hdmi-edid-change-during-hibernate
+igt@kms_chamelium_frames@hdmi-cmp-planes-random
+igt@kms_chamelium_frames@hdmi-crc-planes-random
+igt@kms_chamelium_hpd@common-hpd-after-hibernate
+igt@kms_chamelium_hpd@dp-hpd-after-hibernate
+igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate
-- 
2.48.1

