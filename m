Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29F0109E557
	for <igt-dev@archiver.kernel.org>; Thu, 26 Mar 2026 06:21:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6D010E236;
	Thu, 26 Mar 2026 06:21:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KFuraOqo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75DBD10E2C3
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Mar 2026 06:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774506067; x=1806042067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iAt9WVhn4uyrfT5KtjsL7eHpwAOrlYvv1E2PFdMAW5c=;
 b=KFuraOqoVocGMrZve9rSfNP/Qy2NvZI2Yj1QDtMkaNObTLN3fHE8ju3N
 ShKjDXMQR0f7IEjlzs9EOdk8QO7RJtW83bKpfB3dD3liiPwlmYMK+z/dR
 bw/ahkxF/L+Vr9GjgPbA9K+XEYbpOKLO+04chfZi5graUE+pxUdkOkTTM
 pFI768S1K+9aBNnbRkf8dAH7cdtcTxIHz8qj/jUWtxeollOTLA+y6qch3
 wHVtKLicb6rAG7rj2vvXqcard6TRaRRyGhv4K7K4Ucwat7jJmpw2aXR+w
 DhscJqZrL3aohcbnXgmrAiOTfYEqbwpzwfsL5RMBfzGr7RGm5H09DjWdG Q==;
X-CSE-ConnectionGUID: LaftZjOnQhqWow4su4lvsg==
X-CSE-MsgGUID: rsl5E5IHRqmiBkr4yO7DmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="98175242"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="98175242"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 23:21:07 -0700
X-CSE-ConnectionGUID: Gc57E5WMQfmM1ptjKyzlXQ==
X-CSE-MsgGUID: WB0o5I2LSBqCsSjXXhMT4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; d="scan'208";a="224935977"
Received: from sowmi-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.56])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2026 23:21:06 -0700
From: Sowmiya S <sowmiya.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Mohammed Bilal <mohammed.bilal@intel.com>,
 Sowmiya S <sowmiya.s@intel.com>
Subject: [PATCH i-g-t v4 4/4] intel-ci: Enable hdmi 4k resolution test in
 chamelium testlist
Date: Thu, 26 Mar 2026 12:12:01 +0530
Message-ID: <20260326064201.783311-5-sowmiya.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326064201.783311-1-sowmiya.s@intel.com>
References: <20260326064201.783311-1-sowmiya.s@intel.com>
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

