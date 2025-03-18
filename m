Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A06CCC282EC
	for <igt-dev@archiver.kernel.org>; Tue, 18 Mar 2025 15:10:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F2510E4A8;
	Tue, 18 Mar 2025 15:10:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GRG9rqr5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A42310E4A8
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Mar 2025 15:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742310641; x=1773846641;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sODDeJutggArK5aQdvemx5br0JhoUDHw2QYgzDzkCmk=;
 b=GRG9rqr5pYHVXlZIXnOcQMlOT1koFXKJpV3071hhu5su8Hx76fQsV0hb
 TJxco2WiKbiSXDSZubvDrJr7AmSQiGFKMMaM7dNthj3iC3eQ1dT60NFHt
 jjGVgzmjbiuNXLcMl7/FmIFj9eYqzxo8xRkDfBBM53SMv36G9bbIWpqJq
 BMSsQY+UhxwpMMC+5zd4KbeEKkJIFMaXI1dVVVRlpQ5287vDDlf+tsRpo
 oHj/MVwiZztGuzpeKBd0MLrKkZQW4YO1C/lvipYVIGHMb3zblJGayloSh
 XUlpvvCE7m8IkXKdWRueUycvakJE48YSsb9jznzdsn+EpTY6LNOC/2zoK g==;
X-CSE-ConnectionGUID: R8Kc1rZ3Tk6b6IXuEErpKA==
X-CSE-MsgGUID: mkoPa/MfTp2TmX4c1E+Ibg==
X-IronPort-AV: E=McAfee;i="6700,10204,11377"; a="60989107"
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; d="scan'208";a="60989107"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 08:10:40 -0700
X-CSE-ConnectionGUID: +CfVTAiiSAafriDEStyzsA==
X-CSE-MsgGUID: KZEQRRAZRvKPY2Bo5/gGWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,257,1736841600"; d="scan'208";a="123227648"
Received: from tmistat-dev.igk.intel.com ([10.211.135.226])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2025 08:10:38 -0700
From: Jakub Kolakowski <jakub1.kolakowski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>,
 Adam Miszczak <adam.miszczak@linux.intel.com>,
 Lukasz Laguna <lukasz.laguna@intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH i-g-t v4 2/2] tests/intel/xe_pm: Add a check for power
 management capability
Date: Tue, 18 Mar 2025 15:01:08 +0000
Message-Id: <20250318150108.1055169-3-jakub1.kolakowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250318150108.1055169-1-jakub1.kolakowski@intel.com>
References: <20250318150108.1055169-1-jakub1.kolakowski@intel.com>
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
index c2026474d..70f0613fb 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -146,6 +146,9 @@ static void vram_d3cold_threshold_restore(int sig)
 
 static bool setup_d3(device_t device, enum igt_acpi_d_state state)
 {
+	igt_require_f(igt_has_pci_pm_capability(device.pci_xe),
+		      "PCI power management capability not found\n");
+
 	dpms_on_off(device, DRM_MODE_DPMS_OFF);
 
 	/*
-- 
2.34.1

