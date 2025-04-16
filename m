Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C208CC369C2
	for <igt-dev@archiver.kernel.org>; Wed, 16 Apr 2025 10:27:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A25010E8C4;
	Wed, 16 Apr 2025 10:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m7Q5fckN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4F910E8C4
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Apr 2025 10:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744799264; x=1776335264;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ebGsFzwJqaihlJ24N7rEdvzpHRIRwh9uWpPWUN0DDyM=;
 b=m7Q5fckNo7pv6U/Uw8Ke5Uc3xTyo13vjkLgkFjERFANj+Z8D2b1gEZaO
 Ivv/+SCe3GA9C3BpXJiHRMf3Q5b7S2/QMDWl8rUBrv7P6sY8gjqTJ9/un
 vxJZXhTR1TmaBgm5YHDvtbmbJAp6gAxEu8ogAO3HY/bdw7nZRE7KKj6dE
 Lsd7CSWsowD575vbUt04jhrwh4ZgaPvjLg6GJKx1cTWIz5ShxNdLFk/Jc
 BDGP7niqbOxLyjWoBxA1Vh5CHmEA2opdCYDG8ffL09eKShVBhATXVnaa2
 n2+mgU3ImNvknkyxafmsUlq6p1bxP4cI/prqcD/lDwfZ7BGGPr7DyX1TM A==;
X-CSE-ConnectionGUID: rc7EBbDzQ2KlV3eQUDgEqw==
X-CSE-MsgGUID: X0qIe0ufSAiK4VrmIR/BRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46229304"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="46229304"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 03:27:43 -0700
X-CSE-ConnectionGUID: v6O9LdXSRTWb67I409Hchw==
X-CSE-MsgGUID: wlRRw8gDQpmLQWfOsfXZMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; d="scan'208";a="131334159"
Received: from karthik-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.238.68])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 03:27:40 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@intel.com, jari.tahvanainen@intel.com,
 aditya.chauhan@intel.com, Karthik B S <karthik.b.s@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel-ci: Add platform blocklists to enable
 platform testlist creation
Date: Wed, 16 Apr 2025 15:58:05 +0530
Message-ID: <20250416102806.1362020-2-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416102806.1362020-1-karthik.b.s@intel.com>
References: <20250416102806.1362020-1-karthik.b.s@intel.com>
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

Add BMG/LNL platform blocklists to enable platform testlist creation.
Blocklists are defining test cases that are not supported by LNL/BMG platforms.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Jari Tahvanainen <jari.tahvanainen@intel.com>
Signed-off-by: Aditya Chauhan <aditya.chauhan@intel.com>
---
 tests/intel-ci/xe.bmg.core.blocklist.txt    |  78 +++++++++
 tests/intel-ci/xe.bmg.display.blocklist.txt | 158 ++++++++++++++++++
 tests/intel-ci/xe.lnl.core.blocklist.txt    |  85 ++++++++++
 tests/intel-ci/xe.lnl.display.blocklist.txt | 171 ++++++++++++++++++++
 4 files changed, 492 insertions(+)
 create mode 100644 tests/intel-ci/xe.bmg.core.blocklist.txt
 create mode 100644 tests/intel-ci/xe.bmg.display.blocklist.txt
 create mode 100644 tests/intel-ci/xe.lnl.core.blocklist.txt
 create mode 100644 tests/intel-ci/xe.lnl.display.blocklist.txt

