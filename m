Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7485DC43602
	for <igt-dev@archiver.kernel.org>; Thu,  2 Jul 2026 18:28:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C9310F565;
	Thu,  2 Jul 2026 18:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YpxEoIbU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4ED010F55E
 for <igt-dev@lists.freedesktop.org>; Thu,  2 Jul 2026 18:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783016800; x=1814552800;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hlNUnCCUwSFjxYvVv5EgobmHJpkP6njdezJEEbl2Lo8=;
 b=YpxEoIbUTBaod94JBtewVppdtQwZu/9gnrnGf7ZyxRigv3IV+CvcD/Bq
 9VNc1zTbkCGvqVr+hJt63vmr1gDldGRrUbzwxZWGttItj+QIqK1FgLJvw
 nrXaxmWPn/5bLCo+9W/7Fy44JaJX+jJDMUb8D8eTOJCLLrOKz7OsyWPn7
 TvJLsw+lHQ0PntGEzHHEk0WJ/Cw0U6LY+g1YxobAIGfGyvBSWgujnC87a
 ZXtO5nz7EvIeE6vwrszZ9tnDhhCy7oQsVNw8uSDiLVhTnGVSLU20ffXq8
 spRckcfWPAgQWVtJ4MjY9YP14RKQFm1DPfHZPFX/Wf6ehr0EnR8/Pw3IQ g==;
X-CSE-ConnectionGUID: IBNO5XWsSKudqjA02STNyA==
X-CSE-MsgGUID: SxTgio/7T4m2LDe9LN4/bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="95154700"
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="95154700"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2026 11:26:40 -0700
X-CSE-ConnectionGUID: 1tjf27udShy5jD5pIcWSHw==
X-CSE-MsgGUID: JOJN+qkQSoa/bib7cS9QOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,144,1779174000"; d="scan'208";a="253577095"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa009.jf.intel.com with ESMTP; 02 Jul 2026 11:26:39 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com, suraj.kandpal@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v5 1/7] tools/vbt_decode: fix tables' offset reading
Date: Thu,  2 Jul 2026 20:26:13 +0200
Message-ID: <20260702182619.3973788-2-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260702182619.3973788-1-michal.grzelak@intel.com>
References: <20260702182619.3973788-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

During dumping of VBT #57, all rows are same because parser does not
change offset read. Adjust the offset to change basing on the row used.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tools/intel_vbt_decode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 9451a77318..16f1c96fee 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -3480,7 +3480,7 @@ static void dump_vswing_preemphasis(struct context *context,
 			printf("\t\t%s: ", vswing_preemph[i]);
 
 			for (int j = 0; j < vs->num_columns; j++)
-				printf(" 0x%08x", vs->tables[n * 10 * vs->num_columns + j]);
+				printf(" 0x%08x", vs->tables[n * 10 * vs->num_columns + i * j]);
 			printf("\n");
 		}
 	}
-- 
2.45.2

