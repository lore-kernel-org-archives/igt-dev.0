Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7ECC43458
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 05:29:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585BF10E547;
	Mon, 13 Jul 2026 05:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Sy9T2beZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D7910E549
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 05:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783920506; x=1815456506;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=R8JpSNCAdHlX7R3vkpgCjFniKVSEyJcPGTJ+1OgEAgM=;
 b=Sy9T2beZ7O/MSxK6dYqtdTLf7WAYXL5YsOhqTBSvx2vLMoPOFR1cfCFc
 G3AElk22zedYJiaTm1lT/F48lduVToIN+4Yr3mJ+3aMaeJQtp6wgl3mpF
 9Su3I9DLmQupi182GUGUtJ0RWSsYs0xKNrTyuWzG1hwuZMxjS+BF7LMPk
 QKQsUADhPHRTvcZluhDj4AgBn6H5o+pY+0xHn468G42ycoyIMy6r+tdfU
 Yf/BtRO2w4LFrqF/QPJfkxrXG3dNVM791bSxuH5YGwLlGnpPpk/0LEe+t
 volUr2jW/Tuk384oVpMMmEQZsWAHu1CUR6jl2FJErp8cSSLZiAhzo73Yb w==;
X-CSE-ConnectionGUID: Mx7pEBFeSFCWcqFgCgrIBw==
X-CSE-MsgGUID: 79wrss7YQlK5b9bdVKGePw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95168681"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="95168681"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2026 22:28:26 -0700
X-CSE-ConnectionGUID: x+QUpQnERIadMdjhH0hDwQ==
X-CSE-MsgGUID: L8LmVKBCSp+EkfdwsMxWJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="279856329"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by fmviesa001.fm.intel.com with ESMTP; 12 Jul 2026 22:28:24 -0700
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, igt-dev@lists.freedesktop.org,
 kamil.konieczny@linux.intel.com
Subject: [PATCH i-g-t 2/2] tests/intel/xe_cw_post_sync: Run walker-post-sync
 on all compute engines
Date: Mon, 13 Jul 2026 10:58:23 +0530
Message-ID: <20260713052820.2231844-6-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713052820.2231844-4-priyanka.dandamudi@intel.com>
References: <20260713052820.2231844-4-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Remove the break after the first compute engine subtest so that
walker-post-sync runs dynamically across all available compute engine
instances, not just the first one found.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 tests/intel/xe_cw_post_sync.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/intel/xe_cw_post_sync.c b/tests/intel/xe_cw_post_sync.c
index 5e65673115..1aa2f13139 100644
--- a/tests/intel/xe_cw_post_sync.c
+++ b/tests/intel/xe_cw_post_sync.c
@@ -290,7 +290,6 @@ int igt_main()
 				igt_dynamic_f("%s%d", xe_engine_class_string(hwe->engine_class),
 					      hwe->engine_instance)
 					test_walker_notification(fd, hwe);
-				break;
 			}
 		}
 	}
-- 
2.43.0

