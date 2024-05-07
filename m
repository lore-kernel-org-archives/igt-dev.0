Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFC0FC10F1A
	for <igt-dev@archiver.kernel.org>; Tue,  7 May 2024 07:59:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEF2E112183;
	Tue,  7 May 2024 07:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HOook3ng";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC4D112420
 for <igt-dev@lists.freedesktop.org>; Tue,  7 May 2024 07:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715068753; x=1746604753;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EL8U4X2FbPEH4REIlll5mo3GyVQvKYIf8EulJK0PVCU=;
 b=HOook3ng6sbsefOB55zXZrrFvf5Dme1MY/lIYvUmZVbEe9lpbASuwAgv
 2WPkT9nGX6aY8ARyQHkls+vmX8PMbrINqbf/lUaNrBaWYbw52AurD+VJ5
 ldJyBlDUghO5ItK1EDDjbPVmEYcW+GJ7tOmwEmPcrKe/SLZbSQOPMn8jE
 pXax1MZCb3y2geT/DOaOt8I0UBD9P/1iUsNE16zU2s6ujvCWrUYQmbmyR
 vzKenA3n/W7GBo/vNwGkpapVOhxNghXi8HSoiK709XJMj4VW4Q6Of9UWk
 kYB8GqRjWdoUxJqIiQHAmOlde85Hr9domDPTFQymV8SKuGEbxMqjVisrw Q==;
X-CSE-ConnectionGUID: mmo+SZrcRTuBjih/5ayBNA==
X-CSE-MsgGUID: aK5Qp5qFTRy2WUYG6G/D+w==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="22258373"
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="22258373"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 00:59:13 -0700
X-CSE-ConnectionGUID: DcLf/neISCCZpYCZe0YEJw==
X-CSE-MsgGUID: qSPFpBc6Rf6uU9Z6Rk7lXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,260,1708416000"; d="scan'208";a="33238169"
Received: from maurocar-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.12])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2024 00:59:11 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH i-g-t v3 06/11] lib/rendercopy_gen9: Allow to use all tilings
 on flatccs platforms
Date: Tue,  7 May 2024 09:58:31 +0200
Message-Id: <20240507075836.259581-7-zbigniew.kempczynski@intel.com>
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

Instead of limiting compression to Tile4 lets enable it for any
tiling when platform has flatccs area. For integrated leave Tile4
condition to properly configure compression on those platforms.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 lib/rendercopy_gen9.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 7c7563d50c..c73f815efc 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -268,7 +268,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 			ss->ss13.clear_address_hi = (address + buf->cc.offset) >> 32;
 		}
 
-		if (HAS_4TILE(ibb->devid)) {
+		if (HAS_4TILE(ibb->devid) || HAS_FLATCCS(ibb->devid)) {
 			ss->ss7.dg2.memory_compression_type = 0;
 			ss->ss7.dg2.memory_compression_enable = 0;
 			ss->ss7.dg2.disable_support_for_multi_gpu_partial_writes = 1;
-- 
2.34.1

