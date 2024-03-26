Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48483C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 21:56:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC32E10EB11;
	Mon, 25 Mar 2024 21:56:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PK17++hq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8743F10EB14
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 21:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711403788; x=1742939788;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3/u/HpVBjdv60JTAPSzrd2pvnlrwmV2SlalsfSsOW3s=;
 b=PK17++hqVhxZUvfLuA07HcoilV0emb1uVkAMrNJpZsfCQR5pcZoUultd
 ftIOGEzHH+pU6JrnsDP7K3BwWb88dEtk+QdH8fHv4/z/1w+lAeLBPjex1
 kWFbQm+QOm97pxZSxCWsOKOPsJ7/JpwcUiC14sA8eCbEP4Gbyg500/h/y
 sLT1/oLBvQzJnzqnvZJqeFBrvBrd48p5JBYFytR9oOyGpvTXI2yDBUJ8a
 KTAjFQvSsrPtprORM5kAx9JFEuqkZ7uPn3puEtg3Rlok0nKni6l2qhNjJ
 4MClr3gMgwMo0RFUCGjp/N0jPNCwgwmqbYhDItet/qLOetYavrdcRq8Te Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6540572"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6540572"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 14:56:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; d="scan'208";a="20413096"
Received: from saurabhg-nuc10i5fnh.jf.intel.com ([10.165.21.145])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 14:56:27 -0700
From: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
To: 
Cc: igt-dev@lists.freedesktop.org, zbigniew.kempczynski@intel.com,
 Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Subject: [PATCH i-g-t v1 3/3] tests/xe_ccs: Check if platform supports
 compression
Date: Tue, 26 Mar 2024 02:54:38 -0700
Message-Id: <1d66863d0c0ba1e70c8a668ed88a1ed69321e29f.1711444735.git.akshata.jahagirdar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1711444735.git.akshata.jahagirdar@intel.com>
References: <cover.1711444735.git.akshata.jahagirdar@intel.com>
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

Add check before running the test to ensure the platform supports
compression and has flat ccs enabled.

Signed-off-by: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
---
 tests/intel/xe_ccs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index 8fe1f62eb..b424a1d6d 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -718,6 +718,7 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 	igt_fixture {
 		xe = drm_open_driver(DRIVER_XE);
 		igt_require(blt_has_block_copy(xe));
+		igt_require(blt_platform_supports_compression(xe));
 		if (AT_LEAST_GEN(xe, 20))
 			igt_require(HAS_FLATCCS(xe));
 
-- 
2.34.1

