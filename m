Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6C2C54E71
	for <igt-dev@archiver.kernel.org>; Fri, 22 Mar 2024 20:41:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F3A112764;
	Fri, 22 Mar 2024 20:41:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TDIv8L6x";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1710A112765
 for <igt-dev@lists.freedesktop.org>; Fri, 22 Mar 2024 20:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711140101; x=1742676101;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=y2hxU8RhU4CksaRFbG8I2KqTil55oT+C8zXsZRol8so=;
 b=TDIv8L6x4Vgp2/FxJzYmbI7J8VecHcsgbPiGjACXhnxQayIEMMPSt4HF
 /YNjhaXW9QTJVfzpK3OEVEyMECl1lojb87w95HRPMQ7khTYVjdo4LqqPI
 Bbswq7OjXW2OGLQBMtMYaPUJM9SGGYc4GSSC26Al5CM648Pa/jg3bDm7V
 I7qsKZqlkDJQT7ZZT5TI3y5XqeEbx23gOjZg/M8Q0I56rez48aM6lv8xZ
 V91Iabr6C/I2zgLIJ82vubHObd9EQjZoLCK0+TvR5kgWT9zTpufkfWrM3
 +9vbf7io5JcW+B8ZwuaKBdIZwQrjDIrWikSFxUy+SDVeOWkkj52RoCAhm Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="6329359"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; 
   d="scan'208";a="6329359"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 13:41:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11021"; a="827783613"
X-IronPort-AV: E=Sophos;i="6.07,147,1708416000"; d="scan'208";a="827783613"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 22 Mar 2024 13:41:38 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 22 Mar 2024 22:41:37 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 04/13] tools/intel_vbt_decode: Print the block min size
Date: Fri, 22 Mar 2024 22:41:16 +0200
Message-ID: <20240322204125.17212-5-ville.syrjala@linux.intel.com>
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

Print out our idea of the minimum size for each block. Can be
helpful in determining if we're potentially decoding stuff
that's not really present.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 1d1ba46db6e7..ead3dd6450e9 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -2672,8 +2672,8 @@ static bool dump_section(struct context *context, int section_id)
 		}
 	}
 
-	printf("BDB block %d (%d bytes) - %s%s:\n",
-	       block->id, block->size,
+	printf("BDB block %d (%d bytes, min %zu bytes) - %s%s:\n",
+	       block->id, block->size, block_min_size(context, block->id),
 	       dumper ? dumper->name : "Unknown",
 	       dumper && !dumper->dump ? ", no decoding available" : "");
 
-- 
2.43.2

