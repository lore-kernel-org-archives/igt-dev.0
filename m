Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C80C41513
	for <igt-dev@archiver.kernel.org>; Mon, 27 May 2024 07:34:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B3610E0DA;
	Mon, 27 May 2024 07:34:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aHTRG2fM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EAD510E0DA
 for <igt-dev@lists.freedesktop.org>; Mon, 27 May 2024 07:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716795263; x=1748331263;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=soP1X8mahTNsVtbvLkaPeVJp4QECrpD/IxSBtfrHW9k=;
 b=aHTRG2fMVTQxaZwVwxcoNl+NM+Yk24jndO5AXMWwv7zZwAfB5Z/1MWEw
 Y9sMIhwrAMYbT80LVW8g8ZXIes/ekSlfOnpyw2RvSPgvgvdEmP67T3FUM
 beSkhD8B4zSJk8RIFMxMXtqs8EAHmpNOJGZxo8ZFafTUUkRs2dV1wgXWp
 9Cmz0TLJuoVl8W+gTeiMpvT412iGztjTVmy/uL/NxBAMHSksvXfJv5qRE
 KLvCIZfFMXkGQdIfVtl0HjnzFbA2WimMlyqG5rykK3dxQkL4ExiSFyYHi
 PTP/qNZmBPWWKvIw0CTJhB+2GAtSKhLIkdwSfUQNpNXPg5oT0EkWhA+rx A==;
X-CSE-ConnectionGUID: qySyU9N6Sje8Sl3ezQm64Q==
X-CSE-MsgGUID: B4w64t96RC2sM1C5D76JBg==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="23700430"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="23700430"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 00:34:17 -0700
X-CSE-ConnectionGUID: da1lu3j8SWq9Wr4RFA4Oww==
X-CSE-MsgGUID: V+Ld1aoXQHyMzqchUig7qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="34569844"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.184])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 00:34:15 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 03/12] lib/intel_bufops: Add linear-to-none copy path
Date: Mon, 27 May 2024 09:33:36 +0200
Message-Id: <20240527073345.54729-4-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240527073345.54729-1-zbigniew.kempczynski@intel.com>
References: <20240527073345.54729-1-zbigniew.kempczynski@intel.com>
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

At first glance copying linear to linear (none) is not necessary
as ordinary memcpy() may be used. But adding this makes iterating
over all possible tilings much easier.

In the upcoming patch I'm going to introduce tiling detection tool
which iterates over all tilings where linear copy is also exercised.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_bufops.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index b4ccf4c093..30ba2547dc 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -292,6 +292,17 @@ static unsigned long swizzle_addr(void *ptr, uint32_t swizzle)
 	}
 }
 
+static void *linear_ptr(void *ptr,
+			unsigned int x, unsigned int y,
+			unsigned int stride, unsigned int cpp)
+{
+	int pos;
+
+	pos = (stride/cpp * y + x) * cpp;
+
+	return ptr + pos;
+}
+
 static void *x_ptr(void *ptr,
 		   unsigned int x, unsigned int y,
 		   unsigned int stride, unsigned int cpp)
@@ -418,6 +429,9 @@ static tile_fn __get_tile_fn_ptr(int tiling)
 	tile_fn fn = NULL;
 
 	switch (tiling) {
+	case I915_TILING_NONE:
+		fn = linear_ptr;
+		break;
 	case I915_TILING_X:
 		fn = x_ptr;
 		break;
@@ -598,6 +612,13 @@ static void __copy_linear_to(int fd, struct intel_buf *buf,
 	munmap(map, buf->surface[0].size);
 }
 
+static void copy_linear_to_none(struct buf_ops *bops, struct intel_buf *buf,
+				uint32_t *linear)
+{
+	DEBUGFN();
+	__copy_linear_to(bops->fd, buf, linear, I915_TILING_NONE, 0);
+}
+
 static void copy_linear_to_x(struct buf_ops *bops, struct intel_buf *buf,
 			     uint32_t *linear)
 {
@@ -655,6 +676,13 @@ static void __copy_to_linear(int fd, struct intel_buf *buf,
 	munmap(map, buf->surface[0].size);
 }
 
+static void copy_none_to_linear(struct buf_ops *bops, struct intel_buf *buf,
+				uint32_t *linear)
+{
+	DEBUGFN();
+	__copy_to_linear(bops->fd, buf, linear, I915_TILING_NONE, 0);
+}
+
 static void copy_x_to_linear(struct buf_ops *bops, struct intel_buf *buf,
 			     uint32_t *linear)
 {
@@ -1653,13 +1681,14 @@ static struct buf_ops *__buf_ops_create(int fd, bool check_idempotency)
 		  bops->driver == INTEL_DRIVER_I915 ? "i915" : "xe");
 
 	if (bops->driver == INTEL_DRIVER_XE) {
+		bops->linear_to = copy_linear_to_none;
+		bops->to_linear = copy_none_to_linear;
 		bops->linear_to_x = copy_linear_to_x;
 		bops->x_to_linear = copy_x_to_linear;
 		bops->linear_to_y = copy_linear_to_y;
 		bops->y_to_linear = copy_y_to_linear;
 		bops->linear_to_tile4 = copy_linear_to_tile4;
 		bops->tile4_to_linear = copy_tile4_to_linear;
-
 		bops->linear_to_yf = NULL;
 		bops->yf_to_linear = NULL;
 		bops->linear_to_ys = NULL;
@@ -1869,6 +1898,10 @@ bool buf_ops_set_software_tiling(struct buf_ops *bops,
 	}
 
 	switch (tiling) {
+	case I915_TILING_NONE:
+		igt_debug("-> use SW on tiling NONE\n");
+		break;
+
 	case I915_TILING_X:
 		if (use_software_tiling) {
 			bool supported = buf_ops_has_tiling_support(bops, tiling);
-- 
2.34.1

