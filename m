Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCF7C54798
	for <igt-dev@archiver.kernel.org>; Thu, 29 Feb 2024 07:00:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E347210E0EC;
	Thu, 29 Feb 2024 07:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UpmlAQhN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B690210E14A
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Feb 2024 06:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709189999; x=1740725999;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding:sender;
 bh=/zsMZwgISUmVec5xoSSCP9Ozu6SzyyPk30xsxuyALoM=;
 b=UpmlAQhN3LnWBlP5J6MIYVuUULfvJ9Vum3+7h6P9VvXwB3IcogqzPxz8
 rG9Bk1lOdVSxrzUVEs7RBi3uMbDWPOguDlcTXZufij98F5qjjJSzCAJKm
 BoSdoHsB5S4+Y//EObTVc2M0kBB6VJJhCqmtyUm45IOrnyQv5AQaRXH5x
 Ev7w9H+g0sVFnf+A0ezp9p5Vz2e+kobRtJjoYuGDBqDo0tioOKUGQio0f
 EzH3V6h6dBD7jsPp6NQXemX6bIP4IRXTnlrmiFpV8BeF066SZ/dt2zGJ6
 Uv9Z3fuDybAPSL3VHOGq/O1aFtTII1WRiB+A+fZ4irozt7/xCvzo9tXso g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3755980"
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="3755980"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 22:59:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,192,1705392000"; 
   d="scan'208";a="7640491"
Received: from linux.intel.com ([10.54.29.200])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 22:59:57 -0800
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.245.244.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 49617580DF5;
 Wed, 28 Feb 2024 22:59:57 -0800 (PST)
Received: from maurocar by linux.intel.com with local (Exim 4.97.1)
 (envelope-from <mauro.chehab@linux.intel.com>)
 id 1rfaOY-00000002GEp-3nPs; Thu, 29 Feb 2024 07:59:54 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Katarzyna Piecielska <katarzyna.piecielska@intel.com>
Subject: [PATCH i-g-t 3/4] tests/intel/xe_noexec_ping_pong: change category to
 hardware building block
Date: Thu, 29 Feb 2024 07:56:18 +0100
Message-ID: <20240229065953.538861-4-mauro.chehab@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240229065953.538861-1-mauro.chehab@linux.intel.com>
References: <20240229065953.538861-1-mauro.chehab@linux.intel.com>
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

compute feature is currently mapped as either:
	- Hardware building block; or:
	- Software building block

on different places. As this is a hardware feature, use it for
the test on this file too.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 tests/intel/xe_noexec_ping_pong.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/intel/xe_noexec_ping_pong.c b/tests/intel/xe_noexec_ping_pong.c
index c372cc82db1b..d02ef62e409e 100644
--- a/tests/intel/xe_noexec_ping_pong.c
+++ b/tests/intel/xe_noexec_ping_pong.c
@@ -17,7 +17,7 @@
 
 /**
  * TEST: Expose compute VM's unnecessary rebinds
- * Category: Software building block
+ * Category: Hardware building block
  * Sub-category: compute
  * Functionality: compute VM rebind
  * Test category: functionality test
-- 
2.43.2

