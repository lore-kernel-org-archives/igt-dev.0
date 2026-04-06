Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E2FEFB5173
	for <igt-dev@archiver.kernel.org>; Mon,  6 Apr 2026 23:16:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA96710E056;
	Mon,  6 Apr 2026 23:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ap44wMlg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBEB10E2EC
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Apr 2026 23:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1775517344; x=1807053344;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3fCEeWTvtjPn14cw+nahhsevJ2KOU7D1FYv1mn4qKdQ=;
 b=ap44wMlgwSbWzt+3czE4uVgoUS9nDJHdo2lqSu5ALZlKfAhrcaUDlvJR
 90bQOF673uvJAtuvhBNEwlqOcfxHzoAcX4+25+mYibfhGWy+3OVFydJMD
 Iuvin/XRlzXxwDBECuh19D2wKlfmUXwwwHYVb2HultX1/aswDPl9tOMd7
 o+kwREcT0oBJQexLr4tZpZC+3v8fgC/P61m8m4EfK+ake+KQmdEdVLG6w
 O3Ea3LPWc7k6mnlWjFU4IatVkdOT6hoZvUlfV7j6loyeBxbYekKW7LHM9
 tCpFeNWh1YqyQUIkR5T1FLUHziqLaH7eTFMcFfUGq3ZGu+q6xuCBzXcUZ g==;
X-CSE-ConnectionGUID: +c5Qt7jvSGe3jf/yea+npg==
X-CSE-MsgGUID: BbWHqDv+QQeZXHjAxe9SbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76660626"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="76660626"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2026 16:15:43 -0700
X-CSE-ConnectionGUID: BCdHHZuZRN2L7Sz5jxe5lA==
X-CSE-MsgGUID: kaIPrORSSmySYN1MlSqv5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; d="scan'208";a="227164736"
Received: from dut4072bmgfrd.fm.intel.com ([10.105.8.119])
 by orviesa010.jf.intel.com with ESMTP; 06 Apr 2026 16:15:43 -0700
From: Zongyao Bai <zongyao.bai@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: x.wang@intel.com,
	Zongyao Bai <zongyao.bai@intel.com>
Subject: [PATCH v3 1/5] tests/intel/xe_pat: fix typo in r2 wc debug print
Date: Mon,  6 Apr 2026 23:15:36 +0000
Message-ID: <20260406231540.3238758-2-zongyao.bai@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406231540.3238758-1-zongyao.bai@intel.com>
References: <20251119231900.3797119-1-zongyao.bai@intel.com>
 <20260406231540.3238758-1-zongyao.bai@intel.com>
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

