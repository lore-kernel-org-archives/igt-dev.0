Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A66C2BBCA
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 17:40:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A2810E6F9;
	Tue, 25 Jun 2024 17:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BY3AZzTS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC8510E70A
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 17:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719337244; x=1750873244;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=j2zk7cmlpUPTok0czl+D3h2y74qlLbtum8fcKRDOl8w=;
 b=BY3AZzTSVN6X17OsoMkSFQjTX+ywasXYkyMFS9cKzv7UflDqSNv3O4SE
 w9GhHOa8dmXH+q8JO5HUPN+YqiuwaY0yCY9CWSJfgH9n7MTnxWepaEk1/
 z989Od9zwE+DRu5xAadNBZRc9gOvyErCOg3E7s0zOnn+MWOT7p23HIrlN
 4Sep6TR7Qk6gdOQOCZzkLZhdpFE/VgfqC+zIP0PY3y44JjN9oN228kc+y
 1TH2KbujGhfLjcsnuiBsju1HnZNyeclfm0AatuI0W3rFC3y1xaAL+yllR
 UDC9EFSLsJhW+8N4Aha6xTkT1NLvTCEj6+8vONNloBrDddFa3sNMnZI7D A==;
X-CSE-ConnectionGUID: yAil2WZMQXuUm+2WpelO5w==
X-CSE-MsgGUID: Wiz+HLHsTPOtLfriszsLlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="20184373"
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="20184373"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 10:40:43 -0700
X-CSE-ConnectionGUID: RSNxhshsRNqB37mKsXE6fQ==
X-CSE-MsgGUID: T6eXY6leR7ylo42YsMLOvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,264,1712646000"; d="scan'208";a="43701216"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 25 Jun 2024 10:40:41 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 25 Jun 2024 20:40:40 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/6] tests/kms_frontbuffer_tracking: Use igt_create_fb()
Date: Tue, 25 Jun 2024 20:40:29 +0300
Message-ID: <20240625174032.10398-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240625174032.10398-1-ville.syrjala@linux.intel.com>
References: <20240625174032.10398-1-ville.syrjala@linux.intel.com>
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

Calling igt_calc_fb_size() and igt_create_fb_with_bo_size() like
this back to back is the same as just calling igt_create_fb().

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index e45d17dd692d..da593c3aacc7 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -1630,8 +1630,7 @@ static void create_fb(enum pixel_format pformat, int width, int height,
 		      enum tiling_type tiling, int plane, struct igt_fb *fb)
 {
 	uint32_t format;
-	uint64_t size, modifier;
-	unsigned int stride;
+	uint64_t modifier;
 
 	switch (pformat) {
 	case FORMAT_RGB888:
@@ -1665,13 +1664,7 @@ static void create_fb(enum pixel_format pformat, int width, int height,
 
 	igt_warn_on(plane == PLANE_CUR && tiling != TILING_LINEAR);
 
-	igt_calc_fb_size(drm.fd, width, height, format, modifier, &size,
-			 &stride);
-
-	igt_create_fb_with_bo_size(drm.fd, width, height, format, modifier,
-				   IGT_COLOR_YCBCR_BT709,
-				   IGT_COLOR_YCBCR_LIMITED_RANGE,
-				   fb, size, stride);
+	igt_create_fb(drm.fd, width, height, format, modifier, fb);
 }
 
 static uint32_t pick_color(struct igt_fb *fb, enum color ecolor)
-- 
2.44.2

