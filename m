Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B649C98302
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 15:52:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1E410ED9B;
	Tue, 22 Sep 2026 15:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mCwT4GFg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EEA110E724
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2026 15:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790092319; x=1821628319;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LJLhO1e7yNTTOxRbZ4NPADcgQ/r/2UJsF05bY2IL9G0=;
 b=mCwT4GFg1G6Kf5Z8EikRb04TKL5tdQuVPOghg3lQaLRSvMBOODCNx5YN
 tiaizn5hx6Ijne5dEmyFUKRRDj1/LA1UXWzCqDhtjlvaIVNwxDTFeR2q+
 iwFu/AD0KZ7oa6Qf2WRDpAU6gB9bTQHM0mfex9AtfTWxvXmhATyl1GTPq
 E59mNY78HKgOdpvIanMuyaQr8IUWxZmqySSIs4kojI0S1s91LoKb05CO8
 JlTOvwWvONz3i2Z1WyoO1wSdima2p9K31653TXX8freImxUQdi1QKY7gE
 k8jTnwVlUOUfx29FAMXoU9n9kY7xKIcEx5gkHoFvjU/LE9/VmCv5CUnmk g==;
X-CSE-ConnectionGUID: 71Jaw6eLQcKsuWlItoWkhA==
X-CSE-MsgGUID: Or6TVIt/T7GM9psB+4R9cA==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1209950"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="1209950"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 08:51:58 -0700
X-CSE-ConnectionGUID: A/pwz8xDS3q/RzqcIeDJRA==
X-CSE-MsgGUID: kVufhyeKSlOY+mQWr8HDRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="4200450"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.140])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 08:51:57 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t] Update MAINTAINERS
Date: Tue, 22 Sep 2026 17:51:51 +0200
Message-ID: <20260922155151.90467-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.55.0
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

Remove Ashtutosh Dixit.

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index afc5dbb36..e0ea8f2f3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3,5 +3,4 @@ Arkadiusz Hiler <arek@hiler.eu>
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>
-Ashutosh Dixit <ashutosh.dixit@intel.com>
 Karthik B S <karthik.b.s@intel.com>
-- 
2.55.0

