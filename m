Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CA2C2BBCA
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 05:19:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957EE10E1C8;
	Tue, 25 Jun 2024 05:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WDi1L3M7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6560A10E1C8
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 05:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719292740; x=1750828740;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SHVWpghCyBT8cMJXkL7FxruJEheyw936gjhKwx8umqc=;
 b=WDi1L3M7TF2C+YEFLqXnK9NGWCD6pShndRUf8wzJrMLpumB6FlkUs++A
 HOyHLQ16/DUvnqlaxvCfokvseWck3lgyKkS8GB/O3JYvnKauLdreqpQss
 L0kcZ2/DvpHfYIgLz0jyL9Zc+gCepzekkdJxF5jPaA6eBH+9kBSvxR02G
 CjiAJo/wci/dmozI+G+hR7RnQKsoWRpH0qUCwLaNnmFwvW2B1iFP1oJnC
 rllwdINtJUws0ChOTH+N8Lfy7DU1FMrYxrD3q4Q0EzfLy5EkUEFCnRRQI
 //k/43vpGrXTFF2Chc1iQz6pUKH2Xn1li4ELA0FG5b1+QFvA8aKrvmUzZ Q==;
X-CSE-ConnectionGUID: b+HoLc3lReGd4DJkz7crzA==
X-CSE-MsgGUID: bQ7AITD5T8yXee3xsOFgfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="26911545"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="26911545"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 22:19:00 -0700
X-CSE-ConnectionGUID: WchwU3N9TQi6vH+3ZZdRPQ==
X-CSE-MsgGUID: 6oN0Bz6PRySAiT1T8vBjoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="48436324"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 22:18:59 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [i-g-t] tests/intel-ci: Update i915 blocklist
Date: Tue, 25 Jun 2024 10:40:48 +0530
Message-ID: <20240625051049.275346-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

Block KMS tests those are specific to (display_ver > 14)
are not applicable for i915.

Cc: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel-ci/blacklist.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/intel-ci/blacklist.txt b/tests/intel-ci/blacklist.txt
index d01ef5e16..b35633c5a 100644
--- a/tests/intel-ci/blacklist.txt
+++ b/tests/intel-ci/blacklist.txt
@@ -142,4 +142,11 @@ igt@device_reset@reset-bound
 igt@kms_bw@.*
 
 # Tests specific to (Display_ver > 14) are not applicable for i915
+igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs
+igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs
+igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs
+igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs
+igt@kms_ccs@random-ccs-data-4-tiled-xe2-ccs
+igt@kms_frontbuffer_tracking@plane-fbc-rte
+igt@kms_pm_dc@deep-pkgc
 igt@kms_vrr@cmrr
-- 
2.43.2

