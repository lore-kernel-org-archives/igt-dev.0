Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7BACC27C54
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 14:25:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2098010E64A;
	Fri, 31 May 2024 14:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PLwQ6DDd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB2910E645
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 14:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717165512; x=1748701512;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=A+gUv6QL2mlM5yZqs0al9UyWs5a2J8nUXVCidSQ38xk=;
 b=PLwQ6DDdxRtThWpMD9jO0xdqJZENg2/ZDu/vCAdWOCTrIpO/SucPeoIX
 FPP7BhgXQMm5tEBFFsTLAH1yJGU7gq0XGjO+PcNNQUl6cPusgNtKPVsvG
 /R8RZukC//C/bMfMU0XHALNrVo+EibAdCCv+BXXsUnwEEj7iBAKP0SIzH
 1BzC7DTBLj708L4p6k+B9Ex2h2KLQK5Bb5WgY7EBRWWz5ojeQ6qtJOQOm
 VK/x6fJ85MITzHK5ALXoqV0xYgBw3UyW9rZphPGrUnJPDpjgR2noetovW
 Zf+UOK3r0Dy482LF5XCyzXNfVD+IjP6R2A3UmqZOCb2wX3E9drVamxsJ0 w==;
X-CSE-ConnectionGUID: G+u5I0KqTB+nMCEbdr8LJw==
X-CSE-MsgGUID: da7djSO3RhKRSmf7k1ljmg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="25113751"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="25113751"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:24:44 -0700
X-CSE-ConnectionGUID: JEEeUtTjTJ+ytJXjmcWUtw==
X-CSE-MsgGUID: EZ0WaXPFSX+2QKyH1GGGrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36160927"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 31 May 2024 07:24:42 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 31 May 2024 17:24:41 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 17/20] tools/intel_vbt_decode: Use find_raw_section() to
 determine block presence
Date: Fri, 31 May 2024 17:23:51 +0300
Message-ID: <20240531142354.16528-18-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240531142354.16528-1-ville.syrjala@linux.intel.com>
References: <20240531142354.16528-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

We don't really want to report the generated block 41 as being
present in the VBT. Switch from find_section() to find_raw_section()
so that we only consider the blocks that are actually present in the
VBT.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 04520973aae1..485e0bdb5a59 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -2896,18 +2896,13 @@ static void dump_headers(struct context *context)
 
 	printf("BDB blocks present:");
 	for (i = 0; i < 256; i++) {
-		struct bdb_block *block;
-
-		block = find_section(context, i);
-		if (!block)
+		if (!find_raw_section(context, i))
 			continue;
 
 		if (j++ % 16)
 			printf(" %3d", i);
 		else
 			printf("\n\t%3d", i);
-
-		free(block);
 	}
 	printf("\n\n");
 }
-- 
2.44.1

