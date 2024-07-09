Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B388C3DA47
	for <igt-dev@archiver.kernel.org>; Tue,  9 Jul 2024 12:59:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A3BB10E540;
	Tue,  9 Jul 2024 12:59:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YpHj7uqQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B462B10E51B
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2024 12:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720529956; x=1752065956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TRBvPJn3kYh5kG4WcFbrB7d80ObFAJ2jZeb6odxFZos=;
 b=YpHj7uqQu16CuRPt3XXYT/LTnDRVegn99bmXXu43kddA6D+BkRa8gLyB
 XQY8dNMtmTEsQHDkGeLjVWwbjUhTcAXAr/TbPv7q3SXfph3Rl5LeWPIGT
 +VBpHKWjOwudpeRM4U+jQdkcFfN0N4+T+Xcpdcpzxk9hqRAp1M95iP4TA
 ceNeuvuaD39o0ux2TtHfH1G6ftA2m73bXlXwc2/9Ny4LvvHPpOxvknNFk
 6uHQLGuCydc67YzJn0G51e5uszsJxZUTfxLLvy5KrTHWEFVOuLHvlLUdo
 n8oMgpNxq5e368KaeY86aifCo5d+1O1slsc1+dOPBZ9chl4zgl9jQYR7H A==;
X-CSE-ConnectionGUID: /lIUpLEqRZSxOL3YJ2ZH4g==
X-CSE-MsgGUID: ejHXfFxdSYa1LBGUd+MmIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17411370"
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="17411370"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 05:59:16 -0700
X-CSE-ConnectionGUID: L80AXE/GSrWyOK5akHpmjg==
X-CSE-MsgGUID: dB9nY1GITlu0scMejhQN8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,195,1716274800"; d="scan'208";a="53031374"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.145.169.76])
 by orviesa004-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 05:59:14 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, kunal1.joshi@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t 2/2] HAX patch do not merge
Date: Tue,  9 Jul 2024 18:33:21 +0530
Message-ID: <20240709130321.455906-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240709130321.455906-1-ramanaidu.naladala@intel.com>
References: <20240709130321.455906-1-ramanaidu.naladala@intel.com>
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

HAX patch do not merge

---
 tests/intel-ci/fast-feedback.testlist    | 215 ++++-----------
 tests/intel-ci/xe-fast-feedback.testlist | 320 ++++-------------------
 2 files changed, 98 insertions(+), 437 deletions(-)

diff --git a/tests/intel-ci/fast-feedback.testlist b/tests/intel-ci/fast-feedback.testlist
index be0965110..f0603cc4b 100644
--- a/tests/intel-ci/fast-feedback.testlist
+++ b/tests/intel-ci/fast-feedback.testlist
@@ -2,170 +2,53 @@
 igt@i915_module_load@load
 
 # Keep alphabetically sorted by default
