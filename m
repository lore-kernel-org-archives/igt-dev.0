Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23B6EC27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 05:24:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0E8A10E102;
	Tue, 18 Jun 2024 05:24:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XSPzdYrz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1476010E56F
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 05:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718688243; x=1750224243;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vI4bg8/lY3Qsbx03fMWDx6Re72Kwj183xc41oaT7zwY=;
 b=XSPzdYrz1kjASxnGchL4KDUW70MmriTCTNVAPvCUQ+4Bu3+bRXVpQErA
 JCi4dQeA0bOHjFwMlo7rTqLpWyx07Vd5VJvmNBkGH3431Fl8CPgeA/xN3
 yvnMHh1iiMi+7WANrT7WU2UHmau1IWdZOLeo77T1GVnmzbnsZMXi2d7aU
 /cdI8g+N8ElKE9kLfA4sKN748DW5jD79C086CfPq6vf/FfiwydNXzgxx7
 8pq0l778d52OAF6lJKZpt7v6yuYF6ZMSVEzcv2DNE0pL8xuvV54hwESS2
 D2CRe8vrlC8+bfF0cd2nZKGSRJRJzEctfBnVlSKKtzu9ykp+N4P7ZlF/J g==;
X-CSE-ConnectionGUID: p1f4DFLIT9Se+R4yIekdIg==
X-CSE-MsgGUID: 27QjWSj0Q+69Bj9001XROA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26660089"
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="26660089"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 22:24:03 -0700
X-CSE-ConnectionGUID: 220U6J8bSsOrpsMWW6wytA==
X-CSE-MsgGUID: ssFkBYcPQX6h4DVmlbthaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; d="scan'208";a="41525219"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.150])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 22:24:01 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 06/12] lib/intel_blt: Add Yf tiling in block-copy
Date: Tue, 18 Jun 2024 07:23:29 +0200
Message-Id: <20240618052335.152588-7-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240618052335.152588-1-zbigniew.kempczynski@intel.com>
References: <20240618052335.152588-1-zbigniew.kempczynski@intel.com>
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

For TGL and DG1 I've noticed we have Yf, not Tile4 specified in the
documentation.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_blt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index a8433387d2..d1200ca862 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -555,6 +555,7 @@ static int __block_tiling(enum blt_tiling_type tiling)
 	case T_XMAJOR: return 1;
 	case T_YMAJOR: return 1;
 	case T_TILE4:  return 2;
+	case T_YFMAJOR: return 2;
 	case T_TILE64: return 3;
 	default:
 		break;
-- 
2.34.1

