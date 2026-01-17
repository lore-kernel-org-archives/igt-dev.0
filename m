Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9FAC9832A
	for <igt-dev@archiver.kernel.org>; Sat, 17 Jan 2026 18:43:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57FF310E104;
	Sat, 17 Jan 2026 18:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ixUG23KX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 121CA10E1CC
 for <igt-dev@lists.freedesktop.org>; Sat, 17 Jan 2026 18:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768675382; x=1800211382;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EnDyblevA2ROmvzl5G9MqFd5/iIErn4Fd2VHX8CSMYs=;
 b=ixUG23KX6zn7mTkE+U+9e94Q3o/UPrbbNONDx9TiQEj9u3JEduRj5rwP
 gud3iiZKpprPA45Z/YRErw+K4gTGtC8SPHuvwXGi5zRNeYqZSL4Z56Mxl
 kj4WpUYLC2qKFNCfGX8FHz9RpPYfSOp7Dcj2dWN2Tz0eB80IvxFr6Xw2Y
 V9KQ7uhfeCHYCu1qKEsIBsEZVdCX6VaEgDrM7evM+plccaqLLKGraTiuA
 uTeVADin9dfNb0qqGZCBIQnF6mASNFvhLU2LqS/MsIGw19lJ7yis95K5n
 8MEylg12BDzYGDBCzFIE2fS0/19BeoiWzsYO82wsMcRlyJ7r8hf0FJ5hE A==;
X-CSE-ConnectionGUID: RCPjUZWYQXi/aTA4g3MvlQ==
X-CSE-MsgGUID: yTEJnLMcShijvnzQlifXZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11674"; a="73584972"
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; d="scan'208";a="73584972"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2026 10:43:02 -0800
X-CSE-ConnectionGUID: 0Gu4IcMIS3in1eYzA1sn/w==
X-CSE-MsgGUID: 8bL6jhkVQpeYV4TAHg83EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,234,1763452800"; d="scan'208";a="210374220"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 10:43:00 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juha-pekka.heikkila@intel.com, swati2.sharma@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 2/3] tests/kms_plane: Speed up simulation by limiting
 YUV range tests
Date: Sun, 18 Jan 2026 00:13:47 +0530
Message-ID: <20260117184348.38163-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260117184348.38163-1-ramanaidu.naladala@intel.com>
References: <20260117184348.38163-1-ramanaidu.naladala@intel.com>
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
index fbcc7ead0..a2b1a091f 100644
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

