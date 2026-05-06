Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB51BCD342C
	for <igt-dev@archiver.kernel.org>; Wed,  6 May 2026 08:47:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F79410E522;
	Wed,  6 May 2026 08:47:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BHbaxSHx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF64210E522
 for <igt-dev@lists.freedesktop.org>; Wed,  6 May 2026 08:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778057237; x=1809593237;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4hgJ5NJ6+m/8trO7GCKVtYZ0eI5nQY0I0i24pWUjxqg=;
 b=BHbaxSHxVG3879Het4WTY6iQuWQobKoHvNRMmh/aIILzUk+XMqGDAq4K
 l10as8E+Ou+MhUOvP0ISD7USBmv6vdwLECjgQTH8nZIUGXso7w8OoWo9J
 5V+3qtJjY8ZR+zcF+iRdwgN4nISLxXjGiKaATxpon59cP0Fvfh8oFRury
 L1pEwMq3p2WR/DBm36XBIBtCPRRh5CCmMr+y7CYOFI9KDgVt04nCM1Aei
 MB0RLNIkJX96VRIFPUZgB2mIKW2uzGvmU5XkSUx5Qcyogr/y+w3+bjR3K
 AN9h6BkGNEXV91aLLKZz96rok8Wny8z3FvP+OKrsLHEY15esHWFMgjcZ0 A==;
X-CSE-ConnectionGUID: +nH79XtnScamgmYl/B+p1Q==
X-CSE-MsgGUID: fy1yTdPVTouxo2yI+7hkBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="82585314"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="82585314"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2026 01:47:17 -0700
X-CSE-ConnectionGUID: gDHfW41VSiaSn+rSP52Pkg==
X-CSE-MsgGUID: QD4ONMSvRMOpKMSHzHVR8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; d="scan'208";a="266434273"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa002.jf.intel.com with ESMTP; 06 May 2026 01:47:14 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t 0/1] tests/fbdev: skip non-zero pans on mixed-size
 multi-display topologies
Date: Wed,  6 May 2026 13:52:41 +0530
Message-Id: <20260506082242.2605199-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
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

This series updates the fbdev pan test so it aligns with how DRM fbdev
emulation computes framebuffer sizing and applies panning across active
outputs.

Background:

1. fbdev virtual dimensions are derived from the backing surface,
   not directly from a single visible mode.
	- In the DRM helper path, __drm_fb_helper_find_sizes() computes:
		- surface_width/surface_height as the maximum active scanout
		  footprint across modesets (mode size plus CRTC position)
		- fb_width/fb_height as the minimum visible fbdev size across
		  active outputs

2. The fbdev backing object is allocated from surface_width/surface_height
   in the fbdev_probe path, then:
	- __fill_var() sets xres_virtual/yres_virtual from
	 fb->width/fb->height (the backing surface)
	- drm_fb_helper_fill_var() sets xres/yres from fb_width/fb_height
	  (visible fbdev size)

3. Therefore, xres_virtual/yres_virtual reflect the largest active display layout
   (plus vertical overalloc if specified through CONFIG_DRM_FBDEV_OVERALLOC),
   while xres/yres reflects a smaller visible geometry.

4. Panning semantics remain global:
	pan_set() -> pan_display_atomic() -> drm_fb_helper_pan_display()
   applies one offset to all active CRTCs.

5. On mixed-size multi-display topologies, this can make non-zero pan requests
   fail even when fbdev var info appears to show pan room, because one CRTC(larger)
   may violate source bounds while another does not.

Let's take the example of a dual display setup of 1920x1200 and 3840x2160.

Based on what we know we end up with the following values in the IGT.

	xres=1920 yres=1200 xres_virtual=3840 yres_virtual=2160

For the "Jump to opposite end of virtual screen" case, we end up with the following
panning values (though it does not matter)
	
	xoffset=1920 yoffset=960
	
Since the frame buffer is also of dimension of 3840x2160, there is no real room for
panning (even a single step) and therefore the following
check in drm_atomic_plane_check() fails

if (new_plane_state->src_w > fb_width ||
            new_plane_state->src_x > fb_width - new_plane_state->src_w ||
            new_plane_state->src_h > fb_height ||
            new_plane_state->src_y > fb_height - new_plane_state->src_h) 
			
Leading to -ENOSPC.

[drm:drm_atomic_check_only] [PLANE:203:plane 1B] invalid source coordinates 3840.000000x2160.000000+1920.000000+960.000000 (fb 3840x2160)

Motivation for the change

1. Avoid false failures in IGT where non-zero pan is marked as expected success
   but cannot be satisfied for all active outputs. [1]
2. Keep useful pan coverage where non-zero panning is actually valid
   (e.g. single display with CONFIG_DRM_FBDEV_OVERALLOC = 300).
   Therefore, a fbdev-only hueristics attempted by [2] is too coarse.
3. Use DRM APIs to find out if the test setup have mixed size multiple displays.
   (I don't like the fact that I have to use drm APIs to achieve this but I
    could not find anything in the fbdev ABI that could give me the same information.)
   
[1] https://intel-gfx-ci.01.org/tree/intel-xe/xe-4983-5521e3e7a175fef7d7a35a4b8fd17ca473be8e7e/re-lnl-8/igt@fbdev@pan.html
[2] https://patchwork.freedesktop.org/series/152733/

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Cc: Karthik B S <karthik.b.s@intel.com>

Chaitanya Kumar Borah (1):
  tests/fbdev: skip non-zero pan on mixed-size multi-display

 tests/fbdev.c | 100 ++++++++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 92 insertions(+), 8 deletions(-)

-- 
2.25.1

