Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B574C47DAF
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jan 2024 14:44:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4E3410F1A1;
	Mon, 22 Jan 2024 14:44:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993A510F19B
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jan 2024 14:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705934673; x=1737470673;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Amr4QAPZsQuSsZigGegw8Jxz68bSMf2Gv4POTYln5qY=;
 b=YpI6G2/eSBWZphcKjWfdlfTnYX4HBFRmZP+mQOcCNbhiItr+SHH7d0lz
 fz6xOFnXzyuhp8KTNNBE/wZhaE6oQsQBLMxbDOjfYPYAxZQOGBgytM5Pq
 U1qQrTIhRMFQzM8qfGMPB9JVnuXslQYyLPjFMPnuX1GnE3adW52LK3hE3
 brZM6tmpq/sPEQ6jn0qB0NHPlqvHW06gfp5ijwVQT5AMV7kW6YW3+BTzF
 KpIRyrdLoNXCZi7dKI660lqp4OhXzWnZCm6PHnINgHJfvn5TNjOx9D1iQ
 8sC8e0q64D6Vc9ET+J9gQMkuuujuzpz9dynvOmPWV9dnPPnkBbKzKG/AL w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="22700789"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; d="scan'208";a="22700789"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 06:44:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="1304236"
Received: from dniestep-mobl5.ger.corp.intel.com (HELO localhost)
 ([10.246.17.55])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2024 06:44:24 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t] lib/intel_batchbuffer: Extend requested size by 4K for
 Xe2+
Date: Mon, 22 Jan 2024 15:44:19 +0100
Message-Id: <20240122144419.325452-1-zbigniew.kempczynski@intel.com>
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

Due to batch prefetching on Xe2+ lets add implicitly 4K page
to user requested batch size. Such should protect the user from
being affected by CAT errors when hw will touch offsets after
user requested batch size.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 lib/intel_batchbuffer.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 85023f9e6f..1596e95427 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -959,6 +959,11 @@ __intel_bb_create(int fd, uint32_t ctx, uint32_t vm, const intel_ctx_cfg_t *cfg,
 			alignment = xe_get_default_alignment(fd);
 
 		ibb->alignment = alignment;
+
+		/* Xe2+ hw requires additional page due to prefetching */
+		if (AT_LEAST_GEN(intel_get_drm_devid(ibb->fd), 20))
+			size += SZ_4K;
+
 		size = ALIGN(size, ibb->alignment);
 		ibb->handle = xe_bo_create(fd, 0, size, vram_if_possible(fd, 0),
 					   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
-- 
2.34.1

