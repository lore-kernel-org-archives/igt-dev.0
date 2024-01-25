Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDC5C48285
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 10:57:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1671610F2EB;
	Thu, 25 Jan 2024 10:57:19 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7740610F2EB
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 10:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706180236; x=1737716236;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VVUbvOggFFneD6hyMpVuYpzAhqk/TVr12iWqNtGe+M4=;
 b=AfIpmDIdb13iHrZ+Ypow66H35tiCBKZQuu/drEYa32bgPr/UOhrU/EeG
 /qdi1+ppif7dqYGm3DPREOb+mErQW6+ULRaIMQKWs7rid3z2ED8NdKJZ+
 VoTVPpGWFNrjEsOOfQ+SaOrnJHxzqlR2/i1U+n5343QF3W+JiW5GwqS5f
 B7uzXLYVTem+eDyZ82PgLOH7ua7KSrfNoBXFml/LVfKeirN/MMW6leZTl
 X7BPJFkaUDm048fnCydVPKbKwYA1JR86vLYrmyYj2xZQjcTHSwgyDhXgw
 CfUupTdKOo8sjE4bodEkNFh+Xec9Ql7NpafIxR9IwS/br0mtvjkbOPviN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="433283725"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="433283725"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 02:57:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2365586"
Received: from cdeburca-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.15.173])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 02:57:15 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 7/7] lib/intel_blt: use BYTE_COPY mode on xe2
Date: Thu, 25 Jan 2024 10:56:45 +0000
Message-ID: <20240125105646.313561-7-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240125105646.313561-1-matthew.auld@intel.com>
References: <20240125105646.313561-1-matthew.auld@intel.com>
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

Currently we see various CAT errors and timeouts on xe2 when running
xe_copy_basic. If selecting PAGE_COPY mode for MEM_COPY, the page size
is defined as 256B block on xe2. Also the width should be defined in
number of pages, and not bytes, which likely explains the CAT errors.
However the caller in xe_copy_basic is not using a size that is aligned
to 256B, so rather just select the more general BYTE_COPY mode instead,
which should work for any reasonable number of bytes. Also bit 19
doesn't look to be supported on PVC, where byte copy is all we seem to
have. In addition the matrix copy also expects byte copy.

BSpec: 57561
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_blt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index e41e261ea..25d251c4f 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1613,7 +1613,7 @@ static void emit_blt_mem_copy(int fd, uint64_t ahnd, const struct blt_mem_data *
 	optype = mem->src.type == M_MATRIX ? 1 << 17 : 0;
 
 	i = 0;
-	batch[i++] = MEM_COPY_CMD | (1 << 19) | optype;
+	batch[i++] = MEM_COPY_CMD | optype;
 	batch[i++] = mem->src.width - 1;
 	batch[i++] = mem->src.height - 1;
 	batch[i++] = mem->src.pitch - 1;
-- 
2.43.0

