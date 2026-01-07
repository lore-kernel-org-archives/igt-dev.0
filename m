Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7021CF6C1D
	for <igt-dev@archiver.kernel.org>; Wed,  7 Jan 2026 09:27:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79DA810E583;
	Wed,  7 Jan 2026 09:27:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gHG3bLMQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954B210E583
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jan 2026 09:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767778044; x=1799314044;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dlalpPK0mlDBmOhkYwArvUGY9KyfFC581rlMKr4A1qA=;
 b=gHG3bLMQ14Hs63ogDp7I0A2N/T0nxDaR6kfMVq+1QeLIiHxYv8ZLQVen
 9zUW4QZMI9Tug88YCj93WN9nRwdWUm4Xox+RRtL0Tev56gK6ULaiqokG6
 kVhviJq+Rdhco7BU0TFHo4A6zXVRCuTlZLTsV+4pjz6lT5kviQhuLA1mg
 msd8Kw5g701s6GRQSotOeeW5z2EPr1pA9HL2AQCbD4i01N6kom8orTkSN
 xgTzjZKrwZ4+TGvwjPhaoSgj+Y5Vq1TSNCofNLF9DK1X5tSi6okJ1qiLQ
 /tnLGJfvg6qQigzMuRrizW6FAX2jzdushMeo72bCZK4bnDv8LyYNMvRgf A==;
X-CSE-ConnectionGUID: KYUSWENoRLuww+91K/S0vw==
X-CSE-MsgGUID: EsyajFe1TjmBDa5f7RIJtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="68337808"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="68337808"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2026 01:27:24 -0800
X-CSE-ConnectionGUID: u5ayr7DeT+evzn142jCbRw==
X-CSE-MsgGUID: U6WZqE8oQGug25HzRwnDjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; d="scan'208";a="207412582"
Received: from linux-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.34.115])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 01:27:22 -0800
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>, Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t,v2 6/7] intel-ci: Add NVL display blocklist
Date: Wed,  7 Jan 2026 15:05:34 +0530
Message-Id: <20260107093535.70116-7-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260107093535.70116-1-swati2.sharma@intel.com>
References: <20260107093535.70116-1-swati2.sharma@intel.com>
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

v2: add package-g7 test (JP)

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
---
 tests/intel-ci/xe.nvl.display.blocklist.txt | 132 ++++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100644 tests/intel-ci/xe.nvl.display.blocklist.txt

diff --git a/tests/intel-ci/xe.nvl.display.blocklist.txt b/tests/intel-ci/xe.nvl.display.blocklist.txt
new file mode 100644
index 000000000..41d9eed3e
--- /dev/null
+++ b/tests/intel-ci/xe.nvl.display.blocklist.txt
@@ -0,0 +1,132 @@
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
+# Valid skip: Not supported on igfx
+##############################################################################
+igt@kms_pm_rpm@package-g7
+##############################################################################
-- 
2.25.1

