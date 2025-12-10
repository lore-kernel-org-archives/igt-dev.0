Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDDDD2CE17
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 09:39:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 192DF10E6C9;
	Wed, 10 Dec 2025 09:39:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="auIkSGnd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72FAF10E6C7
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 09:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765359571; x=1796895571;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Dt0lPlw/TE/mQD9IG+31EzwL4ZC9UpShyTxBqydid9M=;
 b=auIkSGndVwwOAp/ZKp5BkeMCjDdZIBkC2kgNztO2Y01gU2maMDnDxT42
 E9DFbAODCcyC8hkQCnbDreaXaP4FPrIFSecGx3DrWJCT6u+hwyLhnvpKi
 rbV4QgFMfidLHJ+eylCxNSS7ryndGnkbwoWt/Y3D3EfL7fyQHw0kklbIc
 KMXWo+b5h9uuDRUNdJCXoH/9LWooQZLGuKUO8yaHqxFs+5cLOJK55/bNS
 eg4ULVZBaS8ZE/4CJpL8N8yB8oU7YPvH/Sni0AN0c9n+7HxmuPsWjCCPR
 6ezX4MM4SeBPuH47ma0eEI4pSg61BcCpLhsD+F8SqmajLL4+ah0NJdUO+ Q==;
X-CSE-ConnectionGUID: DBfx0Q4DT168SXiYQDkpIg==
X-CSE-MsgGUID: 5YQzySGzSD+ZQ/h5vfn5vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="92804434"
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="92804434"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 01:39:31 -0800
X-CSE-ConnectionGUID: 7idy6v0zTD215IPHz6ca5Q==
X-CSE-MsgGUID: bnVwSTRPQ7io7skW+UWYEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,263,1758610800"; d="scan'208";a="196469685"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.21])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 01:39:30 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 06/10] lib/kms: Remove tall tales about 'pipe' in
 DRM_IOCTL_WAIT_VBLANK
Date: Wed, 10 Dec 2025 11:38:59 +0200
Message-ID: <20251210093903.15934-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251210093903.15934-1-ville.syrjala@linux.intel.com>
References: <20251210093903.15934-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

The igt_wait_for_vblank_count() docs are talking nonsense about
DRM_IOCTL_WAIT_VBLANK taking some kind of 'pipe' parameter.
What it actually takes is the original (short-sighted)
DRM_VBLANK_SECONDARY flag, and the later extension in the
form of DRM_VBLANK_HIGH_CRTC_MASK.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 951144bae955..3e7543ae1d88 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5827,15 +5827,6 @@ static int __igt_vblank_wait(int drm_fd, int crtc_offset, int count)
  * @count: Number of vblanks to wait on
  *
  * Waits for a given number of vertical blank intervals
- *
- * In DRM, 'Pipe', as understood by DRM_IOCTL_WAIT_VBLANK,
- * is actually an offset of crtc in drmModeRes.crtcs
- * and it has nothing to do with a hardware concept of a pipe.
- * They can match but don't have to in case of DRM lease or
- * non-contiguous pipes.
- *
- * To make thing clear we are calling DRM_IOCTL_WAIT_VBLANK's 'pipe'
- * a crtc_offset.
  */
 void igt_wait_for_vblank_count(int drm_fd, int crtc_offset, int count)
 {
-- 
2.51.2

