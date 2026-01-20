Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD1AD2ECF9
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 04:54:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C27810E38D;
	Tue, 20 Jan 2026 04:54:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZAWCm2dA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF30710E38D
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 04:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768884898; x=1800420898;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7EKmWdbDzk890jwd7VXVfcQUNFGue2BEoO5xiSg/mQs=;
 b=ZAWCm2dAskQrqF5jSPs2ejBrokfuh6R4kC2ImMQDPYpKpB4cHt61MJ0o
 WQLjdzbhXgQl3mBmN7O+GDlpqJECw/RzXQZafknG2CwD5AL8S2qJ9BLff
 Qi2nsXh95U1ci0PbuIATXbiOGcOQtg7OQ4CxTG5nje/9sR4u/Z7/bqi14
 JTWFCxyf4V04OkHEQ9xapjchb225GMRAdxsAA/0JEZNZ/9mSNMZxZHZLp
 BLKK5NCplG2VUUgq5mWZcPkNJnnDnFtn547vZLXVptxaNX7WDeJd/XAGv
 dKCOhVlz4+mCwgHkNADxS2jlMOTrO3YP2r+5HJeRpwbo2/hvkQK/cVOwl g==;
X-CSE-ConnectionGUID: 7ZAqMWHqRkWfwiraB3KiQA==
X-CSE-MsgGUID: DlMNm6SSSk6tYV5GDOr1rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70057629"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="70057629"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2026 20:54:58 -0800
X-CSE-ConnectionGUID: 5OGJNqVjQx64OWEKyVFeuA==
X-CSE-MsgGUID: illazNWEREyQEj3Svc2Abw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; d="scan'208";a="205817013"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa009-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 20:54:56 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jeevan.b@intel.com, juha-pekka.heikkila@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v2 2/3] tests/kms_plane: Speed up simulation by limiting
 YUV range tests
Date: Tue, 20 Jan 2026 10:25:44 +0530
Message-ID: <20260120045545.102676-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260120045545.102676-1-ramanaidu.naladala@intel.com>
References: <20260120045545.102676-1-ramanaidu.naladala@intel.com>
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

Optimizes the YUV format test flow by skipping all non–full‑range
cases when running in simulation. Previously, the test iterated
over every supported color range, which significantly increased
execution time in simulated environments. By restricting execution
to the full‑range variant during simulation, the overall runtime
is reduced.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index 653a911ad..b71b3586f 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -968,6 +968,10 @@ static bool test_format_plane_yuv(data_t *data, enum pipe pipe,
 						     igt_color_range_to_str(r)))
 				continue;
 
+			if (r != IGT_COLOR_YCBCR_FULL_RANGE &&
+			    igt_run_in_simulation())
+				continue;
+
 			igt_info("Testing format " IGT_FORMAT_FMT " / modifier " IGT_MODIFIER_FMT
 				 " (%s, %s) on %s.%u\n", IGT_FORMAT_ARGS(format),
 				 IGT_MODIFIER_ARGS(modifier),
-- 
2.43.0

