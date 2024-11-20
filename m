Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3675ED711CF
	for <igt-dev@archiver.kernel.org>; Wed, 20 Nov 2024 17:38:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B1010E187;
	Wed, 20 Nov 2024 17:38:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZsPypwDW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DA610E2D1
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2024 17:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732124284; x=1763660284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vEiGXZZQrNEMFGM/zIepIlfK4Z0Fh610muvzWSuMnxI=;
 b=ZsPypwDW0+9nB4k+MEcJA66XB1fwcdziJ9kPhiPdIV2R5kMFHNPryr9O
 eK+y89U/cZJhjviGfafzC+kQCrKobkYXgXT9rqQMQ8cthUV++SijAEXH+
 aSLixbgXRv2u+y3xXR/iJZj+SWpQJmurZP+ByAjygobpnQAxWKqESNAc4
 mVXrUHdaM2y+wnZgKMF/5gfS+4Tb1xi9LjREHAuN4XMKCjFKynbi6lJIM
 kK0ijh56sfg7jz1UJMFGqPMRhMXnPA/8jIdi/x/vk+O7gUwR2H4x2nazR
 cPw6TuCblj5CZgMLCK0qJFaubniRjpX+zPz7uRcAf5uN36ePUYgIJKEt4 A==;
X-CSE-ConnectionGUID: 2zfr6ZBIRUycaRg910mdCQ==
X-CSE-MsgGUID: GCuYzIvDSM+d8qypH5uUYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="35058702"
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="35058702"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 09:38:04 -0800
X-CSE-ConnectionGUID: qrvk7eayRoOpwvJ20Q0Gcw==
X-CSE-MsgGUID: N4vfHgC+Sr+USf6ZNKfB1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,170,1728975600"; d="scan'208";a="90395675"
Received: from mbernato-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.97.199])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2024 09:38:01 -0800
From: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, adam.miszczak@linux.intel.com,
 jakub1.kolakowski@intel.com, lukasz.laguna@intel.com,
 michal.wajdeczko@intel.com, michal.winiarski@intel.com,
 narasimha.c.v@intel.com, piotr.piorkowski@intel.com,
 satyanarayana.k.v.p@intel.com, tomasz.lis@intel.com,
 Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Subject: [PATCH v2 i-g-t 1/3] lib/xe/xe_mmio: Replace open-coded init/cleanup
 with existing functions
Date: Wed, 20 Nov 2024 18:37:47 +0100
Message-Id: <20241120173749.348843-2-marcin.bernatowicz@linux.intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20241120173749.348843-1-marcin.bernatowicz@linux.intel.com>
References: <20241120173749.348843-1-marcin.bernatowicz@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Use intel_register_access_init and intel_register_access_fini to handle
initialization and cleanup, reducing code duplication. This improves
maintainability and ensures consistency, including handling forcewake
for Xe.

Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Lukasz Laguna <lukasz.laguna@intel.com>
Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 lib/xe/xe_mmio.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/lib/xe/xe_mmio.c b/lib/xe/xe_mmio.c
index 0817c12f6..834816133 100644
--- a/lib/xe/xe_mmio.c
+++ b/lib/xe/xe_mmio.c
@@ -23,13 +23,8 @@ void xe_mmio_vf_access_init(int pf_fd, int vf_id, struct xe_mmio *mmio)
 
 	igt_assert_f(pci_dev, "No PCI device found for VF%u\n", vf_id);
 
-	intel_mmio_use_pci_bar(&mmio->intel_mmio, pci_dev);
-
-	igt_assert(mmio->intel_mmio.igt_mmio);
-
+	intel_register_access_init(&mmio->intel_mmio, pci_dev, false);
 	mmio->fd = pf_fd;
-	mmio->intel_mmio.safe = false;
-	mmio->intel_mmio.pci_device_id = pci_dev->device_id;
 }
 
 /**
@@ -53,8 +48,7 @@ void xe_mmio_access_init(int pf_fd, struct xe_mmio *mmio)
  */
 void xe_mmio_access_fini(struct xe_mmio *mmio)
 {
-	mmio->intel_mmio.pci_device_id = 0;
-	intel_mmio_unmap_pci_bar(&mmio->intel_mmio);
+	intel_register_access_fini(&mmio->intel_mmio);
 }
 
 /**
-- 
2.31.1

