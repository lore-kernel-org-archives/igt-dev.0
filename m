Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFFCCFA766
	for <igt-dev@archiver.kernel.org>; Fri,  4 Oct 2024 10:41:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F3B10E290;
	Fri,  4 Oct 2024 10:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eEkLsVnS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0BC810E289
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Oct 2024 10:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728038491; x=1759574491;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=mWdWGH+T2GSmLI3D9xwkIyAzi/QOs9cbIjxuTh0N3Wc=;
 b=eEkLsVnS2fyz9SYZ2B0PZ7O+PMDpGeGVUotzhdHBnlEI0K5bNDCLyCEg
 vMSjf9qvkZMAQW+xX/fDVSNloyJQ1yjBH6tlpMROKGUOVLwrfcUlZ7b2k
 lULJVmHtWrNpYpZKUL4qrvwFniotjE1A4bTwOFtwzP+wrZkhR+oI7mX/l
 4ZhRjOLA3wMCHKRqPONSfCxoBcaDL1hfPdAegFRqkTmRihwiAU6lj+/Py
 OUro33rA7X8yx2Ft/EwBsjNmp7Hf1Luc79ZzzC7kw31YBzEEe0pSGeMJv
 jrIw6n27eKXc3dxx4lYRc5OWkM4vWpyS0tZZ803AjnkN8se1QMOGMpzT0 w==;
X-CSE-ConnectionGUID: 7qj8ebiCS02qg55TpG0QGw==
X-CSE-MsgGUID: pZJ8uqrlS3ysTlizVfGKEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="31140465"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="31140465"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2024 03:41:30 -0700
X-CSE-ConnectionGUID: j2yFEY/ESYKn+GtPpRKcFQ==
X-CSE-MsgGUID: Glz8xPelTC+NO+pInYWajg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; d="scan'208";a="74778252"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 04 Oct 2024 03:41:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Oct 2024 13:41:23 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 01/14] lib/igt_draw: Use void* where appopriate
Date: Fri,  4 Oct 2024 13:41:08 +0300
Message-ID: <20241004104121.32750-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
References: <20241004104121.32750-1-ville.syrjala@linux.intel.com>
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

Use void* instead of uint32_t* when we don't care about the
element size.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_draw.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/igt_draw.c b/lib/igt_draw.c
index 97a7e6b375fb..3ebfaad6ef31 100644
--- a/lib/igt_draw.c
+++ b/lib/igt_draw.c
@@ -446,7 +446,7 @@ static void draw_rect_ptr_tiled(void *ptr, uint32_t stride, uint32_t tiling,
 static void draw_rect_mmap_cpu(int fd, struct buf_data *buf, struct rect *rect,
 			       uint32_t tiling, uint32_t swizzle, uint32_t color)
 {
-	uint32_t *ptr;
+	void *ptr;
 
 	gem_set_domain(fd, buf->handle, I915_GEM_DOMAIN_CPU,
 		       I915_GEM_DOMAIN_CPU);
@@ -481,7 +481,7 @@ static void draw_rect_mmap_cpu(int fd, struct buf_data *buf, struct rect *rect,
 static void draw_rect_mmap_gtt(int fd, struct buf_data *buf, struct rect *rect,
 			       uint32_t color)
 {
-	uint32_t *ptr;
+	void *ptr;
 
 	gem_set_domain(fd, buf->handle, I915_GEM_DOMAIN_GTT,
 		       I915_GEM_DOMAIN_GTT);
@@ -497,7 +497,7 @@ static void draw_rect_mmap_gtt(int fd, struct buf_data *buf, struct rect *rect,
 static void draw_rect_mmap_wc(int fd, struct buf_data *buf, struct rect *rect,
 			      uint32_t tiling, uint32_t swizzle, uint32_t color)
 {
-	uint32_t *ptr;
+	void *ptr;
 
 	if (is_i915_device(fd)) {
 		gem_set_domain(fd, buf->handle, I915_GEM_DOMAIN_GTT,
-- 
2.45.2

