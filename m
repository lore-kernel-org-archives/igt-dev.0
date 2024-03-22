Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D45C54E71
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 20:42:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1264112764;
	Fri, 22 Mar 2024 20:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IFlECxZ/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C3A6112764
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 20:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711140121; x=1742676121;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=xplC8pbW085h7q+gDJ+QiX/Zo7PgVncYic7kJ846fNA=;
 b=IFlECxZ/v61jFtNX3XkEP9BqEZc/0MK3r+9cCzEaMt/XRn76Zsx/il4P
 52temEreMQhukzuihHJZdItDNH0GfAnNmCErh3NFJcfyGjmiZsJUSb5xL
 /QFYzNadQHiOO3X6tAK5ncdkrs9257SrdQIEm1qLgEMTPrLklYP6vw1Rt
 hTI9A26hdMLFB3EItQO2xpkQ+/aUamNCDI1bQmo4K+KerB/ay/++ZSOPa
 I7vHWAJEsBCqgxI947UpjLZf41FuewK77fxVsQsfsavAGbGSb/K6Xmtmp
 /kHjP1QwjVu11vtxt33MrYC6gjLxQ5hGNiOJ+tPrYmzmex6EKKSUGG9ii w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6329373"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="6329373"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 13:42:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="827783620"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="827783620"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 22 Mar 2024 13:41:58 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Mar 2024 22:41:57 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 11/13] tools/intel_vbt_decode: Dump MIPI sequences in
 the order they appear in VBT
Date: Fri, 22 Mar 2024 22:41:23 +0200
Message-ID: <20240322204125.17212-12-ville.syrjala@linux.intel.com>
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

Dump the MIPI sequence blocks in the order they appear
in the VBT (as opposed to being ordered by the sequence type).

This makes it easier to compare the hexdump vs. the decoded
output, which is what I tend to do occasionally when trying to
check whether we are decoding things correctly or not.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index b57d1e9602ae..aa15dbb5e3fd 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -2446,12 +2446,9 @@ static void dump_mipi_sequence(struct context *context,
 				fprintf(stderr, "Invalid sequence %u\n", seq_id);
 				return;
 			}
-		}
 
-		/* Dump the sequences. Corresponds to sequence execution in kernel. */
-		for (int j = 0; j < ARRAY_SIZE(sequence_ptrs); j++)
-			if (sequence_ptrs[j])
-				dump_sequence(sequence_ptrs[j], sequence->version);
+			dump_sequence(sequence_ptrs[seq_id], sequence->version);
+		}
 	}
 }
 
-- 
2.43.2