-igt@core_auth@basic-auth
-igt@debugfs_test@read_all_entries
-igt@debugfs_test@basic-hwmon
-igt@debugfs_test@sysfs
-igt@fbdev@eof
-igt@fbdev@info
-igt@fbdev@nullptr
-igt@fbdev@read
-igt@fbdev@write
-igt@gem_basic@bad-close
-igt@gem_basic@create-close
-igt@gem_basic@create-fd-close
-igt@gem_busy@busy@all-engines
-igt@gem_close_race@basic-process
-igt@gem_close_race@basic-threads
-igt@gem_ctx_create@basic
-igt@gem_ctx_create@basic-files
-igt@gem_ctx_exec@basic
-igt@gem_exec_basic@basic
-igt@gem_exec_create@basic
-igt@gem_exec_fence@basic-busy
-igt@gem_exec_fence@basic-wait
-igt@gem_exec_fence@basic-await
-igt@gem_exec_fence@nb-await
-igt@gem_exec_gttfill@basic
-igt@gem_exec_parallel@engines
-igt@gem_exec_store@basic
-igt@gem_flink_basic@bad-flink
-igt@gem_flink_basic@bad-open
-igt@gem_flink_basic@basic
-igt@gem_flink_basic@double-flink
-igt@gem_flink_basic@flink-lifetime
-igt@gem_huc_copy@huc-copy
-igt@gem_linear_blits@basic
-igt@gem_mmap@basic
-igt@gem_mmap_gtt@basic
-igt@gem_render_linear_blits@basic
-igt@gem_render_tiled_blits@basic
-igt@gem_ringfill@basic-all
-igt@gem_softpin@allocator-basic
-igt@gem_softpin@allocator-basic-reserve
-igt@gem_softpin@safe-alignment
-igt@gem_sync@basic-all
-igt@gem_sync@basic-each
-igt@gem_tiled_blits@basic
-igt@gem_tiled_fence_blits@basic
-igt@gem_tiled_pread_basic
-igt@gem_wait@busy@all-engines
-igt@gem_wait@wait@all-engines
-igt@i915_getparams_basic@basic-eu-total
-igt@i915_getparams_basic@basic-subslice-total
-igt@i915_hangman@error-state-basic
-igt@i915_pciid
-igt@kms_addfb_basic@addfb25-4-tiled
-igt@kms_addfb_basic@addfb25-bad-modifier
-igt@kms_addfb_basic@addfb25-framebuffer-vs-set-tiling
-igt@kms_addfb_basic@addfb25-modifier-no-flag
-igt@kms_addfb_basic@addfb25-x-tiled-legacy
-igt@kms_addfb_basic@addfb25-x-tiled-mismatch-legacy
-igt@kms_addfb_basic@addfb25-yf-tiled-legacy
-igt@kms_addfb_basic@addfb25-y-tiled-legacy
-igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
-igt@kms_addfb_basic@bad-pitch-0
-igt@kms_addfb_basic@bad-pitch-1024
-igt@kms_addfb_basic@bad-pitch-128
-igt@kms_addfb_basic@bad-pitch-256
-igt@kms_addfb_basic@bad-pitch-32
-igt@kms_addfb_basic@bad-pitch-63
-igt@kms_addfb_basic@bad-pitch-65536
-igt@kms_addfb_basic@bad-pitch-999
-igt@kms_addfb_basic@basic
-igt@kms_addfb_basic@basic-x-tiled-legacy
-igt@kms_addfb_basic@basic-y-tiled-legacy
-igt@kms_addfb_basic@bo-too-small
-igt@kms_addfb_basic@bo-too-small-due-to-tiling
-igt@kms_addfb_basic@clobberred-modifier
-igt@kms_addfb_basic@framebuffer-vs-set-tiling
-igt@kms_addfb_basic@invalid-get-prop
-igt@kms_addfb_basic@invalid-get-prop-any
-igt@kms_addfb_basic@invalid-set-prop
-igt@kms_addfb_basic@invalid-set-prop-any
-igt@kms_addfb_basic@no-handle
-igt@kms_addfb_basic@size-max
-igt@kms_addfb_basic@small-bo
-igt@kms_addfb_basic@tile-pitch-mismatch
-igt@kms_addfb_basic@too-high
-igt@kms_addfb_basic@too-wide
-igt@kms_addfb_basic@unused-handle
-igt@kms_addfb_basic@unused-modifier
-igt@kms_addfb_basic@unused-offsets
-igt@kms_addfb_basic@unused-pitches
-igt@kms_busy@basic
-igt@kms_prop_blob@basic
-igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic
-igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy
-igt@kms_cursor_legacy@basic-flip-after-cursor-atomic
-igt@kms_cursor_legacy@basic-flip-after-cursor-legacy
-igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size
-igt@kms_cursor_legacy@basic-flip-before-cursor-atomic
-igt@kms_cursor_legacy@basic-flip-before-cursor-legacy
-igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size
-igt@kms_dsc@dsc-basic
-igt@kms_flip@basic-flip-vs-dpms
-igt@kms_flip@basic-flip-vs-modeset
-igt@kms_flip@basic-flip-vs-wf_vblank
-igt@kms_flip@basic-plain-flip
-igt@kms_force_connector_basic@force-connector-state
-igt@kms_force_connector_basic@force-edid
-igt@kms_force_connector_basic@force-load-detect
-igt@kms_force_connector_basic@prune-stale-modes
-igt@kms_frontbuffer_tracking@basic
-igt@kms_hdmi_inject@inject-audio
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12
-igt@kms_pipe_crc_basic@hang-read-crc
-igt@kms_pipe_crc_basic@nonblocking-crc
-igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
-igt@kms_pipe_crc_basic@read-crc
-igt@kms_pipe_crc_basic@read-crc-frame-sequence
-igt@kms_pm_backlight@basic-brightness
-igt@kms_pm_rpm@basic-pci-d3-state
-igt@kms_pm_rpm@basic-rte
-igt@kms_psr@psr-primary-page-flip
-igt@kms_psr@psr-cursor-plane-move
-igt@kms_psr@psr-sprite-plane-onoff
-igt@kms_psr@psr-primary-mmap-gtt
-igt@kms_setmode@basic-clone-single-crtc
-igt@i915_pm_rps@basic-api
-igt@prime_self_import@basic-llseek-bad
-igt@prime_self_import@basic-llseek-size
-igt@prime_self_import@basic-with_fd_dup
-igt@prime_self_import@basic-with_one_bo
-igt@prime_self_import@basic-with_one_bo_two_files
-igt@prime_self_import@basic-with_two_bos
-igt@prime_vgem@basic-fence-flip
-igt@prime_vgem@basic-fence-mmap
-igt@prime_vgem@basic-fence-read
-igt@prime_vgem@basic-gtt
-igt@prime_vgem@basic-read
-igt@prime_vgem@basic-write
-igt@vgem_basic@setversion
-igt@vgem_basic@create
-igt@vgem_basic@debugfs
-igt@vgem_basic@dmabuf-export
-igt@vgem_basic@dmabuf-fence
-igt@vgem_basic@dmabuf-fence-before
-igt@vgem_basic@dmabuf-mmap
-igt@vgem_basic@mmap
-igt@vgem_basic@second-client
-igt@vgem_basic@sysfs
+igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format
+igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format
+igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format
+igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format
+igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format
+igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format
+igt@kms_plane_scaling@plane-upscale-20x20-with-rotation
+igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation
+igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation
+igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation
+igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation
+igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation
+igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers
+igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers
+igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers
+igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers
+igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers
+igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers
+igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats
+igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation
+igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers
+igt@kms_plane_scaling@planes-upscale-20x20
+igt@kms_plane_scaling@planes-upscale-factor-0-25
+igt@kms_plane_scaling@planes-scaler-unity-scaling
+igt@kms_plane_scaling@planes-downscale-factor-0-25
+igt@kms_plane_scaling@planes-downscale-factor-0-5
+igt@kms_plane_scaling@planes-downscale-factor-0-75
+igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25
+igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5
+igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75
+igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25
+igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5
+igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75
+igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25
+igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5
+igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75
+igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20
+igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25
+igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling
+igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20
+igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25
+igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling
+igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20
+igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25
+igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling
+igt@kms_plane_scaling@intel-max-src-size
+igt@kms_plane_scaling@invalid-num-scalers
+igt@kms_plane_scaling@invalid-parameters
+igt@kms_plane_scaling@2x-scaler-multi-pipe
 
