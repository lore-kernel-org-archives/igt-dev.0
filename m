Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCB2D609DE
	for <igt-dev@archiver.kernel.org>; Tue, 16 Dec 2025 18:45:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4B310E56B;
	Tue, 16 Dec 2025 18:45:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RlASy69Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A07210E2DD
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Dec 2025 18:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765910719; x=1797446719;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UQ4HeaH4s0UXhAWmTiGOlODJphe0kfClo4WtotGzABw=;
 b=RlASy69QhSfHDZVT9Mrxgy5+18dBcZUkpyapQq96fBK18mNT7F6CCQwq
 glDoaog0dsZ9tcgtFqn7m5JZA8/3IPnfDmLEOkNsE7ucHCjHwYvRi/0fd
 JDhkKDFkCQh0mvyfvwH8gIu7ivIB9evI63yEKvxpFplxRTNIbfY0WjO6Y
 Zsgvdaaz0KHy7oUY5qJKUdvkzTOBrEjtp9NjmIN+RCYAKQECst72uh+VD
 zwjC3pLxQVtgmCeXFu/6XrQLoOAdrAGzgjMYuhPTjPbIi2rC7vS3c/rGZ
 5tBJedC3hC7JuX1avQGLfFtKpZM+BC04afHkp8yCw29r93AO2LHQI6ZI6 g==;
X-CSE-ConnectionGUID: wu55fRQOQMGGvBJUBjsiUA==
X-CSE-MsgGUID: 4AzCj24dRGuVG9Cu/ITATg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="70416035"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="70416035"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 10:45:19 -0800
X-CSE-ConnectionGUID: ekcvXkWhTWGOBEbfxqn41Q==
X-CSE-MsgGUID: VktmtZD7QI+zMkRZ4NgQLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; d="scan'208";a="198148622"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa008-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 10:45:18 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 6/7] intel-ci: Add NVL display blocklist
Date: Wed, 17 Dec 2025 00:22:14 +0530
Message-Id: <20251216185215.1281390-7-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251216185215.1281390-1-swati2.sharma@intel.com>
References: <20251216185215.1281390-1-swati2.sharma@intel.com>
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

Introduce display blocklist for the NVL platform containing
NVL-specific display test exclusions.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel-ci/xe.nvl.display.blocklist.txt | 128 ++++++++++++++++++++
 1 file changed, 128 insertions(+)
 create mode 100644 tests/intel-ci/xe.nvl.display.blocklist.txt

