Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B7AC10F15
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 10:47:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB85810EA10;
	Thu, 25 Apr 2024 10:47:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YKGCSVwD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5264B10EA10
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 10:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714042072; x=1745578072;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sqPDj6ROlTLg0otURVJw1hUxGQUNOKUe4W7QyXXXSFo=;
 b=YKGCSVwDsVx/wgjFUfsfPZV13qJoJ0SQc9Nr6IZpKH16wsZQnmFkDe4x
 vDZO7SZB16smo0w+V2+BBsJ8Eqdxa/2huAB9KBpsiu0zxGZT25664Iqr1
 IDHzwivPKrNXmG9Q8N2HZ1ZgRMhSlobfqB4Puf85elZFVbXJ8v95XPgJC
 I7SrwIftDXbyAAaRm8yVyNJnRqqe3OmCOE+kFPhM3uN+QR0VJid2BhThI
 hICPqMPy8e+J4iLA4OPfy4h/XIBHMLOZkrfCXlcjeqdHmp1gik3Zo8Dkh
 Mw6jNnv+baPqWHhIn9a9U/3ljj/WVfxipvLDmNtCjJCn+9cCWRg+13Ggm Q==;
X-CSE-ConnectionGUID: Yj81Yx0aTSGP3/c3IUvJYg==
X-CSE-MsgGUID: pZD1EviUQWqCup2Sb3e1qA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9645837"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="9645837"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 03:47:52 -0700
X-CSE-ConnectionGUID: 8gYgYEmJRnGf9R35ELEvRA==
X-CSE-MsgGUID: 2jRRu5VfQO+op/utgtnn7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="55977780"
Received: from dhhellew-desk2.ger.corp.intel.com.ger.corp.intel.com (HELO
 localhost) ([10.245.246.50])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 03:47:51 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 6/7] lib/rendercopy_gen9: Allow to use all tilings on
 flatccs platforms
Date: Thu, 25 Apr 2024 12:47:20 +0200
Message-Id: <20240425104721.52376-7-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240425104721.52376-1-zbigniew.kempczynski@intel.com>
References: <20240425104721.52376-1-zbigniew.kempczynski@intel.com>
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

Instead of limiting compression to Tile4 lets enable it for any
tiling when platform has flatccs area.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/rendercopy_gen9.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 7c7563d50c..67bb7cfacd 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -175,6 +175,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 		case 64: ss->ss0.surface_format = SURFACEFORMAT_R16G16B16A16_FLOAT; break;
 		default: igt_assert(0);
 	}
+
 	ss->ss0.vertical_alignment = 1; /* align 4 */
 	ss->ss0.horizontal_alignment = 1; /* align 4 or HALIGN_32 on display ver >= 13*/
 
@@ -232,7 +233,6 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 		ss->ss6.aux_mode = 0x5; /* AUX_CCS_E */
 
 		if (buf->ccs[0].stride) {
-
 			ss->ss6.aux_pitch = (buf->ccs[0].stride / 128) - 1;
 
 			address = intel_bb_offset_reloc_with_delta(ibb, buf->handle,
@@ -268,7 +268,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 			ss->ss13.clear_address_hi = (address + buf->cc.offset) >> 32;
 		}
 
-		if (HAS_4TILE(ibb->devid)) {
+		if (HAS_FLATCCS(ibb->devid)) {
 			ss->ss7.dg2.memory_compression_type = 0;
 			ss->ss7.dg2.memory_compression_enable = 0;
 			ss->ss7.dg2.disable_support_for_multi_gpu_partial_writes = 1;
-- 
2.34.1

