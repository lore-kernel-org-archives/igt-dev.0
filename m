Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E660EFD530E
	for <igt-dev@archiver.kernel.org>; Fri, 27 Feb 2026 08:07:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E9810EA53;
	Fri, 27 Feb 2026 08:07:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jSHSny/9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C6E10EA54
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Feb 2026 08:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772179648; x=1803715648;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Rti6XkQdnp9AVvO4p69AnK8dlHJ8MXJ5P2PNd3bm6HE=;
 b=jSHSny/9jsGxOVe9LfkBmQfHgTdBvcyo25K3XwK+fRDVeKgv9WocTDTo
 VOzgZsoyg0SCFtPEYde4U7WUf01xwQ/KNk8+NYHhjSXlwDAZyI2V4UmvU
 gRWCLqCkdcvyGnW05FQL/tJVJRy7vS5MaWNxFS16Moha114zvy/aImIbp
 TJq+LPrTeT6BonyhrpR1DZU/2qYH2foRIRcCnNcC6PCF+nJvg/ZhckVs9
 eIM/nx9UZkrvWeAkzFMgN4onhFhFGCO5yd9rBHWbJTKUJp3R3yW8HLiQg
 Y5SVXYxJCrKmJn7BUUuqtQZqJnV9KgHeFKdSPor8HDFm7TqsdegmF4NeZ w==;
X-CSE-ConnectionGUID: wVXKEVOkRkGwoDO8b0K2Kw==
X-CSE-MsgGUID: gqek3lEFQou6cFQJHfDZEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="75859408"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="75859408"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:07:27 -0800
X-CSE-ConnectionGUID: M1rFEtprR2mPiPnlaZ1dbA==
X-CSE-MsgGUID: 6+w/lkXsRnehs75dnUCg6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; d="scan'208";a="216731148"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.74])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2026 00:07:26 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 07/17] tests/vmwgfx/vmw_prime: Replace
 igt_pipe_crc_new() with igt_crtc_crc_new()
Date: Fri, 27 Feb 2026 10:06:43 +0200
Message-ID: <20260227080653.30389-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260227080653.30389-1-ville.syrjala@linux.intel.com>
References: <20260227080653.30389-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

vmw_prime wasn't caught by the earlier igt_crtc_crc_new() conversions
for some reason. Clean it up.

 #include "scripts/iterators.cocci"

@@
igt_crtc_t *CRTC;
@@
- igt_pipe_crc_new(..., CRTC->pipe
+ igt_crtc_crc_new(CRTC
  ,...)

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/vmwgfx/vmw_prime.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/vmwgfx/vmw_prime.c b/tests/vmwgfx/vmw_prime.c
index 0640b2476dc8..c32ae268d0b7 100644
--- a/tests/vmwgfx/vmw_prime.c
+++ b/tests/vmwgfx/vmw_prime.c
@@ -300,7 +300,7 @@ static void draw_triangle_3d(struct gpu_process_t *gpu, uint32_t draw_flags)
 		gpu->crtc = crtc;
 
 		prepare_crtc(gpu);
-		pipe_crc = igt_pipe_crc_new(gpu->mdevice.drm_fd, crtc->pipe,
+		pipe_crc = igt_crtc_crc_new(crtc,
 					    IGT_PIPE_CRC_SOURCE_AUTO);
 		igt_pipe_crc_collect_crc(pipe_crc, &blank_crc);
 
@@ -367,7 +367,7 @@ static void draw_dumb_buffer(struct gpu_process_t *gpu)
 		gpu->crtc = crtc;
 
 		prepare_crtc_surface(gpu);
-		pipe_crc = igt_pipe_crc_new(gpu->mdevice.drm_fd, crtc->pipe,
+		pipe_crc = igt_crtc_crc_new(crtc,
 					    IGT_PIPE_CRC_SOURCE_AUTO);
 		igt_pipe_crc_collect_crc(pipe_crc, &blank_crc);
 
-- 
2.52.0

