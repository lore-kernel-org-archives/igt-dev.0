Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2550CAC586
	for <igt-dev@archiver.kernel.org>; Mon,  8 Sep 2025 14:43:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 558E710E54C;
	Mon,  8 Sep 2025 14:43:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c1tq7PuX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C8210E54A
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Sep 2025 14:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757342622; x=1788878622;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=blaW1QWXL7tf1Er0+7gY46fU/wfaCTU/SMZHBRtbfyY=;
 b=c1tq7PuX7Hpomp+dLvCcCBeWR5ArxxbO4uDCwVeMOwr2Aukk+TGvbinz
 Dk9GzNJU44O+QnUg2OxLolNAbHvoninQWR4JXkLX0sGr5/ie7udGuDGAO
 n7IiqQ5vkrZv0sNYvyfkgNlr05r2NpWJMmlEJLHOuU98PXNaOFgUaQozy
 NlXPKL3n0ljZd49QRcToRi/Z6bk6dYqhUQHEQAEfRPKgYx7cjiKhEtQ1S
 5YkO1GqNLgBlOvfCs+7r0Wq6nv4PNx5w3E71QP0787LmzG1qdvfnZeAvx
 3Jb9kWye9/hWVreK9H3uE54l7wQdhzUiV3yCH0dwTkpLTbuG27cIsDBZ7 Q==;
X-CSE-ConnectionGUID: VuA+p4huRLq8kNVTmo0V2A==
X-CSE-MsgGUID: pUg3pe6nREuVHEopneExow==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59538915"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="59538915"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 07:43:42 -0700
X-CSE-ConnectionGUID: 5Zh2dJyRRwuPOwEgBzW/Tg==
X-CSE-MsgGUID: 0OUm1kzYTGKllIGzNrSgFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="172933933"
Received: from live-gta-imageloader.iind.intel.com (HELO
 DUT2144PTLH.iind.intel.com) ([10.190.232.53])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 07:43:40 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dwarakanath.ramadeva@intel.com, pravalika.gurram@intel.com,
 Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Subject: [PATCH v3 i-g-t 1/7] benchmarks/latency: Add xe_blt latency test
Date: Mon,  8 Sep 2025 14:43:12 +0000
Message-ID: <20250908144314.42275-10-gajendra.uttamchand@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250908144314.42275-9-gajendra.uttamchand@intel.com>
References: <20250908144314.42275-9-gajendra.uttamchand@intel.com>
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

From: Gurram Pravalika <pravalika.gurram@intel.com>

Add block transfer latency measurement test for the Intel XE
driver. Measures performance of BLT operations for user-
configurable buffer sizes, batch counts, and parallelism to
identify transfer bottlenecks and regression patterns.

Test supports statistical sampling (repetitions, timed
iterations) for reliable performance characterization of XE
block transfer operations. Buffer size, batch count,
repetitions, and CPU parallelism are configurable via command-
line options.

V2: Added original author attribution and handle relocation
preserving git history

Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Author:    Gurram Pravalika <pravalika.gurram@intel.com>
---
 benchmarks/{ => latency}/xe_blt.c | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename benchmarks/{ => latency}/xe_blt.c (100%)

diff --git a/benchmarks/xe_blt.c b/benchmarks/latency/xe_blt.c
similarity index 100%
rename from benchmarks/xe_blt.c
rename to benchmarks/latency/xe_blt.c
-- 
2.43.0

