Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7D6D44C41
	for <igt-dev@archiver.kernel.org>; Thu, 15 Jan 2026 12:57:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A388310E74B;
	Thu, 15 Jan 2026 12:57:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="enQ17NgL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 344B810E74F
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Jan 2026 12:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768481877; x=1800017877;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7S+ALg6wBdm8+rRoahTptx9x+pUlvAwq7AtUaY0nF2c=;
 b=enQ17NgLJuOzqgt8jY9wuGh0bfNpPrL2g9baXLspa7Tkg69dJjwNlC3e
 4OdLQnL++GrMD4ACJ9U41g8ShyhoyXWkLtxT+fwtF1AcHYag6bcppky6J
 TN+02RL1dd4VMtjrve9c87EcvMH/rt1sAMBE3nqiQpG8JtPwY04zBp3wq
 o3iATnBJnmUGcqmuF+4MpJV2nG/ARfTI0ViCk4jMmtA4hPt7+jtLpMAR9
 +AfWShHkdkc6r1Io9/HzUcaPQctabElzk8GzQShg2ZOCv98UMo6gO02x5
 rrELt+w32ikQRoD97O/nqluGvxrZY5bED96KZcPjpsR2Re1y8gDFhZV63 A==;
X-CSE-ConnectionGUID: dy8UaUrdQ6G+TykLP9bpaQ==
X-CSE-MsgGUID: I3SVqsfhRoSlCWjQ2s5GrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="73628857"
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="73628857"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 04:57:57 -0800
X-CSE-ConnectionGUID: r1tR2+ShQ1uGyz4t7hC83g==
X-CSE-MsgGUID: 9EUg/I4KTZ6WMYQMTKK/gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,228,1763452800"; d="scan'208";a="204093207"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.21])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 04:57:56 -0800
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v2 4/4] HAX: runner/resultgen: set reduction for dmesg
 bigger than 256KB
Date: Thu, 15 Jan 2026 13:57:32 +0100
Message-ID: <20260115125732.20542-5-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115125732.20542-1-kamil.konieczny@linux.intel.com>
References: <20260115125732.20542-1-kamil.konieczny@linux.intel.com>
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

Set it here so it will be tested in CI pipeline.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/resultgen.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index a2e4e7c7d..5a52309e7 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -2456,6 +2456,9 @@ struct json_object *generate_results_json(int dirfd)
 		return NULL;
 	}
 
+	/* HAX: set reduction for dmesg bigger than 256KB */
+	settings.reduce_dmesg = 256 * 1024;
+
 	if (settings.reduce_dmesg)
 		fprintf(stderr, "resultgen: dmesg reduction set to %ldKB\n", settings.reduce_dmesg / 1024);
 
-- 
2.52.0

