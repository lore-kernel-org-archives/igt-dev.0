Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF40C369C2
	for <igt-dev@archiver.kernel.org>; Fri, 25 Apr 2025 09:49:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5933010E8F8;
	Fri, 25 Apr 2025 09:49:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IDiGjkaB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C30A710E8F7
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Apr 2025 09:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745574576; x=1777110576;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tI79SRayBXhL7ODFuF/51ZKA/Jy2lalW4Ep8GrSBsaU=;
 b=IDiGjkaB/YbYVjDW7zm25diHEp/Co+Elciq8WYWkkNs0bk3zdvMIFGxw
 /Hmf2q6apdr90XPfZNF5z1vHuEsC5Bz20J60pe8QIA/wqYQBi46IM3wmz
 mVRsNAbHkR2XQeM9+TJDeuq2iKnTdsHmu5E+RVWOmucQ+DKumqUbCWb6t
 xTwrrFoIoA17PhbOE2P6jP9uW5KJ/4d2lNSW3/Y7GtXvjNdTtrY6bIRzb
 aH64wE+gELcX9PExxov+8AdSR1tRDBpW/E8VffbCMgFPbx8c45ugzhX9Z
 YUE2FYH5NgLmuhVssa/LuIKlb+0jk/YoMlGJngEnwEsUT3Cg3l4y4oxpd g==;
X-CSE-ConnectionGUID: lHAgcWIVRxqcaAK0M7aZkA==
X-CSE-MsgGUID: O1jdLrDhT1aUrtzAe9S/Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="57874364"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="57874364"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 02:49:35 -0700
X-CSE-ConnectionGUID: YYtbCxKJRneWRluR1ZlzpA==
X-CSE-MsgGUID: VjYfOAIMTo6d4Tvrq/Q3iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; d="scan'208";a="132606771"
Received: from szymonos-mobl.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.252.47])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2025 02:49:34 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>
Subject: [PATCH i-g-t 3/3] lib/igt_facts: Fix potential NULL pointer
 dereference
Date: Fri, 25 Apr 2025 11:49:04 +0200
Message-ID: <20250425094904.221857-3-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250425094904.221857-1-peter.senna@linux.intel.com>
References: <20250425094904.221857-1-peter.senna@linux.intel.com>
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

If both udev_device_get_sysattr_value and udev_device_get_sysname fail,
pci_addr will remain NULL, which could lead to issues when using it
later in asprintf. Ignore cards when pci_addr cannot be extracted.

Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 lib/igt_facts.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/igt_facts.c b/lib/igt_facts.c
index d38be0726..47a2c98a5 100644
--- a/lib/igt_facts.c
+++ b/lib/igt_facts.c
@@ -537,6 +537,10 @@ static void igt_facts_scan_pci_drm_cards(const char *last_test)
 								 "address");
 			if (!pci_addr)
 				pci_addr = udev_device_get_sysname(pci_dev);
+			if (!pci_addr) {
+				udev_device_unref(drm_dev);
+				continue;
+			}
 		} else {
 			/* Some GPUs are platform devices. Ignore them. */
 			pci_addr = NULL;
-- 
2.43.0

