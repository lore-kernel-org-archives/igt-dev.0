Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD0DC27C79
	for <igt-dev@archiver.kernel.org>; Thu, 13 Jun 2024 09:26:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5AA10E9BD;
	Thu, 13 Jun 2024 09:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VEb2MeAr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D7710E9B9
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jun 2024 09:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718270761; x=1749806761;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CJBr+WaZyOHdX6wACo8bzVFQO+R7FE+/EOnCagow4iQ=;
 b=VEb2MeArTQi5qzWTMBsuMSmdJ57vU6p9vsYqcfRgzE/GtEJH2OTTut3l
 BTbwM2CAKwRTe0FsoA7UKmK5cu4y8+AZL7yM8cpQx8eeNi5dADNIeA9ek
 EGXM5UYLPdinMSMyuCetTmsLv2jKgdSXzkiMTUA4c7THOGF1a49pSrtZf
 RUqXy2qhjlnLb1QAgn5P/JjsZf+vpIVxOjd/EgJcF/uaDuOh0RaQi9no9
 N+VqzpvVZlfECj0kyDPG1Dy7lt/Ua1f51lXeBvq1dsIq0fIAmeKeRF/yR
 qd2Fclmf2LJrFZFGpQHtjQuwA6HWk4KZVoQzY4ujfRitEmoNqbdEbWYL6 g==;
X-CSE-ConnectionGUID: yao3SnXOTzalW/hrjNtrMQ==
X-CSE-MsgGUID: krnC2+Z/SXCqLi1pMPl3Rg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="18004700"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="18004700"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 02:25:59 -0700
X-CSE-ConnectionGUID: quZwkftvRhqd01nkdq8rAg==
X-CSE-MsgGUID: KRdDhM/+QR67/q1IgPeing==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; d="scan'208";a="40045507"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.244.31])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2024 02:25:36 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t v2 6/6] lib/igt_psr: Fix PR_MODE sink support check
Date: Thu, 13 Jun 2024 12:25:14 +0300
Message-Id: <20240613092514.1288801-7-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240613092514.1288801-1-jouni.hogander@intel.com>
References: <20240613092514.1288801-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Panel Replay supporting PR_MODE_SEL_FETCH always support PR_MODE as
well. Change sink support check accordingly.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 lib/igt_psr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 012521fc5..42012243d 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -270,7 +270,7 @@ bool psr_sink_support(int device, int debugfs_fd, enum psr_mode mode, igt_output
 		       (strstr(line, "PSR = yes") &&
 		       (strstr(line, "[0x03]") || strstr(line, "[0x04]")));
 	case PR_MODE:
-		return strstr(line, "Panel Replay = yes, Panel Replay Selective Update = no");
+		return strstr(line, "Panel Replay = yes");
 	case PR_MODE_SEL_FETCH:
 		return strstr(line, "Panel Replay = yes, Panel Replay Selective Update = yes");
 	default:
-- 
2.34.1

