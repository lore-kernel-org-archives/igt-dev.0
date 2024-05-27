Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DF4C25B74
	for <igt-dev@archiver.kernel.org>; Mon, 27 May 2024 07:34:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C59C10E472;
	Mon, 27 May 2024 07:34:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eVBqF6Wz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB63310E472
 for <igt-dev@lists.freedesktop.org>; Mon, 27 May 2024 07:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716795244; x=1748331244;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jQusbobIs4kt17SsTxdgs6VCsL+5gf++PJPr2VHtze4=;
 b=eVBqF6Wzm3Jm7tX7IREveOOgq+O5biI9DcAA/osR9gl2LMuCcOIO/gXf
 lTj80gLPN/f1ZCHGv92GjOT8+krw9F/CtENt2SYASljymSMXm4nAydpJm
 oBhvtcm9QasGlkhxvMqZMp93bGkZCWWCVH4kIeQsbqdU+qLDjX2PVYSxT
 Xu3AuviXXnTbQ5cMN4w+VzIeL3ERxNm1FP8huoUrRm9A/4mnbMByfO+h7
 EsVABxEcPGmjPO2yEiPtn5LIjkzVpz2R7R4S4h8ot4+yYMNapdSVZapoj
 a5slnSBA7PjkhuoKLdXBWmjm/fbR498ejwuZd3ODDXgC7uuPdaGs6Oyqd g==;
X-CSE-ConnectionGUID: +iS6D8UdRQuPpRvphf/FPA==
X-CSE-MsgGUID: LycB05LFTHSR+2q0p4IMqQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="23700408"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="23700408"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 00:34:04 -0700
X-CSE-ConnectionGUID: 4hgiMt8jQvOZyscI0SATEw==
X-CSE-MsgGUID: JdQDV5vKTu2xXYEfYZKlAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="34569726"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.184])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 00:34:02 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 01/12] lib/intel_bufops: Fix offset returned for Tile4
Date: Mon, 27 May 2024 09:33:34 +0200
Message-Id: <20240527073345.54729-2-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240527073345.54729-1-zbigniew.kempczynski@intel.com>
References: <20240527073345.54729-1-zbigniew.kempczynski@intel.com>
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

Functions which calculates offset in bufops for specific tiling should
return it in bytes, not in cpp. Fix this issue for Tile4.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_bufops.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 52a5f322ea..313c2665ae 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -377,7 +377,6 @@ static void *tile4_ptr(void *ptr,
 		((tile_y & 3) << __builtin_ctz(owords)) +
 		(tile_x & (owords - 1));
 	igt_assert((pos & (cpp - 1)) == 0);
-	pos = pos >> __builtin_ctz(cpp);
 
 	return ptr + pos;
 }
-- 
2.34.1

