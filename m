Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45EC6CA100F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Sep 2025 16:10:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F259410E1E1;
	Mon, 22 Sep 2025 16:09:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wii4wLv1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A4F10E1E1
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Sep 2025 16:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758557398; x=1790093398;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DfzOpLiIoMK+Pl9ks3LF9LwvF8jkI/MhjA3sYAFZJwE=;
 b=Wii4wLv1P/dHLVlRWw76eRFEuWXWIJM83w2RwaonnMK9xbPx6UIHmKNn
 3YLrw+2VGOv9DlFs3UPNScxW6X1ZEb3pbTxraLrLjTwBqBkdcOE6mv7vG
 edItZoTVZBITeemWw+MXFDLiwOMgt0I6iTj8B10TgtaFyAWWUZCf4Qd6Q
 aR2yaubEm3/IeuIWshsl2kE2wrrtsH2kaoFIUQLi5sJX8NWFVfhfBPTFu
 mlRql2RCF0WRsGP/t43u09E3L67axImsEXLE1QdXjbC6DJTRJYMhriFTX
 Z1tywe+FSFXHRfRwo9qjHIBvMis5wZOzksxzsoFXQkT7h7jZLuq2FWRsf w==;
X-CSE-ConnectionGUID: NKyjHHGZQ/OxD+WlgYVtIA==
X-CSE-MsgGUID: EmO2+cVmQO+5KKEOY5ih/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="83425515"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="83425515"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 09:09:58 -0700
X-CSE-ConnectionGUID: kBWFCDIIRZCd5AT4LXDudg==
X-CSE-MsgGUID: 45UjM8lJRFauheP21DNc0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; d="scan'208";a="181664925"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.115])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2025 09:09:57 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 1/7] lib/gt: Fix IGT_NO_FORCEWAKE handling
Date: Mon, 22 Sep 2025 19:09:43 +0300
Message-ID: <20250922160950.27250-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250922160950.27250-1-ville.syrjala@linux.intel.com>
References: <20250922160950.27250-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

igt_open_forcewake_handle_for_pcidev() forgets to check for
the IGT_NO_FORCEWAKE environment variable, which is a real
problem when one wants to frob the registers without forcing
power state changes in the hardware (eg. to observe display
low power watermark residencies/etc.)

Add the missing IGT_NO_FORCEWAKE check.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Fixes: 114b9ff31d19 ("lib/igt_gt: Add igt_open_forcewake_handle_for_pcidev()")
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_gt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index d3421b3d7f0d..bec50e38833c 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -528,6 +528,9 @@ int igt_open_forcewake_handle_for_pcidev(const struct pci_device *pci_dev)
 	char path[PATH_MAX];
 	int dirlen, ret;
 
+	if (getenv("IGT_NO_FORCEWAKE"))
+		return -1;
+
 	if (!debugfs_root)
 		return -ENOENT;
 
-- 
2.49.1