-# All tests that do module unloading and reloading are executed last.
-# They will sometimes reveal issues of earlier tests leaving the
-# driver in a broken state that is not otherwise noticed in that test.
-
-igt@core_hotunplug@unbind-rebind
-igt@vgem_basic@unload
-igt@i915_module_load@reload
-igt@gem_lmem_swapping@basic
-igt@gem_lmem_swapping@parallel-random-engines
-igt@gem_lmem_swapping@random-engines
-igt@gem_lmem_swapping@verify-random
-igt@i915_pm_rpm@module-reload
-
-# Kernel selftests
-igt@i915_selftest@live
-igt@dmabuf@all-tests
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index aa98b37e6..ef32ac652 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -1,275 +1,53 @@
 # Should be the first test
 igt@xe_module_load@load
 
-igt@fbdev@eof
-igt@fbdev@info
-igt@fbdev@nullptr
-igt@fbdev@read
-igt@fbdev@write
+igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format
+igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format
+igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format
+igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format
+igt@kms_plane_scaling@plane-downscale-factor-0-75-with-pixel-format
+igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format
+igt@kms_plane_scaling@plane-upscale-20x20-with-rotation
+igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation
+igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation
+igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation
+igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation
+igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation
+igt@kms_plane_scaling@plane-upscale-20x20-with-modifiers
+igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers
+igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers
+igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers
+igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers
+igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers
+igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats
+igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation
+igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-modifiers
+igt@kms_plane_scaling@planes-upscale-20x20
+igt@kms_plane_scaling@planes-upscale-factor-0-25
+igt@kms_plane_scaling@planes-scaler-unity-scaling
+igt@kms_plane_scaling@planes-downscale-factor-0-25
+igt@kms_plane_scaling@planes-downscale-factor-0-5
+igt@kms_plane_scaling@planes-downscale-factor-0-75
+igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25
+igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5
+igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75
+igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25
+igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5
+igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75
+igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25
+igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5
+igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75
+igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20
+igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25
+igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling
+igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20
+igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25
+igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling
+igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20
+igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25
+igt@kms_plane_scaling@planes-downscale-factor-0-75-unity-scaling
+igt@kms_plane_scaling@intel-max-src-size
+igt@kms_plane_scaling@invalid-num-scalers
+igt@kms_plane_scaling@invalid-parameters
+igt@kms_plane_scaling@2x-scaler-multi-pipe
 
