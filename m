Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A214106F303
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 08:43:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D4F10EA05;
	Thu, 26 Mar 2026 08:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BXtGVGuK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF3710E9F0
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 08:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774514599; x=1806050599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iAt9WVhn4uyrfT5KtjsL7eHpwAOrlYvv1E2PFdMAW5c=;
 b=BXtGVGuK0Vtr//NRfOXtkcJmyrutjS3ng852vcpzDwd4mT4Z1lTLiiTz
 b29PvLq5KN5f8aTFuYF2X1H0ZPkun2w5vBizbR8qlS7ABBE+D5dQqrciM
 v++hQqPGtyYfbmoUduTk6ox0kp+xmpkyk36mSNb6PXkikpjKY2GwPCh43
 +UOcwIUM83QWWPWJXhGTDqttti0sk0uvxjBcFlw7Zx0hpsQZbuu3uDxin
 p6dNhA58eRUFASE1p9GlGuIRcGXi+ypUkCCRzf1CSRj9T3kWkFfVvLXoR
 YeGoEq6TYaVg+VKABRZif4MojJIcjPIzSCjkr5PZhsEo3boJLZamuAbwz Q==;
X-CSE-ConnectionGUID: yWFsZ0RaQdigQEwwo1BDCQ==
X-CSE-MsgGUID: XdDHF3kLTyy9SfQzeBSIjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75450318"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="75450318"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 01:43:19 -0700
X-CSE-ConnectionGUID: VJaJuNp3RdG4qLedSHy0Qg==
X-CSE-MsgGUID: A4e2EVSyR3qPmXGWCjPM5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="224874994"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2026 01:43:17 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Mohammed Bilal <mohammed.bilal@intel.com>,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v5 4/5] intel-ci: Enable hdmi 4k resolution test in
 chamelium testlist
Date: Thu, 26 Mar 2026 14:34:16 +0530
Message-ID: <20260326090417.864673-5-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326090417.864673-1-sowmiya.s@intel.com>
References: <20260326090417.864673-1-sowmiya.s@intel.com>
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

From: Mohammed Bilal <mohammed.bilal@intel.com>

Remove inline comment and enable the test in the testlist as the
exclusion is already handled via i915 and Xe blocklists.

v4: Add caution comment (Swati)

Signed-off-by: Sowmiya S <sowmiya.s@intel.com>
Signed-off-by: Mohammed Bilal <mohammed.bilal@intel.com>
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel-ci/chamelium-only.testlist | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/tests/intel-ci/chamelium-only.testlist b/tests/intel-ci/chamelium-only.testlist
index 0e7c8e301..d627ad414 100644
--- a/tests/intel-ci/chamelium-only.testlist
+++ b/tests/intel-ci/chamelium-only.testlist
@@ -1,3 +1,5 @@
+# NOTE: Do NOT add blocklist entries here.
+# To blocklist tests, use the appropriate xe/i915 blocklist files instead
 igt@kms_feature_discovery@chamelium
 igt@kms_chamelium_audio@dp-audio
 igt@kms_chamelium_audio@dp-audio-edid
@@ -18,10 +20,7 @@ igt@kms_chamelium_edid@dp-edid-stress-resolution-4k
 igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k
 igt@kms_chamelium_edid@dp-mode-timings
 igt@kms_chamelium_edid@hdmi-edid-read
-# Chamelium v1 board HDMI receiver supports max 4k@30 resolution 
-# removed test as its having a mode 4k@60 resulting 
-# TMDS config errors on v1 board
-#igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
+igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
 igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k
 igt@kms_chamelium_edid@hdmi-mode-timings
 igt@kms_chamelium_edid@vga-edid-read
-- 
2.48.1

