Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046ABC61DD3
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 11:57:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6642C10E63B;
	Tue,  1 Sep 2026 11:57:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e6F53SfQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7310A10E63B
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2026 11:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788263818; x=1819799818;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Qg9y8Qfp/2OS4XokjBBdC4gRujowD3HcAv/yDVaOUqY=;
 b=e6F53SfQsjMcDausKvXe/Hrr1efD3qLHuTlzTeUkOIvcviMR8PSl1uwE
 Mn5IeTogs5Lt72SfhRUqVf6f/9B+jcFLZmqLHHHiWFccttF01+J5ZeLCa
 tMg98MlAp0zS/4Auii+irVgErU7dPVZOSvK12gBdhQRhaQMu2qaFHfoYX
 dcXgm+pFKdfC7q0N0emSu9I1Ly3gERb+O/+lPr+75eANwlmnv9TUA8AYS
 h+eVajMaUP9+TIi7jyTrmyvBAvBYugBlPB5JU8IoYbZvi2cF7nVNkfCj9
 MyIdN42C9oFITZQUGIeiC/4Q4ujUY8RMBU0iC/Xjt+bLFPf6ELnY3cSgs w==;
X-CSE-ConnectionGUID: lNsV9YS8QKK6DRyYd3+uYA==
X-CSE-MsgGUID: YXoF3bWgQ+Cgo3Ri36V23g==
X-IronPort-AV: E=McAfee;i="6800,10657,11892"; a="88542500"
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="88542500"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2026 04:56:57 -0700
X-CSE-ConnectionGUID: ma3aMWiOTx2k9F7FRY767Q==
X-CSE-MsgGUID: lfSznD9IQhGKO50hMN0BEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,255,1779174000"; d="scan'208";a="268547136"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa008.jf.intel.com with ESMTP; 01 Sep 2026 04:56:56 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Simon Ser <contact@emersion.fr>, Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] lib/igt_eld: Fix 88.2kHz/176.4kHz sample rate parsing
Date: Tue,  1 Sep 2026 17:03:13 +0530
Message-ID: <20260901113313.627816-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.50.1
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

parse_sad_rate() matched the rounded labels 88000/176000, but ALSA's
eld proc file reports the exact rates 88200/176400, so those never
matched and were silently dropped even when present in the ELD:

  $ cat /proc/asound/card0/eld#2.4
  [...]
  sad_count               1
  sad0_rates              [0x1ee0] 32000 44100 48000 88200 96000 176400 192000

Match the exact rates ALSA reports instead of the rounded ones.

Cc: Simon Ser <contact@emersion.fr>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 lib/igt_eld.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/igt_eld.c b/lib/igt_eld.c
index 4a6f867ab..896ab0e6b 100644
--- a/lib/igt_eld.c
+++ b/lib/igt_eld.c
@@ -76,11 +76,11 @@ static enum cea_sad_sampling_rate parse_sad_rate(const char *value)
 		return CEA_SAD_SAMPLING_RATE_44KHZ;
 	case 48000:
 		return CEA_SAD_SAMPLING_RATE_48KHZ;
-	case 88000:
+	case 88200:
 		return CEA_SAD_SAMPLING_RATE_88KHZ;
 	case 96000:
 		return CEA_SAD_SAMPLING_RATE_96KHZ;
-	case 176000:
+	case 176400:
 		return CEA_SAD_SAMPLING_RATE_176KHZ;
 	case 192000:
 		return CEA_SAD_SAMPLING_RATE_192KHZ;
-- 
2.50.1

