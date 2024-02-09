Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E2C8C4828F
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 18:35:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E65910F97F;
	Fri,  9 Feb 2024 18:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SAga4Nij";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F6D10F97C
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 18:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707503719; x=1739039719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3IJTBHfGqFM3ksUjU1AMNsjjTEhtcH5R5XlvmWp7yNM=;
 b=SAga4Nijso5mZJwXtGrrLDEEaRK7el+PnjjI00f/pDd1mcVXl7+N6DOj
 pbj57zQFpe3OuhTIaYdWXxJNrDZdmPnpS8gYDwkjybh6gxU6vYIKIgxk7
 u72jlcCopZoAB3Q6v+v4uV9wDC88+l99oHv8G3pyckQZbtJMHl9h6G3vd
 vHd8Dh/xlrRxvGML80Z/K6K9pnXLpeh+4oGo3Gs+NzALBxVqrZzHYH9RG
 2AlkWgaYUOyy/zBrP1R2CZLG1ke3MDx/4POCMncmctS1XLNHju+REY9bw
 ZnPAynFiQ6hH9T8JsYrxZUIbVsUfUBAvSX50Wk+kWJeNa9AilHexYXnc+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="12049313"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; d="scan'208,223";a="12049313"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 10:35:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; d="scan'208,223";a="6647765"
Received: from vdegtyar-mobl1.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.20.246])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 10:35:18 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t 3/8] lib/intel_bufops: repurpose
 intel_buf_create_using_handle_and_size()
Date: Fri,  9 Feb 2024 18:34:28 +0000
Message-ID: <20240209183433.375099-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209183433.375099-1-matthew.auld@intel.com>
References: <20240209183433.375099-1-matthew.auld@intel.com>
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

From an api pov user this should be the same as intel_buf_create, except
with existing buffer handle and bo_size. There are no current users for
this, but in upcoming patch we will remove
intel_buf_create_using_handle() and convert all users over to this api,
such that we don't have to guess the bo_size deep in the lib code.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/intel_bufops.c | 6 +++---
 lib/intel_bufops.h | 3 +--
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 46eba3fb4..a299cdba7 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -1120,6 +1120,7 @@ struct intel_buf *intel_buf_create(struct buf_ops *bops,
  * @alignment: alignment of the stride for linear surfaces
  * @tiling: surface tiling
  * @compression: surface compression type
+ * @size: real bo size
  *
  * Function creates intel_buf with passed BO handle from the caller. Doesn't
  * take ownership of the buffer. close()/destroy() paths doesn't close
@@ -1151,11 +1152,10 @@ struct intel_buf *intel_buf_create_using_handle_and_size(struct buf_ops *bops,
 							 int bpp, int alignment,
 							 uint32_t req_tiling,
 							 uint32_t compression,
-							 uint64_t size,
-							 int stride)
+							 uint64_t size)
 {
 	return intel_buf_create_full(bops, handle, width, height, bpp, alignment,
-				     req_tiling, compression, size, stride, -1,
+				     req_tiling, compression, size, 0, -1,
 				     DEFAULT_PAT_INDEX);
 }
 
diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
index b6048402b..54a143c5b 100644
--- a/lib/intel_bufops.h
+++ b/lib/intel_bufops.h
@@ -185,8 +185,7 @@ struct intel_buf *intel_buf_create_using_handle_and_size(struct buf_ops *bops,
 							 int bpp, int alignment,
 							 uint32_t req_tiling,
 							 uint32_t compression,
-							 uint64_t size,
-							 int stride);
+							 uint64_t size);
 
 struct intel_buf *intel_buf_create_full(struct buf_ops *bops,
 					uint32_t handle,
-- 
2.43.0

