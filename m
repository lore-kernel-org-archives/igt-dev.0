Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103C1CAC581
	for <igt-dev@archiver.kernel.org>; Mon,  8 Sep 2025 14:43:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B83A710E544;
	Mon,  8 Sep 2025 14:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m2SLV+j5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A186210E544
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Sep 2025 14:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757342624; x=1788878624;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GkDwWtV62uPiQ0WmRPzIgnltYJkwEJKXYD7FAVMGM6k=;
 b=m2SLV+j5rtyb6CE54jU9gx/57mYvigWReP9nNPWCv/Fy92VWaLlajexf
 aTmkBKunXc0jUJ3Qp8jFe89S635LtGpzWeSruLULvKvd1eYzynmpuAyJ5
 SKpT7fjBiMK3+wlUSXw/06mjskhKY3WfCgZJuBw8Q9K4YeDi82JOjdFDh
 zKmdG9Yprtd/pGBEEF/JLEYZZizSZL2G3lQklGcddxh7whYVXqhG/ADEU
 6Nvo9gSatx8lu2tnSq+5RiTXM3rJ6AU4fQvjDoH2RSSQf9kn0lty+KJI0
 an6b7He7iL8ID642IHrZQJoEb173Pi3VsZHszUNN15VZ9Bxljj1aTFy6D Q==;
X-CSE-ConnectionGUID: yJX+TGMVQEOdFNrRCQR/ig==
X-CSE-MsgGUID: 58uCXFndSVGYk0IVxdadXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="59538920"
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="59538920"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 07:43:44 -0700
X-CSE-ConnectionGUID: fK9tAmYSRu2eJ/4x6NYleg==
X-CSE-MsgGUID: wpTXk1NMTLKRYOm8j0+flw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; d="scan'208";a="172933954"
Received: from live-gta-imageloader.iind.intel.com (HELO
 DUT2144PTLH.iind.intel.com) ([10.190.232.53])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2025 07:43:41 -0700
From: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: dwarakanath.ramadeva@intel.com, pravalika.gurram@intel.com,
 Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Subject: [PATCH v3 i-g-t 2/7] benchmarks/latency: Add xe_create latency test
Date: Mon,  8 Sep 2025 14:43:13 +0000
Message-ID: <20250908144314.42275-11-gajendra.uttamchand@intel.com>
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

Add device initialization overhead measurement test for the XE
driver. Measures latency of device and context creation operations
to identify initialization bottlenecks.

Defaults: buffer sizes from 4KB to 8MB, 13 repetitions, 1000
iterations per repetition, 2 seconds per sample, single CPU.
Parallelism and busy mode are configurable via command-line
options.

This is critical for applications with dynamic device management
and helps establish baseline performance expectations for XE driver
initialization paths.

V2: Added original author attribution and handle relocation
preserving git history

Signed-off-by: Gajendra Uttamchand <gajendra.uttamchand@intel.com>
Author:    Gurram Pravalika <pravalika.gurram@intel.com>
---
 benchmarks/{ => latency}/xe_create.c | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename benchmarks/{ => latency}/xe_create.c (100%)

diff --git a/benchmarks/xe_create.c b/benchmarks/latency/xe_create.c
similarity index 100%
rename from benchmarks/xe_create.c
rename to benchmarks/latency/xe_create.c
-- 
2.43.0

