Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154B2C5AD49
	for <igt-dev@archiver.kernel.org>; Tue,  3 Jun 2025 16:38:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAB910E203;
	Tue,  3 Jun 2025 16:38:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a8RgZAhz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B24210E203
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Jun 2025 16:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748968693; x=1780504693;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h/ys446EhI39GuzL/M5IKwa91/NKhwLF+irBH034zhY=;
 b=a8RgZAhzVe9poSW9lpyrWCeMzJBjTd33cA8NYNwW16ITw1Ylbdtz+/rN
 8xyKN0rfVTZUbe8zqkafEguMfBqoVXdJhyzh2WkdC2QG4nrM1uxT2xrWd
 Y9uD71VDJa9JuCsRndbP2YEBmoKtH/Y7Gxdm7qGW0/Gkbcvdk1SC5DWtW
 aFg6XJgbBuR8HRZPiUX2+hA87M8Q5V+/5kBI59j1nb427tsOcNyBScxIv
 jfR/1UFb91VZPaiJ+HhUWPwZtV6aHzzTstjSvc7+C1spQ2lWFNq963Pfb
 xAmoFmn4Ytix0zcdy6yEIvVaxS7uGyclYhpGRWylmzZKj6wJoJswIuff/ Q==;
X-CSE-ConnectionGUID: 1p0EmdDfSZuIwTRX+Gzd6w==
X-CSE-MsgGUID: u9KTtJBLSwq5sV+ibohJ5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="68573307"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="68573307"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 09:38:13 -0700
X-CSE-ConnectionGUID: S4/Wv/gDRfWWltInQhh8yw==
X-CSE-MsgGUID: ulgIdz2pRj+ZxkvEH1O8ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="182090380"
Received: from unknown (HELO d368ed45d7ae.iind.intel.com) ([10.66.234.123])
 by orviesa001.jf.intel.com with ESMTP; 03 Jun 2025 09:38:10 -0700
From: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com, kamil.konieczny@intel.com,
 markyacoub@google.com, seanpaul@google.com, carlos.santa@intel.com,
 sapna1.singh@intel.com,
 Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t v13 10/11] tests/intel/xe_create: Conditionally define
 PAGE_SIZE for non-Android platforms
Date: Tue,  3 Jun 2025 16:37:13 +0000
Message-ID: <20250603163715.70774-11-jeevaka.badrappan@intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250603163715.70774-1-jeevaka.badrappan@intel.com>
References: <20250603163715.70774-1-jeevaka.badrappan@intel.com>
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

Ensure PAGE_SIZE is defined only if it is not already defined,
addressing compatibility with Android where PAGE_SIZE is predefined.

Signed-off-by: Jeevaka Prabu Badrappan <jeevaka.badrappan@intel.com>
Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/intel/xe_create.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_create.c b/tests/intel/xe_create.c
index b22084c84..e8b8bb025 100644
--- a/tests/intel/xe_create.c
+++ b/tests/intel/xe_create.c
@@ -18,7 +18,9 @@
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 
+#ifndef PAGE_SIZE
 #define PAGE_SIZE 0x1000
+#endif
 
 static struct param {
 	unsigned int quantity;
-- 
2.49.0

