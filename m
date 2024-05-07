Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E4AC25B4F
	for <igt-dev@archiver.kernel.org>; Tue,  7 May 2024 07:59:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9B6112499;
	Tue,  7 May 2024 07:59:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eLD9f5jY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03126112183
 for <igt-dev@lists.freedesktop.org>; Tue,  7 May 2024 07:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715068744; x=1746604744;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gfiz19URuH8hVPEJoY0HH9bZWzFHKUQeqa7wq4PyKWg=;
 b=eLD9f5jYi/qjmmx/IbpP0/2do65Dm/Fj8sVCiUwgIj7/Ne8sWslpNNMg
 7NWgr8aBzrd9YMCglH1vKeulJJg9qgsRXIGqt/eygQq14uYFlTAGjBP0l
 EHiFUViAdWHtEOOJcCFnDXpAb269V4PRVWs2wxG59z6MVrkcWnbiMkEWl
 LOAWAYEVuBFBFydeUw/UrHJLT3hKBtEeUmBXT7QQEqXnHEUgPBjL9kttB
 I8FtHiTKAPMdjIRIvRaIL15MI36DDyFf0q1b4ukjPIW/f5SedON2lu6Mq
 9j2GkC6+VoIF2YQJ4ej6fp4cJA5p2HgiGaUZXK5K/bvCe6t0oAcjsa0z0 g==;
X-CSE-ConnectionGUID: K/BpgrQ2QkiOh7hVeoeNhg==
X-CSE-MsgGUID: tp9vqHdGTyqH0/eZYiZYtg==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="14656326"
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="14656326"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 00:59:04 -0700
X-CSE-ConnectionGUID: S4LUOicJTH+Ri527ijZvBQ==
X-CSE-MsgGUID: Rq9zwpF3SeutpR9kXeki3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="32943836"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.12])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 00:59:02 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v3 04/11] lib/intel_bufops: Restrict tilings on
 non-flatccs platforms
Date: Tue,  7 May 2024 09:58:29 +0200
Message-Id: <20240507075836.259581-5-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240507075836.259581-1-zbigniew.kempczynski@intel.com>
References: <20240507075836.259581-1-zbigniew.kempczynski@intel.com>
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

JP noticed after last changes introduced in bufops we keep unnecessary
two conditions instead of pack them to single one. This is refactor,
no functional change.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Suggested-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_bufops.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 43d6dd5b43..7118272e5f 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -896,7 +896,9 @@ static void __intel_buf_init(struct buf_ops *bops,
 
 	size = buf->surface[0].size = buf->surface[0].stride * aligned_height;
 
-	if (compression) {
+	if (compression && !HAS_FLATCCS(buf_ops_get_devid(bops))) {
+		int aux_width, aux_height;
+
 		igt_require(bops->intel_gen >= 9);
 		igt_assert(req_tiling == I915_TILING_Y ||
 			   req_tiling == I915_TILING_Yf ||
@@ -907,17 +909,12 @@ static void __intel_buf_init(struct buf_ops *bops,
 		 * CCS units, that is 4 * 64 bytes. These 4 CCS units are in
 		 * turn mapped by one L1 AUX page table entry.
 		 */
+		aux_width = intel_buf_ccs_width(bops->intel_gen, buf);
+		aux_height = intel_buf_ccs_height(bops->intel_gen, buf);
 
-		if (!HAS_FLATCCS(intel_get_drm_devid(bops->fd))) {
-			int aux_width, aux_height;
-
-			aux_width = intel_buf_ccs_width(bops->intel_gen, buf);
-			aux_height = intel_buf_ccs_height(bops->intel_gen, buf);
-
-			buf->ccs[0].offset = buf->surface[0].stride * ALIGN(height, 32);
-			buf->ccs[0].stride = aux_width;
-			size = buf->ccs[0].offset + aux_width * aux_height;
-		}
+		buf->ccs[0].offset = buf->surface[0].stride * ALIGN(height, 32);
+		buf->ccs[0].stride = aux_width;
+		size = buf->ccs[0].offset + aux_width * aux_height;
 	}
 
 	/* Store buffer size to avoid mistakes in calculating it again */
-- 
2.34.1

