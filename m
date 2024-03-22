Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D52EFC54E71
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 20:41:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76AB3112763;
	Fri, 22 Mar 2024 20:41:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bpne5L50";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E10112763
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 20:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711140098; x=1742676098;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=qz1WQCBt8wQbhOHmBJCa/+x63XH7HLgFnSIHF39t3hk=;
 b=Bpne5L50PywAymIcQTPAS7hxFxCo84fnEUnxUZhAyQiMtY4Hj1/u9ILg
 6BTAvZQ3iM81jUxdk0r+5Tk/JsrGgSA4XHpbMO21AQvzTx4yvYKpVo9Vz
 yT2BLbYAW6XEvvznQhcEzVV7vtRlN3c46XdBOlTOkZ7S/vV+/rHedk24L
 Jo48vyiVUpxPtG65rJyZYpli51XIyVIPrcsoy/B8wQ1U8FeUdz0ShLdlw
 IIX6mvSlcV7/JLs3qPylKdHa9/1vCOa4Fp6Xf2v4v+je0fT4XSPrwQsNA
 ded5/yIvU0dK8dL8qqEtvFFlZkBN2CJPPF0hKTO1hu1cxasLJ/Oj2LPat w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6329357"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="6329357"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 13:41:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="827783612"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="827783612"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 22 Mar 2024 13:41:35 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Mar 2024 22:41:34 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 03/13] tools/intel_vbt_decode: Allow blocks to be named
 without full decoding
Date: Fri, 22 Mar 2024 22:41:15 +0200
Message-ID: <20240322204125.17212-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
References: <20240322204125.17212-1-ville.syrjala@linux.intel.com>
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

Make it possible to give blocks a name without having to
implement full decoding.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index b7cd2b3bfa69..1d1ba46db6e7 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -2672,11 +2672,10 @@ static bool dump_section(struct context *context, int section_id)
 		}
 	}
 
-	if (dumper && dumper->name)
-		printf("BDB block %d (%d bytes) - %s:\n", block->id, block->size, dumper->name);
-	else
-		printf("BDB block %d (%d bytes) - Unknown, no decoding available:\n",
-		       block->id, block->size);
+	printf("BDB block %d (%d bytes) - %s%s:\n",
+	       block->id, block->size,
+	       dumper ? dumper->name : "Unknown",
+	       dumper && !dumper->dump ? ", no decoding available" : "");
 
 	if (context->hexdump)
 		hex_dump_block(block);
-- 
2.43.2

