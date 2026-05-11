Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6FBCD37BE
	for <igt-dev@archiver.kernel.org>; Mon, 11 May 2026 23:36:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4CF10E1FE;
	Mon, 11 May 2026 23:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fSOnmVDm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB6510E22A
 for <igt-dev@lists.freedesktop.org>; Mon, 11 May 2026 23:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778542596; x=1810078596;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3fCEeWTvtjPn14cw+nahhsevJ2KOU7D1FYv1mn4qKdQ=;
 b=fSOnmVDmG5+2PCAhI8H7swsmXXw+qJLf04eGmm1DRalqITDWE1qWq3Ma
 3vkDr2w5TQ4xt6HHQUEo+UsOuwfdQmT9x7tYspQ1nREufaitikrCZLQ+4
 jKCVT1nd9Cl63kXSoNQHwM9ZNZZ4qqyoOoWj6g+uksVMeGC05GV94S+yw
 WscjTGVZ/xAelbawYo9tfevtYsLjKofCd+l2uuqqCPBopuYFo+EZe7qPk
 CqMoeUsaj4EQVomYzKO6z57aigX+uR9Gj1AzNxRy44dmc50hU7UBQlij9
 1O/BmBTNPDjEM5Nlv0SpdmTpWOIFhfKpxFBnAO+v8QzBP6LeAKpNEkDoS g==;
X-CSE-ConnectionGUID: X30HNIYbQQaIAllIsWEDTg==
X-CSE-MsgGUID: LJcc67v4TcmtR5/PTgANUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90027398"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="90027398"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2026 16:36:35 -0700
X-CSE-ConnectionGUID: QI+V4ea7TF2twhhcwjNzTA==
X-CSE-MsgGUID: VOIfmxtRTmyloufG8BAhAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; d="scan'208";a="237687258"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by orviesa009.jf.intel.com with ESMTP; 11 May 2026 16:36:35 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jia.yao@intel.com, x.wang@intel.com, Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH 1/3] tests/intel/xe_pat: fix typo in r2 wc debug print
Date: Mon, 11 May 2026 23:36:20 +0000
Message-ID: <20260511233622.2074382-2-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511233622.2074382-1-zongyao.bai@intel.com>
References: <20260511233622.2074382-1-zongyao.bai@intel.com>
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

Fix typo in debug output: [r2] log used r1_entry.force_cpu_wc instead of
r2_entry.force_cpu_wc.

Signed-off-by: Zongyao Bai <zongyao.bai@intel.com>
---
 tests/intel/xe_pat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index 81c28677a..e53e08877 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -1515,7 +1515,7 @@ static void subtest_pat_index_modes_with_regions(int fd,
 							  r1_entry.force_cpu_wc, p.r1_compressed);
 						igt_debug("[r2]: r: %u, idx: %u (%s), coh: %u, wc: %d, comp: %d, w: %u, h: %u, a: %u\n",
 							  p.r2, p.r2_pat_index, r2_entry.name, r2_entry.coh_mode,
-							  r1_entry.force_cpu_wc, p.r2_compressed,
+							  r2_entry.force_cpu_wc, p.r2_compressed,
 							  p.size->width, p.size->height,
 							  p.size->alignment);
 
-- 
2.43.0

