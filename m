Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D428C5478C
	for <igt-dev@archiver.kernel.org>; Wed, 28 Feb 2024 14:54:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B3B10E9F4;
	Wed, 28 Feb 2024 14:54:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S4bqtRxB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608BD10E9F4
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2024 14:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709132069; x=1740668069;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=inyQI/VnWYlm+h/bWNcbhqJxK8JbOe9Wrc5QT3kfKk0=;
 b=S4bqtRxBykqaDjhwjhtzVqAt4QN0OTcVLZAMEwgKYmy2Oxwz2iDiCQYf
 I7jSlxY7vXlLn6YSQuqlTu9M7KkD0336RzaNr+FnNO24qiuDEBoVrdSP0
 43ayQi3hm1nmc2rkBL5txuFpOcgnYFBBEoycBrvTeCwxeVZ1QsJD8JJ/n
 eths1XTnjdKjjGQ3estaJhoNddx1GaXDZQeL5U00aZkc6rj5J3EGa7dJy
 Lmewk5UUrGCvyGS0oGbdWmekk87RLZ2FYt3M9oOWkj+quNuteRjtMT8yn
 NXofh3CZKWC5MGmlVtNb9Xt716S25a6Z9NHV0iGA7NXq9DXaDUQsz1c/2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="7314199"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7314199"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 06:54:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="8022483"
Received: from wbosek-mobl.ger.corp.intel.com (HELO localhost) ([10.245.80.56])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 06:54:28 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH i-g-t 3/7] lib/intel_bufops: Add width and height to intel_buf
Date: Wed, 28 Feb 2024 15:54:03 +0100
Message-Id: <20240228145407.370325-4-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240228145407.370325-1-zbigniew.kempczynski@intel.com>
References: <20240228145407.370325-1-zbigniew.kempczynski@intel.com>
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

While width calculated as division of stride and bpp/8 is correct
it limits its use to linear buffers (tiled requires stride is
tile width multiplied).

From now on width and height are independent so partial blit (render)
should be now possible.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
---
 lib/intel_bufops.c | 2 ++
 lib/intel_bufops.h | 6 ++++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index c8f91aef82..9d3d17def9 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -836,6 +836,8 @@ static void __intel_buf_init(struct buf_ops *bops,
 	memset(buf, 0, sizeof(*buf));
 
 	buf->bops = bops;
+	buf->width = width;
+	buf->height = height;
 	buf->addr.offset = INTEL_BUF_INVALID_ADDRESS;
 	IGT_INIT_LIST_HEAD(&buf->link);
 	buf->mocs = INTEL_BUF_MOCS_DEFAULT;
diff --git a/lib/intel_bufops.h b/lib/intel_bufops.h
index 0b68482b25..cd0aebdab1 100644
--- a/lib/intel_bufops.h
+++ b/lib/intel_bufops.h
@@ -24,6 +24,8 @@ struct intel_buf {
 	bool is_owner;
 	uint32_t handle;
 	uint64_t size;
+	uint32_t width;
+	uint32_t height;
 	uint32_t tiling;
 	uint32_t bpp;
 	uint32_t compression;
@@ -77,12 +79,12 @@ static inline bool intel_buf_compressed(const struct intel_buf *buf)
 
 static inline unsigned int intel_buf_width(const struct intel_buf *buf)
 {
-	return buf->surface[0].stride / (buf->bpp / 8);
+	return buf->width;
 }
 
 static inline unsigned int intel_buf_height(const struct intel_buf *buf)
 {
-	return buf->surface[0].size / buf->surface[0].stride;
+	return buf->height;
 }
 
 static inline unsigned int
-- 
2.34.1