diff --git a/tests/intel-ci/xe.nvl.display.blocklist.txt b/tests/intel-ci/xe.nvl.display.blocklist.txt
new file mode 100644
index 000000000..38ca3a654
--- /dev/null
+++ b/tests/intel-ci/xe.nvl.display.blocklist.txt
@@ -0,0 +1,128 @@
+##############################################################################
+# non-KMS tests
+##############################################################################
+igt@(?!.*kms|testdisplay|.*display-vs-wb-transient|fbdev)(.*)
+##############################################################################
+# Valid skip: Y and Yf-Tiling not supported
+##############################################################################
+igt@kms_(big_fb|ccs|rotation_crc)@.*(y|yf)-tiled.*
+igt@kms_(plane_lowres|frontbuffer_tracking|plane_multiple)@.*tiling-y.*
+igt@kms_flip_scaled_crc@.*(yf|y)tile.*
+igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
+igt@kms_pipe_stress@stress-xrgb8888-(y|yf)tiled
+##############################################################################
+# Valid skip: Test skip due to hybrid config requirement
+##############################################################################
+igt@kms_addfb_basic@invalid-smem-bo-on-discrete
+##############################################################################
+# Valid skip: 90/270 rotation not supported
+##############################################################################
+igt@kms_big_fb@.*rotate-(90|270)
+igt@kms_rotation_crc@.*rotation-(90|270).*
+igt@kms_rotation_crc@bad-(pixel-format|tiling)
+##############################################################################
+# Valid skip: Mutable zpos not supported
+##############################################################################
+igt@kms_atomic@plane-primary-overlay-mutable-zpos
+##############################################################################
+# Valid skip: Cursor size = 32 and Cursor size > 256
+# are not supported
+##############################################################################
+igt@kms_cursor_crc@.*-max-size
+igt@kms_cursor_crc@.*-(32x10|32x32|512x).*
+igt@kms_cursor_crc@cursor.*(21|42|85)
+##############################################################################
+# Valid skip: !cursor_slowpath(&display, i)
+##############################################################################
+igt@kms_cursor_legacy@(short|basic)-busy-flip-before.*
+##############################################################################
+# Valid skip: Use of a single CRTC for two connectors
+##############################################################################
+igt@kms_setmode@basic-clone-single-crtc
+##############################################################################
+# Valid skip: Connector uses CRTC that is incompatible
+# with the connector
+##############################################################################
+igt@kms_setmode@invalid-clone-exclusive-crtc
+##############################################################################
+# Valid skip: Requires TV connector
+##############################################################################
+igt@kms_tv_load_detect@load-detect
+##############################################################################
+# Valid skip: WB feature not enabled
+##############################################################################
+igt@kms_writeback@.*
+##############################################################################
+# Valid skip: Scaling mode none not supported
+##############################################################################
+igt@kms_scaling_modes@scaling-mode-none
+##############################################################################
+# Valid skip: DG2/MTL/BMG specific CCS tests
+##############################################################################
+igt@kms_ccs@.*-dg2-.*
+igt@kms_ccs@.*-mtl-.*
+igt@kms_flip_scaled_crc@.*dg2rcccs.*
+igt@kms_ccs@.*4-tiled-bmg-ccs
+##############################################################################
+# Valid skip: Valid for display ver < 13
+##############################################################################
+igt@kms_psr2_su@.*
+##############################################################################
+# Valid skip: Downscaling factor not supported
+##############################################################################
+igt@kms_plane_scaling@.*downscale-factor-0-25.*
+##############################################################################
+# Valid skip: Downscaling not supported on second plane MTLP+
+##############################################################################
+igt@kms_plane_scaling@planes-downscale-factor-0-(5|75)$
+igt@kms_plane_scaling@planes-.*upscale-.*downscale.*
+##############################################################################
+# Valid skip: Simulation specific
+##############################################################################
+igt@kms_pm_dc@dc3co-vpb-simulation
+igt@kms_simulation_hpd@sim-hpd
+##############################################################################
+# Valid skip: Mei interface not supported MTL+
+##############################################################################
+igt@kms_content_protection@mei-interface
+##############################################################################
+# Valid skip: VGA subtests on chamelium are expected skips for PTL+
+##############################################################################
+igt@kms_chamelium.*@.*(vga).*
+##############################################################################
+# Valid skip: Use either of connected/non-connected kms_bw
+##############################################################################
+igt@kms_bw@linear-tiling-.*-display.*
+##############################################################################
+# Valid skip: Horizontal flip is not supported with tile4 surface formats
+##############################################################################
+igt@kms_big_fb@4-tiled.*hflip.*
+igt@kms_rotation_crc@primary-4-tiled-reflect-x.*
+##############################################################################
+# Valid skip: X tile defeatured
+##############################################################################
+igt@kms_(plane_lowres|plane_multiple|rotation_crc|big_fb|flip_scaled_crc)@.*(x-tile|xtile|tiling-x).*
+igt@kms_pipe_stress@stress-xrgb8888-xtiled
+##############################################################################
+# Valid skip: DRRS not supported on LNL+
+##############################################################################
+igt@kms_vrr@seamless-rr-switch-drrs
+igt@kms_vrr@seamless-rr-switch-vrr
+igt@kms_dirtyfb@drrs-dirtyfb-ioctl
+igt@kms_frontbuffer_tracking@.*drrs.*
+##############################################################################
+# Valid skip: PTL+(igfx), UJ not supported
+# Bspec: 69556
+##############################################################################
+igt@kms_joiner@.*ultra-joiner.*
+##############################################################################
+# Valid skip: Display 12+ is not supporting FBC with PSR2
+# in case of selective update.
+# Recommendation is to keep this combination disabled
+# Bspec: 50422 HSD: 14010260002
+# *PR selective update + FBC is not valid.
+# *PR full frame update/PSR1 + FBC are valid.
+##############################################################################
+igt@kms_psr@fbc-psr2-.*
+igt@kms_psr2_sf@fbc-(psr2|pr)-.*
+##############################################################################
-- 
2.25.1

