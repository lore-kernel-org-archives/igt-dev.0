Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586A8C47DB3
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jan 2024 11:43:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03054113B6A;
	Wed, 31 Jan 2024 11:43:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA6F113B6A
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jan 2024 11:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706701400; x=1738237400;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nEsgEr92WsqWRuc62JB5FCEdho/xWd2ooji3NILWMeo=;
 b=GfpcDuq7EgzPajcPXzoKe1s/sqFDZSlkMElOaJcYpFV8inF2W7akCkzq
 S+FMNDrHjDXMts1VCJGzHZ4tBXX5HAdr8PUjyD9mbjwa+qSHZqUXl7f7W
 a/OhIRc7xLxH8Zej47qDwaVsObjnNYBnC1YFFQiEeMp5qo97FqdcWRKjG
 7gQbaaeCRbiaDjs5zPY8lbmd4Nk5gxGAYOKw+jW/CHDr1uC7g8I4oIln2
 7Jk1v9wzmQyjN3GXXFjBol/hDemRsx9GeZIyiUVj7wDHpGuTeIDMwu7m3
 vsJMeW+Ciksoz4ZiEliOShs7zSW1n7J5SBjvmpGCCyNuuKfpDIHPhSbM1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="434748554"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="434748554"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 03:43:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="961583638"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="961583638"
Received: from akurkina-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.19.208])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 03:43:19 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 2/3] tests/intel/xe_ccs: require flat CCS on xe2
Date: Wed, 31 Jan 2024 11:43:04 +0000
Message-ID: <20240131114305.202871-2-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240131114305.202871-1-matthew.auld@intel.com>
References: <20240131114305.202871-1-matthew.auld@intel.com>
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
Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

On Xe2 compression is handled via PAT indexes and flat CCS, even on
igpu. Ensure the device has flat CCS support on such hardware, to
determine if these tests are valid.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Akshata Jahagirdar <akshata.jahagirdar@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/intel/xe_ccs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/intel/xe_ccs.c b/tests/intel/xe_ccs.c
index 7d0e8ed7a..88f812c91 100644
--- a/tests/intel/xe_ccs.c
+++ b/tests/intel/xe_ccs.c
@@ -653,6 +653,8 @@ igt_main_args("bf:pst:W:H:", NULL, help_str, opt_handler, NULL)
 	igt_fixture {
 		xe = drm_open_driver(DRIVER_XE);
 		igt_require(blt_has_block_copy(xe));
+		if (AT_LEAST_GEN(xe, 20))
+			igt_require(HAS_FLATCCS(xe));
 
 		xe_device_get(xe);
 
-- 
2.43.0

