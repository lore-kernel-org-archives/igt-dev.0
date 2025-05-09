Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D66EC3ABC3
	for <igt-dev@archiver.kernel.org>; Fri,  9 May 2025 07:46:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1530910E9D2;
	Fri,  9 May 2025 07:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fOZVoDy8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D19A10E9D2
 for <igt-dev@lists.freedesktop.org>; Fri,  9 May 2025 07:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746776816; x=1778312816;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RJoCWeHmbq7RFJDBFfCsCi3Ok7zcoZpdrqbJYYbGfDE=;
 b=fOZVoDy8GwvegLl3SVd3f4zloIBMaweBTIW90LsJusZHhTathuR6aIxp
 K03w0nAw5yFiZ42UwHcnbkdv++VAvNvos/6cxz2jQ6/7N7DniiktIXoc8
 uU7cxXYbqu7M+664j7e7eRgJhAYLeTB0O0iCT12iDCdZ2c+Qj1pssLl//
 Unu93ZP27j3FHOIdAo6YqIDZgJifz3mC92mRAoGra/W8vISH19+DNejL5
 5dfCTXoPTj3urLOj4h1pzuPYVB6kdtJEktcGZqAMeDNWgnRsjcBxiKIoZ
 izjtDBFQNBdaxXsbejP9FxzPY2o60iU5o0yzEQ1X/iFoYc2Fuwv9z88GP Q==;
X-CSE-ConnectionGUID: 99p2cVaAQiSRFrji3CdEFQ==
X-CSE-MsgGUID: +ntSQrlgTYevIpZIPE0HXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="52249084"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="52249084"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 00:46:55 -0700
X-CSE-ConnectionGUID: tKIcsuKZSrC35hx8ss8z7Q==
X-CSE-MsgGUID: MuhokcC0RoGiKYwbkacCaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; d="scan'208";a="136931757"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.131])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 00:46:53 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH i-g-t 1/2] lib/xe_spin: limit width/pitch for mem-copy
Date: Fri,  9 May 2025 09:46:44 +0200
Message-ID: <20250509074645.56169-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250509074645.56169-1-zbigniew.kempczynski@intel.com>
References: <20250509074645.56169-1-zbigniew.kempczynski@intel.com>
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
 lib/xe/xe_spin.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
index a92903b6bd..7ff06cab3b 100644
--- a/lib/xe/xe_spin.c
+++ b/lib/xe/xe_spin.c
@@ -126,11 +126,36 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
 	}
 
 	if (opts->mem_copy) {
+		uint32_t src_width, src_pitch, dst_width, dst_pitch;
+
+		src_width = opts->mem_copy->src->width;
+		src_pitch = opts->mem_copy->src->pitch;
+		dst_width = opts->mem_copy->dst->width;
+		dst_pitch = opts->mem_copy->dst->pitch;
+
+		if (src_width > dst_width)
+			igt_warn("src width must be <= dst width\n");
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

