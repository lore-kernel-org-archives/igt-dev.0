Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089F4CD4851
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 12:01:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB82D10EC7C;
	Tue, 19 May 2026 12:01:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O6zOp6xr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6D4710EC7C
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 12:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779192068; x=1810728068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FrHzwfmqFanVefoHK4il7P5vt25Ei5MlMZmwS6/agrQ=;
 b=O6zOp6xrI7IrNi5dE5+cW+ssCXBgi9h3dtdKgTG5tTR2LMWTbluDYpfe
 jhdeCJuAFulY5BQS8eJF6+WV3/BJ7xHkKoY0LfC/5NCZTGhxgg+DeikEO
 0Lw9u0hOSLFx+X27J/Kvtra31ocVS1eqqkuqPsguJ9xwsUj+pvShN0LwB
 /jQJCsUjSaLn3Z5q3kwcPFfpwjlHnq/Y8PizMnlWGLZ2GMWyCoQ89vvRN
 kFOEbisnFKYCOtXFiHZrDtzSE71u81Eh1tK++QjSsMlaJoLgBRWtajoZ1
 9ttyWwyNdB8y5swY/VL7DbZ30umBsaZQYC1PfY+uOrBQmkiO0JgcSn/fA w==;
X-CSE-ConnectionGUID: Mg8KraDbT827EJ3v6dLy/Q==
X-CSE-MsgGUID: dYUjqmLUT/yy2y8xyFs2Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="79212894"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="79212894"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 05:01:07 -0700
X-CSE-ConnectionGUID: G9SbNT2qSDugHbgeWNc3Tg==
X-CSE-MsgGUID: jG3cCopySJyhxPbJXOcfvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; d="scan'208";a="239611887"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2026 05:01:06 -0700
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com, lukasz.laguna@intel.com,
 jakub1.kolakowski@intel.com
Subject: [PATCH 1/2] tests/intel/xe_sriov_vfio: Query only BAR regions in
 region-info
Date: Tue, 19 May 2026 14:00:54 +0200
Message-ID: <20260519120055.201038-2-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519120055.201038-1-lukasz.laguna@intel.com>
References: <20260519120055.201038-1-lukasz.laguna@intel.com>
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

The region-info subtest iterates over all regions reported by
VFIO_DEVICE_GET_INFO. Not all regions are queryable on every device,
which can lead to false failures. To avoid this, query only BAR regions,
but check if number of regions returned by VFIO is correct.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_sriov_vfio.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_sriov_vfio.c b/tests/intel/xe_sriov_vfio.c
index f42deaea6..bb1c02696 100644
--- a/tests/intel/xe_sriov_vfio.c
+++ b/tests/intel/xe_sriov_vfio.c
@@ -30,7 +30,7 @@
  * Description: Bind VF to xe-vfio-pci and perform minimal VFIO group open and status ioctl.
  *
  * SUBTEST: region-info
- * Description: Bind VF to xe-vfio-pci, open VFIO device and query VFIO region info (BAR sizes).
+ * Description: Bind VF to xe-vfio-pci, open VFIO device and query BAR regions info.
  */
 
 IGT_TEST_DESCRIPTION("Xe SR-IOV VFIO tests (xe-vfio-pci)");
@@ -254,7 +254,10 @@ static void vfio_dump_region_info(int device_fd)
 	igt_info("VFIO device: flags=0x%x num_regions=%u num_irqs=%u\n",
 		 dinfo.flags, dinfo.num_regions, dinfo.num_irqs);
 
-	for (uint32_t i = 0; i < dinfo.num_regions; i++) {
+	igt_assert(dinfo.num_regions >= VFIO_PCI_NUM_REGIONS);
+
+	/* Query BAR regions only */
+	for (uint32_t i = 0; i <= VFIO_PCI_BAR5_REGION_INDEX; i++) {
 		struct vfio_region_info rinfo = {
 			.argsz = sizeof(rinfo),
 			.index = i,
-- 
2.43.0

