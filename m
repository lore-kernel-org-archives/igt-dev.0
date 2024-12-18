Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D1AE77187
	for <igt-dev@archiver.kernel.org>; Wed, 18 Dec 2024 05:14:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C568C10E17D;
	Wed, 18 Dec 2024 05:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gix6H5OU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DEB610EAB4
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Dec 2024 05:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734498839; x=1766034839;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xFK3lUWQ69AM1egIGMNNwD3IM4LfRtx7TSlozonL5E0=;
 b=Gix6H5OUBausMgIV9gL/ffnnClO9fs9pH1vP6/CQtcMzm+Z4WVFrTGFp
 KTl/3kYZviA1Ba3b8+0jFyeL1OpJl/XDVf4cIBk2EJDQRQ4PRykE+4FEb
 gT3h7Xecgh+t4ArMonfTU5hUNVceM86YF/Wti+4S9uhWW/a1CGoiSFe3H
 Ne7Oj/ASCcDoFtGoRYPhdWUhC0clRGLmdGnrGT5mL8SBAOf6OfFd3vRb6
 grXsppHMibv9FrnnsZzzOGx7JycxKyhKLX40nwl/aXIiHCoYaDKFm/Qc7
 MhHJszHZ89jm/mCLChSdNg62KxfqYAj+V3MlVp5HZq5J0e0fDs5TMQqm1 w==;
X-CSE-ConnectionGUID: J5m2uCO5QbumplgPDKpPVA==
X-CSE-MsgGUID: X/gKBLsnTVG4iGsEqQ8KwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="45649501"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="45649501"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 21:13:59 -0800
X-CSE-ConnectionGUID: oOoUU4FvSH6wgir287uzdg==
X-CSE-MsgGUID: oF3Zoi9eQWaKGRbHaRUYPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; d="scan'208";a="102588183"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 21:13:59 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Francois Dugast <francois.dugast@intel.com>,
 Peter Senna Tschudin <peter.senna@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 3/4] lib/igt_sysfs: Move close to be common to all
 actions
Date: Tue, 17 Dec 2024 21:13:23 -0800
Message-ID: <20241218051324.2696557-4-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241218051324.2696557-1-lucas.demarchi@intel.com>
References: <20241218051324.2696557-1-lucas.demarchi@intel.com>
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

In all cases, close the sysfs dir (except when asserting, which is then
pointless as the test is dying), so move the close to a single place.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 lib/igt_sysfs.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/lib/igt_sysfs.c b/lib/igt_sysfs.c
index 9427767b0..a1161b68b 100644
--- a/lib/igt_sysfs.c
+++ b/lib/igt_sysfs.c
@@ -1513,15 +1513,12 @@ int xe_sysfs_driver_do(int xe_device, char pci_slot[], enum xe_sysfs_driver_acti
 	switch(action) {
 	case XE_SYSFS_DRIVER_BIND:
 		igt_assert(igt_sysfs_set(sysfs, "bind", pci_slot));
-		close(sysfs);
 		break;
 	case XE_SYSFS_DRIVER_TRY_BIND:
 		igt_sysfs_set(sysfs, "bind", pci_slot);
-		close(sysfs);
 		break;
 	case XE_SYSFS_DRIVER_UNBIND:
 		igt_assert(igt_sysfs_set(sysfs, "unbind", pci_slot));
-		close(sysfs);
 		break;
 	case XE_SYSFS_DRIVER_REBIND:
 		igt_assert(igt_sysfs_set(sysfs, "unbind", pci_slot));
@@ -1533,7 +1530,6 @@ int xe_sysfs_driver_do(int xe_device, char pci_slot[], enum xe_sysfs_driver_acti
 		__drm_close_driver(xe_device);
 
 		igt_assert(igt_sysfs_set(sysfs, "bind", pci_slot));
-		close(sysfs);
 
 		/* Renew the client connection */
 		xe_device = drm_open_driver(DRIVER_XE);
@@ -1544,6 +1540,8 @@ int xe_sysfs_driver_do(int xe_device, char pci_slot[], enum xe_sysfs_driver_acti
 		igt_assert(!"missing");
 	}
 
+	close(sysfs);
+
 	return xe_device;
 }
 
-- 
2.47.0

