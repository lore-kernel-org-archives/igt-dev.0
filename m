Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36B9D59D65
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 15:46:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF2B10E90E;
	Fri, 12 Dec 2025 15:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BGREuBfv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E44E10E908
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 15:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765554415; x=1797090415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jIWNp5EbrOv8EaiMfzCsB9vv2CIcxKB9NbzLWtZXDls=;
 b=BGREuBfv5rA+VKETV7ClLpzL7jfKh4Tpk5rptqGUmqlguD7IiRKuDG9o
 xIU4rotPIP8/K+caOMOt2puskJDR+e1eDmRHkB1Zebc70/cb+J9oFv4sk
 acYeVvjXinhOyIVRYfVC2QXuzsY3lnytmOdu8q6n/QTCjJxXTCyGiHeEW
 5SdbE6izTerstoCc9XkqLZEpwDFA1alnDr96sixBveggHtDHlnm0Q+W9r
 4WWjepaaJuHsMpZzYQI9eiqFyreB+XxPF/13THSon06gRdC0JUVpHmIV9
 Hq7ZgzFwXd0GsUoWBTnHH+Hhy84bK//XceIX7cSFmz9Uxffava+UrG0D3 A==;
X-CSE-ConnectionGUID: DA9vAdZ7SIG5/cMmXhYbWg==
X-CSE-MsgGUID: 4IZ8uaCHQC2M38CYPHIMnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="70141999"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="70141999"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 07:46:55 -0800
X-CSE-ConnectionGUID: oXr+uxqmT5O1k05WOZ59hA==
X-CSE-MsgGUID: zWZZtCpdSvSE60V1k6HVdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="220491054"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.152])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 07:46:54 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v2 06/10] lib/kms: Remove tall tales about 'pipe' in
 DRM_IOCTL_WAIT_VBLANK
Date: Fri, 12 Dec 2025 17:46:22 +0200
Message-ID: <20251212154626.29471-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251212154626.29471-1-ville.syrjala@linux.intel.com>
References: <20251212154626.29471-1-ville.syrjala@linux.intel.com>
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

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
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

