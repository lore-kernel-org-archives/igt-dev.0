Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED264C47DAF
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jan 2024 15:01:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 425A410F208;
	Mon, 22 Jan 2024 15:01:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8667F10F0F1
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jan 2024 15:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705935698; x=1737471698;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0vnVasPiR6y9QlByuM0ICEnWyFN7kITHP1hvL2JyUdE=;
 b=ZFYOI8RLmhvXXfMlbSlxV6thPfkot7oeyVwYkD22A3nQQRZtRRSzghAI
 EsAZoEj/zQfbm1pcinylcBRMZdgI0ochbjQQtm+bKBauv1WXolqpsp7xx
 N8diQ8zjPjeBq7PvCZZ+3Lfv8kXohd34FLLBGdgqLHAEZ2oOi3nzAGM8r
 AvbxLLZvMSRictY8lfs/5ald4PMF4vCFhuD9zO9cbYzb7LGNH6XX5ZeNw
 exQymna4NQjFQAE6R7CVO6JtDmjeFx18Tukdu/s2Dk09zy/I5dbXBcFFb
 NaP5lz3SPlH+JmKkrxKl/IeMo1ADjrG++EIhjfS9Gkjl8qbK4ZV2wSsn5 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="22705268"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="22705268"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 07:01:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="34062314"
Received: from dniestep-mobl5.ger.corp.intel.com (HELO localhost)
 ([10.246.17.55])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 07:01:35 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2] lib/intel_batchbuffer: Extend requested size by 4K
 for Xe2+
Date: Mon, 22 Jan 2024 16:01:31 +0100
Message-Id: <20240122150131.328414-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Due to batch prefetching on Xe2+ lets add implicitly additional size
to user requested batch size. Such should protect the user from being
affected by CAT errors when hw will touch offsets after user requested
batch size.

v2: use xe_cs_prefetch_size() instead explicit 4K (Matt)

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 lib/intel_batchbuffer.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 85023f9e6f..ec713c7991 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -959,6 +959,11 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 			alignment = xe_get_default_alignment(fd);
 
 		ibb->alignment = alignment;
+
+		/* Xe2+ hw requires additional page due to prefetching */
+		if (AT_LEAST_GEN(intel_get_drm_devid(fd), 20))
+			size += xe_cs_prefetch_size(fd);
+
 		size = ALIGN(size, ibb->alignment);
 		ibb->handle = xe_bo_create(fd, 0, size, vram_if_possible(fd, 0),
 					   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
-- 
2.34.1

