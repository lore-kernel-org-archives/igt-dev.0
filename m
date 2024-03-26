Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FAFCD11DD
	for <igt-dev@archiver.kernel.org>; Tue, 26 Mar 2024 14:14:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 353C710EA60;
	Tue, 26 Mar 2024 14:14:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dwoC9kAs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF39B10EAE8
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2024 14:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711462441; x=1742998441;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WPpRQGUAMS2EKGOTV6XWEoBz58ObObd4zBenjwNvzhc=;
 b=dwoC9kAs0lkSeTjhykJFHe4kaThkMKZKWiMeK7FVvsISRaaA5fVS3YjE
 PCToYR9UdogMRGw83AAUel2dHHuzRkxLxE8mRjC2El1rYKv9cW7DMh9Z0
 zr6ypfVGOmjOQUCiHB5tXmbliAioxz9yMdMM//2Jqa8mDXw0+sIUavbmj
 JCynqbokUF7M0GclU2S/XXENq2avEt0UNynlnJ0xK6141bdMT6wH9VYbB
 pW1Eu1j6F00xgaqw2OLdiMF+CU2tza+sfL1R5zAopETHuv7z1xVrrStBx
 NSGDPpWJ2LVYjHwq3SVBy971Cn98BRkVaDCdlT/1Kx3p1hLQxLqkiP2R8 Q==;
X-CSE-ConnectionGUID: nKd03o8bSvKtu7ZHM1XtnA==
X-CSE-MsgGUID: /kWYLhY/TGC6LcKJJ9IqaA==
X-IronPort-AV: E=McAfee;i="6600,9927,11025"; a="17147228"
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="17147228"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 07:14:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,156,1708416000"; d="scan'208";a="53437656"
Received: from unknown (HELO localhost.localdomain) ([10.190.238.8])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2024 07:13:59 -0700
From: Vandita Kulkarni <vandita.kulkarni@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: zbigniew.kempczynski@intel.com,
 Vandita Kulkarni <vandita.kulkarni@intel.com>
Subject: [v4 2/3] lib/igt_draw: Sanitize the buffer data in the beginning
Date: Tue, 26 Mar 2024 19:44:21 +0530
Message-ID: <20240326141422.13993-3-vandita.kulkarni@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240326141422.13993-1-vandita.kulkarni@intel.com>
References: <20240326141422.13993-1-vandita.kulkarni@intel.com>
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

Since now we have a new member in buffer data which is a
pointer, we need to initialise the buf_ptr. If left uninitialised
may contain garbage. Also may be used in wc write method if it is
initialised to already mmapped buffer.

Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 lib/igt_draw.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index a4d5f2f0e..5ad631f38 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -801,7 +801,7 @@ static void draw_rect_render(int fd, struct cmd_data *cmd_data,
 	uint32_t devid = intel_get_drm_devid(fd);
 	igt_render_copyfunc_t rendercopy = igt_get_render_copyfunc(devid);
 	struct intel_bb *ibb;
-	struct buf_data tmp;
+	struct buf_data tmp = {};
 	int pixel_size = buf->bpp / 8;
 
 	igt_skip_on(!rendercopy);
@@ -822,6 +822,7 @@ static void draw_rect_render(int fd, struct cmd_data *cmd_data,
 	tmp.bpp = buf->bpp;
 	tmp.width = rect->w;
 	tmp.height = rect->h;
+	tmp.buf_ptr = buf->buf_ptr;
 	if (is_i915_device(fd))
 		draw_rect_mmap_cpu(fd, &tmp, &(struct rect){0, 0, rect->w, rect->h},
 				   I915_TILING_NONE, I915_BIT_6_SWIZZLE_NONE, color);
-- 
2.43.2

