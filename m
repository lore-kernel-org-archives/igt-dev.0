Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E86C35FF3
	for <igt-dev@archiver.kernel.org>; Mon, 17 Mar 2025 17:50:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33EC10E43B;
	Mon, 17 Mar 2025 17:50:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C154Rl3u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE8AE10E43B
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Mar 2025 17:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742233855; x=1773769855;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7cx8RzHOlT5UTmvlyinEXp2FQZKs1sGrZGxmIKpUnag=;
 b=C154Rl3u3bA85iPOLTToCRUGg7G3M04E1z7CnHJXbC+gERwffosbOiWf
 WXYcuFtd5fIs+0ViBrKrdzQAFYKGXO06gv1PiShcZCemx1oi9Cs/0KTX1
 +fE79adZWpEJrO6kuziwM84pD1TNAoxRkU/cY7aWNRhw2eV0sO/NQQlOe
 oae3eb0dtLACbxvdJCo7pnEFGfrzVdc+K4tvGOr6a5rldYWRgTnC7ymi0
 8+GzA/4xdGX6yi2j6XMeKLGx0r+4hBSVI7o7t9cVZ0ihiJ+ISUOKNkyXk
 bLP4+qPwiiXnO4ujRqkvov1pJJWf7UvxQ3WOpGVjkDpaHx4d6R3rWbsQY g==;
X-CSE-ConnectionGUID: Aht2z1nHQ52qfaFDX054tw==
X-CSE-MsgGUID: lEPNY3cLQ4+mDX8VRAkI6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11376"; a="60878809"
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="60878809"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 10:50:55 -0700
X-CSE-ConnectionGUID: Dihvo57QRy+qecxN97EaBA==
X-CSE-MsgGUID: iR/oRQvGTduDRu5z63aO1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,254,1736841600"; d="scan'208";a="121959347"
Received: from tmistat-dev.igk.intel.com ([10.211.135.226])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 10:50:53 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t v3 2/2] tests/intel/xe_pm: Add a check for power
 management capability
Date: Mon, 17 Mar 2025 17:41:34 +0000
Message-Id: <20250317174134.991555-3-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250317174134.991555-1-jakub1.kolakowski@intel.com>
References: <20250317174134.991555-1-jakub1.kolakowski@intel.com>
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

Add a check for power management capability of device tested in tests
related to D3 states. Currently if test is started on configuration
that does not support the PM capability it doesn't skip, instead
depending on test it may fail, abort or timeout.
With this change test will skip with a clear message why it did.

Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Signed-off-by: Jakub Kolakowski <jakub1.kolakowski@intel.com>
---
 tests/intel/xe_pm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index c2026474d..f3bfab50e 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -146,6 +146,9 @@ static void vram_d3cold_threshold_restore(int sig)
 
 static bool setup_d3(device_t device, enum igt_acpi_d_state state)
 {
+	igt_require_f(igt_has_pci_pm_capability(device.pci_root),
+		      "PCI power management capability not found\n");
+
 	dpms_on_off(device, DRM_MODE_DPMS_OFF);
 
 	/*
-- 
2.34.1

