Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1418C30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:29:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8155F10E70C;
	Tue,  2 Jul 2024 23:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AqBZ0IrN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD2610E70C
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719962960; x=1751498960;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=8LFr0oznlufLqCOT0aeqj/AJakGg42pogYsUX71A6K0=;
 b=AqBZ0IrNICkkCqM8+J7JQ1MzoOIV9K8z5yfR+QQGODLduI5rXnSjYK2f
 XL2P0Bp9tcYtEkB6JVlXPgnGrnCw0Fan+6Xpcwwx7Pq3n2lfnq5wIgVZq
 1cHpAJMJYV4+ZwofdHpiy+lqH8w6XIiD8wnCM/ArT7qpJfKxNfg4k0ssa
 5T5rmC1UvASyfYZKqHlS6gzlEPdkSw1khNNgM0z5hSgRerRPOIV1BlgEQ
 0gHXEPJwzS0s3geiKafb8WlhvrImXS/4K2f2uKZY9fYl2yrxvw8he9emF
 Dnu+x61bWpY5v6W5YPg501E2BZmg9G9u3d43gUhCnV+QucQJMYDQXeiu9 Q==;
X-CSE-ConnectionGUID: ij/pDavdTzGemPCX4Ic7fA==
X-CSE-MsgGUID: phklTCgXSr28Er3mKU7lKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559629"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559629"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:29:19 -0700
X-CSE-ConnectionGUID: P/7EmeNtQcyWxg3DK6Xn9g==
X-CSE-MsgGUID: UInBr6GySlu6aspRbWeMvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043878"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:29:17 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:29:16 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 21/37] lib/igt_fb: Add DRM_FORMAT_XRGB2101010
 compression format for the
Date: Wed,  3 Jul 2024 02:28:01 +0300
Message-ID: <20240702232817.31147-22-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Pick the correct compression format for the block copy when
using a 2:10:10:10 pixel format.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index fd115f833bc5..e120ee9dcf70 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2879,6 +2879,7 @@ const struct {
 	enum blt_compression_type type;
 	uint32_t return_value;
 } compression_mappings[] = {
+	{ DRM_FORMAT_XRGB2101010, COMPRESSION_TYPE_3D, 0xc },
 	{ DRM_FORMAT_XRGB8888, COMPRESSION_TYPE_3D, 0x8 },
 	{ DRM_FORMAT_XRGB8888, COMPRESSION_TYPE_MEDIA, 8 },
 	{ DRM_FORMAT_XYUV8888, COMPRESSION_TYPE_MEDIA, 9 },
-- 
2.44.2

