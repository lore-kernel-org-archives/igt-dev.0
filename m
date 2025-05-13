Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39841C3ABC3
	for <igt-dev@archiver.kernel.org>; Tue, 13 May 2025 18:58:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 319D810E5DC;
	Tue, 13 May 2025 18:58:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BzI8itcO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4C010E5DC
 for <igt-dev@lists.freedesktop.org>; Tue, 13 May 2025 18:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747162701; x=1778698701;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hfiZhSem2p/1yO7vs5lDVMv7y5df4CRBslzEHmr/z34=;
 b=BzI8itcOrH+l0Ko//e4jgySJKNjqs94P4Ajho+gP3bWc1+0cw6aW3tkH
 qA3YXBFihNQgIL5iLd4B5sBf2gL0S4TxBN8t51yqLZVSBD1b9+ogS80Bo
 TJdCcR2OlQgyi4PTfIr0/i3CmrBQyBAmTJCfHHk3/R5IX4TpzKP4848gT
 6NdmY7AHCDQ4TFTnmgNy4XyybzSTKhOZIhNb+KyRovrn+q5MimRqKSPFI
 FdHMdsPIyQnUerRAZfyF5yUBuThuCyLR/ztbGkiMF6nqmEUIratNi64Km
 wvMAuRpNSLychdZwrPN+EW5xt0ZWxO1f4UqOFSYqw0WNpSvpxEAhTrjkv Q==;
X-CSE-ConnectionGUID: 26MvwLYHSASR764r2/N6Ug==
X-CSE-MsgGUID: 6gGX3oX7Rfqs3yZfGJsKgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="48960579"
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="48960579"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:58:20 -0700
X-CSE-ConnectionGUID: guOm8Ai3Rt2kRuZh9ArdRw==
X-CSE-MsgGUID: K9f3jd6PS9WUd6PIJ3/niA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,286,1739865600"; d="scan'208";a="137679105"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.60])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 11:58:19 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 01/15] lib/xe_spin: limit width/pitch for mem-copy
Date: Tue, 13 May 2025 20:57:56 +0200
Message-ID: <20250513185811.897232-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
References: <20250513185811.897232-1-zbigniew.kempczynski@intel.com>
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

Mem-copy for byte copy requires width/pitch to be max 256K
(higher bits have different meaning and setting them might lead
to undefined behavior). If witch/pitch are too high limit them to
the maximum possible for the operation. Asserting might lead to
test stucking in multithreading scenarios so displaying warning
was selected instead.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
---
 lib/xe/xe_spin.c | 35 +++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index a92903b6bd..6683d1f351 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -126,11 +126,38 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
 	}
 
 	if (opts->mem_copy) {
+		uint32_t src_width, src_pitch, dst_width, dst_pitch;
+
+		src_width = opts->mem_copy->src->width;
+		src_pitch = opts->mem_copy->src->pitch;
+		dst_width = opts->mem_copy->dst->width;
+		dst_pitch = opts->mem_copy->dst->pitch;
+
+		if (src_width > dst_width) {
+			igt_warn("src width must be <= dst width\n");
+			src_width = dst_width;
+		}
+
+		if (src_width > SZ_256K) {
+			igt_warn("src width must be less than 256K, limiting it\n");
+			src_width = SZ_256K;
+		}
+
+		if (src_pitch > SZ_256K) {
+			igt_warn("src pitch must be less than 256K, limiting it\n");
+			src_pitch = SZ_256K;
+		}
+
+		if (dst_pitch > SZ_256K) {
+			igt_warn("dst pitch must be less than 256K, limiting it\n");
+			dst_pitch = SZ_256K;
+		}
+
 		spin->batch[b++] = MEM_COPY_CMD;
-		spin->batch[b++] = opts->mem_copy->src->width - 1;
-		spin->batch[b++] = opts->mem_copy->src->height - 1;
-		spin->batch[b++] = opts->mem_copy->src->pitch - 1;
-		spin->batch[b++] = opts->mem_copy->dst->pitch - 1;
+		spin->batch[b++] = src_width - 1;
+		spin->batch[b++] = 1;  /* for byte copying this is ignored */
+		spin->batch[b++] = src_pitch - 1;
+		spin->batch[b++] = dst_pitch - 1;
 		spin->batch[b++] = opts->mem_copy->src_offset;
 		spin->batch[b++] = opts->mem_copy->src_offset << 32;
 		spin->batch[b++] = opts->mem_copy->dst_offset;
-- 
2.43.0

