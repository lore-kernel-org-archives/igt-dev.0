Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289E7C25B10
	for <igt-dev@archiver.kernel.org>; Fri, 10 May 2024 17:04:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9868010E6D5;
	Fri, 10 May 2024 17:04:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="erRg2u+1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38D110EEE9
 for <igt-dev@lists.freedesktop.org>; Fri, 10 May 2024 17:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715360696; x=1746896696;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=lGHxGp+v/UGSAMMx0NaGqMCNEFYqw3SHv02SPx0ssBA=;
 b=erRg2u+1QWBGx8i8pPe3xzWxoCc6Mg3oln8AQ5qFHHJd7uaa0ZC8K5rh
 pKjZbRGbKSQY/nWuglyDv8aCM3kWKMfj71fp2mTEJZ5Bsgp60wrkdoKoJ
 d8fV2dCfBv86uXDTRIufBIUT9MTl1gTohk1mO28l0tjXqodeY5zxPDDY3
 Fh+xUoJlJ2RFhmFXAhkGRd2mHUJ6CjR+WoknoVGBqMqouhqUc0GsyqT8T
 ifb9fJU22x4DamxqYoOcNMkZCvFxORxYOemGCA29b4aCGP5c3yrvFzOXO
 Qr9KvDJP/TLa/IAKm0HV5iW9yjwqszrVrp04sy8c6Xol0PvoDFFmzt3gW w==;
X-CSE-ConnectionGUID: 9zNlH7PKQZqCJO9Dpc9eVg==
X-CSE-MsgGUID: l170z1BRQ+KpRz5Rz5QkpA==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="11567653"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="11567653"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 10:04:56 -0700
X-CSE-ConnectionGUID: 6MMwZSRgSz+Q/4HvRYDLsg==
X-CSE-MsgGUID: Cr1qTcI0RMqNDOT2Fq9eIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="34206434"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 10:04:56 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Subject: [PATCH i-g-t] lib/i915/perf: Accumulate clocks for MPEC format too
Date: Fri, 10 May 2024 10:04:50 -0700
Message-ID: <20240510170450.2404385-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.41.0
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

Clocks/gpu_ticks should also be accumulated in intel_perf_accumulate_reports.

Fixes: cbe11c2939f8 ("lib/i915/perf: Add support for select MPEC formats")
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 lib/i915/perf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/i915/perf.c b/lib/i915/perf.c
index bbfa360607..9333edfebb 100644
--- a/lib/i915/perf.c
+++ b/lib/i915/perf.c
@@ -928,7 +928,7 @@ void intel_perf_accumulate_reports(struct intel_perf_accumulator *acc,
 			deltas[idx++] += (end64[1] - start64[1]) >> (-perf->devinfo.oa_timestamp_shift);
 
 		/* 64 bit clock */
-		deltas[idx++] = end64[3] - start64[3];
+		deltas[idx++] += end64[3] - start64[3];
 
 		/* 8x 32bit MPEC counters */
 		for (i = 0; i < 8; i++)
-- 
2.41.0