diff --git a/tests/intel-ci/xe.bmg.core.blocklist.txt b/tests/intel-ci/xe.bmg.core.blocklist.txt
new file mode 100644
index 000000000..a43e43a62
--- /dev/null
+++ b/tests/intel-ci/xe.bmg.core.blocklist.txt
@@ -0,0 +1,78 @@
+##################################################################
+# Tests NA for Native
+##################################################################
+igt@.*iov.*
+##################################################################
+# KMS - Display related tests
+# Other Display specific tests
+##################################################################
+igt@.*kms.*
+igt@testdisplay
+igt@xe_pat@display-vs-wb-transient
+igt@fbdev@.*
+##################################################################
+# Expected Skip for xe2+ platforms
+##################################################################
+igt@xe_pat@pat-index-xehpc
+igt@xe_pat@pat-index-xelp
+igt@xe_pat@pat-index-xelpg
+igt@xe_media_fill@media-fill
+##################################################################
+# Expected skip on xe1 & xe2 Platforms
+##################################################################
+igt@xe_pat@pat-index-xe3p-xpc
+##################################################################
+# Expected skip on single card machines
+##################################################################
+igt@xe_peer2peer@.*
+igt@xe_query@multigpu-query-.*
+igt@xe_create@multigpu-create-massive-size
+igt@xe_exec_basic@.*multigpu.*
+##################################################################
+# Expected skip - small bar not supported
+##################################################################
+igt@xe_mmap@small-bar
+##################################################################
+# Expected skip: CPU host pcieport not supported
+##################################################################
+igt@xe_pm@.*d3cold.*
+##################################################################
+# Expected behavior - CCS mode enabled only for platforms
+# which have more than 1 COMPUTE ENGINE instance per tile.
+##################################################################
+igt@xe_compute@ccs-mode-basic
+##################################################################
+# Expected skip as tests not applicable for the platform
+##################################################################
+igt@xe_vm@.*export.*
+##################################################################
+# Tests not applicable for the platform
+##################################################################
+igt@xe_exec_multi_queue@.*
+igt@xe_evict@.*multi(-)?queue.*
+igt@.*@.*-multi_queue
+igt@.*@.*multi-queue.*
+##################################################################
+# Expected skips, Kernel support not available
+##################################################################
+igt@xe_eudebug@.*
+igt@xe_eudebug_online@.*
+igt@xe_exec_sip@.*
+igt@xe_exec_sip_eudebug@.*
+igt@xe_live_ktest@xe_eudebug
+##################################################################
+# Expected Skip as per the current behaviour
+##################################################################
+igt@xe_oa@oa-tlb-invalidate
+igt@xe_oa@unprivileged-single-ctx-counters
+##################################################################
+# Temporarily blocking the tests until we have
+# support for exhaustive eviction
+##################################################################
+igt@xe_evict@evict-(beng-)?cm-threads-large$
+igt@xe_evict@evict-(beng-)?mixed-many-threads-large$
+igt@xe_evict@evict-(beng-)?mixed-many-threads-small$
+igt@xe_evict@evict-(beng-)?mixed-threads-large$
+igt@xe_evict@evict-(beng-)?threads-large$
+igt@xe_evict@evict-(beng-)?large-multi-vm-cm$
+##################################################################
diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/xe.bmg.display.blocklist.txt
new file mode 100644
index 000000000..f145d6c0d
--- /dev/null
+++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
@@ -0,0 +1,158 @@
+#########################################
+# non-KMS tests
+#########################################
+igt@(?!.*kms|testdisplay|.*display-vs-wb-transient)(.*)
+
+#########################################
+# Valid skip :- Y and Yf-Tiling are not supported
+#########################################
+igt@kms_(big_fb|ccs|rotation_crc)@.*(y|yf)-(tiled|tile).*
+igt@kms_(plane_lowres|frontbuffer_tracking|plane_multiple)@.*tiling-y.*
+igt@kms_flip_scaled_crc@.*(yf|y)tile.*
+igt@kms_async_flips@invalid-async-flip
+igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
+#########################################
+# Valid skip :- 90/270 rotation is not supported
+##########################################
+igt@kms_big_fb@.*rotate-(90|270)
+igt@kms_rotation_crc@.*rotation-(90|270)
+igt@kms_rotation_crc@bad-(pixel-format|tiling)
+igt@kms_rotation_crc@sprite-rotation-90-pos-100-0
+##########################################
+# Valid skip :- Mutable zpos is not supported
+##########################################
+igt@kms_atomic@plane-primary-overlay-mutable-zpos
+##########################################
+# Valid skip :- Requires TV connector not present on BMG
+##########################################
+igt@kms_tv_load_detect@load-detect
+##########################################
+# Valid skip :- Scaling mode none is not supported
+##########################################
+igt@kms_scaling_modes@scaling-mode-none
+##########################################
+# Valid skip :- Valid for display ver > 13
+##########################################
+igt@kms_psr2_su@.*
+##########################################
+# Valid skip :-  Cursor sizes of 32 and greater than 256 are not supported
+##########################################
+igt@kms_cursor_crc@.*-max-size
+igt@kms_cursor_crc@.*-(32x10|32x32|512x)
+##########################################
+# Valid skip :- Downscaling factor is not supported
+##########################################
+igt@kms_plane_scaling@.*downscale-factor-0-25.*
+igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-(5|75)
+igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-(5|75)
+##########################################
+# Valid skip :- Downscaling is not supported on second plane MTL+
+##########################################
+igt@kms_plane_scaling@planes-downscale-factor-0-(5|75)$
+igt@kms_plane_scaling@planes-.*upscale-.*downscale
+##########################################
+# Valid skip :- Unsupported cursor size
+##########################################
+igt@kms_cursor_crc@.*64x21
+igt@kms_cursor_crc@.*128x42
+igt@kms_cursor_crc@.*256x85
+igt@kms_cursor_crc@cursor-(offscreen|onscreen|random|rapid-movement|sliding)-512x(512|170)
+##########################################
+# Valid skip as BMG doesn't have eDP supported
+##########################################
+igt@kms_vrr@seamless-rr-switch-vrr
+#########################################
+# no VGA connectors in BMG
+#########################################
+igt@.*chamelium.*vga.*
+##########################################
+# Expected skip as GSC not present in BMG
+##########################################
+igt@kms_content_protection@content-type-change
+igt@kms_content_protection@lic-type-1
+igt@kms_content_protection@type1
+#########################################
+# Expected skip as BMG doesn't have PORT_A/B
+#########################################
+igt@kms_pm_rpm@modeset-lpsp
+igt@kms_pm_rpm@modeset-lpsp-stress
+igt@kms_pm_rpm@dpms-mode-unset-lpsp
+igt@kms_pm_rpm@dpms-lpsp
+igt@kms_pm_lpsp@kms-lpsp
+igt@kms_pm_rpm@modeset-lpsp-stress-no-wait
+#########################################
+# Expected Skip : flat ccs has only one buffer
+#########################################
+igt@kms_getfb@getfb-reject-ccs
+#########################################
+# Expected skip for graphics ver >= 20
+#########################################
+igt@kms_getfb@getfb2-accept-ccs
+##########################################
+# Valid skip :- Feature is not enabled on kernel
+##########################################
+igt@kms_writeback@.*
+##########################################
+# Valid skip :- dc6 is not supported by dgfx
+#########################################
+igt@kms_pm_dc@deep-pkgc
+igt@kms_pm_dc@dc6-dpms
+
+##########################################
+# Valid skip :- DG2 & MTL specific
+##########################################
+igt@kms_ccs@.*-dg2-.*
+igt@kms_ccs@.*-mtl-.*
+igt@kms_flip_scaled_crc@.*dg2rcccs.*
+##########################################
+# Valid skip :- Simulation specific
+##########################################
+igt@kms_pm_dc@dc3co-vpb-simulation
+igt@kms_simulation_hpd@sim-hpd
+#########################################
+# Chamelium v1 HDMI receiver doesn't support 4k
+#########################################
+igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k
+#########################################
+# Valid skip on non-hybrid configuration
+#########################################
+igt@kms_addfb_basic@invalid-smem-bo-on-discrete
+#########################################
+# crc-random cases are resource intensive
+#########################################
+igt@.*chamelium.*random.*
+
+##########################################
+# Valid skip :- cursor moving doesn't take slowpath
+##########################################
+igt@kms_cursor_legacy@(short|basic)-busy-flip-before
+igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-(transitions|transitions-varying-size)
+igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle
+igt@kms_cursor_legacy@basic-busy-flip-before-cursor-(atomic|legacy|varying-size)
+##########################################
+# Valid skip :- Use of a single CRTC for two connectors
+##########################################
+igt@kms_setmode@basic-clone-single-crtc
+##########################################
+# Valid skip :- Connector uses CRTC that is incompatible
+#		with the connector
+##########################################
+igt@kms_setmode@invalid-clone-exclusive-crtc
+##########################################
+# Valid skip for display ver < 20
+##########################################
+igt@kms_frontbuffer_tracking@plane-fbc-rte
+#########################################
+Unsupported for platform with Wa_16023588340
+#########################################
+igt@kms.*fbc.*
+#########################################
+# Use either of linear-tiling or
+# connected-linear-tiling
+#########################################
+igt@kms_bw@linear-tiling-.*-display.*
+#########################################
+# Linear + hflip combination is not supported on BMG
+#########################################
+igt@kms_big_fb@linear-max-hw-stride.*hflip
+#########################################
diff --git a/tests/intel-ci/xe.lnl.core.blocklist.txt b/tests/intel-ci/xe.lnl.core.blocklist.txt
new file mode 100644
index 000000000..1e69170d8
--- /dev/null
+++ b/tests/intel-ci/xe.lnl.core.blocklist.txt
@@ -0,0 +1,85 @@
+##################################################################
+# Tests NA for Native
+##################################################################
+igt@.*iov.*
+##################################################################
+# KMS - Display related tests
+# Other Display specific tests
+##################################################################
+igt@.*kms.*
+igt@testdisplay
+igt@xe_pat@display-vs-wb-transient
+igt@fbdev@.*
+##################################################################
+# Expected skip as platform has no vram support
+##################################################################
+igt@xe_create@create-big-vram
+igt@xe_evict@.*
+igt@xe_evict_ccs@.*
+igt@xe_mmap@small-bar
+igt@xe_mmap@vram$
+igt@xe_noexec_ping_pong
+igt@xe_pm@d3-mmap-vram
+igt@xe_pm@d3hot-mmap-vram
+igt@xe_sysfs_tile@physical_vram_size_bytes
+##################################################################
+# No d3cold support for LNL
+##################################################################
+igt@xe_pm@.*d3cold.*
+##################################################################
+# Expected skip, S3 is not supported on the platform
+##################################################################
+igt@xe_gt_freq@freq_suspend
+igt@xe_pm@s3.*
+igt@xe_pm_residency@cpg-basic
+##################################################################
+# Hwmon feature isn't applicable for Integrated Platforms
+##################################################################
+igt@intel_hwmon@.*
+##################################################################
+# Expected Skip for xe2+ paltforms
+##################################################################
+igt@xe_media_fill@media-fill
+igt@xe_pat@pat-index-xehpc
+igt@xe_pat@pat-index-xelp
+igt@xe_pat@pat-index-xelpg
+##################################################################
+# Expected skip on xe1 & xe2 Platforms
+##################################################################
+igt@xe_pat@pat-index-xe3p-xpc
+##################################################################
+# Expected skip on integrated platforms
+##################################################################
+igt@.*@.*multigpu.*
+igt@xe_peer2peer@.*
+#######################################################
+# Expected behavior - CCS mode enabled only for platforms
+# which have more than 1 COMPUTE ENGINE instance per tile.
+##################################################################
+igt@xe_compute@ccs-mode-basic
+igt@xe_compute@ccs-mode-compute-kernel
+##################################################################
+# Expected skips as tests are xe-internal specific
+##################################################################
+igt@xe_vm@.*export.*
+##################################################################
+# Tests not applicable for the platform
+##################################################################
+igt@xe_evict@.*multiqueue.*
+igt@xe_exec_multi_queue@.*
+igt@.*@.*-multi_queue
+igt@.*@.*multi-queue.*
+##################################################################
+# Kernel support not available
+##################################################################
+igt@xe_eudebug@.*
+igt@xe_eudebug_online@.*
+igt@xe_exec_sip@.*
+igt@xe_exec_sip_eudebug@.*
+igt@xe_live_ktest@xe_eudebug
+##################################################################
+# Expected Skip as per the current behaviour
+##################################################################
+igt@xe_oa@oa-tlb-invalidate
+igt@xe_oa@unprivileged-single-ctx-counters
+##################################################################
diff --git a/tests/intel-ci/xe.lnl.display.blocklist.txt b/tests/intel-ci/xe.lnl.display.blocklist.txt
new file mode 100644
index 000000000..1c6ea8c14
--- /dev/null
+++ b/tests/intel-ci/xe.lnl.display.blocklist.txt
@@ -0,0 +1,171 @@
+#########################################
+# non-KMS tests
+#########################################
+igt@(?!.*kms|testdisplay|.*display-vs-wb-transient)(.*)
+
+#########################################
+# Valid skip :- Y and Yf-Tiling are not supported
+#########################################
+igt@kms_(big_fb|ccs|rotation_crc)@.*(y|yf)-tiled.*
+igt@kms_(plane_lowres|frontbuffer_tracking|plane_multiple)@.*tiling-y.*
+igt@kms_flip_scaled_crc@.*(yf|y)tile.*
+igt@kms_async_flips@invalid-async-flip
+igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
+#########################################
+# Valid skip :- 90/270 rotations are not supported
+##########################################
+igt@kms_big_fb@.*rotate-(90|270)
+igt@kms_rotation_crc@.*rotation-(90|270).*
+igt@kms_rotation_crc@bad-(pixel-format|tiling)
+##########################################
+# Valid skip :-  Cursor sizes of 32 and greater than 256 are not supported
+##########################################
+igt@kms_cursor_crc@.*-max-size
+igt@kms_cursor_crc@.*-(32x10|32x32|512x).*
+igt@kms_cursor_crc@cursor.*(21|42|85)
+##########################################
+# Valid skip :- Mutable zpos is not supported
+##########################################
+igt@kms_atomic@plane-primary-overlay-mutable-zpos
+##########################################
+# Valid skip :- Requires TV connector, which is not supported
+##########################################
+igt@kms_tv_load_detect@load-detect
+##########################################
+# Valid skip :- Scaling mode none is not supported
+##########################################
+igt@kms_scaling_modes@scaling-mode-none
+##########################################
+# Valid skip :- Downscaling factor is not supported
+##########################################
+igt@kms_plane_scaling@.*downscale-factor-0-25.*
+#########################################
+# Mei interface is not supported for LNL
+#########################################
+igt@kms_content_protection@mei-interface
+##########################################
+# Valid skip :- Downscaling is not supported on second plane MTL+
+##########################################
+igt@kms_plane_scaling@planes-downscale-factor-0-(5|75)$
+igt@kms_plane_scaling@planes-.*upscale-.*downscale.*
+#########################################
+# Expected skip for graphics ver >= 20
+#########################################
+igt@kms_getfb@getfb2-accept-ccs
+#########################################
+# Retention flops are not supported on LNL
+#########################################
+igt@kms_pm_dc@dc5-retention-flops
+#########################################
+# Horizontal flip is not supported with
+# tile4 surface formats
+#########################################
+igt@kms_big_fb@4-tiled.*hflip.*
+igt@kms_rotation_crc@primary-4-tiled-reflect-x.*
+##########################################
+# Valid skip :- LNL on CI supports only 3 pipes
+##########################################
+igt@kms_ccs@.*pipe-d.*
+igt@kms_feature_discovery@display-4x
+igt@.*@.*pipe-(d|D)($|-.*)
+igt@kms_bw@.*-4-displays-.*
+#########################################
+# Ultrajoiner is not supported with only 3 pipes
+#########################################
+igt@kms_joiner@.*ultra-joiner.*
+##########################################
+# Valid skip :- Feature is not enabled on kernel
+##########################################
+igt@kms_writeback@.*
+
+##########################################
+# Valid skip :- DG2 & MTL & BMG specific
+##########################################
+igt@kms_ccs@.*-dg2-.*
+igt@kms_ccs@.*-mtl-.*
+igt@kms_flip_scaled_crc@.*dg2rcccs.*
+igt@kms_ccs@.*4-tiled-bmg-ccs
+
+##########################################
+# Valid skip :- Simulation specific
+##########################################
+igt@kms_pm_dc@dc3co-vpb-simulation
+igt@kms_simulation_hpd@sim-hpd
+#########################################
+# HDMI/VGA subtests on chamelium are
+# expected skips for LNL on CI
+#########################################
+igt@kms_chamelium.*@.*(hdmi|vga).*
+#########################################
+# Valid skip when HDMI is not enabled in VBT
+#########################################
+igt@kms_force_connector_basic@force-connector-state
+igt@kms_force_connector_basic@force-edid
+igt@kms_force_connector_basic@prune-stale-modes
+igt@kms_hdmi_inject@inject-audio
+igt@kms_hdmi_inject@inject-4k
+igt@kms_3d
+#########################################
+# Valid skip for non-hybrid configuration
+#########################################
+igt@kms_addfb_basic@invalid-smem-bo-on-discrete
+#########################################
+# Valid skip on non-tiled display configuration
+#########################################
+igt@kms_tiled_display@.*
+
+##########################################
+# Valid skip :- cursor moving doesn't take slowpath
+##########################################
+igt@kms_cursor_legacy@(short|basic)-busy-flip-before.*
+##########################################
+# Valid skip :- Use of a single CRTC for two connectors
+##########################################
+igt@kms_setmode@basic-clone-single-crtc
+##########################################
+# Valid skip :- Connector uses CRTC that is incompatible
+#               with the connector
+##########################################
+igt@kms_setmode@invalid-clone-exclusive-crtc
+##########################################
+# Valid skip :- Valid for display ver > 13
+##########################################
+igt@kms_psr2_su@.*
+#########################################
+# Valid skip :- ccs modifiers not supported on Xe2
+#########################################
+igt@kms_getfb@.*ccs
+#########################################
+# Use either of connected/non-connected
+#########################################
+igt@kms_bw@linear-tiling-.*-display.*
+#########################################
+# Valid skip :- linear + hflip combination is a new
+                capability supported on display_ver >= 35
+#########################################
+igt@kms_big_fb@linear-max-hw-stride.*hflip
+
+#########################################
+# Expected skip/fail on CI
+#########################################
+igt@kms_pm_dc@.*dc6.*
+igt@kms_content_protection@.*dp-mst.*type-1.*
+igt@kms_pm_dc@deep-pkgc
+#########################################
+# Expected skip/fail on CI TypeC configuration
+#########################################
+igt@kms_chamelium_color@.*
+igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode
+igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode
+igt@kms_chamelium_hpd@dp-hpd-for-each-pipe
+#########################################
+# Expected skip as config missing on CI
+#########################################
+igt@kms_joiner@basic-max-non-joiner
+#########################################
+# FBC with PR/PSR2 is a valid skip
+#########################################
+igt@kms_psr2_sf@fbc-pr-.*
+igt@kms_psr2_sf@fbc-psr2.*
+igt@kms_psr@fbc-psr2.*
+'igt@kms_psr@fbc-pr.*
-- 
2.43.0

