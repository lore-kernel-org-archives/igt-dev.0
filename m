Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336C6C48BC4
	for <igt-dev@archiver.kernel.org>; Tue, 13 Feb 2024 10:01:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE78910E2E4;
	Tue, 13 Feb 2024 10:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XmM03QVt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171F310E2CD
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Feb 2024 10:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707818498; x=1739354498;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ktj28+xDXllGd+/4zJcpG7E57TRP+zY+TgFf2Z+HUVE=;
 b=XmM03QVt6gC7LxGqB2aby4XQnDGTKidaTsbEik+ixp6S1e/eXB0X7KwS
 7+keltaOwN1yRI3cyM3julVz+pi5lY140NetnGld57XXBGHexjTesMO9b
 8xXTzkbBMFmvCCUfV8/Dx6XXArFutPU2fjKqNq2jnJIyCIwpi3CWkt9t8
 Zx2WQggmIVuzoeT4d3mZQ/N/CL16GX1o2vG8Gc51HDsKgZYEQIthfnTRb
 wj0Diuhcm6oEeeBoMEEF12EEzdUiIxagpx8JXiYL24fuLvsL53+6Swd26
 HU/bqoaITQuONjQ3sb6KSg+5ZKEiCC4Dqwu7NoFfZ2t2DuguDB9cNx3c7 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="19232353"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208,223";a="19232353"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 02:01:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208,223";a="2815505"
Received: from gfmckenx-mobl.ger.corp.intel.com (HELO mwauld-mobl1.intel.com)
 ([10.252.21.42])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2024 02:01:37 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 3/8] lib/intel_bufops: repurpose
 intel_buf_create_using_handle_and_size()
Date: Tue, 13 Feb 2024 10:01:20 +0000
Message-ID: <20240213100125.90085-3-matthew.auld@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213100125.90085-1-matthew.auld@intel.com>
References: <20240213100125.90085-1-matthew.auld@intel.com>
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
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
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

