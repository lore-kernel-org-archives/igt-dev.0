Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B37C021A4
	for <igt-dev@archiver.kernel.org>; Mon, 17 Feb 2025 08:18:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF87F10E399;
	Mon, 17 Feb 2025 08:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c/sazkhk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C03010E398
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Feb 2025 08:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739780338; x=1771316338;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=merVYHZx9fZsu1qbn1s986IlVPT7E5V1mchEMtU7ssE=;
 b=c/sazkhkqJ+r5pNxRrwBvm8SsjjwZe3zavug8vzOwDu3KWSFMj8M4pUk
 RkS3/mshjWjENbjogUxzTTkxHmrbMdxRm4PMBr2AWvZZ/rQADA7s6ovJn
 G+qfLSVQJjDfN6DjHARFe11otv5oArZSo/j6Skrv32N5DTu9t7fQN5mPb
 FBoHBCCVELZMa53Ik3grro9C3VvlTeCUNoPKtzPEZWhKq2m3Gkleg0306
 kpLyIq47LCRGUuOeSrACLHoO33vhPYMFyl7vOIrogBm/2Un/okSGFTZFR
 J1XcjtXmZn+QHYvc+umMWOPBgf3on9apd1jhCL1Awo+zrDma1loUwk1Ae g==;
X-CSE-ConnectionGUID: Ud3ORKN1TdaqDPX0VFDtPw==
X-CSE-MsgGUID: 7R4dxA4kSBqDCcslDl+b6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="40157770"
X-IronPort-AV: E=Sophos;i="6.13,292,1732608000"; d="scan'208";a="40157770"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 00:18:58 -0800
X-CSE-ConnectionGUID: RousUuU8SuONc1Gu9J+aSA==
X-CSE-MsgGUID: 4hpzc5JaQOStKo/2nBrSQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="144978428"
Received: from dut1069atsm.igk.intel.com ([10.211.176.182])
 by fmviesa001.fm.intel.com with ESMTP; 17 Feb 2025 00:18:56 -0800
From: priyanka.dandamudi@intel.com
To: priyanka.dandamudi@intel.com, zbigniew.kempczynski@intel.com,
 igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 1/5] lib/intel_compute: Add ptl library support for wmtp
 test
Date: Mon, 17 Feb 2025 08:18:50 +0000
Message-Id: <20250217081854.3219791-2-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217081854.3219791-1-priyanka.dandamudi@intel.com>
References: <20250217081854.3219791-1-priyanka.dandamudi@intel.com>
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

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Enable WMTP test for PTL.

Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
---
 lib/intel_compute.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/intel_compute.c b/lib/intel_compute.c
index bca763328..f46de1074 100644
--- a/lib/intel_compute.c
+++ b/lib/intel_compute.c
@@ -2049,6 +2049,11 @@ static const struct {
 		.compute_exec = xe2lpg_compute_preempt_exec,
 		.compat = COMPAT_DRIVER_XE,
 	},
+	{
+		.ip_ver = IP_VER(30, 00),
+		.compute_exec = xe2lpg_compute_preempt_exec,
+		.compat = COMPAT_DRIVER_XE,
+	},
 };
 
 static bool __run_intel_compute_kernel_preempt(int fd,
-- 
2.34.1