-igt@kms_addfb_basic@addfb25-4-tiled
-igt@kms_addfb_basic@addfb25-bad-modifier
-igt@kms_addfb_basic@addfb25-modifier-no-flag
-igt@kms_addfb_basic@addfb25-x-tiled-legacy
-igt@kms_addfb_basic@addfb25-yf-tiled-legacy
-igt@kms_addfb_basic@addfb25-y-tiled-legacy
-igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
-igt@kms_addfb_basic@bad-pitch-0
-igt@kms_addfb_basic@bad-pitch-1024
-igt@kms_addfb_basic@bad-pitch-128
-igt@kms_addfb_basic@bad-pitch-256
-igt@kms_addfb_basic@bad-pitch-32
-igt@kms_addfb_basic@bad-pitch-63
-igt@kms_addfb_basic@bad-pitch-65536
-igt@kms_addfb_basic@bad-pitch-999
-igt@kms_addfb_basic@basic
-igt@kms_addfb_basic@basic-x-tiled-legacy
-igt@kms_addfb_basic@bo-too-small
-igt@kms_addfb_basic@invalid-get-prop
-igt@kms_addfb_basic@invalid-get-prop-any
-igt@kms_addfb_basic@invalid-set-prop
-igt@kms_addfb_basic@invalid-set-prop-any
-igt@kms_addfb_basic@no-handle
-igt@kms_addfb_basic@size-max
-igt@kms_addfb_basic@small-bo
-igt@kms_addfb_basic@too-high
-igt@kms_addfb_basic@too-wide
-igt@kms_addfb_basic@unused-handle
-igt@kms_addfb_basic@unused-modifier
-igt@kms_addfb_basic@unused-offsets
-igt@kms_addfb_basic@unused-pitches
-igt@kms_cursor_legacy@basic-flip-after-cursor-atomic
-igt@kms_cursor_legacy@basic-flip-after-cursor-legacy
-igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size
-igt@kms_cursor_legacy@basic-flip-before-cursor-atomic
-igt@kms_cursor_legacy@basic-flip-before-cursor-legacy
-igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size
-igt@kms_dsc@dsc-basic
-igt@kms_flip@basic-flip-vs-dpms
-igt@kms_flip@basic-flip-vs-modeset
-igt@kms_flip@basic-flip-vs-wf_vblank
-igt@kms_flip@basic-plain-flip
-igt@kms_force_connector_basic@force-connector-state
-igt@kms_force_connector_basic@force-edid
-igt@kms_force_connector_basic@prune-stale-modes
-igt@kms_frontbuffer_tracking@basic
-igt@kms_hdmi_inject@inject-audio
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24
-igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12
-igt@kms_pipe_crc_basic@hang-read-crc
-igt@kms_pipe_crc_basic@nonblocking-crc
-igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence
-igt@kms_pipe_crc_basic@read-crc
-igt@kms_pipe_crc_basic@read-crc-frame-sequence
-igt@kms_prop_blob@basic
-igt@kms_psr@psr-primary-page-flip
-igt@kms_psr@psr-cursor-plane-move
-igt@kms_psr@psr-sprite-plane-onoff
-igt@xe_compute@compute-square
-igt@xe_create@create-execqueues-noleak
-igt@xe_create@create-execqueues-leak
-igt@xe_create@create-invalid-mbz
-igt@xe_create@create-massive-size
-igt@xe_debugfs@base
-igt@xe_debugfs@gt
-igt@xe_debugfs@forcewake
-igt@xe_dma_buf_sync@export-dma-buf-once
-igt@xe_dma_buf_sync@export-dma-buf-once-read-sync
-igt@xe_evict_ccs@evict-overcommit-simple
-igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd
-igt@xe_exec_atomic@basic-dec-all
-igt@xe_exec_atomic@basic-inc-all
-igt@xe_exec_balancer@twice-virtual-basic
-igt@xe_exec_balancer@no-exec-virtual-basic
-igt@xe_exec_balancer@twice-cm-virtual-basic
-igt@xe_exec_balancer@no-exec-cm-virtual-basic
-igt@xe_exec_balancer@twice-virtual-userptr
-igt@xe_exec_balancer@twice-cm-virtual-userptr
-igt@xe_exec_balancer@twice-virtual-rebind
-igt@xe_exec_balancer@twice-cm-virtual-rebind
-igt@xe_exec_balancer@twice-virtual-userptr-rebind
-igt@xe_exec_balancer@twice-cm-virtual-userptr-rebind
-igt@xe_exec_balancer@twice-virtual-userptr-invalidate
-igt@xe_exec_balancer@twice-cm-virtual-userptr-invalidate
-igt@xe_exec_balancer@twice-parallel-basic
-igt@xe_exec_balancer@no-exec-parallel-basic
-igt@xe_exec_balancer@twice-parallel-userptr
-igt@xe_exec_balancer@twice-parallel-rebind
-igt@xe_exec_balancer@twice-parallel-userptr-rebind
-igt@xe_exec_balancer@twice-parallel-userptr-invalidate
-igt@xe_exec_basic@twice-basic
-igt@xe_exec_basic@no-exec-basic
-igt@xe_exec_basic@twice-basic-defer-mmap
-igt@xe_exec_basic@twice-basic-defer-bind
-igt@xe_exec_basic@twice-userptr
-igt@xe_exec_basic@twice-rebind
-igt@xe_exec_basic@twice-userptr-rebind
-igt@xe_exec_basic@twice-userptr-invalidate
-igt@xe_exec_basic@no-exec-userptr-invalidate
-igt@xe_exec_basic@twice-bindexecqueue
-igt@xe_exec_basic@no-exec-bindexecqueue
-igt@xe_exec_basic@twice-bindexecqueue-userptr
-igt@xe_exec_basic@twice-bindexecqueue-rebind
-igt@xe_exec_basic@twice-bindexecqueue-userptr-rebind
-igt@xe_exec_basic@twice-bindexecqueue-userptr-invalidate
-igt@xe_exec_compute_mode@twice-basic
-igt@xe_exec_compute_mode@twice-preempt-fence-early
-igt@xe_exec_compute_mode@twice-userptr
-igt@xe_exec_compute_mode@twice-rebind
-igt@xe_exec_compute_mode@twice-userptr-rebind
-igt@xe_exec_compute_mode@twice-userptr-invalidate
-igt@xe_exec_compute_mode@twice-bindexecqueue
-igt@xe_exec_compute_mode@twice-bindexecqueue-userptr
-igt@xe_exec_compute_mode@twice-bindexecqueue-rebind
-igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-rebind
-igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate
-igt@xe_exec_queue_property@invalid-property
-igt@xe_exec_reset@close-fd-no-exec
-igt@xe_exec_reset@cm-close-fd-no-exec
-igt@xe_exec_reset@virtual-close-fd-no-exec
-igt@xe_exec_store@basic-store
-igt@xe_gpgpu_fill@basic
-igt@xe_gt_freq@freq_basic_api
-igt@xe_gt_freq@freq_fixed_idle
-igt@xe_gt_freq@freq_range_idle
-igt@xe_huc_copy@huc_copy
-igt@xe_intel_bb@add-remove-objects
-igt@xe_intel_bb@bb-with-allocator
-igt@xe_intel_bb@blit-reloc
-igt@xe_intel_bb@blit-simple
-igt@xe_intel_bb@create-in-region
-igt@xe_intel_bb@delta-check
-igt@xe_intel_bb@destroy-bb
-igt@xe_intel_bb@intel-bb-blit-none
-igt@xe_intel_bb@intel-bb-blit-x
-igt@xe_intel_bb@intel-bb-blit-y
-igt@xe_intel_bb@lot-of-buffers
-igt@xe_intel_bb@offset-control
-igt@xe_intel_bb@purge-bb
-igt@xe_intel_bb@render
-igt@xe_intel_bb@reset-bb
-igt@xe_intel_bb@simple-bb
-igt@xe_intel_bb@simple-bb-ctx
-igt@xe_mmap@bad-extensions
-igt@xe_mmap@bad-flags
-igt@xe_mmap@bad-object
-igt@xe_mmap@cpu-caching
-igt@xe_mmap@system
-igt@xe_mmap@vram
-igt@xe_mmap@vram-system
-igt@xe_pm_residency@gt-c6-on-idle
-igt@xe_prime_self_import@basic-with_one_bo
-igt@xe_prime_self_import@basic-with_fd_dup
-#igt@xe_prime_self_import@basic-llseek-size
-igt@xe_query@query-engines
-igt@xe_query@query-mem-usage
-igt@xe_query@query-gt-list
-igt@xe_query@query-config
-igt@xe_query@query-hwconfig
-igt@xe_query@query-topology
-igt@xe_query@query-invalid-extension
-igt@xe_query@query-invalid-query
-igt@xe_query@query-invalid-size
-igt@xe_spin_batch@spin-basic
-igt@xe_spin_batch@spin-batch
-igt@xe_sysfs_defaults@engine-defaults
-igt@xe_sysfs_scheduler@preempt_timeout_us-invalid
-igt@xe_sysfs_scheduler@preempt_timeout_us-min-max
-igt@xe_sysfs_scheduler@timeslice_duration_us-invalid
-igt@xe_sysfs_scheduler@timeslice_duration_us-min-max
-igt@xe_sysfs_scheduler@job_timeout_ms-invalid
-igt@xe_sysfs_scheduler@job_timeout_ms-min-max
-#igt@xe_vm@bind-once
-#igt@xe_vm@scratch
-igt@xe_vm@shared-pte-page
-igt@xe_vm@shared-pde-page
-igt@xe_vm@shared-pde2-page
-igt@xe_vm@shared-pde3-page
-igt@xe_vm@bind-execqueues-independent
-igt@xe_vm@large-split-binds-268435456
-igt@xe_vm@munmap-style-unbind-one-partial
-igt@xe_vm@munmap-style-unbind-end
-igt@xe_vm@munmap-style-unbind-front
-igt@xe_vm@munmap-style-unbind-userptr-one-partial
-igt@xe_vm@munmap-style-unbind-userptr-end
-igt@xe_vm@munmap-style-unbind-userptr-front
-igt@xe_vm@munmap-style-unbind-userptr-inval-end
-igt@xe_vm@munmap-style-unbind-userptr-inval-front
-igt@xe_pat@userptr-coh-none
-igt@xe_pat@prime-self-import-coh
-igt@xe_pat@prime-external-import-coh
-igt@xe_pat@pat-index-all
-igt@xe_pat@pat-index-xelp
-igt@xe_pat@pat-index-xehpc
-igt@xe_pat@pat-index-xelpg
-igt@xe_pat@pat-index-xe2
-igt@xe_waitfence@abstime
-igt@xe_waitfence@engine
-igt@xe_waitfence@reltime
-
-# All tests that do module unloading and reloading are executed last.
-# They will sometimes reveal issues of earlier tests leaving the
-# driver in a broken state that is not otherwise noticed in that test.
-igt@core_hotunplug@unbind-rebind
-
-# Run KUnit tests at the end
-igt@xe_live_ktest@xe_bo
-igt@xe_live_ktest@xe_dma_buf
-igt@xe_live_ktest@xe_migrate
-
-# Move fault_mode tests at the end to unblock execution
-igt@xe_exec_fault_mode@twice-basic
-igt@xe_exec_fault_mode@many-basic
-igt@xe_exec_fault_mode@twice-userptr
-igt@xe_exec_fault_mode@twice-rebind
-igt@xe_exec_fault_mode@twice-userptr-rebind
-igt@xe_exec_fault_mode@twice-userptr-invalidate
-igt@xe_exec_fault_mode@twice-bindexecqueue
-igt@xe_exec_fault_mode@twice-bindexecqueue-userptr
-igt@xe_exec_fault_mode@twice-bindexecqueue-rebind
-igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind
-igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate
-igt@xe_exec_fault_mode@twice-basic-imm
-igt@xe_exec_fault_mode@twice-userptr-imm
-igt@xe_exec_fault_mode@twice-rebind-imm
-igt@xe_exec_fault_mode@twice-userptr-rebind-imm
-igt@xe_exec_fault_mode@twice-userptr-invalidate-imm
-igt@xe_exec_fault_mode@twice-bindexecqueue-imm
-igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm
-igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-imm
-igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-imm
-igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-imm
-igt@xe_exec_fault_mode@twice-basic-prefetch
-igt@xe_exec_fault_mode@twice-userptr-prefetch
-igt@xe_exec_fault_mode@twice-rebind-prefetch
-igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch
-igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch
-igt@xe_exec_fault_mode@twice-bindexecqueue-prefetch
-igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-prefetch
-igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch
-igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch
-igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-prefetch
-igt@xe_exec_fault_mode@twice-invalid-fault
-igt@xe_exec_fault_mode@twice-invalid-userptr-fault
-igt@xe_exec_threads@threads-basic
-igt@xe_exec_threads@threads-mixed-basic
-igt@xe_exec_threads@threads-mixed-shared-vm-basic
-igt@xe_exec_threads@threads-mixed-fd-basic
-igt@xe_exec_threads@threads-mixed-userptr-invalidate
-igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race
-igt@xe_evict@evict-beng-mixed-threads-small-multi-vm
-igt@xe_evict@evict-beng-small
-igt@xe_evict@evict-beng-small-cm
-igt@xe_evict@evict-beng-small-external
-igt@xe_evict@evict-beng-small-external-cm
-igt@xe_evict@evict-beng-small-multi-vm
-igt@xe_evict@evict-cm-threads-small
-igt@xe_evict@evict-mixed-threads-small
-igt@xe_evict@evict-mixed-threads-small-multi-vm
-igt@xe_evict@evict-small
-igt@xe_evict@evict-small-cm
-igt@xe_evict@evict-small-external
-igt@xe_evict@evict-small-external-cm
-igt@xe_evict@evict-small-multi-vm
-igt@xe_evict@evict-small-multi-vm-cm
-igt@xe_evict@evict-threads-small
-- 
2.43.0

