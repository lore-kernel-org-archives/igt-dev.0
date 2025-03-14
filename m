Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A348C282EC
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 11:37:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B589910E9DE;
	Fri, 14 Mar 2025 11:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iCybb80X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE7710E9DE
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 11:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741952233; x=1773488233;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=72OJyrHE2I3tiPtZSIZ36CCIxm9RP5tRDXWxy9DdD0Y=;
 b=iCybb80X2FC3jbflfGv8rh30lXzItIkPVuHaWeiFvR8PtZI6w6YNOCX6
 8rRFGhY6KRTW57sk5zV0MxnjJU3m8cQvfgzbCjBCeOdfweZv4ogbZV9SL
 /vMcnfwQe2FlPWzNFvkjy0aAn6pZmPlohrl9/gwRhoSjGuUkLAcvA8FRy
 LyW6g2LFFPzIp0hbINaMkjI8+t3MHQObmGjJhUj2/fUlr36uoaSdz4rnW
 kYARqhhUOLNM2EJ8oU5MKefDRxpQmG06/BfOizRMzl5qZVUWesWglvLK/
 gHlPdsmeHZ7XC9aXg2rvFUgQl07LADAF9yWfmzrY9Lrd74utKVb0Gt+gd A==;
X-CSE-ConnectionGUID: UOpU0RsNQ0SQFW/kGoxaiw==
X-CSE-MsgGUID: 9B8eigdVScCOBduXot8YrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="60497511"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="60497511"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 04:37:13 -0700
X-CSE-ConnectionGUID: Giq+L1mZTMao33Oou3GktA==
X-CSE-MsgGUID: 94L5rKZNRZGcXgk5xdio0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="126293504"
Received: from tmistat-dev.igk.intel.com ([10.211.135.226])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 04:37:11 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t v2 2/2] tests/intel/xe_pm: Add a check for power
 management capability
Date: Fri, 14 Mar 2025 11:27:32 +0000
Message-Id: <20250314112732.795523-3-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250314112732.795523-1-jakub1.kolakowski@intel.com>
References: <20250314112732.795523-1-jakub1.kolakowski@intel.com>
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
 tests/intel/xe_pm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index c2026474d..53792e1c6 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -146,6 +146,10 @@ static void vram_d3cold_threshold_restore(int sig)
 
 static bool setup_d3(device_t device, enum igt_acpi_d_state state)
 {
+	
+	igt_require_f(igt_has_pci_pm_capability(device.pci_root),
+					"PCI power management capability not found\n");
+
 	dpms_on_off(device, DRM_MODE_DPMS_OFF);
 
 	/*
-- 
2.34.1

