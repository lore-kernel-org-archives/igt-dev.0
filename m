Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76055EA812D
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 15:24:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F6FA10E5AE;
	Tue, 10 Feb 2026 15:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oKzfok4H";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 458DC10E5AE
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 15:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770737094; x=1802273094;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KiwIybudED38lmPCX4RZ7cAGM0yU6qSNambbSRANmgg=;
 b=oKzfok4HIXS7UkGoKHva7ZonjE2Y0aoXFXc7ndinZGhTqnip6OTLP0NT
 rLY72HZ+EC+KmMwCBVD8GX8RMtec31wauaNHWKw/Rqxd5fY0Bn1NoywD/
 Oo4BEYDhsgIVRzNx+t/4KXq7brK8LLxbXrTrGUVEoyBwbiQcM68ZRI7Yy
 iL+v6WPdC1LAmqtwW202wryz9ejNVX0Gwisr+ye6DfbXo0a8QdCjSb1bS
 ++gADNZOKP7VHO11TQ0yL+BHMDJlIylP4z4h4s/3gJr3Rqt4/y3pyl00R
 AAaq4jRkzRkEIefLtyLZICa3DGzMvNxbWBgJyk2zw/kbkeNCH/q5tpq9K w==;
X-CSE-ConnectionGUID: AnBgm0ymSRS2ypjrA8AmSw==
X-CSE-MsgGUID: JgxXdSk9R1qrZ8fK+WQXsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71912095"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71912095"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 07:24:54 -0800
X-CSE-ConnectionGUID: 2NnpIYjtSXa5kz/JObiXQA==
X-CSE-MsgGUID: 2gWLcCBBR2CNGnGKHExSBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="212030353"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.246])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 07:24:51 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 08/11] lib/igt_kms: rename kmstest_get_vblank() param to
 crtc_index
Date: Tue, 10 Feb 2026 17:23:49 +0200
Message-ID: <9ddb1c251f69c933b453e8277be92bcfa3c8840c.1770736961.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770736961.git.jani.nikula@intel.com>
References: <cover.1770736961.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

No matter what the callers pass to kmstest_get_vblank(), it's treated as
a CRTC index, so name it accordingly.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c | 6 +++---
 lib/igt_kms.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 63fd8095c551..9e90ee8bc54f 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2452,19 +2452,19 @@ int kmstest_get_crtc_idx(drmModeRes *res, uint32_t crtc_id)
 /**
  * kmstest_get_vblank:
  * @fd: Opened drm file descriptor
- * @pipe: Display pipe
+ * @crtc_index: CRTC_index
  * @flags: Flags passed to drm_ioctl_wait_vblank
  *
  * Blocks or request a signal when a specified vblank event occurs
  *
  * Returns 0 on success or non-zero unsigned integer otherwise
  */
-unsigned int kmstest_get_vblank(int fd, int pipe, unsigned int flags)
+unsigned int kmstest_get_vblank(int fd, int crtc_index, unsigned int flags)
 {
 	union drm_wait_vblank vbl;
 
 	memset(&vbl, 0, sizeof(vbl));
-	vbl.request.type = DRM_VBLANK_RELATIVE | kmstest_get_vbl_flag(pipe) | flags;
+	vbl.request.type = DRM_VBLANK_RELATIVE | kmstest_get_vbl_flag(crtc_index) | flags;
 	if (drmIoctl(fd, DRM_IOCTL_WAIT_VBLANK, &vbl))
 		return 0;
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index d9b9c5c6351e..dedc3f88055b 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -293,7 +293,7 @@ void *kmstest_dumb_map_buffer(int fd, uint32_t handle, uint64_t size,
 void kmstest_dumb_destroy(int fd, uint32_t handle);
 void kmstest_wait_for_pageflip(int fd);
 void kmstest_wait_for_pageflip_timeout(int fd, uint64_t timeout_us);
-unsigned int kmstest_get_vblank(int fd, int pipe, unsigned int flags);
+unsigned int kmstest_get_vblank(int fd, int crtc_index, unsigned int flags);
 
 bool kms_has_vblank(int fd);
 
-- 
2.47.3

