Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45713D49C92
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 10:17:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F30D210E11F;
	Fri, 30 Jan 2026 10:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HuGREeSH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD44510E11F
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 10:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769768267; x=1801304267;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=RAOvG8IE24zHVDJxzWdEYYKsYBbZAZXZPVPFd2MTvZ8=;
 b=HuGREeSHmUtpojxCCxOfYsj7Wep2SrUSYJGmlPagMqvZTP/V++k2rIPw
 /keQDYsq7hZvnwtKjrAMTCVxTOrPox9XHyn4CmKrrcNNwQWz+6LD+9+df
 wcV0NvCpbdKsTvQsBiV1Pnh++zZ4A2It4JMkSKftHg/gwxj9cJJS2xuvd
 5NtQ3vlIh3hah4Fg0gz5Z3jc411IjHwi0nNWUUaUjvARlBgZ/edNFXRJn
 keiqQh9QKeA5J4X4ImXEDXIMjZ9Y07Qsk771tp7w6IR9LWgoJlY6td6XE
 12TqctI0018gakjdvsPK2QzBJKmd45BG22mT5JYH/OXjCwHIMs/kGFevY A==;
X-CSE-ConnectionGUID: AUOV9BLwRwSrVT3dud2pMw==
X-CSE-MsgGUID: rkFg4gnlRUaqiUvB6EvKjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71181651"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="71181651"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:17:46 -0800
X-CSE-ConnectionGUID: 2eS6N5i7R9GvpH5TbsXOLQ==
X-CSE-MsgGUID: f1R4tSI8Rwm30qc3yktNHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208";a="240083504"
Received: from llaguna-dev.igk.intel.com (HELO localhost) ([10.91.214.40])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 02:17:44 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@linux.intel.com, piotr.piorkowski@intel.com,
 lukasz.laguna@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_sriov_vram: Add support for multitile
 platforms
Date: Fri, 30 Jan 2026 11:17:36 +0100
Message-Id: <20260130101736.11715-1-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.40.0
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

So far the amount of provisioned VRAM was collected only from the first
tile. On multitile platforms it may not reflect the full provisioned
VRAM size. Extend it to take into account values from all tiles.

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 tests/intel/xe_sriov_vram.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_sriov_vram.c b/tests/intel/xe_sriov_vram.c
index 622ca77fc7..e46416d96c 100644
--- a/tests/intel/xe_sriov_vram.c
+++ b/tests/intel/xe_sriov_vram.c
@@ -38,10 +38,14 @@ const size_t STEP = SZ_1M;
 
 static uint64_t get_provisioned_vram(unsigned int pf_fd, unsigned int vf_id)
 {
+	unsigned int tile, main_gt;
 	uint64_t size = 0;
 
-	/* TODO: adjust for multitile platforms */
-	size = xe_sriov_pf_get_provisioned_quota(pf_fd, XE_SRIOV_SHARED_RES_LMEM, vf_id, 0);
+	xe_for_each_tile(pf_fd, tile) {
+		main_gt = xe_tile_get_main_gt_id(pf_fd, tile);
+		size += xe_sriov_pf_get_provisioned_quota(pf_fd, XE_SRIOV_SHARED_RES_LMEM, vf_id,
+							  main_gt);
+	}
 
 	return size;
 }
-- 
2.40.0

