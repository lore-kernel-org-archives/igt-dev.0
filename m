Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA876D24468
	for <igt-dev@archiver.kernel.org>; Fri, 11 Oct 2024 03:05:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1829C10EA1C;
	Fri, 11 Oct 2024 03:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hwD9VK7+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8709D10EA1C
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Oct 2024 03:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728615931; x=1760151931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mK3JQ5os59p99ws14op2742GbLI5TbKmrIw05Xckw5U=;
 b=hwD9VK7+9G2JNAvcek/yZl91N5U+PeLx/f6ZbxoMDghPZZWJAzaQMwSr
 1YBTz/Ccd2rta0vYvXzidZ+EZUkbSH4N4B/jA81jXvfPuGzzSFt+kCB4c
 Yj3DSSmiN+LX90/7ubwUXg0svH+8WxiYDz7ZODr10nzCtfZBrw3RTWdfq
 nenwgNFzAMPBPMgR/E6aLeEQbUNAqf3rQyDs+7e0UCZIg9Up16cR6jaNV
 X+AbZ0SWd/ZgZEa5/4NlPn1jwuj798BEn10Tf85dEm6yoVS6bAbvPCtRF
 GbWV6A4tkb+kwCm0pC/6jZ8q0RwlDadZI3xePwpyqvgf8gbytjAsFMrgq Q==;
X-CSE-ConnectionGUID: pFUsiBGPTrqpceu7o3bZ4w==
X-CSE-MsgGUID: eext0mGeRzOeHK6hsujdbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="30880143"
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; d="scan'208";a="30880143"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 20:05:30 -0700
X-CSE-ConnectionGUID: v69N/niRRYC7oKa0OM6oKg==
X-CSE-MsgGUID: o5uYbKwuTA2/VYk6MbLeWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,194,1725346800"; d="scan'208";a="107654644"
Received: from mgoodin-mobl2.amr.corp.intel.com (HELO ldmartin-desk2.lan)
 ([10.125.111.122])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2024 20:05:30 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH i-g-t 2/3] tests/intel/xe_query: Add debug messsage with
 calculated refclock
Date: Thu, 10 Oct 2024 22:05:06 -0500
Message-ID: <20241011030507.321961-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241011030507.321961-1-lucas.demarchi@intel.com>
References: <20241011030507.321961-1-lucas.demarchi@intel.com>
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

When debugging new hardware, it's useful to check the refclock matches
the expectation. Calculated the expected reflock and print it for quick
check. Eventually this could be a test on its own if the err is stable.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 tests/intel/xe_query.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_query.c b/tests/intel/xe_query.c
index 9e0fa93dd..87ddb58bb 100644
--- a/tests/intel/xe_query.c
+++ b/tests/intel/xe_query.c
@@ -708,7 +708,7 @@ __engine_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
 {
 	struct drm_xe_query_engine_cycles ts1 = {};
 	struct drm_xe_query_engine_cycles ts2 = {};
-	uint64_t delta_cpu, delta_cs, delta_delta;
+	uint64_t delta_cpu, delta_cs, delta_delta, calc_freq;
 	unsigned int exec_queue;
 	int i, usable = 0;
 	igt_spin_t *spin;
@@ -770,7 +770,10 @@ __engine_cycles(int fd, struct drm_xe_engine_class_instance *hwe)
 			delta_cs = (((1 << ts2.width) - ts2.engine_cycles) + ts1.engine_cycles) *
 				   NSEC_PER_SEC / eng_ref_clock;
 
-		igt_debug("freq %u Hz\n", eng_ref_clock);
+		calc_freq = (ts2.engine_cycles - ts1.engine_cycles) * NSEC_PER_SEC / delta_cpu;
+
+		igt_debug("freq %u Hz, calc_freq %"PRIu64" Hz, err %.3f%%\n", eng_ref_clock,
+			  calc_freq, fabs((double)calc_freq - eng_ref_clock) * 100 / eng_ref_clock);
 		igt_debug("delta_cpu[%"PRIu64"], delta_cs[%"PRIu64"]\n",
 			  delta_cpu, delta_cs);
 
-- 
2.46.2

