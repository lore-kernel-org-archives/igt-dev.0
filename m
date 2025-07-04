Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037FAC8303D
	for <igt-dev@archiver.kernel.org>; Fri,  4 Jul 2025 15:34:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC3E110E2A8;
	Fri,  4 Jul 2025 15:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a/L2PALN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD97710E2BA
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Jul 2025 15:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751643260; x=1783179260;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ttavz/JlC4lHUVFliZctXnSj8NZ2f5TGbifSUcAh+IM=;
 b=a/L2PALNqqR8LBMj10uSIFXEa2MJa7XHuFgSt/weg6Nxnm0euZWQqOU/
 h/30WPMNRwzHXUaFMhKYVuANGUo1ZP9oXWVxQVlHAlns4SZ0wioXWvXk3
 g7bvBfHNlATf62M0y6ODCt+IcAj5VRtRoHV/+3bfO/BRx4otu1RLom8y7
 a7AITrQf8k5h+NIJG874C1S0lHAFoRfcSgLOBD2lvnMJR3ehjA1T3q+AX
 C0r5DoK6MRFSfyIuG29wiiQsEYZ36sM5H8yde6YHnKkZ5kzBQ+IMpTIDC
 0a3Oo03PrG5LJP6T42joOyw7XybDL/uLeqVIUmpzJxNwVa/cYT1Q8SpkC A==;
X-CSE-ConnectionGUID: URV0h0rPTwG2PddT86sqcQ==
X-CSE-MsgGUID: VFdU2jYmTFidJNlUFoXVdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="65035256"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="65035256"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 08:34:20 -0700
X-CSE-ConnectionGUID: rffWOTyCQ+KUGKMXK0loCw==
X-CSE-MsgGUID: iqM2nJfESxmJd/J7j5p/CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="158935254"
Received: from unknown (HELO rvodapal-mobl.iind.intel.com) ([10.190.239.40])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 08:34:18 -0700
From: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: balasubramani.vivekanandan@intel.com,
 Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
Subject: [PATCH] lib/pciids: Add one more PCI ID to BMG
Date: Fri,  4 Jul 2025 21:04:07 +0530
Message-Id: <20250704153407.101227-1-ravi.kumar.vodapalli@intel.com>
X-Mailer: git-send-email 2.34.1
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

Align with kernel commit ccfb15b8158c ("drm/xe/bmg: Add one additional PCI ID")

It adds one more pci id to BMG.

v2:
 - Earlier i have written the unmerged kernel patch commit id in the
   description under kernel commit ,  actually the commit id of merged
   patch is to be specified there.
 - Updated with correct commit id of respective kernel patch.

Signed-off-by: Ravi Kumar Vodapalli <ravi.kumar.vodapalli@intel.com>
---
 lib/pciids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/pciids.h b/lib/pciids.h
index 129c3172a..666265b5f 100644
--- a/lib/pciids.h
+++ b/lib/pciids.h
@@ -846,6 +846,7 @@
 /* BMG */
 #define INTEL_BMG_IDS(MACRO__, ...) \
 	MACRO__(0xE202, ## __VA_ARGS__), \
+	MACRO__(0xE209, ## __VA_ARGS__), \
 	MACRO__(0xE20B, ## __VA_ARGS__), \
 	MACRO__(0xE20C, ## __VA_ARGS__), \
 	MACRO__(0xE20D, ## __VA_ARGS__), \
-- 
2.34.1

